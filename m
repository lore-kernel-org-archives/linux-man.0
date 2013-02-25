From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] zdump.8: ffix
Date: Mon, 25 Feb 2013 05:44:10 +0100
Message-ID: <CAKgNAkg3RgMzZ_B6B-gMFraeT5WexQnHWOE3PttARv6gFrwD+Q@mail.gmail.com>
References: <1361766561-3679-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361766561-3679-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

Cheers,

Michael

On Mon, Feb 25, 2013 at 5:29 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man8/zdump.8 |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/man8/zdump.8 b/man8/zdump.8
> index 3bd32af..fb1e7c3 100644
> --- a/man8/zdump.8
> +++ b/man8/zdump.8
> @@ -13,7 +13,9 @@ zdump \- timezone dumper
>  .B \-v
>  ] [
>  .B \-c
> -[loyear,]hiyear ] [ zonename ... ]
> +.RI [ loyear \fB,\fR] hiyear
> +] [
> +.IR zonename " ... ]"
>  .SH DESCRIPTION
>  .I Zdump
>  prints the current time in each
> @@ -44,7 +46,7 @@ if the given time is Daylight Saving Time or
>  .B isdst=3D0
>  otherwise.
>  .TP
> -.BI "\-c " [loyear,]hiyear
> +.BI "\-c " \fR[\fIloyear , \fR]\fIhiyear
>  Cut off the verbose output near the start of the given year(s).
>  The output still includes the lowest possible time value
>  and one day after it, and the highest possible time value
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
