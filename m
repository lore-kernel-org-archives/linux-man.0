From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] locale.5: tfix
Date: Mon, 14 Apr 2014 12:23:38 +0200
Message-ID: <534BB72A.6070905@gmail.com>
References: <20140412180355.0ac2aeac@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140412180355.0ac2aeac-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On 04/12/2014 04:03 PM, Yuri Kozlov wrote:
> 
> ---
>  man5/locale.5 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index e699088..1a79b17 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -405,7 +405,7 @@ toupper list is used.
>  The
>  .B LC_CTYPE
>  definition ends with the string
> -.IR "END LC_CYTPE" .
> +.IR "END LC_CTYPE" .
>  .SS LC_COLLATE
>  .\" FIXME: the decsription of LC_COLLATE lacks a lot of details
>  The
> @@ -450,7 +450,7 @@ notably the examples
>  .BR POSIX ,
>  .B Example
>  and
> -.B Example2
> +.B Example2 .

Thanks. (Should be: ".BR Example2 .")

>  .PP
>  The
>  .B LC_COLLATE
> @@ -685,7 +685,7 @@ otherwise a space separates the sign string and the value.
>  .I n_sep_by_space
>  followed by an integer that indicates the separation of
>  .IR currency_symbol ,
> -the sign string, and the value for a nonnegative formatted monetary quantity.
> +the sign string, and the value for a negative formatted monetary quantity.

Thanks for catching that piece especially.

>  The same values are recognized as for
>  .IR p_sep_by_space .
>  .TP
Patch applied.

Thanks!

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
