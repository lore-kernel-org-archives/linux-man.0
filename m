From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] errno: add numbers to the errno-names
Date: Tue, 20 Sep 2011 16:43:38 +0200
Message-ID: <20110920144338.GC1915@pengutronix.de>
References: <1310591022-28752-1-git-send-email-w.sang@pengutronix.de>
 <CAKgNAkgMoFBJKQhy_mnMuSsdm5TY2SSyoOW3iG70UaqSZeqRKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgMoFBJKQhy_mnMuSsdm5TY2SSyoOW3iG70UaqSZeqRKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2011 at 04:34:52PM +0200, Michael Kerrisk wrote:
> Hello Wolfram,
>=20
> On Wed, Jul 13, 2011 at 11:03 PM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wr=
ote:
> > Kernel logs often print errnos as '%d', so having the numbers next to t=
he
> > defined names in the man-page is convenient to find out what went wrong.
> > Also move the indentation from 16 to 21 to make the numbers fit.
> >
> > Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >
> > The errorcodes were inserted by a little awk-script which parsed the nu=
mbers
> > directly out of the Kernel include-files.
>=20
> Which Kernel include files? As I recall there is some variation in
> errno codes across architectures.

Yes, true. Alpha has a custom one :( Pity!

Thanks for the pointer,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk54ppoACgkQD27XaX1/VRt/hACglN1ZHi0lB0c60htmg5WVCmMM
UD0AnRZC+aEcW6iEoapHRjnpHb+/wmoE
=+3Ua
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
