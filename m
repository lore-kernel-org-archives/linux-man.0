From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: elf.5: EI_BRAND is not exist in Linux
Date: Wed, 3 Feb 2010 02:04:35 -0500
Message-ID: <201002030204.36675.vapier@gentoo.org>
References: <20100107133046.7d380dcb@keeper.home.local> <cfd18e0f1002022208j7e78def6ycee31e0c818b9351@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1466829.9opsQaaGoa";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f1002022208j7e78def6ycee31e0c818b9351-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1466829.9opsQaaGoa
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 03 February 2010 01:08:03 Michael Kerrisk wrote:
> On Thu, Jan 7, 2010 at 11:30 AM, Yuri Kozlov wrote:
> > From elf.5:
> >  e_ident     This array of bytes specifies to interpret the file, ...
> >    EI_BRAND    Start of architecture identification.
> >
> > Value for EI_BRAND is not defined in the linux/elf.h (and gabi too).
> > Maybe add some comment, that is for *BSD only?
>
> You've done a patch or two to the elf.5 page in the past. Are you able
> to comment on the below? I confirmed Yuri's statement: EI_BRAND isn't
> in glibc 2.11 source.

not being the glibc source isnt terribly important imo (since there are a l=
ot=20
of things glibc's elf.h doesnt define), but the fact it isnt in the gabi as=
=20
Yuri notes seems pretty important:
http://www.sco.com/developers/gabi/latest/ch4.eheader.html

whether it be marked as non-standard (and then we research what random OSes=
=20
actually define it) or simply drop it, either makes sense to me.  the latte=
r=20
is obviously less work :).
=2Dmike

--nextPart1466829.9opsQaaGoa
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iQIcBAABAgAGBQJLaSAEAAoJEEFjO5/oN/WBytoQAN2uqJUHfURO171SaBZEzKss
TVEGCefhMXumIVaq/winR/QAdEjzIqI2zt7JnnUa/cpJSyCcAOMWD4qrtsGoT9Xz
nhnfk9DhIhVtTDim3Z9f45TJ90/qqd2s3G6QKithKp+eFYY5S2ywCunZP0N4PxhV
pJmoDCuEBeiSTPLXMsEBF/IwRwvGHlwsEgvxIdFodHy9NDV8rKsLza3Wz0dRaXi3
0xHynfMFWP75xyw63wWBV58o+nLSYiB/kft+EQvVjlOX6s4d0Aq0/DJy6dWdGaXg
yZZXyReoW4h+GSUtKU25elVd4OqRC/XbvxaiRDDKqA3wZcMAv9WjYrVDp5Hpq5j1
ckbv4S+evbomb2wSR0FvDKX4G0T8iCbbUrYD66PvtSSjVFEhAt6OMgdZ8LUytmjl
QVXuZrUCrN/3CImorGrzok8mNZFieyC5A+W/ESkGn3XKbrESIr/jyS7c6SIGY/9p
baSGLnrr2gM6khQ6AqkSrnChBnSvtw1f9YVqiBrGdBEnL2NX/jLlRrqeV+/469Ia
v/NcV0oFvOBd07oebp/+4t//lpVM5SYBx2FqAINzIsOjt5g2EKsXeh3rlBYIy4KK
ie13cWaYUElBy5G1NWsDoQIie0rKeeHugHvEB9dzl3J6ZqC3tfSsc2WkYTavHYMx
xpVoGOnoTgKD81hyA3Ay
=J4nk
-----END PGP SIGNATURE-----

--nextPart1466829.9opsQaaGoa--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
