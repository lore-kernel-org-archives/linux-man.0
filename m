From: jchaloup <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] proc.5: /proc/fs is not empty directory
Date: Thu, 05 Jun 2014 16:02:04 +0200
Message-ID: <20140605140204.25995.48033.stgit@unused-4-157.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Man page for proc says:
/proc/fs
	      Empty subdirectory.

But ls says something else:
$ ls /proc/fs/
ext4  jbd2  nfs  nfsd

In addition from https://www.kernel.org/doc/Documentation/filesystems/proc.txt, caption: 1.9 Ext4 file system parameters:

Information about mounted ext4 file systems can be found in
/proc/fs/ext4.

This patch gives better description for the content. Open to give more description if someone knows more or where to find it.

Signed-off-by: jchaloup <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man5/proc.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 8fd7b19..956760c 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1805,7 +1805,7 @@ Then filesystems contained in this file are tried
 (excepted those that are marked with "nodev").
 .TP
 .I /proc/fs
-Empty subdirectory.
+Directory shows which file systems are exported.
 .TP
 .I /proc/ide
 This directory

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
