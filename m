From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 3/6] filesystems.5: wfix
Date: Fri,  6 Mar 2015 13:11:18 +0100
Message-ID: <1425643881-6581-4-git-send-email-saulery@free.fr>
References: <1425643881-6581-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
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
index 1d6feed..5638d49 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -27,7 +27,7 @@
 .nh
 .SH NAME
 filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4, r=
eiserfs,
-xfs, jfs, xia, msdos,
+xfs, jfs, xiafs, msdos,
 umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
 .SH DESCRIPTION
 When, as is customary, the
@@ -104,7 +104,7 @@ extending the Minix filesystem code.
 It provides the basic most
 requested features without undue complexity.
 The
-.B xia
+.B xiafs
 filesystem is no longer actively developed or maintained.
 It was removed from the kernel in 2.1.21.
 .TP
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
