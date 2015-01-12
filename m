From: Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Edited kexec_load(2) [kexec_file_load()] man page for review
Date: Mon, 12 Jan 2015 17:16:34 -0500
Message-ID: <20150112221634.GD16162@redhat.com>
References: <545FBDDD.9060801@gmail.com>
 <20141111213037.GA31445@redhat.com>
 <54ADA284.30502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54ADA284.30502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jan 07, 2015 at 10:17:56PM +0100, Michael Kerrisk (man-pages) wrote:

[..]
> >> .BR KEXEC_ON_CRASH " (since Linux 2.6.13)"
> >> Execute the new kernel automatically on a system crash.
> >> .\" FIXME Explain in more detail how KEXEC_ON_CRASH is actually used
> 
> I wasn't expecting that you would respond to the FIXMEs that were 
> not labeled "kexec_file_load", but I was hoping you might ;-). Thanks!
> I have a few additional questions to your nice notes.
> 
> > Upon boot first kernel reserves a chunk of contiguous memory (if
> > crashkernel=<> command line paramter is passed). This memory is
> > is used to load the crash kernel (Kernel which will be booted into
> > if first kernel crashes).
> 

Hi Michael,

> Can I just confirm: is it in all cases only possible to use kexec_load() 
> and kexec_file_load() if the kernel was booted with the 'crashkernel'
> parameter set?

As of now, only kexec_load() and kexec_file_load() system calls can
make use of memory reserved by crashkernel=<> kernel parameter. And
this is used only if we are trying to load a crash kernel (KEXEC_ON_CRASH
flag specified).

> 
> > Location of this reserved memory is exported to user space through
> > /proc/iomem file. 
> 
> Is that export via an entry labeled "Crash kernel" in the 
> /proc/iomem file?

Yes.

> 
> > User space can parse it and prepare list of segments
> > specifying this reserved memory as destination.
> 
> I'm not quite clear on "specifying this reserved memory as destination".
> Is that done by specifying the address in the kexec_segment.mem fields?

You are absolutely right. User space can specify in kexec_segment.mem
field the memory location where it expecting a particular segment to
be loaded by kernel.

> 
> > Once kernel sees the flag KEXEC_ON_CRASH, it makes sure that all the
> > segments are destined for reserved memory otherwise kernel load operation
> > fails.
> 
> Could you point me to where this checking is done? Also, what is the
> error (errno) that occurs when the load operation fails? (I think the
> answers to these questions are "at the start of kimage_alloc_init()"
> and "EADDRNOTAVAIL", but I'd like to confirm.)

This checking happens in sanity_check_segment_list() which is called
by kimage_alloc_init().

And yes, error code returned is -EADDRNOTAVAIL.

> 
> > [..]
> >> struct kexec_segment {
> >>     void   *buf;        /* Buffer in user space */
> >>     size_t  bufsz;      /* Buffer length in user space */
> >>     void   *mem;        /* Physical address of kernel */
> >>     size_t  memsz;      /* Physical address length */
> >> };
> >> .fi
> >> .in
> >> .PP
> >> .\" FIXME Explain the details of how the kernel image defined by segments
> >> .\" is copied from the calling process into previously reserved memory.
> > 
> > Kernel image defined by segments is copied into kernel either in regular
> > memory 
> 
> Could you clarify what you mean by "regular memory"?

I meant memory which is not reserved memory.

> 
> > or in reserved memory (if KEXEC_ON_CRASH is set). Kernel first
> > copies list of segments in kernel memory and then goes does various
> > sanity checks on the segments. If everything looks line, kernel copies
> > segment data to kernel memory.
> > 
> > In case of normal kexec, segment data is loaded in any available memory
> > and segment data is moved to final destination at the kexec reboot time.
> 
> By "moved to final destination", do you mean "moved from user space to the
> final kernel-space destination"?

No. Segment data moves from user space to kernel space once kexec_load()
call finishes successfully. But when user does reboot (kexec -e), at that
time kernel moves that segment data to its final location. Kernel could
not place the segment at its final location during kexec_load() time as
that memory is already in use by running kernel. But once we are about
to reboot to new kernel, we can overwrite the old kernel's memory.

> 
> > In case of kexec on panic (KEXEC_ON_CRASH flag set), segment data is
> > directly loaded to reserved memory and after crash kexec simply jumps
> 
> By "directly", I assume you mean "at the time of the kexec_laod() call",
> right?

Yes.

Thanks
Vivek

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
