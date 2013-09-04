From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug] str(n)dup(3) typo in feature test macros
Date: Wed, 04 Sep 2013 08:15:22 +0200
Message-ID: <5226CFFA.1080801@gmail.com>
References: <d8384bdbedc49ebaba2362b2dd559d5e@imap.meterriblecrew.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d8384bdbedc49ebaba2362b2dd559d5e-YjGdiButnEYOIcSUmuw+JF6tKEld0gVj@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Wiese <aw-lkml-Y2ul+VlnGkTSryWq8ScI/qxOck334EZe@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/03/13 09:31, Andreas Wiese wrote:
> Hey, folks.
>=20
> I just stumbled upon a typo in strdup(3)-family manual page.  Took me=
 an
> hour and much cursing on flex, that strndup wasn't defined when build=
ing
> with -std=3Dc99 since it's spelled _POSIX_C_SOURCE, not POSIX_C_SOURC=
E.  I
> should've known myself, indeed=E2=80=A6 :/

Thanks for the fix, Andreas. Applied.

Cheers,

Michael


> --- /usr/share/man/man3/strdup.3	2013-09-02 15:04:48.736602203 +0200
> +++ strdup.3	2013-09-03 09:26:50.210203381 +0200
> @@ -63,7 +63,7 @@
>   .RS 4
>   .TP 4
>   Since glibc 2.10:
> -POSIX_C_SOURCE\ >=3D\ 200809L || _XOPEN_SOURCE\ >=3D\ 700
> +_POSIX_C_SOURCE\ >=3D\ 200809L || _XOPEN_SOURCE\ >=3D\ 700
>   .TP
>   Before glibc 2.10:
>   _GNU_SOURCE
>=20
>=20
> Best regards, a.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
