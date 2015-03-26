From: Marian Marinov <mm-l-NV7Lj0SOnH0@public.gmane.org>
Subject: [PATCH] [patch] mount.2: Add MS_REC description
Date: Thu, 26 Mar 2015 02:28:37 +0200
Message-ID: <551352B5.30706@yuhu.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Marian Marinov <mm-NV7Lj0SOnH0@public.gmane.org>
---
  man2/mount.2 | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/man2/mount.2 b/man2/mount.2
index b081ba1..0c7b3e9 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -145,6 +145,15 @@ was also ignored
  (the bind mount has the same mount options as
  the underlying mount point).
  .TP
+.B MS_REC
+.\" information collected from tools/testing/selftests/mount/unprivileged-remount-test.c
+.\" and include/uapi/linux/fs.h
+This option is used together with
+.BR MS_BIND
+to make the mount recursive. This means that the kernel will walk trough
+all mount points within the source of the BIND and mount all of them in
+the corresponding directories within the destination of the BIND.
+.TP
  .BR MS_DIRSYNC " (since Linux 2.5.19)"
  Make directory changes on this filesystem synchronous.
  (This property can be obtained for individual directories
-- 
1.8.4
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
