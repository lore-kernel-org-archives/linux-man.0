From: Simon Nicolussi <Simon.Nicolussi-oe7qfRrRQffpYOdAUmGicbNldLUNz+W/@public.gmane.org>
Subject: Redundant sentence in man page of acos(3)
Date: Sun, 13 Mar 2011 02:13:16 +0100
Message-ID: <20110313011316.GA4539@vendetta.sinic.name>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

the sentence "If x is positive infinity or negative infinity, a domain
error occurs, and a NaN is returned" in the man page of acos(3) seems
to be redundant, since it is followed by the more specific sentence "If
x is outside the range [-1, 1], a domain error occurs, and a NaN is
returned". In the man page of asin(3) there's only the latter sentence,
therefore the former should probably be removed, if only for consistency
reasons.

I've verified this in 3.32 and in a current checkout from git.

--=20
Simon Nicolussi, <Simon.Nicolussi-oe7qfRrRQffpYOdAUmGicbNldLUNz+W/@public.gmane.org>
http://homepage.uibk.ac.at/~csag9583/

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQEcBAEBAgAGBQJNfBooAAoJEAjZq1sVaquZiEUIAJD0yTruE811dtG5fvcJfwU9
Ohmm98RtV3E0ttEMvTxxbUJlCFvOCxxPzc+Zb9KAdoE0YDgQI2e6pI/r9hlBQwsU
+Lnif8qf5gky5ep8VmWAJAmLYOUHtaorfXUElRRSexwN/k29jmH4MBKg9JZ6f7Oy
Eun2o3BFgc8fWBww9nATrnP655ardViH4MMrXuXralw8hObgv57qcu/SRkI1Id4v
0fhlJDSzPburCdo8P5Gnl4Ho9LeME22YmJOCD93fvtoDzHoMLCF0XRl6Mvj3GxtB
mO68S+FTRVGcmbKi2pthmrsHy3oTg/rJmFaIummWG9vYwRw5qylNc1H4iSi5mMo=
=OBm3
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
