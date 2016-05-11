From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Wed, 11 May 2016 10:00:24 -0400
Message-ID: <20160511140024.GM26300@vapier.lan>
References: <571E731A.6050809@canonical.com>
 <20160509213140.GD26300@vapier.lan>
 <573103C8.9050008@canonical.com>
 <20160511025040.GL26300@vapier.lan>
 <20160511131855.GG3051@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2nmUZS6EBFTGcnEV"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160511131855.GG3051-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--2nmUZS6EBFTGcnEV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11 May 2016 14:18, Catalin Marinas wrote:
> On Tue, May 10, 2016 at 10:50:40PM -0400, Mike Frysinger wrote:
> > On 09 May 2016 22:40, Colin Ian King wrote:
> > > On 09/05/16 22:31, Mike Frysinger wrote:
> > > > On 25 Apr 2016 20:42, Colin Ian King wrote:
> > > >> currently, the aarch64 clone() system call requires the stack to be
> > > >> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
> > > >> copy_thread():
> > > >>
> > > >>                 if (stack_start) {
> > > >>                         if (is_compat_thread(task_thread_info(p)))
> > > >>                                 childregs->compat_sp =3D stack_sta=
rt;
> > > >>                         /* 16-byte aligned stack mandatory on AArc=
h64 */
> > > >>                         else if (stack_start & 15)
> > > >>                                 return -EINVAL;
> > > >>                         else
> > > >>                                 childregs->sp =3D stack_start;
> > > >>                 }
> > > >>
> > > >>
> > > >> ..and returns -EINVAL if not aligned correctly.  This should be ad=
ded to
> > > >> the manual page clone(2) as it took me a while to figure out why c=
lone()
> > > >> was failing with -EINVAL for aarch64 but not on x86.
> > > >=20
> > > > seems weird for the kernel to be enforcing this.  is it just becaus=
e of
> > > > the stated ABI ?  or is there some weird requirement in the kernel =
itself
> > > > that requires this ?  it's not like other arches have this check, a=
nd
> > > > there are def ABI requirements about stack alignments in C.
> > >=20
> > > The article here indicates it is an aarch64 convention:
> > >=20
> > > https://community.arm.com/groups/processors/blog/2015/11/19/using-the=
-stack-in-aarch32-and-aarch64
> >=20
> > that checks my point about the ABI having alignment requirements, but
> > that doesn't mean it needs to be checked/enforced in the kernel.  all
> > the limitations i see there can be seen in other arches, but we don't
> > have those arches do any stack alignment checking.  so should we be
> > dropping it from aarch64 ?  why does it need to be special here ?
>=20
> It is not just a software ABI requirement but a hardware one. If you try
> to access the stack with an unaligned SP value, you get a fault followed
> by a SIGBUS delivered to the user application. We decided to enforce
> this at the copy_thread() level, it is easier to catch such issue early
> than debugging SIGBUS delivered to a thread.

as i said, that same behavior can be observed on other arches.  i know of
at least one for sure that if the stack is unaligned, then push/pop ops
will also trigger SIGBUS.  x86 tends to be more forgiving, but if it isn't
16bytes, then it is known that SSE optimized code will often fault.

so the question is still: why is aarch64 enforcing in the kernel what all
other arches have left alone even when they behave the same in hardware ?
-mike

--2nmUZS6EBFTGcnEV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXMzr3AAoJEEFjO5/oN/WB7G8QAJHfeOF+MuSCH7gmnwrz9DiU
5murKIf4frgXrbks2cEj8syvaPYwZ/kQ+9Um25en6az3jzWXq4GzPbYmkel+8XPx
DYOdKDrJc9jnwZFrncGoivtmDxpfPYn+iwv0oS3jqpieLFcxjvWhsLYcVen+IYEh
ysBoM1MSGBhUnKD/dkwwNDrM/3KBLndRM4ArGqpYXvgort6/NGlIVqvUphOm+VW8
v/Ezlr7iAaiKbczIXsWjbRBt+hrmYNDIVVg17+jRcsFaay7lF0rxTwlo7qMxOoUs
0Y5ZQD88s84r6khzBFbTteUGf9b+ONIuIARdcHhE1qg7bn+Qvf9nkeJxxsFA6FGq
C6njxcyvYAhf2OboXGjCd9cR+0cptE2LR3hDhGEbHIPp5BgrNa7XMPR3pcVvqjq9
qvlC5nwc+TGSamDZiOOKIV0/FdCfLhSm5XZhI49vDGad13Q5z+X4xOzod7dBAuWx
7au4uxEvuNfNsULfdTCNQZYi0eEyXM+AAe8UiDXAAscMdNubqxi5h9XS3clX5OaA
mvCu+vXmI7E2p+srz9WSRioDSES9rlt5S0HpwpU8HNe0liYtbk537BhvweJc5R7x
JYSmeWhrNAqzODV7JWfJTl5ZemCkCc5ZPxm1mWKOEs09ij1dEgxwkZQnQr6JJee1
naeUDWApFSJXnyepdvRJ
=tAd7
-----END PGP SIGNATURE-----

--2nmUZS6EBFTGcnEV--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
