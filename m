From: saulery-GANU6spQydw@public.gmane.org
Subject: filesystems.5: Add cross references for ext filsystems
Date: Tue,  3 Mar 2015 22:21:13 +0100
Message-ID: <1425417676-13816-3-git-send-email-saulery@free.fr>
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

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 17b2fce..048c5cd 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -68,16 +68,19 @@ extended filesystem
 .B ext2
 offers the best performance (in terms of speed and CPU usage) of
 the filesystems supported under Linux.
+.RB See " ext2 " (5).
 .TP
 .B ext3
 is a journaling version of the ext2 filesystem.
 It is easy to
 switch back and forth between ext2 and ext3.
+.RB See " ext3 " (5).
 .TP
 .B ext4
 is a set of upgrades to ext3 including substantial performance and
 reliability enhancements,
 plus large increases in volume, file, and directory size limits.
+.RB See " ext4 " (5).
 .TP
 .B hpfs
 is the High Performance Filesystem, used in OS/2.
@@ -194,6 +197,9 @@ The
 filesystem is no longer actively developed or maintained.
 It was removed from the kernel in 2.1.21.
 .SH SEE ALSO
+.BR ext2 (5),
+.BR ext3 (5),
+.BR ext4 (5),
 .BR proc (5),
 .BR fsck (8),
 .BR mkfs (8),
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
