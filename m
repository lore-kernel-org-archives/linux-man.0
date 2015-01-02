From: Laurent Georget <laurent.georget@supelec.fr>
Subject: Re: [PATCH 2/2] adjtimex.2: Change 'PPM' (parts per million) to 'ppm'
Date: Sat, 03 Jan 2015 00:07:42 +0100
Message-ID: <54A724BE.8050409@supelec.fr>
References: <54A2DEAD.2050708@supelec.fr> <54A72360.3070807@supelec.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4Q5xOQXmvFeuoMsBiUQA8rFkGrf9horje"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54A72360.3070807@supelec.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-man <linux-man@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Jeff Epler <jepler@unpythonic.net>, Richard Cochran <richardcochran@gmail.com>
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4Q5xOQXmvFeuoMsBiUQA8rFkGrf9horje
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi again,

this is the second patch of the new series of patchs for adjtimex.2.=20

This is a trivia patch correcting "PPM" (parts per million) to the more u=
sual "ppm".
Credits to Jeff Epler <jepler@unpythonic.net>.

---
 man2/adjtimex.2 | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index ff4b23e..dbb2333 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -54,7 +54,7 @@ struct timex {
     long offset;      /* Time offset; nanoseconds, if STA_NANO
                          status flag is set, otherwise
                          microseconds */
-    long freq;        /* Frequency offset, in units of 2^-16 PPM
+    long freq;        /* Frequency offset, in units of 2^-16 ppm
                          (parts per million) (see NOTES below) */
     long maxerror;    /* Maximum error (microseconds) */
     long esterror;    /* Estimated error (microseconds) */
@@ -62,8 +62,7 @@ struct timex {
     long constant;    /* PLL (phase-locked loop) time constant */
     long precision;   /* Clock precision (microseconds,
                          read-only) */
-    long tolerance;   /* Clock frequency tolerance (PPM,
-                         read-only) */
+    long tolerance;   /* Clock frequency tolerance (ppm, read-only) */
     struct timeval time;
                       /* Current time (read-only, except for
                          ADJ_SETOFFSET); upon return, time.tv_usec
@@ -71,13 +70,13 @@ struct timex {
                          flag is set, otherwise microseconds */
     long tick;        /* Microseconds between clock ticks */
     long ppsfreq;     /* PPS (pulse per second) frequency
-                         (2^-16 PPM (see NOTES), read-only) */
+                         (2^-16 ppm (see NOTES), read-only) */
     long jitter;      /* PPS jitter (read-only); nanoseconds, if
                          STA_NANO status flag is set, otherwise
                          microseconds */
     int  shift;       /* PPS interval duration
                          (seconds, read-only) */
-    long stabil;      /* PPS stability (2^-16 PPM (see NOTES), read-only=
) */
+    long stabil;      /* PPS stability (2^-16 ppm (see NOTES), read-only=
) */
     long jitcnt;      /* PPS jitter limit exceeded (read-only) */
     long calcnt;      /* PPS calibration intervals (read-only) */
     long errcnt;      /* PPS calibration errors (read-only) */
@@ -349,9 +348,9 @@ In struct
 .IR ppsfreq ,
 and=20
 .I stabil
-are PPM (parts per million) with a 16-bits fractional part, which means =
that a
-value of 1 in one of those fields actually means 2^-16 PPM, and 2^16=3D6=
5535 is=20
-1 PPM. This is the case for both input values (in the case of
+are ppm (parts per million) with a 16-bits fractional part, which means =
that a
+value of 1 in one of those fields actually means 2^-16 ppm, and 2^16=3D6=
5535 is=20
+1 ppm. This is the case for both input values (in the case of
 .IR freq )
 and output values.
 .SH CONFORMING TO
--=20
2.0.4



--4Q5xOQXmvFeuoMsBiUQA8rFkGrf9horje
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlSnJMMACgkQRTidSplJch4hWAD/XWMZLdN1ckTN4he587ni4nb6
WkmX3boSE1QNl1D1O60BALp335+1rGv8uy3mLlC7dh/FOZfjQ8jTLhlHCbCQaQL1
=qq9J
-----END PGP SIGNATURE-----

--4Q5xOQXmvFeuoMsBiUQA8rFkGrf9horje--
