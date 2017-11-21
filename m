From: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Subject: [manpages PATCH] open_by_handle_at: clarifications needed due to NFS reexport
Date: Wed, 22 Nov 2017 08:15:13 +1100
Message-ID: <87wp2j1ggu.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-nfs@vger.kernel.org" <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, Peng Tao <tao.peng-7I+n7zu2hftEKMMhf/gKZA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


The recent addition of NFS re-export and the possibility of
using name_to_handle_at() on an NFS filesystem raises issues
with name_to_handle_at() which have not been properly documented.

Getting the filehandle for an untriggered automount point is
arguably meaningless and in certainly not supported by NFS.
name_to_handle_at() will return -EOVERFLOW even though the
requested "handle_bytes" is large enough.  This is an unfortunate
overloading of the error code, but is manageable.

So clarify this and also note that the mount_id is returned
when EOVERFLOW is reported.

Thought: it would be nice if mount_id were returned in the
EOPNOTSUPP case too.  I guess it is too late to fix that (?).

Link: https://github.com/systemd/systemd/issues/7082
Signed-off-by: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
=2D--
 man2/open_by_handle_at.2 | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/man2/open_by_handle_at.2 b/man2/open_by_handle_at.2
index 91300e80fe24..9a30dd2ed476 100644
=2D-- a/man2/open_by_handle_at.2
+++ b/man2/open_by_handle_at.2
@@ -109,6 +109,12 @@ and
 is set to indicate the required size;
 the caller can then use this information to allocate a structure
 of the correct size (see EXAMPLE below).
+Some care is needed here as
+.BR EOVERFLOW
+can also indicate that no filehandle is available for this particular
+name in a filesystem which does normally support filehandle lookup.
+This case can be detected when EOVERFLOW is returned without
+handle_bytes being increased.
 .PP
 Other than the use of the
 .IR handle_bytes
@@ -193,6 +199,10 @@ Opening the pathname in the fifth field of that record=
 yields a file
 descriptor for the mount point;
 that file descriptor can be used in a subsequent call to
 .BR open_by_handle_at ().
+.I mount_id
+is returned both for a successful call and for a call that results
+in the error
+.BR EOVERFLOW .
 .PP
 By default,
 .BR name_to_handle_at ()
@@ -206,6 +216,21 @@ is specified in
 .I pathname
 is dereferenced if it is a symbolic link
 (so that the call returns a handle for the file referred to by the link).
+.PP
+.BR name_to_handle_at )
+does not trigger a mount when the final component of the path is an
+automount point.  When a filesystem supports both filehandles and
+automount points, a
+.BR name_to_handle_at ()
+call on an automount point will return with error
+.BR EOVERFLOW
+without having increased
+.IR handle_bytes .
+This can happen since Linux 4.13 with NFS when accessing a directory
+which is on a separate filesystem on the server.
+.\" commit 20fa19027286983ab2734b5910c4a687436e0c31
+In this case the automount can be triggered by adding a "/" to the end
+of the path.
 .SS open_by_handle_at()
 The
 .BR open_by_handle_at ()
=2D-=20
2.14.0.rc0.dirty


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAloUl2EACgkQOeye3VZi
gblHgxAAlvVOzYnDRfnkFI2ZBmfSwaRdUUWaG3X1TivB5CE2np48Xx2IdJ3eRaQE
dLaWh1P7SoDCH1ueIG5h6kMFhudLvj6EHUz6H0HjASDd9IfuXn/X6WEfB1TTD7Zf
U2hUYUCUe0bEa3VqcA2HHlc5351f336630MgB97LF09NIP9DcfdMYhL8RR08tLnV
4GzhNAW7yYrfVS3QWOvQ7O7RyD8iXSLSltN8+6zZak+TrruG6eFQK1pUq031fhd3
eT0taXug5ckkX63gaQyirVqoj5/nwvsg2dIG944dJF8ZRgMLaGYKVOoTsSqaFEXo
NFaUl49MIyF3pdUe/uyM32qPG7hGIRa1qxtLAPF1Ds74w/nH+VC3puRv44az/v1g
Gm1Zw4jsXbjvsjBYVLtEe56ToPQXVwZGWKPzdLs0PHWZ0iz67eaxyrSasT3AjZbO
4IwBpdJApIJ9E7BpUMp1FTdukT5S1j79bXsbyU6JyPdv92crLkObWOHSmALL0nRC
dqiHpolLgeBYwiShZWBhBPaI5jMPW7ECeJePkEn9TUp/wE2q4N30kk3Aw6nLyQrC
4J4Yief9qmG0fX0LT/D4600SYc3mjc/mtJZ6EP/jkoDrZUUvPqWA5u1rHJ9fYOnj
7M/L2rP/gTKb9e/GgoNmVkOhMWJvIg1zbkkl5/MV56NQ06KRAhY=
=6VSA
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
