From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] armscii-8.7, koi8-r.7, koi8-u.7, unicode.7: Uniform description
Date: Mon, 25 Oct 2010 07:18:58 +0200
Message-ID: <AANLkTi=DngvZdHPMqQmH9DQZ750ukoKZfzayWLDkBOQw@mail.gmail.com>
References: <ia2bm0$2lt$1@dough.gmane.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ia2bm0$2lt$1@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Mon, Oct 25, 2010 at 12:24 AM, David Pr=E9vot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org> wr=
ote:
> Hi,
>
> Please find inline a patch to address some consistency among
> character set manual page descriptions. If you prefer to
> shrink =93the=94 from other manual page descriptions (ascii.7,
> cp1251.7 and iso_8859-*.7 ones), I volunteer to provide the
> (trivial) patch instead.

Thanks. Applied for 3.30. I prefer without "the", and made that change =
also.

All changes are now pushed to git; you may wish to check.

Thanks,

Michael


>
>
> diff --git a/man7/armscii-8.7 b/man7/armscii-8.7
> index 9cd8bd1..597f0a8 100644
> --- a/man7/armscii-8.7
> +++ b/man7/armscii-8.7
> @@ -25,7 +25,7 @@
> =A0.TH ARMSCII-8 7 2010-09-20 "Linux" "Linux Programmer's Manual"
> =A0.nh
> =A0.SH NAME
> -armscii-8 \- Armenian Character Set encoded in octal, decimal, and
> +armscii-8 \- the Armenian character set encoded in octal, decimal, a=
nd
> =A0hexadecimal
> =A0.SH DESCRIPTION
> =A0The Armenian Standard Code for Information Interchange,
> diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
> index 509adac..bb08d8b 100644
> --- a/man7/koi8-r.7
> +++ b/man7/koi8-r.7
> @@ -25,7 +25,7 @@
> =A0.TH KOI8-R 7 2010-10-24 "Linux" "Linux Programmer's Manual"
> =A0.nh
> =A0.SH NAME
> -koi8-r \- Russian Net Character Set encoded in octal, decimal, and
> +koi8-r \- the Russian character set encoded in octal, decimal, and
> =A0hexadecimal
> =A0.SH DESCRIPTION
> =A0KOI8-R is the character set of choice for encoding Russian texts f=
or
> diff --git a/man7/koi8-u.7 b/man7/koi8-u.7
> index 5d30bb8..d59cb52 100644
> --- a/man7/koi8-u.7
> +++ b/man7/koi8-u.7
> @@ -26,7 +26,7 @@
> =A0.TH KOI8-U 7 2010-09-20 "Linux" "Linux Programmer's Manual"
> =A0.nh
> =A0.SH NAME
> -koi8-u \- Ukrainian Net Character Set encoded in octal, decimal, and
> +koi8-u \- the Ukrainian character set encoded in octal, decimal, and
> =A0hexadecimal
> =A0.SH DESCRIPTION
> =A0KOI8-U (KOI8 Ukrainian, described in RFC\ 2310)
> diff --git a/man7/unicode.7 b/man7/unicode.7
> index ee4c4bc..b8a8948 100644
> --- a/man7/unicode.7
> +++ b/man7/unicode.7
> @@ -29,7 +29,7 @@
> =A0.\"
> =A0.TH UNICODE 7 2001-05-11 "GNU" "Linux Programmer's Manual"
> =A0.SH NAME
> -Unicode \- the Universal Character Set
> +Unicode \- the universal character set
> =A0.SH DESCRIPTION
> =A0The international standard
> =A0.B ISO 10646
>
>
> Regards
>
> David
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
