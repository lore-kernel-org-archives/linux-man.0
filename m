From: Andre Landwehr <andrel-qFpIZCbatykuZeo0DBJMuQ@public.gmane.org>
Subject: bug in proc(5) manpage
Date: Wed, 28 Jul 2010 12:04:04 +0200
Message-ID: <1280311444.1994.67.camel@precision.loewe-komp.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-OixcBlgCXxKcvcOZwJjc"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-OixcBlgCXxKcvcOZwJjc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,
the man page for "proc" says for the /proc/[pid]/stat files the field
"itrealvalue":

"Since kernel 2.6.17, this field is no longer maintained, and is hard
coded as 0."

Looking at the kernel source[1] however, I see that the field is not
hard coded as 0 but instead has been removed completely. Since this may
result in a one-off when searching for a specific field, it should be
documented correctly.

Best regards,

Andre


[1] compare the relevant file of 2.6.16 and 2.6.17=20
    sources:
    http://lxr.linux.no/#linux+v2.6.16/fs/proc/array.c#L415
    http://lxr.linux.no/#linux+v2.6.17/fs/proc/array.c#L413


--=20
Andre Landwehr, Ricklinger Stadtweg 42, D-30459 Hannover




--=-OixcBlgCXxKcvcOZwJjc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxQAIwACgkQC3ZlGS1b0mPMKACgyxDTUGqDkv2nfrVd5mRDMbCu
zc4AoJcKqenHF9Znms+EUHFdW1pxIHEe
=nQBu
-----END PGP SIGNATURE-----

--=-OixcBlgCXxKcvcOZwJjc--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
