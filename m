From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: document glibc conventions regarding days and week
Date: Wed, 28 May 2014 16:30:30 +0200
Message-ID: <CAKgNAki4FD=2wJG+5bEqD7v7Q4ZD-2aOtRrQJEiBWKT2S2mMEA@mail.gmail.com>
References: <5382D64A.9020404@redhat.com> <CAKgNAkivXL4KwJoL9ZzEoc91zMx2sonKh=8ZV22Waa8BrWf6bQ@mail.gmail.com>
 <5385F087.2060602@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5385F087.2060602-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-locales-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Marko,


On Wed, May 28, 2014 at 4:19 PM, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 2014-05-28 14:54, Michael Kerrisk (man-pages) wrote:
>>
>> Looking at this patch more closely, there's a piece that seems to be broken.
>>
>> That sentence is garbled. Some words are missing, I think. Can you clarify?
>
> it was clumsy indeed, and also repetitive, I don't think it's needed at all
> as the previous paragraph already explains the same thing.
>
> Please see an updated and rebased patch below.

Best just to tell me what needs to be dropped from the preceding
patch, since I've already merged and edited in a private branch.

Thanks,

Michael


> From 19a2e938158ffb94b0265968c6213a16b5179985 Mon Sep 17 00:00:00 2001
> From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Wed, 28 May 2014 17:18:15 +0300
> Subject: [PATCH] locale.5: document glibc conventions regarding days and week
>
> Based on existing practice and glibc community wiki page at
>
> https://sourceware.org/glibc/wiki/Locales
> ---
>  man5/locale.5 |   59 +++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 files changed, 49 insertions(+), 10 deletions(-)
>
> diff --git a/man5/locale.5 b/man5/locale.5
> index 6f0538a..754a4e0 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -975,6 +975,7 @@ The list starts with the first day of the week
>  as specified by
>  .I week
>  (Sunday by default).
> +See NOTES.
>  .TP
>  .I day
>  followed by a list of names of the days of the week.
> @@ -982,6 +983,7 @@ The list starts with the first day of the week
>  as specified by
>  .I week
>  (Sunday by default).
> +See NOTES.
>  .TP
>  .I abmon
>  followed by a list of abbreviated month names.
> @@ -1020,16 +1022,7 @@ Regarding the start of the week,
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
> @@ -1041,6 +1034,7 @@ corresponds to either Sunday or Monday depending
>  on the value of the second
>  .I week
>  list item.
> +See NOTES.
>  .TP
>  .IR first_workday " (since glibc 2.2)"
>  followed by the number of the first working day from the
> @@ -1048,6 +1042,7 @@ followed by the number of the first working day from the
>  list.
>  The default value is
>  .BR 2 .
> +See NOTES.
>  .TP
>  .I cal_direction
>  .\" from localedata/locales/uk_UA
> @@ -1080,6 +1075,50 @@ Usual default locale archive location.
>  .TP
>  .I /usr/share/i18n/locales
>  Usual default path for locale definition files.
> +.SH NOTES
> +The collective GNU C library community wisdom regarding
> +.IR abday ,
> +.IR day ,
> +.IR week ,
> +.IR first_weekday ,
> +and
> +.I first_workday
> +states at
> +https://sourceware.org/glibc/wiki/Locales
> +the following:
> +.PP
> +The value of the second
> +.I week
> +list item specifies the base of the
> +.I abday
> +and
> +.I day
> +lists.
> +.PP
> +.I first_weekday
> +specifies the offset of the first day-of-week in the
> +.I abday
> +and
> +.I day
> +lists.
> +.PP
> +For compatibility reasons, all glibc locales should set the value of the
> +second
> +.I week
> +list item to
> +.B 19971130
> +(Sunday) and base the
> +.I abday
> +and
> +.I day
> +lists appropriately, and set
> +.I first_weekday
> +to
> +.B 1
> +or
> +.BR 2 ,
> +depending on whether the week actually starts on Sunday or Monday
> +for the locale.
>  .SH CONFORMING TO
>  POSIX.2, ISO/IEC TR 14652.
>  .SH BUGS
> --
> 1.7.1
>
> Thanks,
>
> --
> Marko Myllynen



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
