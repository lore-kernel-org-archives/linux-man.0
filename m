From: Kirill Smelkov <kirr-SMVZJ6D5G6fQT0dZR+AlfA@public.gmane.org>
Subject: [patch] mmap.2: Add link to commit which broke MAP_POPULATE | MAP_NONBLOCK to be noop
Date: Sat, 18 Mar 2017 22:40:10 +0300
Message-ID: <20170318194010.11639-1-kirr@nexedi.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Kirill Smelkov <kirr-SMVZJ6D5G6fQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Kirill Smelkov <kirr-SMVZJ6D5G6fQT0dZR+AlfA@public.gmane.org>
---
 man2/mmap.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/mmap.2 b/man2/mmap.2
index 96875e486..f6fd56523 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -300,6 +300,7 @@ Don't perform read-ahead:
 create page tables entries only for pages
 that are already present in RAM.
 Since Linux 2.6.23, this flag causes
+.\" commit 54cb8821de07f2ffcd28c380ce9b93d5784b40d7
 .BR MAP_POPULATE
 to do nothing.
 One day, the combination of
-- 
2.11.0
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
