From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Sun,  8 Oct 2017 17:53:34 +0200
Message-ID: <20171008155334.6909-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Remove duplicated word.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/proc.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index d23c0588a..cf4f35025 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4992,7 +4992,7 @@ cache management.
 .IR /proc/sys/vm/admin_reserve_kbytes " (since Linux 3.10)"
 .\" commit 4eeab4f5580d11bffedc697684b91b0bca0d5009
 This file defines the amount of free memory (in KiB) on the system that
-that should be reserved for users with the capability
+should be reserved for users with the capability
 .BR CAP_SYS_ADMIN .
 .IP
 The default value in this file is the minimum of [3% of free pages, 8MiB]
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
