From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] termios.3: tfix
Date: Wed,  7 May 2014 21:42:34 +0400
Message-ID: <1399484554-4545-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/termios.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/termios.3 b/man3/termios.3
index 65f6c791..639e845 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -181,7 +181,7 @@ this allows character-erase to be correctly performed in cooked mode.
 Enable implementation-defined output processing.
 .PP
 The remaining \fIc_oflag\fP flag constants are defined in POSIX.1-2001,
-unless marked otherwise.
+unless marked otherwise:
 .TP
 .B OLCUC
 (not in POSIX) Map lowercase characters to uppercase on output.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
