From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpwnam.3: Add description of the functions are not thread-safe
Date: Sun, 17 Mar 2013 11:48:19 +0100
Message-ID: <CAKgNAkgg-or9HyZ793dHpRc_DVSfCCfnEz6EHtKhx1oyPLYZpg@mail.gmail.com>
References: <4E71B895.704@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E71B895.704-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Peng,

I dug through some old mails...

On Thu, Sep 15, 2011 at 10:34 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>
> The functions getpwnam() and getpwuid() return a pointer to a static area which
> is overwritten by a subsequent call to them. So they are thread-unsafe.

I've applied this to my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpwnam.3 |   15 ++++++++++++++-
>  1 files changed, 14 insertions(+), 1 deletions(-)
>
> diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
> index 649da01..679477d 100644
> --- a/man3/getpwnam.3
> +++ b/man3/getpwnam.3
> @@ -32,7 +32,7 @@
>  .\" Modified 2003-11-15 by aeb
>  .\" 2008-11-07, mtk, Added an example program for getpwnam_r().
>  .\"
> -.TH GETPWNAM 3  2010-10-21 "GNU" "Linux Programmer's Manual"
> +.TH GETPWNAM 3  2011-09-15 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  getpwnam, getpwnam_r, getpwuid, getpwuid_r \- get password file entry
>  .SH SYNOPSIS
> @@ -206,6 +206,19 @@ Insufficient buffer space supplied.
>  .TP
>  .I /etc/passwd
>  local password database file
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The two functions
> +.BR getpwnam ()
> +and
> +.BR getpwuid ()
> +are not thread_safe.
> +.LP
> +The two functions
> +.BR getpwnam_r ()
> +and
> +.BR getpwuid_r ()
> +are thread-safe.
>  .SH "CONFORMING TO"
>  SVr4, 4.3BSD, POSIX.1-2001.
>  The
> --
> 1.7.1
>
> --
> Best Regards,
> Peng Haitao
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
