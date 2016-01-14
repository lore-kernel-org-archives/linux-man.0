From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] nanosleep.2: tfix
Date: Thu, 14 Jan 2016 21:28:37 +0100
Message-ID: <1452803318-7860-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/nanosleep.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/nanosleep.2 b/man2/nanosleep.2
index 05fcce1..7ab6c01 100644
--- a/man2/nanosleep.2
+++ b/man2/nanosleep.2
@@ -114,7 +114,7 @@ Problem with copying information from user space.
 .TP
 .B EINTR
 The pause has been interrupted by a signal that was
-delivered to the threadi (see
+delivered to the thread (see
 .BR signal (7)).
 The remaining sleep time has been written
 into
-- 
2.7.0.rc3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
