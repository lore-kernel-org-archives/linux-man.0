From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] tmpfs(5): document current mount options
Date: Mon, 5 Feb 2018 11:18:17 -0500
Message-ID: <20180205161817.GD9138@vapier>
References: <20180127095928.6294-1-vapier@gentoo.org>
 <d92fae63-5d6a-56ea-1a69-973bee77395c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d92fae63-5d6a-56ea-1a69-973bee77395c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04 Feb 2018 10:03, Michael Kerrisk (man-pages) wrote:
> On 01/27/2018 10:59 AM, Mike Frysinger wrote:
> > Some of this content is moved from the mount(8) man page.
> > Style was based on proc(5) sections.
>=20
> Thanks. I've applied this.

you meant commit 462a385e9a239ac58e0db188d1d7ed94f36c2d6f ?  was the
author change a typo ?  am i more than person and didn't realize ?

> I also added some further details for the
> 'mpol' and 'huge' options, largely drawn from kernel Documentation
> files. Could you take a quick look at that new content?

seems fine

> Is there any other text for mount(8) that should be imported to
> tmpfs(5)?

i slurped all the tmpfs specific stuff out here.  there's room for
moving more stuff out, but into new pages.  that'll take more effort.
-mike

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAlp4g8kACgkQQWM7n+g3
9YGt/RAAzzmUKLrY2bqLHNA2KLG6dx++Kex0M1cIajxP/pG1vB3gzPZ2ue33ShfY
6I6xA3uAHLdH+mY3rhP/YE7ga8rmkgeXestU+Yd2n71J+0yGmTneZDrQ/2iJiISM
cB+89EROxIzFCGCKeVZKmx3UiPWlbL7I3BPbt8ZWulJZrZRNeELKVIEYl2xm+Ikj
h5MgfmMg5q2gHqxW3XFsMVGmpDEyZ3DviCs1h9jvnD1yTD/FW1a9TkPpo+XKs8og
ZiUnG78tlTFsnBRtA9qA1lWSlvq8oMVnfIx0xKm4Fl/XseTisW+k6qcatU/4z8fQ
0bxM3n1HlvCbp1ngJxnqQz9L1+PwfVGI9Mi9bNVH+zd5COqgPblTCByvL2aF4qO3
DlGAavzZJTm31P1SCmgOVoU4GphFectV9AK2Z93hnt+wllYk5hT/u/5ul+3QDGBr
FrNYi8m8msZ90bDFJSYSAJD7NSxbPW8v+GFTlKjJRqjURSFqTnX8FiH1elUfIvgw
dSsq8VCawDbHJlUfbEUzDIdWMZvywsG2HwfIzjEIxcJpS93INs5TRGQsGsIyqqG3
eskHucTb8gLfXC2bWmJZ8BD1iOLHJe60iaFd72Et9piv48VaInhKPiZJG3sVr9Pw
XdnvNDkmyWJiVhjQmqVbxt0zPjBo+lK4XPLw+USLcSbw3FPhkgY=
=sQdF
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
