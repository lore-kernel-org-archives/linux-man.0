From: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] usleep.3: usleep suspends calling thread, not process
Date: Wed, 1 Dec 2010 18:12:27 +0100
Message-ID: <20101201171225.GA21870@foxbat.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
---
 man3/usleep.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/usleep.3 b/man3/usleep.3
index b4b70bc..79d89a8 100644
--- a/man3/usleep.3
+++ b/man3/usleep.3
@@ -65,7 +65,7 @@ _XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED
 .SH DESCRIPTION
 The
 .BR usleep ()
-function suspends execution of the calling process for
+function suspends execution of the calling thread for
 (at least) \fIusec\fP microseconds.
 The sleep may be lengthened slightly
 by any system activity or by the time spent processing the call or by the
--=20
1.7.1


Petr

--
Petr Uzel
IRC: ptr_uzl @ freenode

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEARECAAYFAkz2gfkACgkQnZxG0T6qDD0q9wCfev+qn6MEaeXGVGPovX31uNw0
7OoAnjVskmrdIJCZLleLfQXeep4uWBSs
=OMIR
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
