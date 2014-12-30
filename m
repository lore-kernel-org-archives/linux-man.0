From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: [PATCH] adjtimex.2: Add details about ADJ_FREQUENCY
Date: Tue, 30 Dec 2014 18:19:41 +0100
Message-ID: <54A2DEAD.2050708@supelec.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oVjXO5rKwBQrV7OKtOc0sbE9laaEH6alm"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oVjXO5rKwBQrV7OKtOc0sbE9laaEH6alm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

this is another patch for adjtimex(2) man page which fixes a FIXME by
giving the scaling unit of timex.freq and adds a detail about the value
expected by ADJ_FREQUENCY.

Laurent

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index 18823c8..2652fc6 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -55,8 +55,8 @@ struct timex {
                          status flag is set, otherwise
                          microseconds */
     long freq;        /* Frequency offset, as scaled PPM
-                         (parts per million) */
-.\" FIXME What is the scaling unit of timex.freq?  2^16 ?
+                         (parts per million) :
+                         the scaling unit of timex.freq is 2^16 usec =3D=

1000*2^16 nsec.
     long maxerror;    /* Maximum error (microseconds) */
     long esterror;    /* Estimated error (microseconds) */
     int  status;      /* Clock command/status */
@@ -106,6 +106,10 @@ Set time offset from
 .BR ADJ_FREQUENCY
 Set frequency offset from
 .IR buf.freq .
+The clock frequency must be comprised between -500000 and 500000 scaled
ns/s.
+If the given value is outside those bounds, it is silently truncated. Th=
is
+corresponds to values between -32768000 and 32768000 for
+.IR buf.freq .
 .TP
 .BR ADJ_MAXERROR
 Set maximum time error from


--oVjXO5rKwBQrV7OKtOc0sbE9laaEH6alm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlSi3scACgkQRTidSplJch65ggD+NyMFwhQV/ekRHYdnqqWyra3Y
SdK0LW6iI5kViwpqmZcBAKqLYo1p6JKgI25bx6bBa0DA6Clc8i5xm/33/AMieVcr
=WG8C
-----END PGP SIGNATURE-----

--oVjXO5rKwBQrV7OKtOc0sbE9laaEH6alm--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
