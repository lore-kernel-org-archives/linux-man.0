From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] log1p.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sun, 02 Mar 2014 07:21:45 +0100
Message-ID: <5312CDF9.9080003@gmail.com>
References: <1393567185-32369-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393567185-32369-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael

On 02/28/2014 06:59 AM, Peng Haitao wrote:
> The functions log1p(), log1pf() and log1pl() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/log1p.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/log1p.3 b/man3/log1p.3
> index 0d114b5..2884512 100644
> --- a/man3/log1p.3
> +++ b/man3/log1p.3
> @@ -26,7 +26,7 @@
>  .\"
>  .\" Modified 2002-07-27 by Walter Harms
>  .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
> -.TH LOG1P 3   2010-09-20 "" "Linux Programmer's Manual"
> +.TH LOG1P 3   2014-02-28 "" "Linux Programmer's Manual"
>  .SH NAME
>  log1p, log1pf, log1pl \-  logarithm of 1 plus argument
>  .SH SYNOPSIS
> @@ -139,6 +139,14 @@ These functions do not set
>  .\" FIXME . Is it intentional that these functions do not set errno?
>  .\" log(), log2(), log10() do set errno
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6792
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR log1p (),
> +.BR log1pf (),
> +and
> +.BR log1pl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .\" BSD
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
