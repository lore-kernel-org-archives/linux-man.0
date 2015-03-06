From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 5/6] filesystems.5: Add cross references for ext filsystems
Date: Fri,  6 Mar 2015 13:11:20 +0100
Message-ID: <1425643881-6581-6-git-send-email-saulery@free.fr>
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

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index cc43b71..2380a00 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -75,6 +75,7 @@ extended filesystem
 .B ext2
 offers the best performance (in terms of speed and CPU usage) of
 the filesystems supported under Linux.
+.RB See " ext2 " (5).
 .TP
 .B ext3
 is a journaling version of the
@@ -83,6 +84,7 @@ filesystem.
 It is easy to
 switch back and forth between
 .BR=C2=A0ext2 " and " ext3 .
+.RB See " ext3 " (5).
 .TP
 .B ext4
 is a set of upgrades to
@@ -90,6 +92,7 @@ is a set of upgrades to
 including substantial performance and
 reliability enhancements,
 plus large increases in volume, file, and directory size limits.
+.RB See " ext4 " (5).
 .TP
 .B reiserfs
 is a journaling filesystem, designed by Hans Reiser,
@@ -200,6 +203,9 @@ you need special programs, which can be found at
 .UR ftp://linux01.gwdg.de\:/pub\:/ncpfs
 .UE .
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
