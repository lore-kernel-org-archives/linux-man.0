From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dl_iterate_phdr(3) needs clarification
Date: Fri, 15 Sep 2017 10:33:09 +0200
Message-ID: <CAKgNAkhRo04hCoYX+SCKEr7Ai0zT9HcV_z-aZhCio+CQqO+eHw@mail.gmail.com>
References: <20170915084423.GB317@HP.internal.baidu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915084423.GB317-BUpDV9vzqx74NUO8LpiZZi+1pv2Z1Xu3@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, vivek-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Yubin,

On 15 September 2017 at 10:44, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> i,
> I need some clarification on dl_iterate_phdr(3):
>
> it is claimed that the returned "struct dl_phdr_info" argument has the
> following structure:
>
>   struct dl_phdr_info {
>       ElfW(Addr)  dlpi_addr;  /* Base address of object */
>       const char *dlpi_name;  /* (Null-terminated) name of
>                                        object */
>       const ElfW(Phdr) *dlpi_phdr;  /* Pointer to array of
>                                        ELF program headers
>                                        for this object */
>       ElfW(Half)  dlpi_phnum; /* # of items in dlpi_phdr */
>
>       /* The following fields were added in glibc 2.4, after the first
>          version of this structure was available.  Check the size
>          argument passed to the dl_iterate_phdr callback to determine
>          whether or not each later member is available.  */
>
>       unsigned long long int dlpi_adds;
>                       /* Incremented when a new object may
>                          have been added */
>       unsigned long long int dlpi_subs;
>                       /* Incremented when an object may
>                          have been removed */
>       size_t dlpi_tls_modid;
>                       /* If there is a PT_TLS segment, its module
>                          ID as used in TLS relocations, else zero */
>       void  *dlpi_tls_data;
>                       /* The address of the calling thread's instance
>                          of this module's PT_TLS segment, if it has
>                          one and it has been allocated in the calling
>                          thread, otherwise a null pointer */
>   };
>
> and:
>
>   The dlpi_addr field indicates the base address of the shared object
>   (i.e., the difference between the virtual memory address of the
>   shared object and the offset of that object in the file from which it
>   was loaded).  The dlpi_name field is a null-terminated string giving
>   the pathname from which the shared object was loaded.
>
> What does it mean by "the offset of that object in the file from which it was
> loaded"??? For a shared object, can I assume that this value is always 0? And
> in what circumstance will it not be 0?
>
> The same statement has also been seen at the old man page[1], so I guess the
> author

(That would be me.)

> might have done some copy&paste and overlook this detail.

Can I suggest that as a first step to investigating that you modify
the example program in thepage to print out the values of these
fields?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
