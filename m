From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] termios.3: wfix
Date: Fri,  9 May 2014 09:13:25 +0400
Message-ID: <1399612405-4062-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/termios.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/termios.3 b/man3/termios.3
index d847e17..fbf909b 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -672,7 +672,7 @@ the change occurs immediately.
 the change occurs after all output written to
 .I fd
 has been transmitted.
-This function should be used when changing
+This option should be used when changing
 parameters that affect output.
 .IP \fBTCSAFLUSH\fP
 the change occurs after all output written to the object referred by
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
