From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: [PATCH 1/2] adjtimex.2: Clarify the 'ppm scaling' used in struct
 timex
Date: Sat, 03 Jan 2015 00:01:52 +0100
Message-ID: <54A72360.3070807@supelec.fr>
References: <54A2DEAD.2050708@supelec.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UPDWOLVpmI7GpWUiOVl9up5OVPcO3X6HF"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A2DEAD.2050708-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UPDWOLVpmI7GpWUiOVl9up5OVPcO3X6HF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

this is the last version of a new series of patchs for adjtimex.2.
Please ignore all previous versions of this series.

This patch makes explicit and clarifies the unit used for fields "freq", =
"ppsfreq" and "stabil" in struct timex.
It closes a FIXME in the man page.

Reviewed-By: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>

---
 man2/adjtimex.2 | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index 18823c8..ff4b23e 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -54,9 +54,8 @@ struct timex {
     long offset;      /* Time offset; nanoseconds, if STA_NANO
                          status flag is set, otherwise
                          microseconds */
-    long freq;        /* Frequency offset, as scaled PPM
-                         (parts per million) */
-.\" FIXME What is the scaling unit of timex.freq?  2^16 ?
+    long freq;        /* Frequency offset, in units of 2^-16 PPM
+                         (parts per million) (see NOTES below) */
     long maxerror;    /* Maximum error (microseconds) */
     long esterror;    /* Estimated error (microseconds) */
     int  status;      /* Clock command/status */
@@ -72,13 +71,13 @@ struct timex {
                          flag is set, otherwise microseconds */
     long tick;        /* Microseconds between clock ticks */
     long ppsfreq;     /* PPS (pulse per second) frequency
-                         (scaled PPM, read-only) */
+                         (2^-16 PPM (see NOTES), read-only) */
     long jitter;      /* PPS jitter (read-only); nanoseconds, if
                          STA_NANO status flag is set, otherwise
                          microseconds */
     int  shift;       /* PPS interval duration
                          (seconds, read-only) */
-    long stabil;      /* PPS stability (scaled PPM, read-only) */
+    long stabil;      /* PPS stability (2^-16 PPM (see NOTES), read-only=
) */
     long jitcnt;      /* PPS jitter limit exceeded (read-only) */
     long calcnt;      /* PPS calibration intervals (read-only) */
     long errcnt;      /* PPS calibration errors (read-only) */
@@ -343,6 +342,18 @@ and the caller does not have sufficient privilege.
 Under Linux, the
 .B CAP_SYS_TIME
 capability is required.
+.SH NOTES
+In struct
+.IR timex ,
+.IR freq ,
+.IR ppsfreq ,
+and=20
+.I stabil
+are PPM (parts per million) with a 16-bits fractional part, which means =
that a
+value of 1 in one of those fields actually means 2^-16 PPM, and 2^16=3D6=
5535 is=20
+1 PPM. This is the case for both input values (in the case of
+.IR freq )
+and output values.
 .SH CONFORMING TO
 .BR adjtimex ()
 is Linux-specific and should not be used in programs
--=20
2.0.4



--UPDWOLVpmI7GpWUiOVl9up5OVPcO3X6HF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlSnI2UACgkQRTidSplJch4WqwD6A43Qda9fY8oRJWcxWSwuLF14
YNwwa5wuKLhRahagyo4A/0cq8YjqfSmOjL7lRWA29HIqTm3CDM3SVmcGaIDy/h2O
=N0oL
-----END PGP SIGNATURE-----

--UPDWOLVpmI7GpWUiOVl9up5OVPcO3X6HF--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
