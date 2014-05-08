From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtime.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 08 May 2014 11:42:12 +0200
Message-ID: <536B5174.5010409@gmail.com>
References: <1399381433-16490-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399381433-16490-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

Cheers,

Michael


On 05/06/2014 03:03 PM, Peng Haitao wrote:
> The function rtime() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/rtime.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/rtime.3 b/man3/rtime.3
> index ce093af..8070ee3 100644
> --- a/man3/rtime.3
> +++ b/man3/rtime.3
> @@ -9,7 +9,7 @@
>  .\"
>  .\" Slightly polished, aeb, 2003-04-06
>  .\"
> -.TH RTIME 3 2014-01-05 "GNU" "Linux Programmer's Manual"
> +.TH RTIME 3 2014-05-06 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  rtime \- get time from a remote machine
>  .SH SYNOPSIS
> @@ -54,6 +54,11 @@ The number of returned bytes is not 4.
>  .TP
>  .B ETIMEDOUT
>  The waiting time as defined in timeout has expired.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR rtime ()
> +function is thread-safe.
>  .SH NOTES
>  Only IPv4 is supported.
>  .LP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
