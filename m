From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 4/6] filesystems.5: ffix
Date: Fri,  6 Mar 2015 13:11:19 +0100
Message-ID: <1425643881-6581-5-git-send-email-saulery@free.fr>
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

Highlight all file systems citations

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 5638d49..cc43b71 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -77,12 +77,17 @@ offers the best performance (in terms of speed and =
CPU usage) of
 the filesystems supported under Linux.
 .TP
 .B ext3
-is a journaling version of the ext2 filesystem.
+is a journaling version of the
+.B ext2
+filesystem.
 It is easy to
-switch back and forth between ext2 and ext3.
+switch back and forth between
+.BR=C2=A0ext2 " and " ext3 .
 .TP
 .B ext4
-is a set of upgrades to ext3 including substantial performance and
+is a set of upgrades to
+.B ext3
+including substantial performance and
 reliability enhancements,
 plus large increases in volume, file, and directory size limits.
 .TP
@@ -123,7 +128,8 @@ sacrificing compatibility with DOS.
 .TP
 .B vfat
 is an extended DOS filesystem used by Microsoft Windows95 and Windows =
NT.
-vfat adds the capability to use long filenames under the MSDOS filesys=
tem.
+.B vfat
+adds the capability to use long filenames under the MSDOS filesystem.
 .TP
 .B ntfs
 replaces Microsoft Window's FAT filesystems (VFAT, FAT32).
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
