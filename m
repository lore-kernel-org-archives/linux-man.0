From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify_init(2): BUG O_CLOEXEC ignored
Date: Mon, 29 Sep 2014 16:48:07 +0200
Message-ID: <54297127.5050005@gmail.com>
References: <1411809421-5012-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411809421-5012-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich

I've applied this with some tweaks. See below.

On 09/27/2014 11:17 AM, Heinrich Schuchardt wrote:
> The bug section should describe that O_CLOEXEC is ignored.
> A patch is pending.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fanotify_init.2 | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
> index 8539325..9d42fa5 100644
> --- a/man2/fanotify_init.2
> +++ b/man2/fanotify_init.2
> @@ -237,10 +237,18 @@ was introduced in version 2.6.36 of the Linux kernel and enabled in version
>  .SH "CONFORMING TO"
>  This system call is Linux-specific.
>  .SH BUGS
> -As of Linux 3.15,
> +As of Linux 3.17,
> +the following bug exists:
> +.IP * 3
> +.\" FIXME . Patch proposed: https://lkml.org/lkml/2014/9/24/967
> +.B O_CLOEXEC
> +passed in
> +.I event_f_flags
> +is ignored.

The above looks good, and is applied.

> +.PP
> +Up to Linux 3.15,
>  the following bug exists:
>  .IP * 3
> -.\" FIXME . Patch accepted to mm tree.
>  The
>  .I event_f_flags
>  argument is not checked for invalid flags.

It's a small thing, but really the above piece should have been a 
separate patch. It is a separate (and important) point:
A different bug was fixed in 3.15.

So, instead I made the text as follows:

[[
The following bug was present in Linux kernels before version 3.14:
.IP * 3
.\" Fixed by commit 48149e9d3a7e924010a0daab30a6197b7d7b6580
The
.I event_f_flags
argument is not checked for invalid flags.
]]

and applied this as a separate commit.

Thanks very much for the patch!

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
