From: =?iso-8859-1?Q?C=E9dric?= Boutillier <cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] ld.so.8: missing .TP tag before description of --audit LIST
Date: Fri, 9 Mar 2012 23:39:30 +0100
Message-ID: <20120309223930.GA8520@spin>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

During the translation of 3.37 into French, I noticed the following
problem: in man8/ld.so.8, there is a missing .TP tag. Patch againt
master (man-pages-3.37-8-g2bfe665) below.

Best regards,

	C=E9dric


diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 5c02204..2fbacae 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -126,6 +126,7 @@ Ignore RPATH and RUNPATH information in object names in=
 LIST.
 This option is ignored if
 .B ld.so
 is set-user-ID or set-group-ID.
+.TP
 .B \-\-audit LIST
 Use objects named in LIST as auditors.
 .SH ENVIRONMENT

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPWoadAAoJENpJWPYR4UnpaloP/RYZvH9andAK5Y3v2nkYv+0A
6yqUatY3arVyHsBTlHsecKgQIjwipc6b2XEfcpamQCS6tkaw6PGksEpEKHbRRgxT
IJ2FeHs+Q0F4jaXkCkUKyd21uvJbmRtVHCn2ox1zoWho3gh6qk0RBXgsegXf+xM0
bd/y970FIZA4NR9sqqCW2jt1Huf3AJpCg8MciNtzwIsTgguRaavWRqpjtXm/z1Mn
VMJiMojqkI/J7//+XqHr9lYY0Ewdql9BAT8deR+FsqyT46/06cfryri1kMiIdq+Y
kN/g2bKw5MQbpBsyWE4cw0GR4A1hwBz2ddNoZYzJFkeA2EOm86BxI41TB7RerOan
rF9p8gM34PT/lOK4H8Wd+IY+rLTI5IqaZ12oK/Q1GLYjqWtdeU0kKFIMs/hxARf+
eojlF7xKYy1TgXzbfTraYM2mDn+0/jtrOX38RodMwUDeX/CkTMc4ZdF/sjf2HoUc
INZcTlL71dQvt2l3Gidad/K/Guwpf2/3/kRqKewZwRp0P7pGWMOBeK29fHZcqHS0
YuNiBxE7HfVQjHzhN6g1SzDFWNH9zXLE9AOFswRKXwImCyOhBNyyOdKIkd2lEZWT
8PplRyD2EcHTUr8Wl9gGCzR+LYkxQCBOVRkQH/PZLjD78lvVYn/AyK+3L8aOc8wz
AgmtELDJBP6QBr8YF09V
=5xMI
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
