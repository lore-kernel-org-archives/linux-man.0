From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: document era keywords
Date: Fri, 17 Jul 2015 00:05:20 +0200
Message-ID: <55A82AA0.1010404@gmail.com>
References: <558BB0D7.9010307@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558BB0D7.9010307-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 06/25/2015 09:42 AM, Marko Myllynen wrote:
> Hi Michael,
> 
> this patch completes the LC_TIME section - since these era keywords are
> so tightly coupled, I'm providing them as a single patch.
> 
> Based on
> 
> http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap07.html
> http://www.open-std.org/jtc1/SC22/WG20/docs/n972-14652ft.pdf

Thanks! Applied. Sorry for the delay.

Cheers,

Michael


> ---
>  man5/locale.5 | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 84 insertions(+), 5 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index e6c1f07..22cda04 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -1067,11 +1067,6 @@ The definition starts with the string
>  in the first column.
>  
>  The following keywords are allowed:
> -.\" FIXME The following LC_TIME keywords are not documented:
> -.\"	era
> -.\"	era_d_fmt
> -.\"	era_d_t_fmt
> -.\"	era_t_fmt
>  .TP
>  .I abday
>  followed by a list of abbreviated names of the days of the week.
> @@ -1125,6 +1120,89 @@ followed by the appropriate time format
>  when using 12h clock format.
>  This should be left empty for locales not using AM/PM convention.
>  .TP
> +.I era
> +followed by semicolon-separated strings that define how years are
> +counted and displayed for each era in the locale.
> +Each string has the following format:
> +.RS
> +.PP
> +.IR direction ":" offset ":" start_date ":" end_date ":" era_name ":" era_format
> +.PP
> +The fields are to be defined as follows:
> +.PP
> +.TP 4
> +.I direction
> +Either
> +.BR +
> +or
> +.BR -.
> +.BR +
> +means the years closer to
> +.IR start_date
> +have lower numbers than years closer to
> +.IR end_date .
> +.BR -
> +means the opposite.
> +.TP
> +.I offset
> +The number of the year closest to
> +.IR start_date
> +in the era, corresponding to the
> +.IR %Ey
> +descriptor (see
> +.BR strptime (3)).
> +.TP
> +.I start_date
> +The start of the era in the form of
> +.IR yyyy/mm/dd .
> +Years prior AD 1 are represented as negative numbers.
> +.TP
> +.I end_date
> +The end of the era in the form of
> +.IR yyyy/mm/dd ,
> +or one of the two special values of
> +.BR -*
> +or
> +.BR +* .
> +.BR -*
> +means the ending date is the beginning of time.
> +.BR +*
> +means the ending date is the end of time.
> +.TP
> +.I era_name
> +The name of the era corresponding to the
> +.I %EC 
> +descriptor (see
> +.BR strptime (3)).
> +.TP
> +.I era_format
> +The format of the year in the era corresponding to the
> +.I %EY
> +descriptor (see
> +.BR strptime (3)).
> +.RE
> +.TP
> +.I era_d_fmt
> +followed by the format of the date in alternative era notation,
> +corresponding to the
> +.I %Ex
> +descriptor (see
> +.BR strptime (3)).
> +.TP
> +.I era_t_fmt
> +followed by the format of the time in alternative era notation,
> +corresponding to the
> +.I %EX
> +descriptor (see
> +.BR strptime (3)).
> +.TP
> +.I era_d_t_fmt
> +followed by the format of the date and time in alternative era notation,
> +corresponding to the
> +.I %Ec
> +descriptor (see
> +.BR strptime (3)).
> +.TP
>  .I alt_digits
>  followed by the alternative digits used for date and time in the locale.
>  .TP
> @@ -1254,6 +1332,7 @@ This manual page isn't complete.
>  .BR newlocale (3),
>  .BR setlocale (3),
>  .BR strftime (3),
> +.BR strptime (3),
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
