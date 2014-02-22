From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setbuf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sat, 22 Feb 2014 10:23:03 +0100
Message-ID: <53086C77.7070403@gmail.com>
References: <1392715588-9324-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392715588-9324-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks.

On 02/18/2014 10:26 AM, Peng Haitao wrote:
> The functions setbuf(), setbuffer(), setlinebuf() and setvbuf()
> are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/setbuf.3 | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/setbuf.3 b/man3/setbuf.3
> index ad9914f..242afcf 100644
> --- a/man3/setbuf.3
> +++ b/man3/setbuf.3
> @@ -45,7 +45,7 @@
>  .\" Correction,  2000-03-03, Andreas Jaeger <aj-l3A5Bk7waGM@public.gmane.org>
>  .\" Added return value for setvbuf, aeb,
>  .\"
> -.TH SETBUF 3  2012-08-03 "Linux" "Linux Programmer's Manual"
> +.TH SETBUF 3  2014-02-18 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  setbuf, setbuffer, setlinebuf, setvbuf \- stream buffering operations
>  .SH SYNOPSIS
> @@ -161,6 +161,15 @@ It may set
>  on failure.
>  
>  The other functions do not return a value.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR setbuf (),
> +.BR setbuffer (),
> +.BR setlinebuf (),
> +and
> +.BR setvbuf ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  The
>  .BR setbuf ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
