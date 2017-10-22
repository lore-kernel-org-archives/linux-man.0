From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: connect.2, ioprio_set.2, ...: tfix
Date: Sun, 22 Oct 2017 06:04:54 -0400
Message-ID: <20171022100452.vexn5fvln5cdjhoh@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sar2hzu7hrhipex4"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--sar2hzu7hrhipex4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fix nonstandard usage.

diff --git a/man2/connect.2 b/man2/connect.2
index e7d35f4d6..d55d69bec 100644
--- a/man2/connect.2
+++ b/man2/connect.2
@@ -179,7 +179,7 @@ been completed.
 is not a valid open file descriptor.
 .TP
 .B ECONNREFUSED
-No-one listening on the remote address.
+No one listening on the remote address.
 .TP
 .B EFAULT
 The socket structure address is outside the user's address space.
diff --git a/man2/ioprio_set.2 b/man2/ioprio_set.2
index 0e86d6ca3..6e53687b4 100644
--- a/man2/ioprio_set.2
+++ b/man2/ioprio_set.2
@@ -314,7 +314,7 @@ Priority levels range from 0 (highest) to 7 (lowest).
 .BR IOPRIO_CLASS_IDLE " (3)"
 This is the idle scheduling class.
 Processes running at this level get I/O
-time only when no-one else needs the disk.
+time only when no one else needs the disk.
 The idle class has no class data.
 Attention is required when assigning this priority class to a process,
 since it may become starved if higher priority processes are
diff --git a/man3/dbopen.3 b/man3/dbopen.3
index f48658fb6..d76ee3e6a 100644
--- a/man3/dbopen.3
+++ b/man3/dbopen.3
@@ -544,7 +544,7 @@ for any of the errors specified for the library routine
 The typedef
 .I DBT
 is a mnemonic for "data base thang", and was used
-because no-one could think of a reasonable name that wasn't already used.
+because no one could think of a reasonable name that wasn't already used.
 .PP
 The file descriptor interface is a kludge and will be deleted in a
 future version of the interface.
diff --git a/man5/group.5 b/man5/group.5
index 704ba48fd..0475764da 100644
--- a/man5/group.5
+++ b/man5/group.5
@@ -57,7 +57,7 @@ a list of the usernames that are members of this group, s=
eparated by commas.
 .SH BUGS
 As the 4.2BSD
 .BR initgroups (3)
-man page says: no-one seems to keep
+man page says: no one seems to keep
 .I /etc/group
 up-to-date.
 .SH SEE ALSO
diff --git a/man7/fifo.7 b/man7/fifo.7
index aa73f9dd6..b17eb9f66 100644
--- a/man7/fifo.7
+++ b/man7/fifo.7
@@ -34,7 +34,7 @@ until the other end is opened also.
 .PP
 A process can open a FIFO in nonblocking mode.
 In this
-case, opening for read-only succeeds even if no-one has
+case, opening for read-only succeeds even if no one has
 opened on the write side yet and opening for write-only
 fails with
 .B ENXIO

--=20
Regards,
Branden

--sar2hzu7hrhipex4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnsbTsACgkQ0Z6cfXEm
bc5SKQ//aFCpC71p376ftm126+s03dXdMWFVvGtKLohzedBVj6ArvJGoTRuZmyho
QWChrY8yQBVQuLK0ETJzzejaMbhkZ78qv7ZjisvIreiZCr/9IEz/9RXdpY+c0Hwq
9xn7jxpr0iXaB2bwX/GZ5mKviTObtaTxHtBpx58uNScC37fShrwHmPqDfvoadynm
UWJ0d8anaxVQsfosZGTvs4I/GEfJNtZswBIdBuTSD7PQPgleyCWCGlHYtqx24O3S
y4jvinSjOuB+KDn+bmr3Mst+Ck4ysI778+x60fFL684LvFwycHtN+Z7CGMpXi168
Z55PXcUppP9MK8aBdN8xQjuxRVeUIi/UziavovWZH5GZxEWp02m/pb63I6YYwrra
OBGpayaAz63rrqCAxCr91BP9lf9SJwgqlYhwBdTd8lJxVmfx/MYhqFhHeqGQM4yw
IDSoHP5m0x4pdzjhEGaTQjc7DHR2rPWzNvA+LPPQ2ad7Bn6kZg61hgmZPu9qujA9
IPWaBTPRZyvuSjzjS3XYee6XMwP22T99xGGfjEKBYu1Lf++YUn3eaWPiLvlX5lVe
c48cigR0M+cwU6bx779zv26HbyvmRcihvmv/mxj2Z5FTJMjZBcsClD0T23ys1syM
6VjCU2MpaJR5X8ce2i5YI2daky8G96ETeAQMJwNNG2t1DPxvh4c=
=Bdvf
-----END PGP SIGNATURE-----

--sar2hzu7hrhipex4--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
