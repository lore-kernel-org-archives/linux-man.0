From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: refer to strftime(3) where appropriate
Date: Fri, 12 Jun 2015 20:18:00 +0200
Message-ID: <557B2258.8070308@gmail.com>
References: <5576F5C8.7020903@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F5C8.7020903-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/09/2015 04:18 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> the relationship between the locale time format syntax
> and strftime() cannot be considered as obvious.

Thanks, Marko. Applied. One point, though: the references should 
include the section number. I'll fix that.

Cheers,

Michael


> ---
>  man5/locale.5 |   22 +++++++++++++++++-----
>  1 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 374f6b2..2a2edc1 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -1106,16 +1106,25 @@ strings.
>  This should be left empty for locales not using AM/PM convention.
>  .TP
>  .I d_t_fmt
> -followed by the appropriate date and time format.
> +followed by the appropriate date and time format
> +(for syntax, see
> +.BR strftime ()).
>  .TP
>  .I d_fmt
> -followed by the appropriate date format.
> +followed by the appropriate date format
> +(for syntax, see
> +.BR strftime ()).
>  .TP
>  .I t_fmt
> -followed by the appropriate time format.
> +followed by the appropriate time format
> +(for syntax, see
> +.BR strftime ()).
>  .TP
>  .I t_fmt_ampm
> -followed by the appropriate time format when using 12h clock format.
> +followed by the appropriate time format
> +(for syntax, see
> +.BR strftime ())
> +when using 12h clock format.
>  This should be left empty for locales not using AM/PM convention.
>  .TP
>  .I week
> @@ -1169,7 +1178,9 @@ Right-left from top.
>  .TP
>  .I date_fmt
>  followed by the appropriate date representation for
> -.BR date (1).
> +.BR date (1)
> +(for syntax, see
> +.BR strftime ()).
>  .TP
>  .I alt_digits
>  followed by the alternative digits used for date and time in the locale.
> @@ -1244,6 +1255,7 @@ This manual page isn't complete.
>  .BR localeconv (3),
>  .BR newlocale (3),
>  .BR setlocale (3),
> +.BR strftime (3),
>  .BR uselocale (3),
>  .BR charmap (5),
>  .BR charsets (7),
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
