From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/3] rtc.4: tfix
Date: Thu,  7 Jul 2016 11:57:36 +0200
Message-ID: <1467885458-625-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man4/rtc.4 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man4/rtc.4 b/man4/rtc.4
index c4675a7..218582c 100644
--- a/man4/rtc.4
+++ b/man4/rtc.4
@@ -238,9 +238,9 @@ these operations can be used to read or to set the RTC's Epoch,
 respectively.
 The third
 .BR ioctl (2)
-argument is a
+argument is an
 .I "unsigned long\ *"
-or a
+or an
 .IR "unsigned long" ,
 respectively, and the value returned (or assigned) is the Epoch.
 To set the RTC's Epoch the process must be privileged (i.e., have the
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
