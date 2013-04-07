From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Sun, 7 Apr 2013 12:15:18 +0200
Message-ID: <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA@mail.gmail.com>
References: <515EF542.8090200@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515EF542.8090200-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Peter,


On Fri, Apr 5, 2013 at 6:01 PM, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Michael,
>
> it looks like the clone(2) man page is describing glibc implementation
> and not the system call. So I guess it should be moved to the section 3
> and a new man page for clone(2) syscall should be created in section 2.
>
> The clone(2) syscall is defined like this:
>
> SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>                  int __user *, parent_tidptr,
>                  int __user *, child_tidptr,
>                  int, tls_val)
>
> (I'm sorry, but I don't have a patch this time.)

The general tendency is to document all system calls in section 2, and
if there are some differences caused by wrapper functions, then they
are noted on the page.

I admint that clone(2) is an unusual case. The signature given at the
top of the page is for the wrapper (and later the difference to the
syscall raw interface are described). However, the details are
primarily about the underlying kernel interface, so I'm inclined to
leave the page where it is.

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
