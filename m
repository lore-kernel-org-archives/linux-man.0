From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] stat.2: add note about stat being racy
Date: Mon, 20 Apr 2015 22:46:01 +0200
Message-ID: <20150420204601.GA9904@pc.thejh.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The same thing was fixed for execve() in commit
8b01fc86b9f425899f8a3a8fc1c47d73c2c20543, but for performance
reasons, that simple patch won't work for stat().
---
 man2/stat.2 | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/man2/stat.2 b/man2/stat.2
index 0d244af..69ec6a4 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -175,6 +175,29 @@ that may be present between some fields on various arc=
hitectures.
 Consult the glibc and kernel source code
 if you need to know the details.
=20
+\# Background: inode attributes are modified with i_mutex held, but
+\# read by stat() without taking the mutex.
+.I Note:
+For performance and simplicity reasons, different fields in the
+.I stat
+structure may contain state information from different moments
+during the execution of the syscall. For example, if
+.IR st_mode ,
+.IR st_uid
+and
+.IR st_gid
+are changed by another process by calling
+.BR chown (2) ,
+.BR stat ()
+might return the old
+.I st_mode
+together with the new
+.IR st_uid ,
+or the old
+.I st_uid
+together with the new
+.IR st_mode .
+
 The
 .I st_dev
 field describes the device on which this file resides.
--=20
2.1.4

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVNWWJAAoJED4KNFJOeCOojD8QAJ1t/at3qaZeIkqrLkQynp5p
3vk1cNlzWX5RZDovF3VEe/2gdc1TgJZvnacoIw2C6+WgwT6xvpxT7aG1xXajklWZ
DK9uvXWcaWJuKUx5s3z/edKIScWQzsfglzwDnEqU8cIDgTePHlctmZ9gH5M68LPe
Q64ELlgkzAopYR+7SU+l6W6b6jHtwItpucl8gdOyO/UyrfDfSKcS1ziPgzDqhqsm
8IHxOdzGJ8Wec5OhCkwPMKS7o17XM9z4tcdNyaeeuGjJ02ChF7CIYJ1nkqUQCCf0
PE5SJzWvlkLp9KyciuTIDqO9bhC3aWIQ+RzDF9G6hSKcTDk6Z2khPVaRgQ+2uz26
zNJOb7WVbXhsuYHL6LiaUGjN511/FLnOvQzrreNpu2Z6OYOL0owo+OMx8u0BLGYK
yhQcAwuIDyjYtpoNNjKmDz7k1xLAeaAXd8oXSmBQK2OitNzs87Rmz+ZaQXDQLkjW
mDUvAhuuldL9pI7KutINssg8a74zCLRkQTekfkmf9Krjmpm5Pa2MQyPxKeV75MH4
D+rQWb6Si6GdJZRMreFLOGt9q5nykUSUzJk6/mYajInhNS9uaORLLPmnnv52/t30
KeQWN2oeoSCrCUpymLerMnIcLU3xVbggZRhxqIWzi7BPtk97IHrVr4GSFPTj1ICV
J9eau6zdGEluPEE8Bem5
=uSnt
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
