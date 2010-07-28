From: Andre Landwehr <andrel-qFpIZCbatykuZeo0DBJMuQ@public.gmane.org>
Subject: Re: bug in proc(5) manpage
Date: Wed, 28 Jul 2010 12:41:23 +0200
Message-ID: <1280313683.1994.70.camel@precision.loewe-komp.de>
References: <1280311444.1994.67.camel@precision.loewe-komp.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-0obE5mKWHs7sr4q4PME3"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1280311444.1994.67.camel-cB/ihCqopeGbpGji+OEwdKSq0ejlY3ad@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-0obE5mKWHs7sr4q4PME3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday, 2010/07/28, 12:04 +0200 Andre Landwehr wrote:
> hi,
> the man page for "proc" says for the /proc/[pid]/stat files the field
> "itrealvalue":
>
> "Since kernel 2.6.17, this field is no longer maintained, and is hard
> coded as 0."
>=20
> Looking at the kernel source[1] however, I see that the field is not
> hard coded as 0 but instead has been removed completely. Since this may
> result in a one-off when searching for a specific field, it should be
> documented correctly.

Forget it, the man page is correct. I overlooked the hardcoded "0" in
the format string of the printf. Sorry for the noise.

Regards,
Andre

--=20
Andre Landwehr, Ricklinger Stadtweg 42, D-30459 Hannover




--=-0obE5mKWHs7sr4q4PME3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxQCU8ACgkQC3ZlGS1b0mOlUQCgttwdtm59MCQ3/OaBlivXvtDS
Wo0AnRVwtZg7fJ5pkXQYadqH0cdpBXmH
=dM9i
-----END PGP SIGNATURE-----

--=-0obE5mKWHs7sr4q4PME3--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
