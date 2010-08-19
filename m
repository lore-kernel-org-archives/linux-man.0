From: Nicholas Hunt <nhunt-GmWTxIRN22iJaUV4rX00uodd74u8MsAO@public.gmane.org>
Subject: [patch] send.2, recv.2: Fixed type of msg_controllen in struct
 msghdr
Date: Wed, 18 Aug 2010 18:13:46 -0700
Message-ID: <20100818181346.7dee6951@Semtex>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/nb/X4lPxEc0mX/+Y0ycDYG."; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Sig_/nb/X4lPxEc0mX/+Y0ycDYG.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,=20

This patch fixes the type of msg_controllen in the struct msghdr
definition given in send.2 and recv.2 to match the definition in glibc
and the kernel. Applies cleanly to the current head of git (sha hash:
55d56b71...).

-Nick

diff --git a/man2/recv.2 b/man2/recv.2
index 9431b5c..d5eaf33 100644
--- a/man2/recv.2
+++ b/man2/recv.2
@@ -304,7 +304,7 @@ struct msghdr {
     struct iovec *msg_iov;        /* scatter/gather array */
     size_t        msg_iovlen;     /* # elements in msg_iov */
     void         *msg_control;    /* ancillary data, see below */
-    socklen_t     msg_controllen; /* ancillary data buffer len */
+    size_t        msg_controllen; /* ancillary data buffer len */
     int           msg_flags;      /* flags on received message */
 };
 .fi
diff --git a/man2/send.2 b/man2/send.2
index c99b77a..c9e76b0 100644
--- a/man2/send.2
+++ b/man2/send.2
@@ -250,7 +250,7 @@ struct msghdr {
     struct iovec *msg_iov;        /* scatter/gather array */
     size_t        msg_iovlen;     /* # elements in msg_iov */
     void         *msg_control;    /* ancillary data, see below */
-    socklen_t     msg_controllen; /* ancillary data buffer len */
+    size_t        msg_controllen; /* ancillary data buffer len */
     int           msg_flags;      /* flags on received message */
 };
 .fi

--=20
Computer Science and Engineering, University of Washington
E-mail   : nhunt-GmWTxIRN22iJaUV4rX00uodd74u8MsAO@public.gmane.org
PGP Key  : http://students.washington.edu/nhunt/cs.asc

--Sig_/nb/X4lPxEc0mX/+Y0ycDYG.
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkxshUoACgkQ1dJYOTL0PzjMMwCeNuVUOHAs1rbiqT9IJrZmIxST
rhQAoILWRcYhJvWcik+cEw6UJUgHPiHK
=wiWd
-----END PGP SIGNATURE-----

--Sig_/nb/X4lPxEc0mX/+Y0ycDYG.--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
