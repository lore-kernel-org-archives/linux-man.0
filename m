From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dl_iterate_phdr(3) needs clarification
Date: Sat, 16 Sep 2017 23:00:56 +0800
Message-ID: <20170916150053.GD13267@HP.internal.baidu.com>
References: <20170915084423.GB317@HP.internal.baidu.com>
 <CAKgNAkhRo04hCoYX+SCKEr7Ai0zT9HcV_z-aZhCio+CQqO+eHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhRo04hCoYX+SCKEr7Ai0zT9HcV_z-aZhCio+CQqO+eHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, vivek-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Fri, Sep 15, 2017 at 10:33:09AM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Yubin,
> 
> On 15 September 2017 at 10:44, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > i,
> > I need some clarification on dl_iterate_phdr(3):
> >
> > it is claimed that the returned "struct dl_phdr_info" argument has the
> > following structure:
> >
> >   struct dl_phdr_info {
> >       ElfW(Addr)  dlpi_addr;  /* Base address of object */
> >       const char *dlpi_name;  /* (Null-terminated) name of
> >                                        object */
> >       const ElfW(Phdr) *dlpi_phdr;  /* Pointer to array of
> >                                        ELF program headers
> >                                        for this object */
> >       ElfW(Half)  dlpi_phnum; /* # of items in dlpi_phdr */
> >
> >       /* The following fields were added in glibc 2.4, after the first
> >          version of this structure was available.  Check the size
> >          argument passed to the dl_iterate_phdr callback to determine
> >          whether or not each later member is available.  */
> >
> >       unsigned long long int dlpi_adds;
> >                       /* Incremented when a new object may
> >                          have been added */
> >       unsigned long long int dlpi_subs;
> >                       /* Incremented when an object may
> >                          have been removed */
> >       size_t dlpi_tls_modid;
> >                       /* If there is a PT_TLS segment, its module
> >                          ID as used in TLS relocations, else zero */
> >       void  *dlpi_tls_data;
> >                       /* The address of the calling thread's instance
> >                          of this module's PT_TLS segment, if it has
> >                          one and it has been allocated in the calling
> >                          thread, otherwise a null pointer */
> >   };
> >
> > and:
> >
> >   The dlpi_addr field indicates the base address of the shared object
> >   (i.e., the difference between the virtual memory address of the
> >   shared object and the offset of that object in the file from which it
> >   was loaded).  The dlpi_name field is a null-terminated string giving
> >   the pathname from which the shared object was loaded.
> >
> > What does it mean by "the offset of that object in the file from which it was
> > loaded"??? For a shared object, can I assume that this value is always 0? And
> > in what circumstance will it not be 0?
> >
> > The same statement has also been seen at the old man page[1], so I guess the
> > author
> 
> (That would be me.)
> 
> > might have done some copy&paste and overlook this detail.
> 
> Can I suggest that as a first step to investigating that you modify
> the example program in thepage to print out the values of these
> fields?

After some investigation, I am convinced that `dlpi_addr' is the runtime
address that is mapped after an executable or a shared object is loaded.
So I think the doc should be modify to the following:

    The dlpi_addr field indicates the base address that is mapped at runtime.
    For an executable this field is always 0 and for a shared object it is the
    address where the shared object is mapped. Therefore, the address of any
    loadable segment in the program header array can be calculated as:

        addr == info->dlpi_addr + info->dlpi_phdr[x].p_vaddr

    The dlpi_name field is a null-termiated string giving the pathname from
    which the shared object was loaded ...

Please see the patch below.

I get this info from several places:

    1) some Solaris doc at [1] (oh Solaris again...)
    2) The ELF spec [2]. In section 2 "Program Loading and Dynamic Linking",
    subsection 3, "Dynamic Loading", there is a paragraph above "Figure 2-8"
    which states that virtual address for executable code is the same as it is
    in the program header file of an executable file, while it is unfixed for
    an shared object, which usually contains position independent code (but
    for a shared object, the differences between each segment are always the
    same as in the shared object file). So, if you inspect the on-disk program
    header file with "readelf -l object-name", and obtain those addresses from
    the program in the current man page, you will see that all the things will
    show up as expected. So, `dlpi_addr' has to be the runtime address that is
    mapped.
    3) I have craft a program which is used to get the runtime address of the
    GOT (and successfully modify some of those fields to "change function
    behavior"). That program is based on the assumption that `dlpi_addr' is
    the runtime address that is mapped.

                Yubin

[1]: https://docs.oracle.com/cd/E36784_01/html/E36874/dl-iterate-phdr-3c.html
[2]: http://www.cs.northwestern.edu/~pdinda/icsclass/doc/elf.pdf (note, I
don't know whether this is the latest ELF spec, but I think things won't
change that much)


Signed-off-by: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
======
diff --git a/man3/dl_iterate_phdr.3 b/man3/dl_iterate_phdr.3
index b5b75e8..35107da 100644
--- a/man3/dl_iterate_phdr.3
+++ b/man3/dl_iterate_phdr.3
@@ -121,10 +121,9 @@ header files.)
 .PP
 The
 .I dlpi_addr
-field indicates the base address of the shared object
-(i.e., the difference between the virtual memory address of
-the shared object and the offset of that object in the file
-from which it was loaded).
+field indicates the base address that is mapped at runtime.
+For an executable this field is always 0 and for a shared
+object it is the address where the shared object is mapped.
 The
 .I dlpi_name
 field is a null-terminated string giving the pathname
@@ -258,40 +257,40 @@ is the main program.
 .in +4n
 .EX
 $ \fB./a.out\fP
-Name: "" (9 segments)
+Address: (nil), Name: "" (9 segments)
      0: [      0x400040; memsz:    1f8] flags: 0x5; PT_PHDR
      1: [      0x400238; memsz:     1c] flags: 0x4; PT_INTERP
-     2: [      0x400000; memsz:    ac4] flags: 0x5; PT_LOAD
-     3: [      0x600e10; memsz:    240] flags: 0x6; PT_LOAD
+     2: [      0x400000; memsz:    acc] flags: 0x5; PT_LOAD
+     3: [      0x600e10; memsz:    248] flags: 0x6; PT_LOAD
      4: [      0x600e28; memsz:    1d0] flags: 0x6; PT_DYNAMIC
      5: [      0x400254; memsz:     44] flags: 0x4; PT_NOTE
-     6: [      0x400970; memsz:     3c] flags: 0x4; PT_GNU_EH_FRAME
+     6: [      0x40097c; memsz:     3c] flags: 0x4; PT_GNU_EH_FRAME
      7: [         (nil); memsz:      0] flags: 0x6; PT_GNU_STACK
      8: [      0x600e10; memsz:    1f0] flags: 0x4; PT_GNU_RELRO
-Name: "linux-vdso.so.1" (4 segments)
-     0: [0x7ffc6edd1000; memsz:    e89] flags: 0x5; PT_LOAD
-     1: [0x7ffc6edd1360; memsz:    110] flags: 0x4; PT_DYNAMIC
-     2: [0x7ffc6edd17b0; memsz:     3c] flags: 0x4; PT_NOTE
-     3: [0x7ffc6edd17ec; memsz:     3c] flags: 0x4; PT_GNU_EH_FRAME
-Name: "/lib64/libc.so.6" (10 segments)
-     0: [0x7f55712ce040; memsz:    230] flags: 0x5; PT_PHDR
-     1: [0x7f557145b980; memsz:     1c] flags: 0x4; PT_INTERP
-     2: [0x7f55712ce000; memsz: 1b6a5c] flags: 0x5; PT_LOAD
-     3: [0x7f55716857a0; memsz:   9240] flags: 0x6; PT_LOAD
-     4: [0x7f5571688b80; memsz:    1f0] flags: 0x6; PT_DYNAMIC
-     5: [0x7f55712ce270; memsz:     44] flags: 0x4; PT_NOTE
-     6: [0x7f55716857a0; memsz:     78] flags: 0x4; PT_TLS
-     7: [0x7f557145b99c; memsz:   544c] flags: 0x4; PT_GNU_EH_FRAME
-     8: [0x7f55712ce000; memsz:      0] flags: 0x6; PT_GNU_STACK
-     9: [0x7f55716857a0; memsz:   3860] flags: 0x4; PT_GNU_RELRO
-Name: "/lib64/ld-linux-x86-64.so.2" (7 segments)
-     0: [0x7f557168f000; memsz:  20828] flags: 0x5; PT_LOAD
-     1: [0x7f55718afba0; memsz:   15a8] flags: 0x6; PT_LOAD
-     2: [0x7f55718afe10; memsz:    190] flags: 0x6; PT_DYNAMIC
-     3: [0x7f557168f1c8; memsz:     24] flags: 0x4; PT_NOTE
-     4: [0x7f55716acec4; memsz:    604] flags: 0x4; PT_GNU_EH_FRAME
-     5: [0x7f557168f000; memsz:      0] flags: 0x6; PT_GNU_STACK
-     6: [0x7f55718afba0; memsz:    460] flags: 0x4; PT_GNU_RELRO
+Address: 0x7ffdedbe8000, Name: "" (4 segments)
+     0: [0x7ffdedbe8000; memsz:    f29] flags: 0x5; PT_LOAD
+     1: [0x7ffdedbe8360; memsz:    110] flags: 0x4; PT_DYNAMIC
+     2: [0x7ffdedbe87f8; memsz:     3c] flags: 0x4; PT_NOTE
+     3: [0x7ffdedbe8834; memsz:     3c] flags: 0x4; PT_GNU_EH_FRAME
+Address: 0x7fb9a86ca000, Name: "/lib/x86_64-linux-gnu/libc.so.6" (10 segments)
+     0: [0x7fb9a86ca040; memsz:    230] flags: 0x5; PT_PHDR
+     1: [0x7fb9a8860620; memsz:     1c] flags: 0x4; PT_INTERP
+     2: [0x7fb9a86ca000; memsz: 1bfad0] flags: 0x5; PT_LOAD
+     3: [0x7fb9a8a8a7c0; memsz:   91e0] flags: 0x6; PT_LOAD
+     4: [0x7fb9a8a8dba0; memsz:    1e0] flags: 0x6; PT_DYNAMIC
+     5: [0x7fb9a86ca270; memsz:     44] flags: 0x4; PT_NOTE
+     6: [0x7fb9a8a8a7c0; memsz:     78] flags: 0x4; PT_TLS
+     7: [0x7fb9a886063c; memsz:   54bc] flags: 0x4; PT_GNU_EH_FRAME
+     8: [0x7fb9a86ca000; memsz:      0] flags: 0x6; PT_GNU_STACK
+     9: [0x7fb9a8a8a7c0; memsz:   3840] flags: 0x4; PT_GNU_RELRO
+Address: 0x7fb9a8a94000, Name: "/lib64/ld-linux-x86-64.so.2" (7 segments)
+     0: [0x7fb9a8a94000; memsz:  253b8] flags: 0x5; PT_LOAD
+     1: [0x7fb9a8cb9bc0; memsz:   15a8] flags: 0x6; PT_LOAD
+     2: [0x7fb9a8cb9e70; memsz:    170] flags: 0x6; PT_DYNAMIC
+     3: [0x7fb9a8a941c8; memsz:     24] flags: 0x4; PT_NOTE
+     4: [0x7fb9a8ab68e4; memsz:    63c] flags: 0x4; PT_GNU_EH_FRAME
+     5: [0x7fb9a8a94000; memsz:      0] flags: 0x6; PT_GNU_STACK
+     6: [0x7fb9a8cb9bc0; memsz:    440] flags: 0x4; PT_GNU_RELRO
 .EE
 .in
 .PP
@@ -309,8 +308,8 @@ callback(struct dl_phdr_info *info, size_t size, void *data)
     char *type;
     int p_type, j;
 
-    printf("Name: \\"%s\\" (%d segments)\\n", info\->dlpi_name,
-               info\->dlpi_phnum);
+    printf("Address: %p, name: \\"%s\\" (%d segments)\\n",
+           (void *)info\->dlpi_addr, info\->dlpi_name, info\->dlpi_phnum);
 
     for (j = 0; j < info\->dlpi_phnum; j++) {
         p_type = info\->dlpi_phdr[j].p_type;

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
