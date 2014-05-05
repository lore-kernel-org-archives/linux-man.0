From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] termios.3: tfix
Date: Mon,  5 May 2014 21:37:32 +0400
Message-ID: <1399311452-4610-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/termios.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/termios.3 b/man3/termios.3
index c0e3c45..60413f5 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -346,7 +346,7 @@ devices): if
 .B PARODD
 is set, the parity bit is always 1; if
 .B PARODD
-is not set, then the parity bit is always 0).
+is not set, then the parity bit is always 0.
 [requires
 .B _BSD_SOURCE
 or
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
