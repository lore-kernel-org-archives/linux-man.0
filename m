From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigvec.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 01 Apr 2014 20:13:19 +0200
Message-ID: <533B01BF.9060106@gmail.com>
References: <1395650439-11347-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395650439-11347-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Haitao! Applied.

Cheers,

Michael


On 03/24/2014 09:43 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> The functions sigvec(), sigblock(), sigsetmask() and
> siggetmask() are thread safe.
> 
> The macro sigmask() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sigvec.3 | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/sigvec.3 b/man3/sigvec.3
> index 28f580c..39b39f9 100644
> --- a/man3/sigvec.3
> +++ b/man3/sigvec.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH SIGVEC 3 2014-02-18 "Linux" "Linux Programmer's Manual"
> +.TH SIGVEC 3 2014-03-24 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  sigvec, sigblock, sigsetmask, siggetmask, sigmask \- BSD signal API
>  .SH SYNOPSIS
> @@ -218,6 +218,19 @@ See the ERRORS under
>  .BR sigaction (2)
>  and
>  .BR sigprocmask (2).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR sigvec (),
> +.BR sigblock (),
> +.BR sigsetmask (),
> +and
> +.BR siggetmask ()
> +functions are thread-safe.
> +.LP
> +The
> +.BR sigmask ()
> +macro is thread-safe.
>  .SH CONFORMING TO
>  All of these functions were in
>  4.3BSD, except
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
