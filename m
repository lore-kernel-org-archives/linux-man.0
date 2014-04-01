From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] abort.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 01 Apr 2014 20:13:52 +0200
Message-ID: <533B01E0.9070502@gmail.com>
References: <1395714636-20263-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395714636-20263-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Haitao! Applied.

Cheers,

Michael


On 03/25/2014 03:33 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> The function abort() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/abort.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/abort.3 b/man3/abort.3
> index 854c7d4..cd25dc8 100644
> --- a/man3/abort.3
> +++ b/man3/abort.3
> @@ -31,7 +31,7 @@
>  .\" Modified Fri Aug  4 10:51:53 2000 - patch from Joseph S. Myers
>  .\" 2007-12-15, mtk, Mostly rewritten
>  .\"
> -.TH ABORT 3  2007-12-15 "GNU" "Linux Programmer's Manual"
> +.TH ABORT 3  2014-03-25 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  abort \- cause abnormal process termination
>  .SH SYNOPSIS
> @@ -69,6 +69,11 @@ and then raising the signal for a second time.
>  The
>  .BR abort ()
>  function never returns.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR abort ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001, 4.3BSD, C89, C99.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
