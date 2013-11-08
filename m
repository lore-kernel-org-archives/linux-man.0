From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] clone.2: fix a bug of CLONE_PARENT_SETTID
Date: Fri, 8 Nov 2013 17:41:19 +0800
Message-ID: <1383903679-11598-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

CLONE_PARENT_SETTID only stores child thread ID in parent memory.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man2/clone.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/clone.2 b/man2/clone.2
index 4815fb1..6325397 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -532,7 +532,7 @@ calling process itself, will be signaled.
 .BR CLONE_PARENT_SETTID " (since Linux 2.5.49)"
 Store child thread ID at location
 .I ptid
-in parent and child memory.
+in parent memory.
 (In Linux 2.5.32-2.5.48 there was a flag
 .B CLONE_SETTID
 that did this.)
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
