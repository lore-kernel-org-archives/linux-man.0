From: NeilBrown <neilb@suse.com>
Subject: [PATCH manpages] umount.2: restore mention of data loss with MNT_FORCE
Date: Thu, 10 Aug 2017 13:23:38 +1000
Message-ID: <8760dwrtqd.fsf@notabene.neil.brown.name>
References: <87mv7asj5l.fsf@notabene.neil.brown.name> <508034ae-e254-d0bd-5ca9-c3f1959f8fe5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <508034ae-e254-d0bd-5ca9-c3f1959f8fe5@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Recent patch to description of MNT_FORCE incorrectly
dropped the mention of possible data loss.  Restore it.

Signed-off-by: NeilBrown <neilb@suse.com>
=2D--

Sorry, I thought I had put the mention of data loss back it, but clearly
not.

NeilBrown


 man2/umount.2 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man2/umount.2 b/man2/umount.2
index ccd1d07afe88..01f42710ee9d 100644
=2D-- a/man2/umount.2
+++ b/man2/umount.2
@@ -63,9 +63,10 @@ controlling the behavior of the operation:
 .BR MNT_FORCE " (since Linux 2.1.116)"
 Ask the filesystem to abort pending requests before attempting the
 unmount.  This may allow the unmount to complete without waiting
=2Dfor an inaccessible server.  If, after aborting requests, some
=2Dprocesses still have active references to the filesystem, the
=2Dunmount will still fail. In Linux 4.12, only the filesystems
+for an inaccessible server, but could cause data loss.  If, after
+aborting requests, some processes still have active references to the
+filesystem, the unmount will still fail. In Linux 4.12, only the
+filesystems
 9p (2.6.16),
 ceph (2.6.34),
 cifs (2.6.12),
=2D-=20
2.14.0.rc0.dirty


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlmL0bwACgkQOeye3VZi
gbnwsQ//drRg5xAw6Zys1gG1o9Km/x56TjUxCGw38zwyw0/Hjuh9ZgAxiT3szlyx
ffuQ7Upm2KcaAuoN7ki1n9LnzMafm5GU0Po7x2wY2HRfk67RtYW//V36zHuMmy8M
dtbZ0EuQhmnOb207wcFg4qvUms4wrtdDA7GeNO9ptgh5VrIGNJwcR+5oEOtzcf50
nRNUj4tAIkcFkfZQGEkdEhlZ08HMs8o92THaZfDBfM6veXUWxwBJa09RISBLK8VD
Z+DXKAxI5BH0ejg66P96KUYm1OiEwASkUI+NNYoY0wF7LqKEvxF7O8Rcd6AtDbjE
GoSdhflm2fcbr4/sw2PK28aCzrGy+6ZgriERSDovkNMa2sx8FAU84fWCBEpmS0nz
MO6d8M2a9CXP7/OLZ+4NFFHpfJXfNB/r/F4qOTGQ3yq7zX5jaMotu229OI+smEY+
+AJYYbgIk6lIw0InM9qyx64sjcOdFbFyVxPXPOO/t1nTFh9zqUI3LVCqkSSLPlp6
7ogU4uun7b1yEk2dPwN3GgLE8nHEULEd1NbWZjn0F81QMZai77LePf0McmDTheM+
KZ55uirXKiyUk+5QUcFe+RPsq1J7E3FB7mix8qY2zQs6odYIsLNwri4jx7loW/bS
xWY0zXLN0OIpjG+h2RtE54E5SG+JN2OHG4oc5kM1EwFKW05GA/0=
=FgtK
-----END PGP SIGNATURE-----
--=-=-=--
