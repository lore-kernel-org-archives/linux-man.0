From: Julien Gomes <julien-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] openpty.3: tfix
Date: Thu, 21 Sep 2017 14:48:00 -0700
Message-ID: <20170921214800.10824-1-julien@arista.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julien Gomes <julien-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Julien Gomes <julien-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>
---
 man3/openpty.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/openpty.3 b/man3/openpty.3
index 45e5a8257..c35a74bcb 100644
--- a/man3/openpty.3
+++ b/man3/openpty.3
@@ -103,7 +103,7 @@ descriptor of the master side of the pseudoterminal is returned in
 If
 .I name
 is not NULL, the buffer it points to is used to return the
-the filename of the slave.
+filename of the slave.
 The
 .I termp
 and
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
