From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: memrchr(3): depends on _GNU_SOURCE
Date: Sat, 5 Dec 2009 06:06:38 +0100
Message-ID: <cfd18e0f0912042106we0323fcx56556b438bca5591@mail.gmail.com>
References: <4B0D3255.9080305@iki.fi>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B0D3255.9080305-X3B1VOXEql0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Peuhkuri <puhuri-X3B1VOXEql0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Markus,

On Wed, Nov 25, 2009 at 2:34 PM, Markus Peuhkuri <puhuri-X3B1VOXEql0@public.gmane.org> wrote:
> At manual page (memchr, memrchr and rawmemchr) it is listed that only
> rawmemchr needs _GNU_SOURCE feature test macro. However, at least in
> /usr/include/string.h shipped with Debian Lenny and Ubuntu 9.04 both
> have also memrchr in same #ifdef __USE_GNU block.
>
> Correction:
>
> --- memchr.old =A02008-07-26 15:31:57.431082210 +0200
> +++ memchr.3 =A0 =A02009-11-25 15:31:39.000000000 +0200
> @@ -46,6 +46,8 @@
> =A0.BR feature_test_macros (7)):
> =A0.in
> =A0.sp
> +.BR memrchr ():
> +_GNU_SOURCE
> =A0.BR rawmemchr ():
> =A0_GNU_SOURCE
> =A0.SH DESCRIPTION
>
>
> (or should them be at same line.)

Thanks for the report. Indeed, it should be at the same line. Fixed for=
 3.24.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
