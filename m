From: Philipp Gesang <phg-seE3WNHshEcXhy9q4Lf3Ug@public.gmane.org>
Subject: [patch] strptime(3) ISO 8601 compliance
Date: Sun, 19 Nov 2017 20:58:55 +0100
Message-ID: <20171119195855.GA20953@lethe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: multipart/mixed; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

strptime.3 claims %F is both ISO 8601 compliant and equivalent to
%Y-%m-%d. Since the standard permits a leading dash character to
indicate negative years [0], this can=E2=80=99t be both true.

%F with strftime prints negative years just fine though. Hence
I=E2=80=99m not sure if this is a bug in the docs or glibc.

Best,
Philipp

[0] http://www.loc.gov/standards/datetime/iso-tc154-wg5_n0039_iso_wd_8601-2=
_2016-02-16.pdf


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-strptime.3-clarify-behavior-of-F-with-negative-years.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 57818307dc9ad8ecebc9517c26f800d3ae0cb0de Mon Sep 17 00:00:00 2001
=46rom: Philipp Gesang <phg-seE3WNHshEcXhy9q4Lf3Ug@public.gmane.org>
Date: Sun, 19 Nov 2017 20:34:59 +0100
Subject: [PATCH] strptime.3: clarify behavior of %F with negative years

ISO 8601 explicitly allows for negative years:

    year =3D positiveYear | negativeYear | "0000" ;
    positiveYear =3D positiveDigit, digit, digit, digit
                   | ...
    negativeYear =3D "-", positiveYear ;

Thus for strptime, "%F" isn't strictly equivalent to the ISO 8601 year
format since it fails to handle the sign. (strftime "%F" has no problem
with negative years.)

Signed-off-by: Philipp Gesang <phg-seE3WNHshEcXhy9q4Lf3Ug@public.gmane.org>
---
 man3/strptime.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/strptime.3 b/man3/strptime.3
index 6a82b04f4..b261e0736 100644
--- a/man3/strptime.3
+++ b/man3/strptime.3
@@ -363,7 +363,7 @@ This leads to
 .B %F
 Equivalent to
 .BR %Y-%m-%d ,
-the ISO 8601 date format.
+the ISO 8601 date format. (Parses only nonnegative year numbers.)
 .TP
 .B %g
 The year corresponding to the ISO week number, but without the century
--=20
2.15.0


--mojUlQ0s9EVzWg2t--

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEES333rrYLmJt7KIF3Oc0IoluWAywFAloR4n4ACgkQOc0IoluW
AyzzvQ/9EQ7f5AhVpbzw7MrrQz8l1zAZGJPhh022yhH/ouXktIBE0Paec5rG/gsp
l9QcQPM6DScJQcq6mHiy7fJneX3K+RlwMElYiOyji5nXBuvJKoriZn/zWZO3uwZY
fccz6FT/OPoW54Yq5OFURtEmxtqYEjUGAxI2AvUzbS/NKL19t6iEU+bAh9dkmeIw
+BBPOfiHxUbRBhmU7V5Pd4Spi2CY51wfGCcfaRskK6dsj82x3HU10XaV7rEgvCZw
BesorwbF1/vUgpzJeRtaEjsmM7dIh1M134z4iQeKNfTVRqoq7AOhdcjw/EtEbUBq
8FC1hc3IoYCxU3XbkVDT+EywQdcabPSOsnUtfMOuyg4IEPSBEfvqUQsrJkxbSEjf
nAqpZgFOgyrTzBHwE45VPSvjDNG24zmEZozCp4mixdmoNZUvE+60KHfDC0jvMMy4
wUXGybJfRberfZ0QcbBLKORERi0H++KtAFj6K9x9LS+piXu4OMVfs++XnZMRRJlR
eBN+2vgq+uf3OdLK/x7r+q1AUD1RFlQ8c3YJjZffNvx5isP00fBI6O3y7IQbVzL2
JYqokYCIh5d2tu5msHxQwKI/dyLGOjGey3xSJT+o5iaDL9ByVi8i9qLhicqlF9B9
J5jV4uuzVYH94o8r8QFrvDypaREM1Rwscrohe2mZ6o3/zTKxHIg=
=f6tq
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
