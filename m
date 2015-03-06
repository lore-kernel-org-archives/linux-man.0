From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 2/6] filesystems.5: ffix
Date: Fri,  6 Mar 2015 13:11:17 +0100
Message-ID: <1425643881-6581-3-git-send-email-saulery@free.fr>
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

All filesystems in lowercase

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 006408d..1d6feed 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -26,8 +26,8 @@
 .TH FILESYSTEMS 5 2014-01-15 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
-filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4, R=
eiserfs,
-XFS, JFS, xia, msdos,
+filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4, r=
eiserfs,
+xfs, jfs, xia, msdos,
 umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
 .SH DESCRIPTION
 When, as is customary, the
@@ -86,15 +86,15 @@ is a set of upgrades to ext3 including substantial =
performance and
 reliability enhancements,
 plus large increases in volume, file, and directory size limits.
 .TP
-.B Reiserfs
+.B reiserfs
 is a journaling filesystem, designed by Hans Reiser,
 that was integrated into Linux in kernel 2.4.1.
 .TP
-.B XFS
+.B xfs
 is a journaling filesystem, developed by SGI,
 that was integrated into Linux in kernel 2.4.20.
 .TP
-.B JFS
+.B jfs
 is a journaling filesystem, developed by IBM,
 that was integrated into Linux in kernel 2.4.24.
 .TP
@@ -123,7 +123,7 @@ sacrificing compatibility with DOS.
 .TP
 .B vfat
 is an extended DOS filesystem used by Microsoft Windows95 and Windows =
NT.
-VFAT adds the capability to use long filenames under the MSDOS filesys=
tem.
+vfat adds the capability to use long filenames under the MSDOS filesys=
tem.
 .TP
 .B ntfs
 replaces Microsoft Window's FAT filesystems (VFAT, FAT32).
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
