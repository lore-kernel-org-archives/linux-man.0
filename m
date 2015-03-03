From: saulery-GANU6spQydw@public.gmane.org
Subject: filesystems.5: wfix
Date: Tue,  3 Mar 2015 22:21:15 +0100
Message-ID: <1425417676-13816-5-git-send-email-saulery@free.fr>
References: <1425417676-13816-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425417676-13816-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

XIA filesystem Linux module name is xiafs

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index f6ee334..dd9101a 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -28,7 +28,7 @@
 .SH NAME
 filesystems \- Linux filesystem types: ext, ext2, ext3, ext4, hpfs, is=
o9660,
 jfs, minix, msdos, ncpfs, nfs, ntfs, proc, reiserfs, smb, sysv, umsdos=
, vfat,
-xfs, xia
+xfs, xiafs
 .SH DESCRIPTION
 When, as is customary, the
 .B proc
@@ -199,7 +199,7 @@ extending the Minix filesystem code.
 It provides the basic most
 requested features without undue complexity.
 The
-.B xia
+.B xiafs
 filesystem is no longer actively developed or maintained.
 It was removed from the kernel in 2.1.21.
 .SH SEE ALSO
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
