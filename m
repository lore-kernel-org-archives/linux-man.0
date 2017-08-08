From: NeilBrown <neilb@suse.com>
Subject: [PATCH manpages] umount.2: revise MNT_FORCE
	description.
Date: Tue, 08 Aug 2017 15:49:58 +1000
Message-ID: <87mv7asj5l.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1010185718=="
Return-path: <systemd-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/systemd-devel>,
 <mailto:systemd-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/systemd-devel>
List-Post: <mailto:systemd-devel@lists.freedesktop.org>
List-Help: <mailto:systemd-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/systemd-devel>,
 <mailto:systemd-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: systemd-devel-bounces@lists.freedesktop.org
Sender: "systemd-devel" <systemd-devel-bounces@lists.freedesktop.org>
To: mtk.manpages@gmail.com
Cc: linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org, systemd-devel@freedesktop.org
List-Id: linux-man@vger.kernel.org

--===============1010185718==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


MNT_FORCE does not allow a busy filesystem to be unmounted.  Only
MNT_DETACH allows that.
MNT_FORCE only tries to abort pending transactions, in the hope that
might help umount not to block,

Also, other filesystems than NFS support MNT_FORCE.

Signed-off-by: NeilBrown <neilb@suse.com>
=2D--

Explanation derived from examination of source code.
Cc to systemd devel in relation to comment I just posted:

https://github.com/systemd/systemd/commit/0c08f5cde749bd2818475e487109cd0d4=
13452df

You may want to move the "linux version when support was added" to a
comment, or discard it.

 man2/umount.2 | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/man2/umount.2 b/man2/umount.2
index 68f76b7c6352..ccd1d07afe88 100644
=2D-- a/man2/umount.2
+++ b/man2/umount.2
@@ -61,9 +61,17 @@ unmounts a target, but allows additional
 controlling the behavior of the operation:
 .TP
 .BR MNT_FORCE " (since Linux 2.1.116)"
=2DForce unmount even if busy.
=2DThis can cause data loss.
=2D(Only for NFS mounts.)
+Ask the filesystem to abort pending requests before attempting the
+unmount.  This may allow the unmount to complete without waiting
+for an inaccessible server.  If, after aborting requests, some
+processes still have active references to the filesystem, the
+unmount will still fail. In Linux 4.12, only the filesystems
+9p (2.6.16),
+ceph (2.6.34),
+cifs (2.6.12),
+fuse (2.6.16),
+lustre (3.11),
+and NFS (2.1.116) respond to MNT_FORCE.
 .TP
 .BR MNT_DETACH " (since Linux 2.4.11)"
 Perform a lazy unmount: make the mount point unavailable for new
=2D-=20
2.14.0.rc0.dirty


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlmJUQgACgkQOeye3VZi
gbn0OBAAkSSZnbLZZ+ZFGjqUKtva2sXR7VIY0Enf/d0KDrzFRFfpMD3NCyv+xQfJ
9KJZxEDBcQfdyQNtGUC99MSpBK1zvhKglZ+KA/fJNBcR07AQeDks8BbFvtp/eMka
xb3i1Rp/98IknH6pmZP7wg/zPomGMgWVl2AOFP3n0T/ZTiUo7TkqCJ5TLESp/C5S
n3cnXjaun62vxHRyGwn2LMy0dMsO2wziAsvq6/kTai0aCLO04dyu3ylJ+Y8HzkJc
hY/tEQV/9Ws1yG6p42JuWHRhz4WsZfHtWrzPT/kLtGAkMj3CTzlOYRc/TILsrhFJ
Hsgsd9ZBNX5DXPCiFq+cviGXjtWNGjEKhJWykmVewAtv5MKjgFQ0ApElXUQOmfMG
jJeQaFPGHCe2DRInL4xg4hH5gTHNuTrk2Ef4zsxoNvn+tGTMvJSQhY5FEiuEHu4G
BiBTcR2mA2uZKFyT07pR0SkBiqCuizzBoTUefjlbN6s13vQyxHQL9nw0YzirpTQR
yvHk+UC7+NE74DpLp9FL6W3G4IZ+4E16gRYZiTkbHDl2f8iSFKhZ1GiVVnAXOStA
ry2hlqV6qZexG4qq2ekkTXDs0PsNSIQ8LuVxWxhByi1LgMi7UudcokwTc9TQRov1
SC/vi8rMCa1cFp6VT2+PybFH1qmpNZcz7SlBv7/19DVPi3Db0ZM=
=C+YH
-----END PGP SIGNATURE-----
--=-=-=--

--===============1010185718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18Kc3lzdGVtZC1k
ZXZlbCBtYWlsaW5nIGxpc3QKc3lzdGVtZC1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9zeXN0ZW1kLWRldmVs
Cg==

--===============1010185718==--
