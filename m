From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] termios.3: tfix
Date: Mon,  5 May 2014 21:47:14 +0400
Message-ID: <1399312034-4691-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/termios.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/termios.3 b/man3/termios.3
index 60413f5..71a1e6c 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -374,7 +374,12 @@ If \fBICANON\fP is also set, terminal is uppercase only.
 Input is converted to lowercase, except for characters preceded by \\.
 On output, uppercase characters are preceded by \\ and lowercase
 characters are converted to uppercase.
-[requires _BSD_SOURCE or _SVID_SOURCE or _XOPEN_SOURCE]
+[requires
+.B _BSD_SOURCE
+or
+.B _SVID_SOURCE
+or
+.BR _XOPEN_SOURCE ]
 .\" glibc is probably now wrong to allow
 .\" Define
 .\" .B _XOPEN_SOURCE
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
