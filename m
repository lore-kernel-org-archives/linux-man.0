From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
Date: Tue, 31 Oct 2017 21:36:58 -0400
Message-ID: <20171101013656.urhyeq7h2ccclxzu@crack.deadbeast.net>
References: <150833943926.13185.7883447908516236321.stgit@brunhilda>
 <20171019213558.aelneujzgyucrye3@crack.deadbeast.net>
 <4993A297653ECB4581FA5C3C31323D196721BE80@avsrvexchmbx2.microsemi.net>
 <588a2c6e-f01c-f1e8-9fd0-cdcd414dc973@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="toy54gv5ufn2worc"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <588a2c6e-f01c-f1e8-9fd0-cdcd414dc973-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerry Morong <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, John Hall <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Bader Ali - Saleh <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Teel <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Benesh <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--toy54gv5ufn2worc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2017-10-31T08:10:47+0100, Michael Kerrisk (man-opages) wrote:
> My apologies for not weighing in sooner. I see you got a lot of input from
> Branden! (Thanks, Branden!) How shall we move forward? Possibilities:
>=20
> 1. I apply your original patch as is.
> 2. You rework your patch incorporating those changes from Branden
>    that seem uncontroversial to you, and I apply, and then we
>    discuss any further changes that may be needed.
> 3. If all changes from Branden seem uncontroversial, I apply\
>    your patch, his patch, and then we  discuss any further changes
>    that may be needed.
>=20
> I suspect 2 or 3 is the way to go, but I await your input.

If the set of my changes accepted is not null, I'm happy to prepare
diffs for any parallel changes that are necessary to cciss(4) and
hpsa(4), which share some material with the proposed smartpqi(4).

--=20
Regards,
Branden

--toy54gv5ufn2worc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAln5JTgACgkQ0Z6cfXEm
bc5wmhAArLNrxZJKH/2RPfL/5HylY6/lhB/J82LDzk+6aqH4x/wCZGlXmjag+9lR
Q/E/sKtyJL8LN9b6yPV5gDMItkSZbl+sAPl3KA+T7x2ON2vk5VPMgR3XtRqu1zlh
W0pcIfVpV8w02ajZi5ZquU+vhELQIne3AjAZnMN5Emtov5UISwHDTlDsNJR9du32
VrfNz0TlCXSHY5HqRagplkBDvYu9I8FaDtUklVA7MWxVqDYa2RfCyxD6PHpAYfXE
/AZyq2ShT9H9x27n/CQYj4cpCNxU4d2aPfHTtfO3dO44GiPgjFwZfAWormifraLN
0xPr3LVgf90ue0rUPMQ/y/x6Zfv4+n/55CGcvHHBJHZcDUxrGPD/XidR9JpcoFZm
O3p1rxwPh9RcWy1ENXxz4ALBUoXRifcDjYkjNCF8t8Qw9ASDj7ufU4D+mtPhBGs+
oScLt238YY5sdQtrB/e3ACpg4nqmevyA2aGNTXO6lAV3JFfjWIR2c6sCGM2IK0Sg
lhKdFz2nR3S9IzvD2Sjo1KNnuOmb90M0Pa4TDL/LI5FDYv9mSQ8ceRUE+Yh/L66j
Dw9ASMWa5skk0z88/po4xJr26Z/Vtt6VAqYUZtIMwODLOXuYLbc9p3i5k4OfCIMK
lwNpixNsTG29Gw/Vvz36xBPbzT6batKwO7CERZIpASx0RysdbJE=
=ct6O
-----END PGP SIGNATURE-----

--toy54gv5ufn2worc--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
