From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] unicode.7: Document private use areas
Date: Tue, 9 Feb 2016 12:27:30 +0100
Message-ID: <56B9CD22.3090306@debian.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9L17kqhaHolmOgBaPjXqgjcSmcHa7Cpon"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9L17kqhaHolmOgBaPjXqgjcSmcHa7Cpon
Content-Type: multipart/mixed;
 boundary="------------010903020707040003010408"

This is a multi-part message in MIME format.
--------------010903020707040003010408
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

there's a quite old bug report in Debian about missing information in
unicode.7. I've attached a patch with a wording suggestion.

<https://bugs.debian.org/285444>

Regards,
Tobias


--------------010903020707040003010408
Content-Type: text/x-patch;
 name="0001-unicode.7-Document-private-use-areas.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-unicode.7-Document-private-use-areas.patch"

=46rom df81380020726607bf4da401dc79a6275fd909a2 Mon Sep 17 00:00:00 2001
From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Date: Tue, 9 Feb 2016 11:59:24 +0100
Subject: [PATCH] unicode.7: Document private use areas

---
 man7/unicode.7 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man7/unicode.7 b/man7/unicode.7
index b21b5fb..dc586d8 100644
--- a/man7/unicode.7
+++ b/man7/unicode.7
@@ -191,7 +191,7 @@ and
 tells, how many positions (0\(en2) the cursor is advanced by the
 output of a character.
 .PP
-.SS Private area
+.SS Private Use Areas (PUA)
 In the Basic Multilingual Plane,
 the range 0xe000 to 0xf8ff will never be assigned to any characters by
 the standard and is reserved for private usage.
@@ -205,6 +205,11 @@ assigned to the Linux zone is maintained by LANANA a=
nd the registry
 itself is
 .I Documentation/unicode.txt
 in the Linux kernel sources.
+.PP
+Two other planes are reserved for private usage, plane 15
+(Supplementary Private Use Area-A, range 0xf0000 to 0xffffd)
+and plane 16 (Supplementary Private Use Area-B, range
+0x100000 to 0x10fffd).
 .SS Literature
 .IP * 3
 Information technology \(em Universal Multiple-Octet Coded Character
--=20
2.5.0


--------------010903020707040003010408--

--9L17kqhaHolmOgBaPjXqgjcSmcHa7Cpon
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJWuc0nAAoJEBMC8fA26+sZpTkP/jNzTzuI2cFdE/aSeCkrBn4i
hOxzfTjd3MUcW0QbIgdUdtIK341ZaLPhdhzWG2gmSUT4DiNTt0Hbujy2UbNpnYaZ
jGLwmD43HTQELKbnO0BQOL5fMdG2jBkZ7p8wBpR1tw2XrpViTUDKMaYNvdF36AMW
jtjLVRMF6N9DBaH1WQ28sszb0p4/2FPbYzol+BI/2KuTSJ5kLAApDtbKhmtUP9Ey
uM4U+qvB6zcw64JwX5z2t19NaIvPWCDVy1Gn1d9B/oYl82SwQchtLv4O84FDI7JC
/8m1rvaVo0eEY3LpBDGiSbciOs1C4Enn+/xCX9lJ+YvIAjXbsdvfKbjaeXKus35E
Q3MIkTmoOk6ATm972Q0nNZhYpx8wKgnFhuOFJlRGcon4IWuCXD8CMZdK+z0BIMyv
iSMV17vjWOEr0M3F/qe5B0DSGkaxlnZVeLz0LBEOf5BfJk1h0XbbxGu3io6rGfxL
d61YXVRnSTctwFt6UdGJH50Pa0YSj5OiMVQTNY8qKRzqoDrM0Vr7g3hW7DxxygXj
+gar/JQiCHGXWOH30LyM/4ex9ppX/smkAILBr5O4rB7WXkVC4K7RFeQ6CXjCIlRm
1W2+RFKWX1Eo1HEE+rN9fjUIqkpZaey5N2PWLOHEa/pBl2w7z/N0+B5Z7ux5jTo3
TaPgPwWvNllIgWvfx+Y1
=lGMy
-----END PGP SIGNATURE-----

--9L17kqhaHolmOgBaPjXqgjcSmcHa7Cpon--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
