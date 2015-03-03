From: saulery-GANU6spQydw@public.gmane.org
Subject: filesystems.5: ffix
Date: Tue,  3 Mar 2015 22:21:14 +0100
Message-ID: <1425417676-13816-4-git-send-email-saulery@free.fr>
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

All file systems in lowercase
Highlight all file systems citations

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 048c5cd..f6ee334 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -27,8 +27,8 @@
 .nh
 .SH NAME
 filesystems \- Linux filesystem types: ext, ext2, ext3, ext4, hpfs, is=
o9660,
-JFS, minix, msdos, ncpfs, nfs, ntfs, proc, Reiserfs, smb, sysv, umsdos=
, vfat,
-XFS, xia
+jfs, minix, msdos, ncpfs, nfs, ntfs, proc, reiserfs, smb, sysv, umsdos=
, vfat,
+xfs, xia
 .SH DESCRIPTION
 When, as is customary, the
 .B proc
@@ -71,13 +71,18 @@ the filesystems supported under Linux.
 .RB See " ext2 " (5).
 .TP
 .B ext3
-is a journaling version of the ext2 filesystem.
+is a journaling version of the
+.B ext2
+filesystem.
 It is easy to
-switch back and forth between ext2 and ext3.
+switch back and forth between
+.BR ext2 " and " ext3 .
 .RB See " ext3 " (5).
 .TP
 .B ext4
-is a set of upgrades to ext3 including substantial performance and
+is a set of upgrades to
+.B ext3
+including substantial performance and
 reliability enhancements,
 plus large increases in volume, file, and directory size limits.
 .RB See " ext4 " (5).
@@ -110,7 +115,7 @@ It is automatically recognized within the
 filesystem support under Linux.
 .RE
 .TP
-.B JFS
+.B jfs
 is a journaling filesystem, developed by IBM,
 that was integrated into Linux in kernel 2.4.24.
 .TP
@@ -153,7 +158,7 @@ In particular, its files do not take disk space.
 See
 .BR proc (5).
 .TP
-.B Reiserfs
+.B reiserfs
 is a journaling filesystem, designed by Hans Reiser,
 that was integrated into Linux in kernel 2.4.1.
 .TP
@@ -181,9 +186,10 @@ sacrificing compatibility with DOS.
 .TP
 .B vfat
 is an extended DOS filesystem used by Microsoft Windows95 and Windows =
NT.
-VFAT adds the capability to use long filenames under the MSDOS filesys=
tem.
+.B vfat
+adds the capability to use long filenames under the MSDOS filesystem.
 .TP
-.B XFS
+.B xfs
 is a journaling filesystem, developed by SGI,
 that was integrated into Linux in kernel 2.4.20.
 .TP
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
