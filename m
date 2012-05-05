From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] clock_getres.2: ffix
Date: Sat,  5 May 2012 22:33:55 +0200
Message-ID: <1336250035-15232-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Formating issue introduced in 63f0f3d9b864
---
 man2/clock_getres.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index ed6fed9..e710d0b 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -243,4 +243,4 @@ On Linux, these clocks are not settable
 .BR ftime (3),
 .BR pthread_getcpuclockid (3),
 .BR sysconf (3),
- time (7)
+.BR time (7)
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
