From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] filesystems.5: Add filesystems adfs and afs
Date: Wed, 11 Mar 2015 12:55:53 +0100
Message-ID: <1426074953-4589-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 0c66f9e..b204e26 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -52,6 +52,17 @@ Below a short description of the available or histor=
ically available
 filesystems in Linux kernel. See kernel documentation for a comprehens=
ive
 description of all options and limitations.
 .TP 10
+.B adfs
+is the Acorn Advanced Disc Filing System, the standard filesystem of R=
iscOS
+operating system which runs on Acorn's ARM-based Risc PC systems
+and the Acorn Archimedes range of machines,
+that was integrated into Linux in kernel 2.1.
+.TP
+.B afs
+is the distributed AFS (Andrew File System) fs. It is under developmen=
t
+and does not yet provide the full feature set.
+It does not yet support pioctl() system call.
+.TP
 .B ext
 is an elaborate extension of the
 .B minix
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
