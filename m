From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getitimer.2: tfix
Date: Sun, 24 Jul 2016 14:46:11 +0200
Message-ID: <1469364371-12020-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/getitimer.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/getitimer.2 b/man2/getitimer.2
index 3191a16..c991577 100644
--- a/man2/getitimer.2
+++ b/man2/getitimer.2
@@ -106,7 +106,7 @@ substructure is populated with the timer interval.
 If both fields of
 .IR it_interval
 are zero, then this is a single-shot timer (i.e., it expires just once).
-.SS getitimer()
+.SS setitimer()
 The function
 .BR setitimer ()
 arms or disarms the timer specified by
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
