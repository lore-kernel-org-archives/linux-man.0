From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] tmpfs.5: ffix
Date: Wed,  5 Jul 2017 01:02:01 +0200
Message-ID: <20170704230201.6413-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/tmpfs.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/tmpfs.5 b/man5/tmpfs.5
index 00bb02085..7063cde01 100644
--- a/man5/tmpfs.5
+++ b/man5/tmpfs.5
@@ -91,7 +91,7 @@ extended attributes are not permitted.
 
 An internal shared memory filesystem is used for
 System V shared memory
-.BR (shmget (2))
+.RB ( shmget (2))
 and shared anonymous mappings
 .RB ( mmap (2)
 with the
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
