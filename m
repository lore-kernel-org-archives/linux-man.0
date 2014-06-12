From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] setresuid.2: sfix
Date: Thu, 12 Jun 2014 16:23:12 +0400
Message-ID: <1402575792-5331-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/setresuid.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/setresuid.2 b/man2/setresuid.2
index f0482cd..847e224 100644
--- a/man2/setresuid.2
+++ b/man2/setresuid.2
@@ -71,7 +71,7 @@ is set appropriately.
 there are cases where
 .BR setresuid ()
 can fail even when the caller is UID 0;
-it is a grave security error to omit checking for a faulure return from
+it is a grave security error to omit checking for a failure return from
 .BR setresuid ().
 .SH ERRORS
 .TP
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
