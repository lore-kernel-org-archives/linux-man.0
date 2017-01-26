From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] mlock.2: tfix
Date: Thu, 26 Jan 2017 16:18:30 +0100
Message-ID: <20170126151830.8088-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/mlock.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/mlock.2 b/man2/mlock.2
index 9d5c1902c..7c90819b2 100644
--- a/man2/mlock.2
+++ b/man2/mlock.2
@@ -493,7 +493,7 @@ resource limit is encountered.
 .\" "Rationale for RLIMIT_MEMLOCK"
 .\" 23 Jan 2006
 .SH SEE ALSO
-.BR minore (2),
+.BR mincore (2),
 .BR mmap (2),
 .BR setrlimit (2),
 .BR shmctl (2),
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
