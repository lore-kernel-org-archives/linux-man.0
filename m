From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mallopt.3: ffix
Date: Sat, 24 Mar 2012 11:44:33 +1300
Message-ID: <CAKgNAkjFJ1wTj3FtBdWEsVCSDXndyUkv7pN5V6piSjTkiV9pCQ@mail.gmail.com>
References: <1332539395-4867-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332539395-4867-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks for forwarding that, David. Applied.

On Sat, Mar 24, 2012 at 10:49 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> Author: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/mallopt.3 | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man3/mallopt.3 b/man3/mallopt.3
> index bab7dd0..f8848ab 100644
> --- a/man3/mallopt.3
> +++ b/man3/mallopt.3
> @@ -483,9 +483,9 @@ $ \fB./a.out\fP
> =A0/lib/libc.so.6(+0x6c501)[0x523501]
> =A0/lib/libc.so.6(+0x6dd70)[0x524d70]
> =A0/lib/libc.so.6(cfree+0x6d)[0x527e5d]
> -./a.out[0x80485db]
> +\&./a.out[0x80485db]
> =A0/lib/libc.so.6(__libc_start_main+0xe7)[0x4cdce7]
> -./a.out[0x8048471]
> +\&./a.out[0x8048471]
> =A0=3D=3D=3D=3D=3D=3D=3D Memory map: =3D=3D=3D=3D=3D=3D=3D=3D
> =A0001e4000\-001fe000 r\-xp 00000000 08:06 1083555 =A0 =A0/lib/libgcc=
_s.so.1
> =A0001fe000\-001ff000 r\-\-p 00019000 08:06 1083555 =A0 =A0/lib/libgc=
c_s.so.1
> --
> 1.7.9.1
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
