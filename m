From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pthread_spin_init(3): tfix
Date: Sat, 21 Oct 2017 16:21:30 -0400
Message-ID: <20171021202128.njpgppyvcjpenbos@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bv3ozjiqgbbnzivt"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--bv3ozjiqgbbnzivt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

diff --git a/man3/pthread_spin_init.3 b/man3/pthread_spin_init.3
index e6cf692d7..3018d804a 100644
--- a/man3/pthread_spin_init.3
+++ b/man3/pthread_spin_init.3
@@ -30,7 +30,7 @@ pthread_spin_init, pthread_spin_destroy \- initialize or =
destroy a spin lock
 .B #include <pthread.h>
 .PP
 .BI "int pthread_spin_init(pthread_spinlock_t *" lock " int " pshared ");"
-.BI "int pthread_spin_destroy(pthread_spinlock_t *" cock ");"
+.BI "int pthread_spin_destroy(pthread_spinlock_t *" lock ");"
 .fi
 .PP
 Compile and link with \fI\-pthread\fP.

--=20
Regards,
Branden

--bv3ozjiqgbbnzivt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnrrEAACgkQ0Z6cfXEm
bc7lXQ/8CAekub41vWhTsji1C2/coaLIgwijdZc16kXbHBFxEjCMyXQgxfwCBdXC
VZOPsgEiGaZCHbl73PDJK2vlgAcnQsbs6SanplVqxHnOCe3ClC5p1TKnow2ZUL17
mGDCPpY0lioOtkiaX2dhP9zRylY2S6fNNiZGVPfLQT63RHdjR7JX9a57a74xUwYr
CC4uefFMprP3IoyitwEBA63tcPbaEzM+sDp8ijqEikJbTjZimoUQNH0E/ycZYRd4
3nUZVbGvIPmfCww+tUPA/y+0Q3fwrMqrl2GTi/RWH6p36ZOUxGF+tpfKx31lw6jF
/N2VSSx2PU0Ys2s+qww8zoLVIe+VhBgdVwxJy5h5P9a2gpOTsrPx12oyavzEUNAJ
oKkRJ32Ns1yj6WLSYW7Hhk1Eu4LUjJCh5CIkHLHLT/R9leaHX0+yohBCpMjgIk8/
Qqv5Z7pfnn+Af8dxrixair+7kQrBVkAJRgD0eocM9KDswBhvWaLCI0hm9zekZKv/
JDpkR2sWCYk8J+WSamcwJsfOkGU3IqWYEDZ9ZT1If9Bjp7PPbTc+sey3jxaJFDUR
iHxHgeOIX8tzmfeyDPGqto9Vn7lDtWQw3IkhBRzOR/6Fvg3yqL25HJ1tORiW7hnA
EtY6/hcIp9J6ztLq4gyoT9T+YzD0QssLinF86J4ZF76EVjJG0KI=
=0xjc
-----END PGP SIGNATURE-----

--bv3ozjiqgbbnzivt--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
