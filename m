From: Karl-Philipp Richter <krichter-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: [patch] trivial extranous comma in host.conf.5 tfix
Date: Wed, 18 Jun 2014 22:31:32 +0200
Message-ID: <53A1F724.5060102@posteo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="iIKcEkDN60GRbC3sH68momBwK5Kvpefgs"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iIKcEkDN60GRbC3sH68momBwK5Kvpefgs
Content-Type: multipart/mixed;
 boundary="------------010803000208000608040301"

This is a multi-part message in MIME format.
--------------010803000208000608040301
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi together,
please find attached a trivial patch for a typo in man(5) page of host.co=
nf

Best regards,
Kalle Richter

--------------010803000208000608040301
Content-Type: text/x-patch;
 name="fix_simple_comma_typo.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="fix_simple_comma_typo.patch"

=46rom 824ea7110915e59bde282bbcf8d936701dca97b4 Mon Sep 17 00:00:00 2001
From: Karl-Philipp Richter <krichter722-fMVlBex6FRc@public.gmane.org>
Date: Wed, 18 Jun 2014 22:29:40 +0200
Subject: [PATCH] trivial typo (extranous comma)

---
 man5/host.conf.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/host.conf.5 b/man5/host.conf.5
index a289cb4..bbc8ab7 100644
--- a/man5/host.conf.5
+++ b/man5/host.conf.5
@@ -40,7 +40,7 @@ These keywords are described below.
 This keyword specifies how host lookups are to be performed.
 It should be followed by one or more lookup methods, separated by commas=
=2E
 Valid methods are
-.IR bind ", " hosts ", and " nis .
+.IR bind ", " hosts " and " nis .
 .TP
 .I trim
 This keyword may be listed more than once.
--=20
2.0.0


--------------010803000208000608040301--

--iIKcEkDN60GRbC3sH68momBwK5Kvpefgs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTofckAAoJEGadKJ8eJ7ZGMJ4IALTt1TDGO3aKKVUm7YOoSQf0
/GC49FmeR+QbqnM0vxPQYi539G4yGdkTqD6fNMT7B5flEKqGekBoKkpdFftdwObn
hNHijKo/Qmpj9xw5U7cY4UgiaiI1rn84zlH0c4Diij1HOryTFWmQMDH/n7tT9YzI
YKxHV4fTWnCinVkwHRZzTDyOzXvZ2a7ovP4iKdIM82jzwRXm0Yja16moG/Mvnibe
olHt97W0h5OTjPDGieb9aC1fFBhYB2daSeZIGEN38wdb5lVyH2UwQ9cwlAnIX+bv
qQmIA5VDPlNWwWkCfPV8LUFZG7a2JEGGDuVBEwGsliCc1llF+yg0+iXJrej9Oqw=
=ZHW7
-----END PGP SIGNATURE-----

--iIKcEkDN60GRbC3sH68momBwK5Kvpefgs--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
