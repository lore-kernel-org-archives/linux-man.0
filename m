From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: sort according to the standard
Date: Fri, 12 Jun 2015 20:18:06 +0200
Message-ID: <557B225E.2010102@gmail.com>
References: <5576F609.1030200@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F609.1030200-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/09/2015 04:19 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> sort the options so that those defined in POSIX are listed first,
> then followed by those defined in ISO/IEC TR 14652 in the order
> of common convention in many widely used glibc locales.
> 
> Actual descriptions are unchanged.


Thanks, Marko. Applied.

Cheers,

Michael


> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap07.html
> ---
>  man5/locale.5 |  104 ++++++++++++++++++++++++++++----------------------------
>  1 files changed, 52 insertions(+), 52 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 556c745..bbc46b7 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -418,6 +418,10 @@ and
>  .B <tab>
>  are automatically included.
>  .TP
> +.I charclass
> +followed by a list of locale-specific character class names
> +which are then to be defined in the locale.
> +.TP
>  .I toupper
>  followed by a list of mappings from lowercase to uppercase
>  letters.
> @@ -444,10 +448,6 @@ followed by a locale-specific character class definition,
>  starting with the class name followed by the characters
>  belonging to the class.
>  .TP
> -.I charclass
> -followed by a list of locale-specific character class names
> -which are then to be defined in the locale.
> -.TP
>  .I charconv
>  followed by a list of locale-specific character map names
>  which are then to be defined in the locale.
> @@ -740,27 +740,6 @@ the symbol succeeds the value.
>  the symbol precedes the value.
>  .RE
>  .TP
> -.I n_cs_precedes
> -followed by an integer that indicates the placement of
> -.I currency_symbol
> -for a negative formatted monetary quantity.
> -The same values are recognized as for
> -.IR p_cs_precedes .
> -.TP
> -.I int_p_cs_precedes
> -followed by an integer that indicates the placement of
> -.I int_currency_symbol
> -for a nonnegative internationally formatted monetary quantity.
> -The same values are recognized as for
> -.IR p_cs_precedes .
> -.TP
> -.I int_n_cs_precedes
> -followed by an integer that indicates the placement of
> -.I int_currency_symbol
> -for a negative internationally formatted monetary quantity.
> -The same values are recognized as for
> -.IR p_cs_precedes .
> -.TP
>  .I p_sep_by_space
>  followed by an integer that indicates the separation of
>  .IR currency_symbol ,
> @@ -782,6 +761,13 @@ a space separates them from the value;
>  otherwise a space separates the sign string and the value.
>  .RE
>  .TP
> +.I n_cs_precedes
> +followed by an integer that indicates the placement of
> +.I currency_symbol
> +for a negative formatted monetary quantity.
> +The same values are recognized as for
> +.IR p_cs_precedes .
> +.TP
>  .I n_sep_by_space
>  followed by an integer that indicates the separation of
>  .IR currency_symbol ,
> @@ -789,22 +775,6 @@ the sign string, and the value for a negative formatted monetary quantity.
>  The same values are recognized as for
>  .IR p_sep_by_space .
>  .TP
> -.I int_p_sep_by_space
> -followed by an integer that indicates the separation of
> -.IR int_currency_symbol ,
> -the sign string,
> -and the value for a nonnegative internationally formatted monetary quantity.
> -The same values are recognized as for
> -.IR p_sep_by_space .
> -.TP
> -.I int_n_sep_by_space
> -followed by an integer that indicates the separation of
> -.IR int_currency_symbol ,
> -the sign string,
> -and the value for a negative internationally formatted monetary quantity.
> -The same values are recognized as for
> -.IR p_sep_by_space .
> -.TP
>  .I p_sign_posn
>  followed by an integer that indicates where the
>  .I positive_sign
> @@ -849,6 +819,36 @@ should be placed for a negative monetary quantity.
>  The same values are recognized as for
>  .IR p_sign_posn .
>  .TP
> +.I int_p_cs_precedes
> +followed by an integer that indicates the placement of
> +.I int_currency_symbol
> +for a nonnegative internationally formatted monetary quantity.
> +The same values are recognized as for
> +.IR p_cs_precedes .
> +.TP
> +.I int_n_cs_precedes
> +followed by an integer that indicates the placement of
> +.I int_currency_symbol
> +for a negative internationally formatted monetary quantity.
> +The same values are recognized as for
> +.IR p_cs_precedes .
> +.TP
> +.I int_p_sep_by_space
> +followed by an integer that indicates the separation of
> +.IR int_currency_symbol ,
> +the sign string,
> +and the value for a nonnegative internationally formatted monetary quantity.
> +The same values are recognized as for
> +.IR p_sep_by_space .
> +.TP
> +.I int_n_sep_by_space
> +followed by an integer that indicates the separation of
> +.IR int_currency_symbol ,
> +the sign string,
> +and the value for a negative internationally formatted monetary quantity.
> +The same values are recognized as for
> +.IR p_sep_by_space .
> +.TP
>  .I int_p_sign_posn
>  followed by an integer that indicates where the
>  .I positive_sign
> @@ -1095,14 +1095,6 @@ followed by a list of abbreviated month names.
>  .I mon
>  followed by a list of month names.
>  .TP
> -.I am_pm
> -followed by the appropriate representation of the
> -.B am
> -and
> -.B pm
> -strings.
> -This should be left empty for locales not using AM/PM convention.
> -.TP
>  .I d_t_fmt
>  followed by the appropriate date and time format
>  (for syntax, see
> @@ -1118,6 +1110,14 @@ followed by the appropriate time format
>  (for syntax, see
>  .BR strftime ()).
>  .TP
> +.I am_pm
> +followed by the appropriate representation of the
> +.B am
> +and
> +.B pm
> +strings.
> +This should be left empty for locales not using AM/PM convention.
> +.TP
>  .I t_fmt_ampm
>  followed by the appropriate time format
>  (for syntax, see
> @@ -1125,6 +1125,9 @@ followed by the appropriate time format
>  when using 12h clock format.
>  This should be left empty for locales not using AM/PM convention.
>  .TP
> +.I alt_digits
> +followed by the alternative digits used for date and time in the locale.
> +.TP
>  .I week
>  followed by a list of three values as plain numbers:
>  The number of days in a week (by default 7),
> @@ -1179,9 +1182,6 @@ followed by the appropriate date representation for
>  .BR date (1)
>  (for syntax, see
>  .BR strftime ()).
> -.TP
> -.I alt_digits
> -followed by the alternative digits used for date and time in the locale.
>  .PP
>  The
>  .B LC_TIME
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
