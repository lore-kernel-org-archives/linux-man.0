From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Wed, 11 May 2016 12:27:51 -0400
Message-ID: <20160511162751.GN26300@vapier.lan>
References: <571E731A.6050809@canonical.com>
 <20160509213140.GD26300@vapier.lan>
 <573103C8.9050008@canonical.com>
 <20160511025040.GL26300@vapier.lan>
 <20160511131855.GG3051@e104818-lin.cambridge.arm.com>
 <20160511140024.GM26300@vapier.lan>
 <20160511152622.GJ3051@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9gXqgVhKaPB5h51M"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160511152622.GJ3051-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--9gXqgVhKaPB5h51M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11 May 2016 16:26, Catalin Marinas wrote:
> On Wed, May 11, 2016 at 10:00:24AM -0400, Mike Frysinger wrote:
> > On 11 May 2016 14:18, Catalin Marinas wrote:
> > > On Tue, May 10, 2016 at 10:50:40PM -0400, Mike Frysinger wrote:
> > > > On 09 May 2016 22:40, Colin Ian King wrote:
> > > > > On 09/05/16 22:31, Mike Frysinger wrote:
> > > > > > On 25 Apr 2016 20:42, Colin Ian King wrote:
> > > > > >> currently, the aarch64 clone() system call requires the stack =
to be
> > > > > >> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
> > > > > >> copy_thread():
> > > > > >>
> > > > > >>                 if (stack_start) {
> > > > > >>                         if (is_compat_thread(task_thread_info(=
p)))
> > > > > >>                                 childregs->compat_sp =3D stack=
_start;
> > > > > >>                         /* 16-byte aligned stack mandatory on =
AArch64 */
> > > > > >>                         else if (stack_start & 15)
> > > > > >>                                 return -EINVAL;
> > > > > >>                         else
> > > > > >>                                 childregs->sp =3D stack_start;
> > > > > >>                 }
> > > > > >>
> > > > > >>
> > > > > >> ..and returns -EINVAL if not aligned correctly.  This should b=
e added to
> > > > > >> the manual page clone(2) as it took me a while to figure out w=
hy clone()
> > > > > >> was failing with -EINVAL for aarch64 but not on x86.
> > > > > >=20
> > > > > > seems weird for the kernel to be enforcing this.  is it just be=
cause of
> > > > > > the stated ABI ?  or is there some weird requirement in the ker=
nel itself
> > > > > > that requires this ?  it's not like other arches have this chec=
k, and
> > > > > > there are def ABI requirements about stack alignments in C.
> > > > >=20
> > > > > The article here indicates it is an aarch64 convention:
> > > > >=20
> > > > > https://community.arm.com/groups/processors/blog/2015/11/19/using=
-the-stack-in-aarch32-and-aarch64
> > > >=20
> > > > that checks my point about the ABI having alignment requirements, b=
ut
> > > > that doesn't mean it needs to be checked/enforced in the kernel.  a=
ll
> > > > the limitations i see there can be seen in other arches, but we don=
't
> > > > have those arches do any stack alignment checking.  so should we be
> > > > dropping it from aarch64 ?  why does it need to be special here ?
> > >=20
> > > It is not just a software ABI requirement but a hardware one. If you =
try
> > > to access the stack with an unaligned SP value, you get a fault follo=
wed
> > > by a SIGBUS delivered to the user application. We decided to enforce
> > > this at the copy_thread() level, it is easier to catch such issue ear=
ly
> > > than debugging SIGBUS delivered to a thread.
> >=20
> > as i said, that same behavior can be observed on other arches.  i know =
of
> > at least one for sure that if the stack is unaligned, then push/pop ops
> > will also trigger SIGBUS.  x86 tends to be more forgiving, but if it is=
n't
> > 16bytes, then it is known that SSE optimized code will often fault.
> >=20
> > so the question is still: why is aarch64 enforcing in the kernel what a=
ll
> > other arches have left alone even when they behave the same in hardware=
 ?
>=20
> This was an early decision before we upstreamed the AArch64 kernel
> patches. Whether it was right or not it doesn't matter much now;

the logic behind it still matters.  what was it ?  or was it just what
you outlined above ?

> at this
> point it is considered kernel-user (syscall) ABI and any change would
> require careful review.

i don't think this classifies as ABI: we're talking about relaxing a
restriction, not adding a new one.  if we delete this code, all valid
old binaries that worked in the past will continue to work.
-mike

--9gXqgVhKaPB5h51M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXM12HAAoJEEFjO5/oN/WBHugP/2LWveWwgwNOJn5groNrjDES
3u32jkAp3pP2LwBgQr9Mb9AeS0xzkHUh4ShgF5ZPKRAJ+C+HADZG1D8U03itE35E
7TiQzlub1ZwvcapXH0jTxKg8eapsTyXmQ4d4Lzsr3uH51CB92nmzt+GzTjjXuyvG
LnsA+Pvt7vXdlcICTmd8jzHqNCfGuZsf+/ax5YtPbC/J4bu1uVO68GA1smwaGhXU
OqP9TQirqFvy4v92EZ9A8oThO5EBdhH+WDYGg6AneAjaOi934Uj0XW3IRxTUTHUZ
5/kbxHiEJQNf/398BsRre7PL8CuA7xykiYIfuZxBwwWYHRLA0IYCRZbtMynMd3Hv
v2kxkKC6vU/cIOUw117jegJGfs6Jr/egfngjozsFj/O+pD4rL8ck9riXm+TDrpRe
CpdrbY76BbPaDcgVpxJuRoWFPxTTv6S/6eDWe+mDYZs9jOWSxL/AehxkReN5zZk4
cPjxMD9pOwhacN6A1zZ56bgKb75Ykph/Ebhwh+CZJpCxJ+uF3XWncb/OdST0aY9D
wSntJNnLAjcyTG2XviLpO1fCHyRRHr4MWKaUJVbTuywOFpUVKEFHV784EcAB0YS4
zuzSWOazpfa88zMPXL8ITN5fKY+ry7z2rfvCB9bheyiDMxv5iULyG77d4VkLNF2r
GStPsl2j7a1GPn8WVMha
=LoxL
-----END PGP SIGNATURE-----

--9gXqgVhKaPB5h51M--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
