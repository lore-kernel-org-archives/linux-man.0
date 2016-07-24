From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getitimer.2: tfix
Date: Sun, 24 Jul 2016 15:13:25 +0200
Message-ID: <1469366005-19476-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/getitimer.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/getitimer.2 b/man2/getitimer.2
index c991577..7d6ead7 100644
--- a/man2/getitimer.2
+++ b/man2/getitimer.2
@@ -84,7 +84,7 @@ struct timeval {
 .SS getitimer()
 The function
 .BR getitimer ()
-places the curent value of the timer specified by
+places the current value of the timer specified by
 .IR which
 in the buffer pointed to by
 .IR curr_value .
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
