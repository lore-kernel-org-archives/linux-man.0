From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: document glibc conventions regarding days and
 week
Date: Mon, 26 May 2014 10:43:54 +0200
Message-ID: <5382FECA.7050008@gmail.com>
References: <5382D64A.9020404@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5382D64A.9020404-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-locales-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/26/2014 07:51 AM, Marko Myllynen wrote:
> Hi,
> 
> let's document glibc de facto current interpretation of handling
> weekdays also on the locale(5) man page, based on Petr's research in
> the past, currently documented in the glibc Locales wiki page.

Pending any comments, I've applied this patch in a locale branch, and
will merge when you ping me, Marko.

Cheers,

Michael


> 
>>From fc28ef135148e0b6c6546666422cc9999e64bfc3 Mon Sep 17 00:00:00 2001
> From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Mon, 26 May 2014 08:42:23 +0300
> Subject: [PATCH] locale.5: document glibc conventions regarding days and week
> 
> Based on existing practice and glibc community wiki page at
> 
> https://sourceware.org/glibc/wiki/Locales
> ---
>  man5/locale.5 |   69 +++++++++++++++++++++++++++++++++++++++++++-------------
>  1 files changed, 53 insertions(+), 16 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 2ad8e59..1b0f57d 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -966,14 +966,14 @@ followed by a list of abbreviated names of the days of the week.
>  The list starts with the first day of the week
>  as specified by
>  .I week
> -(Sunday by default).
> +(Sunday by default). See NOTES.
>  .TP
>  .I day
>  followed by a list of names of the days of the week.
>  The list starts with the first day of the week
>  as specified by
>  .I week
> -(Sunday by default).
> +(Sunday by default). See NOTES.
>  .TP
>  .I abmon
>  followed by a list of abbreviated month names.
> @@ -1011,16 +1011,7 @@ Regarding the start of the week,
>  shall be used for Sunday and
>  .B 19971201
>  shall be used for Monday.
> -Thus, countries using
> -.B 19971130
> -should have local Sunday name as the first day in the
> -.I day
> -list,
> -while countries using
> -.B 19971201
> -should have Monday translation as the first item in the
> -.I day
> -list.
> +See NOTES.
>  .TP
>  .IR first_weekday " (since glibc 2.2)"
>  followed by the number of the first day from the
> @@ -1031,12 +1022,12 @@ The default value of
>  corresponds to either Sunday or Monday depending
>  on the value of the second
>  .I week
> -list item.
> +list item. See NOTES.
>  .TP
>  .IR first_workday " (since glibc 2.2)"
>  followed by the number of the first working day from the
>  .I day
> -list.
> +list. See NOTES.
>  .TP
>  .I cal_direction
>  .\" from localedata/locales/uk_UA
> @@ -1067,10 +1058,56 @@ definition ends with the string
>  \(em database for the current locale setting of that category
>  .br
>  /usr/lib/nls/charmap/* \(em charmap-files
> +.SH NOTES
> +The collective GNU C library community wisdom regarding
> +.IR day ,
> +.IR week ,
> +and
> +.I first_weekday
> +states at
> +https://sourceware.org/glibc/wiki/Locales
> +the following:
> +.PP
> +The value of the second
> +.I week
> +list item specifies the base of the
> +.I day
> +list.
> +.PP
> +.I first_weekday
> +specifies the offset of the first day-of-week in the
> +.I day
> +list.
> +.PP
> +For compatibility reasons, all glibc locales should set the value of the
> +second
> +.I week
> +list item to
> +.B 19971130
> +(Sunday) and base the
> +.I day
> +list appropriately, and set
> +.I first_weekday
> +to
> +.B 1
> +or
> +.BR 2 ,
> +depending on whether the week actually starts on Sunday or Monday
> +for the locale.
> +.PP
> +Thus, a locale which week starts on Monday
> +.I first_weekday
> +and
> +.I first_workday
> +should be set to
> +.B 2
> +and
> +.I abday
> +and
> +.I day
> +should have the locale representation of Sunday as the first list item.
>  .SH CONFORMING TO
>  POSIX.2, ISO/IEC 14652.
> -.SH BUGS
> -This manual page isn't complete.
>  .\" .SH AUTHOR
>  .\" Jochen Hein (Hein-SVAqIv1tV6Auki3NsKDZl5HjxUfvIkdz@public.gmane.org)
>  .SH SEE ALSO
> --
> 1.7.1
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
