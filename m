From: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] mount.2: fix incorrect path
Date: Wed, 19 May 2010 14:32:04 +0200
Message-ID: <20100519123203.GA9081@foxbat.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
---
 man2/mount.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/mount.2 b/man2/mount.2
index a79bdca..486fb4f 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -438,7 +438,7 @@ to other processes (except child processes that the cal=
ler
 subsequently creates) and vice versa.
=20
 The Linux-specific
-.I /proc/PID/self
+.I /proc/PID/mounts
 file exposes the list of mount points in the mount
 namespace of the process with the specified ID; see
 .BR proc (5)
--=20
1.6.4.2


Petr

--
Petr Uzel
IRC: ptr_uzl @ freenode

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEARECAAYFAkvz2kMACgkQnZxG0T6qDD12DwCfdRCcQy4Eqs2+6yRaCYcaxbGP
6nkAn0FCECHErU25yWu2uQ2krsV6yDKz
=QPP0
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
