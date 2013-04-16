From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Tue, 16 Apr 2013 07:42:56 +0200
Message-ID: <CAKgNAkjQ1PfvrVgJ_UXUerG9MzLAoUt9ixgS07L9LAroCW7_Jw@mail.gmail.com>
References: <515EF542.8090200@redhat.com> <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA@mail.gmail.com>
 <201304071503.07751.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304071503.07751.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Apr 7, 2013 at 9:03 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Sunday 07 April 2013 06:15:18 Michael Kerrisk (man-pages) wrote:
>> On Fri, Apr 5, 2013 at 6:01 PM, Peter Schiffer wrote:
>> > it looks like the clone(2) man page is describing glibc implementation
>> > and not the system call. So I guess it should be moved to the section 3
>> > and a new man page for clone(2) syscall should be created in section 2.
>> >
>> > The clone(2) syscall is defined like this:
>> >
>> > SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>> >                  int __user *, parent_tidptr,
>> >                  int __user *, child_tidptr,
>> >                  int, tls_val)
>> >
>> > (I'm sorry, but I don't have a patch this time.)
>>
>> The general tendency is to document all system calls in section 2, and
>> if there are some differences caused by wrapper functions, then they
>> are noted on the page.
>>
>> I admint that clone(2) is an unusual case. The signature given at the
>> top of the page is for the wrapper (and later the difference to the
>> syscall raw interface are described). However, the details are
>> primarily about the underlying kernel interface, so I'm inclined to
>> leave the page where it is.
>
> i think his point is that the syscall doesn't take a func pointer.  it is
> userspace (the C lib) that takes care of making the clone syscall and then
> calling the function.  the man page doesn't mention this anywhere that i see.

Yes, I've tried to claify this.

> the notes section does refer to this as being a "system call" instead of a
> "system call wrapper" when discussing ia64.

And I've also tried to clarify that.

> also, the quoted syscall signature isn't the whole story.  there's actually
> more variants:
> #ifdef __ARCH_WANT_SYS_CLONE
> #ifdef CONFIG_CLONE_BACKWARDS
> SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>          int __user *, parent_tidptr,
>          int, tls_val,
>          int __user *, child_tidptr)
> #elif defined(CONFIG_CLONE_BACKWARDS2)
> SYSCALL_DEFINE5(clone, unsigned long, newsp, unsigned long, clone_flags,
>          int __user *, parent_tidptr,
>          int __user *, child_tidptr,
>          int, tls_val)
> #else
> SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>          int __user *, parent_tidptr,
>          int __user *, child_tidptr,
>          int, tls_val)
> ...

I've worked in some of the above detail; see the Git copy of the page.

> these arches don't define __ARCH_WANT_SYS_CLONE:
>         blackfin ia64 m68k sparc

I'm not sure of the significance of the above; can you explain?

> and i gave up enumerating all the other edge cases :)

Okay.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
