From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 04:37:51 -0400
Message-ID: <201304010437.52901.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <CAKgNAki_8bOsuKTJLx3iMLeSvVXHo0bZf8zSUQ08RR7+D33xgQ@mail.gmail.com> <201304010319.45019.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3443684.6k45cG3eM0";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304010319.45019.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart3443684.6k45cG3eM0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 01 April 2013 03:19:43 Mike Frysinger wrote:
> for ARM OABI, there is no such padding, and the proposed example is wrong
> and will not work.
>=20
> for ARM EABI, the ABI requires that 64bit values be passed in register
> pairs. since the kernel people wanted to avoid an assembly trampoline to
> unpack the 64bit value with EABI, you have to call it as proposed:
> 	syscall(readahead, fd, _pad, high32, low32)
>=20
> for MIPS, only the O32 ABI has this behavior.
>=20
> for PPC, only the 32bit ABI has this behavior.
>=20
> otherwise, i don't believe anyone else does this -- they just pass things
> along in registers w/out padding.

in random grepping of code bases (uClibc), i believe the xtensa arch also d=
oes=20
64bit register pair aligning.  a cursory scan of the kernel seems to back t=
his=20
up.
=2Dmike

--nextPart3443684.6k45cG3eM0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRWUdgAAoJEEFjO5/oN/WBab0P+gPxUNTcdiKbhdLugQKfLmUO
W4IYgEiRQ6kYqq5EAusWW9CJfqv38EKX+PpfQtUGUt+p/ozuKRsW+hPYwovI53IG
J/1YbvUws7odZ8A6AQOFVOVFoGCOc8u67SnsCDmekdftT8cFJbVlIxzialJH+zh2
jOY81bZMEKLaKy+eisCxnS9F/linVKJ6S5f7VId8XI3jYh0X87JXmX+u8shWjvFd
OCCYwcgEekz9U8DiaifLK2N3tUTumuoVi77k3qop05y/Nxuf+AceXQ022PY2ypcV
OKseEyWMhPO/9gDUTswc9LPkHn0NNTopdBUacnJaIlH7etWddME8l3qBM2aDJ9PK
mYl/zWywDLJqCiEMMMxe42RGPMQxkFCznTixnAexWzUi/XYsXh8oodilx4ig/YLO
WCo5Xa1a2kRopuEoNQJS95Wd4SVvkfVVmhoCYs2z0wWegdjqxXJB1LShnIV0j5xF
peqqSmlgDpettJyV0uvqUNOitKktb9J8uptvefoW8aDWPndPQZcXwFGfRcBsZCkY
ay7u3aovyaCYA6fD/JIVVrnnHsJEdwJep597r1BfgGFuc1IzO/hcdJ6rLzkwgJPb
3PfuwfomSrF5XDa7VJzYUnX2x0uwIdMWw5XHyZcXqJGjD08VRvXl7urprxZ3ncAI
fGoAjVJ/ZnTG9qPgoIxG
=06Sv
-----END PGP SIGNATURE-----

--nextPart3443684.6k45cG3eM0--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
