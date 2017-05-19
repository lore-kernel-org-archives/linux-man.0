From: NeilBrown <neilb@suse.com>
Subject: [PATCH] mount.2: revise description of MS_REMOUNT | MS_BIND
Date: Fri, 19 May 2017 16:55:34 +1000
Message-ID: <87zie9jpy1.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


MS_REMOUNT|MS_BIND affect all per-mount-point
flag.  MS_READONLY is only special because it,
uniquely, is both a per-mount-point flag *and* a
per-filesystem flag.

So the sections of per-mount-point flags and
MS_REMOUNT can usefully be clarified.

Signed-off-by: NeilBrown <neilb@suse.com>
=2D--
 man2/mount.2 | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/man2/mount.2 b/man2/mount.2
index 35fdda084d61..3e5348368757 100644
=2D-- a/man2/mount.2
+++ b/man2/mount.2
@@ -288,6 +288,12 @@ are also settable on a per-mount-point basis.
 The
 .B MS_RELATIME
 flag is also settable on a per-mount-point basis.
+Since Linux 2.6.16,
+.B MS_RDONLY
+can be set or cleared on a per-mount-point basis as well as on
+the underlying filesystem.  The mounted filesystem will only be
+writable if neither the filesystem nor the mountpoint are flagged as
+read-only.
 .\"
 .SS Remounting an existing mount
 An existing mount may be remounted by specifying
@@ -317,6 +323,10 @@ and
 arguments should match the values used in the original
 .BR mount ()
 call, except for those parameters that are being deliberately changed.
+Another exception is that
+.B MS_BIND
+has a different meaning for remount, and it should only be included if
+explicitly desired.
=20
 The following
 .I mountflags
@@ -351,17 +361,20 @@ then the remount operation preserves the existing val=
ues of these flags
 (rather than defaulting to
 .BR MS_RELATIME ).
=20
=2DSince Linux 2.6.26, this flag can also be used to make
+Since Linux 2.6.26, this flag can be used with
+.B MS_BIND
+to only modify the per-mount-point flags.
 .\" See https://lwn.net/Articles/281157/
=2Dan existing bind mount read-only by specifying
+This is particularly useful for setting or clearing the "read-only"
+flag on a mount point without changing the underlying filesystem.
+Specifying
 .IR mountflags
 as:
=20
     MS_REMOUNT | MS_BIND | MS_RDONLY
=20
=2DNote that only the
=2D.BR MS_RDONLY
=2Dsetting of the bind mount can be changed in this manner.
+will make access through this mountpoint read-only, without affecting
+other mount points.
 .\"
 .SS Creating a bind mount
 If
=2D-=20
2.12.2


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlkelucACgkQOeye3VZi
gbkuvRAAv5gimNcqPT5z3NSbRxqhzu3LPMeIZKNHNlUgPOZ6/9ObfC4IZosWqSrh
cfs5+TXw4p7Nx53K8kht127eJYXZyGTzwsaBitwzADdZCIIAwMbGAma027CqXHu8
fGn8bzUrdd3u56emrNA/1c0Rtw8ihSxDZko+/DX9sAEP3tf4PWjs3wrhwm8jHnXy
3heukbQZ7Dy7SaJfBJXSB6lNXqfsJRUJdO06p15Ez3JcY3eO8zpXNUWApd3BJGCs
DD3wMpvqPwt5BGw3VS2w+FyVJd1A1GIoRLYYUlO4RihdI91g2rt6UxpoTq0S/N3A
tBfxM4SP5R3N+h6fdvVU9q2O99WDA1t/cRgNsfcNm1me8OretY6YHRUyA4nhnstP
PzbzeOWsZ1La+cl3vz3oN5UKQ2ryz+Mq+eAeHyXqg2n+bbT/Y+HbA4heEzJxarP2
Cc8O31kY4qkhhKDUTySwNMjlJdgKbmtKKpZ4OHfFIkiIYFtso0brIKvSGm1VTb3b
cdYgGdYdfzgVGz6nLoRK3BMqvqIEp/Llwj178BTcXTXJ3AF2/VMULs/HnQZGA4PF
vN+usw6Ql4UN27sNP7l+uC64KAq+WBpivDNYKoPORsoGHFx2trfI44loyxJ+65Yu
p8zY6LmWyb/OjbtgPAkhKaI2R/pfzrz4Tf2nFCjFd7tPs3q+nyo=
=TpUj
-----END PGP SIGNATURE-----
--=-=-=--
