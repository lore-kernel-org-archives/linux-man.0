From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strsep.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 26 Feb 2014 10:23:46 +0100
Message-ID: <530DB2A2.9060600@gmail.com>
References: <1393311599-4668-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393311599-4668-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

On 02/25/2014 07:59 AM, Peng Haitao wrote:
> The function strsep() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strsep.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strsep.3 b/man3/strsep.3
> index d08c437..f469ebf 100644
> --- a/man3/strsep.3
> +++ b/man3/strsep.3
> @@ -30,7 +30,7 @@
>  .\" Modified Mon Jan 20 12:04:18 1997 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
>  .\" Modified Tue Jan 23 20:23:07 2001 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
>  .\"
> -.TH STRSEP 3  2014-01-04 "GNU" "Linux Programmer's Manual"
> +.TH STRSEP 3  2014-02-25 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  strsep \- extract token from string
>  .SH SYNOPSIS
> @@ -76,6 +76,11 @@ The
>  function returns a pointer to the token,
>  that is, it returns the original value of
>  .IR *stringp .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strsep ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  4.4BSD.
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
