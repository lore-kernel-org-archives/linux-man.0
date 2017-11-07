From: Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH] system.3: wfix
Date: Tue,  7 Nov 2017 23:09:48 +0100
Message-ID: <20171107220948.13675-1-mail@lucaswerkmeister.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/system.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/system.3 b/man3/system.3
index 07d0d92bd..9c66242f9 100644
--- a/man3/system.3
+++ b/man3/system.3
@@ -69,7 +69,7 @@ If
 .I command
 is NULL, then
 .BR system ()
-returns a status indicating whether a shell is available on the system
+returns a status indicating whether a shell is available on the system.
 .SH RETURN VALUE
 The return value of
 .BR system ()
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
