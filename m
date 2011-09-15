From: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] flock.2: describe flock on NFS filesystems
Date: Thu, 15 Sep 2011 10:09:35 +0200
Message-ID: <20110915080934.GA9293@foxbat.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

NFSv4 need file to be opened in RW-mode to place exclusive lock:
http://www.spinics.net/lists/linux-nfs/msg18502.html

flock works on NFS since 2.6.12:
http://nfs.sourceforge.net/#section_d ,section D10

Signed-off-by: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
---
 man2/flock.2 |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/man2/flock.2 b/man2/flock.2
index f0d85af..c904f6b 100644
--- a/man2/flock.2
+++ b/man2/flock.2
@@ -107,7 +107,8 @@ are preserved across an
 .BR execve (2).
=20
 A shared or exclusive lock can be placed on a file regardless of the
-mode in which the file was opened.
+mode in which the file was opened. The exception is NFSv4, where
+the file has to be opened for writing to place exclusive lock.
 .SH "RETURN VALUE"
 On success, zero is returned.
 On error, \-1 is returned, and
@@ -146,7 +147,8 @@ possibly implemented in terms of
 appears on most UNIX systems.
 .SH NOTES
 .BR flock ()
-does not lock files over NFS.
+does not lock files over NFS before kernel 2.6.12. Since
+2.6.12, kernel emulates flock () using fcntl(2).
 Use
 .BR fcntl (2)
 instead: that does work over NFS, given a sufficiently recent version of
--=20
1.7.3.4


Petr

--
Petr Uzel
IRC: ptr_uzl @ freenode

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAk5xsr4ACgkQnZxG0T6qDD1GVQCfTRL9Qna+xs+07eJLNRxkNbJU
FS4AnR+5hvgszY0FBC6G93O3Ot8QvwMr
=VEIn
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
