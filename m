From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Tue, 10 May 2016 22:50:40 -0400
Message-ID: <20160511025040.GL26300@vapier.lan>
References: <571E731A.6050809@canonical.com>
 <20160509213140.GD26300@vapier.lan>
 <573103C8.9050008@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="656hIAUFSU7Oh46B"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <573103C8.9050008-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
List-Id: linux-man@vger.kernel.org


--656hIAUFSU7Oh46B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09 May 2016 22:40, Colin Ian King wrote:
> On 09/05/16 22:31, Mike Frysinger wrote:
> > On 25 Apr 2016 20:42, Colin Ian King wrote:
> >> currently, the aarch64 clone() system call requires the stack to be
> >> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
> >> copy_thread():
> >>
> >>                 if (stack_start) {
> >>                         if (is_compat_thread(task_thread_info(p)))
> >>                                 childregs->compat_sp =3D stack_start;
> >>                         /* 16-byte aligned stack mandatory on AArch64 =
*/
> >>                         else if (stack_start & 15)
> >>                                 return -EINVAL;
> >>                         else
> >>                                 childregs->sp =3D stack_start;
> >>                 }
> >>
> >>
> >> ..and returns -EINVAL if not aligned correctly.  This should be added =
to
> >> the manual page clone(2) as it took me a while to figure out why clone=
()
> >> was failing with -EINVAL for aarch64 but not on x86.
> >=20
> > seems weird for the kernel to be enforcing this.  is it just because of
> > the stated ABI ?  or is there some weird requirement in the kernel itse=
lf
> > that requires this ?  it's not like other arches have this check, and
> > there are def ABI requirements about stack alignments in C.
>=20
> The article here indicates it is an aarch64 convention:
>=20
> https://community.arm.com/groups/processors/blog/2015/11/19/using-the-sta=
ck-in-aarch32-and-aarch64

that checks my point about the ABI having alignment requirements, but
that doesn't mean it needs to be checked/enforced in the kernel.  all
the limitations i see there can be seen in other arches, but we don't
have those arches do any stack alignment checking.  so should we be
dropping it from aarch64 ?  why does it need to be special here ?
-mike

--656hIAUFSU7Oh46B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXMp4AAAoJEEFjO5/oN/WBIJoP/00pzO0isc/XWTCHMekVL2Zv
oc229DEjF6n2R6q89b/Vlm6qaRlVvZ7uT0cGLZpLxUXvPWLeU1l6JKSGTLnJf9hL
PGb1zt/M9/NK4ens5SnJwgvBtdAuiuSx6HTYS8PnV5EjcoqICBXAeverx0bBXS4g
KUzqtrvdFi19GoPWJBU2IKjWzxQUA5clQcnKtje+zrxpTAo+pdh28C+/IatNcckH
dD2dIrePrSXZNgqi/E7XoS7XAOZJCf7QauKf6/yzTqb2/qybZguM9JQdHdwXbNuO
v6nJSO+r5liDcXTRLRGEGbvWJGNk8/tksT+yaoim9YNYoyYHQY2T1AfWV+dqcoKS
e6lwcpHRil2T/KOv0YPamHzt30do0bT+h3P6oiJjkHC9e/gIzNtzOyH8NM+dUrKA
N7pInCEL06KRHNiRdx+Lzkrm1O7QjWQqYEbs3vnwaBXuHH1/6HbpLMKLE+lJ0XUj
8UY8DcKMRbiS39f3VnIEOBQSVG/bBX0zpnp3JWOBMV97z8FzOrpZ/sDZ+N0HSXBk
FaMpyfw5B+77+3ku+OtaFMj4PrA1TChNrokey2Lwn6D2HNjqQveDEWJ+411x8Bsk
P/Vtn13UyU1R9dKtCdTUYPMOEiSYZEGeOBNNA64wEtJNcQvJRLwQ3uvYH3lE1PQw
vJiumRHz2tUCT0AnP/0x
=biXo
-----END PGP SIGNATURE-----

--656hIAUFSU7Oh46B--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
