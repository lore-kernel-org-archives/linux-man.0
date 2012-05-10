From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] poll.2: tfix
Date: Thu, 10 May 2012 01:59:53 -0400
Message-ID: <1336629593-10300-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/poll.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/poll.2 b/man2/poll.2
index ee53353..87905e8 100644
--- a/man2/poll.2
+++ b/man2/poll.2
@@ -135,7 +135,7 @@ Specifying a
 .I timeout
 of zero causes
 .BR poll ()
-to return immediately, even if no file desciptors are ready.
+to return immediately, even if no file descriptors are ready.
 
 The bits that may be set/returned in
 .I events
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
