From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tcgetpgrp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 13 Jan 2014 21:42:16 +1300
Message-ID: <52D3A6E8.5080402@gmail.com>
References: <1389578306-7050-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389578306-7050-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/13/2014 02:58 PM, Peng Haitao wrote:
> The functions tcgetpgrp() and tcsetpgrp() are thread safe.

Applied. Thanks, Haitao.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/tcgetpgrp.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/tcgetpgrp.3 b/man3/tcgetpgrp.3
> index 2bea0cf..da039e2 100644
> --- a/man3/tcgetpgrp.3
> +++ b/man3/tcgetpgrp.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH TCGETPGRP 3 2003-01-28 "GNU" "Linux Programmer's Manual"
> +.TH TCGETPGRP 3 2014-01-13 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  tcgetpgrp, tcsetpgrp \- get and set terminal foreground process group
>  .SH SYNOPSIS
> @@ -106,6 +106,13 @@ of the calling process.
>  .I pgrp
>  has a supported value, but is not the process group ID of a
>  process in the same session as the calling process.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR tcgetpgrp ()
> +and
> +.BR tcsetpgrp ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
