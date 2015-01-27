From: Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Edited kexec_load(2) [kexec_file_load()] man page for review
Date: Tue, 27 Jan 2015 09:24:59 -0500
Message-ID: <20150127142459.GA12851@redhat.com>
References: <545FBDDD.9060801@gmail.com>
 <20141111213037.GA31445@redhat.com>
 <54ADA284.30502@gmail.com>
 <20150112221634.GD16162@redhat.com>
 <54B91271.3000600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54B91271.3000600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jan 16, 2015 at 02:30:25PM +0100, Michael Kerrisk (man-pages) wrote:
[..]
> 

Hi Michael,

Please find my responses below. Sorry, I got stuck in other work and
forgot about this thread.

> So, returning to the kexeec_segment structure:
> 
>            struct kexec_segment {
>                void   *buf;        /* Buffer in user space */
>                size_t  bufsz;      /* Buffer length in user space */
>                void   *mem;        /* Physical address of kernel */
>                size_t  memsz;      /* Physical address length */
>            };
> 
> Are the following statements correct:
> * buf + bufsz identify a memory region in the caller's virtual 
>   address space that is the source of the copy

Yes.

> * mem + memsz specify the target memory region of the copy

Yes.

> * mem is  physical memory address, as seen from kernel space

Yes.

> * the number of bytes copied from userspace is min(bufsz, memsz)

Yes. bufsz can not be more than memsz. There is a check to validate
this in kernel.

	result = -EINVAL;
	for (i = 0; i < nr_segments; i++) {
		if (image->segment[i].bufsz > image->segment[i].memsz)
			return result;
	}

> * if bufsz > memsz, then excess bytes in the user-space buffer 
>   are ignored.

You will get -EINVAL.

> * if memsz > bufsz, then excess bytes in the target kernel buffer
>   are filled with zeros.

Yes.

> Also, it seems to me that 'mem' need not be page aligned.
> Is that correct? Should the man page say something about that?
> (E.g., is it generally desirable that 'mem' should be page aligned?)

mem and memsz need to be page aligned. There is a check for that too.

	mstart = image->segment[i].mem;
	mend   = mstart + image->segment[i].memsz;
	if ((mstart & ~PAGE_MASK) || (mend & ~PAGE_MASK))
		return result;

> 
> Likewise, 'memsz' doesn't need to beta page multiple, IIUC.
> Should the man page say anything about this? For example, should 
> it note that the initialized kernel segment will be of size:
> 
>      (mem % PAGE_SIZE + memsz) rounded up to the next multiple of PAGE_SIZE
> 
> And should it note that if 'mem' is not a multiple of the page size, then
> the initial bytes (mem % PAGE_SIZE)) in the first page of the kernel segment 
> will be zeros?
> 
> (Hopefully I have read kimage_load_normal_segment() correctly.)

Both mem and memsz need to be page aligned.

> 
> And one further question. Other than the fact that they are used with 
> different system calls, what is the difference between KEXEC_ON_CRASH 
> and KEXEC_FILE_ON_CRASH?

Right now I can't think of any other difference. They both tell respective
system call that this kernel needs to be loaded in reserved memory region
for crash kernel.

Thanks
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
