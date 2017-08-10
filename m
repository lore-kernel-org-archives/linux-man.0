From: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Subject: [PATCH man-pages] open.2: improve O_PATH documentation.
Date: Thu, 10 Aug 2017 13:25:21 +1000
Message-ID: <873790rtni.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


=2D fstatfs is now permitted.
=2D ioctl isn't, and is worth listing explicitly
=2D O_PATH allows an automount point to be opened with
  triggering the mount.

All tested

Signed-off-by: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
=2D--
 man2/open.2 | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index e3b00939790c..38d532397b02 100644
=2D-- a/man2/open.2
+++ b/man2/open.2
@@ -585,6 +585,7 @@ The file itself is not opened, and other file operation=
s (e.g.,
 .BR fchmod (2),
 .BR fchown (2),
 .BR fgetxattr (2),
+.BR ioctl (2),
 .BR mmap (2))
 fail with the error
 .BR EBADF .
@@ -599,8 +600,11 @@ be performed on the resulting file descriptor:
 (since Linux 3.5);
 .\" commit 332a2e1244bd08b9e3ecd378028513396a004a24
 .BR fstat (2)
=2D(since Linux 3.6).
+(since Linux 3.6);
 .\" fstat(): commit 55815f70147dcfa3ead5738fd56d3574e2e3c1c2
+.BR fstatfs (2)
+(since Linux 3.12).
+.\" fstatfs(): commit 9d05746e7b16d8565dddbe3200faa1e669d23bbf
 .IP *
 Duplicating the file descriptor
 .RB ( dup (2),
@@ -666,6 +670,16 @@ argument in calls to
 and
 .BR readlinkat (2)
 with an empty pathname to have the calls operate on the symbolic link.
+
+If
+.I pathname
+refers to an automount point that has not yet been triggered, so no
+other filesystem is mounted on it, then the call returns a file
+descriptor referring to the automount directory without triggering a mount.
+.BR fstatfs (2)
+can then be used to determine if it is, in fact, an untriggered
+automount point
+.RB ( ".f_type =3D=3D AUTOFS_SUPER_MAGIC" ).
 .TP
 .B O_SYNC
 Write operations on the file will complete according to the requirements of
=2D-=20
2.14.0.rc0.dirty


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlmL0iIACgkQOeye3VZi
gblVHw//VVGmPhVA0RA4Z5QPgCnHAObREULvwi7E7ZHugGrkynH1dvp9rw0SZziP
+pm5DBu3f6RGHRRM2GwOhuoZVyaYrZNdfYIHk/BnipHl8M/Aw2atu0Kyys0P3qY6
J0tTOykz+WprIe2LMcTixtTIi7l++mHrTndcMtzKf/54/tFth+9rmoRwjTYL1qvn
5/ZOqHMNSgKSE41FHusplrTWZr3eGi8qYE3CLYW/tjQfNCFrdWXOBEwTg8AgTZVs
R8Hy4phRVrGjMZan3qcIMxt8GoJlPsW9ZWZ8FkN/m8+f+ONZHInUzaKs0+7Nb7jz
W7hDAp62pL0KyJMr4kZn+n20KkVc1UhmOom5EFU/cMPkbgU6g/4KOXaCOJk5T8Lw
Grhvj0hXGqR+rIyjtWjQoUVlR9/tqO5zZipBbRH7izVn5Am2gUozyVWxP28xbH7v
oozvy6IkYu8UZoJyZFzR41kBRd8NZfuLmHqtvUqLQu173kBgtUAqCLuTyzJsqfS1
9uXJ43Y8CtBYbxBWuhG4K9mC+w/m1Meb/JR7+kUdKCOEEP5aldnz0r8YqAzyYyBr
tGPmfVnP2cvG4UherDg+xADmJUP0QaIERVz8zUvIoMObmD2i3bNJuTQVj/2QQafL
s+xrI0inUrnwuyIr8blYd4fDO9Kp8dlTrcIW9IJykAqGZtun3ls=
=8h0U
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
