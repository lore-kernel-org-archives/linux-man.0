From: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] adjtimex.2: Update modes field of adjtimex
Date: Wed, 24 Dec 2014 22:00:40 +0900
Message-ID: <1419426040-16090-2-git-send-email-standby24x7@gmail.com>
References: <1419426040-16090-1-git-send-email-standby24x7@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419426040-16090-1-git-send-email-standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This patch update modes field of adjtimex man page.

Signed-off-by: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/adjtimex.2 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index f2a8b8c..b4450e8 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -92,8 +92,15 @@ combination of zero or more of the following bits:
 #define ADJ_ESTERROR          0x0008 /* estimated time error */
 #define ADJ_STATUS            0x0010 /* clock status */
 #define ADJ_TIMECONST         0x0020 /* pll time constant */
+#define ADJ_TAI               0x0080 /* set TAI offset */
+#define ADJ_SETOFFSET         0x0100 /* add 'time' to current time */
+#define ADJ_MICRO             0x1000 /* select microsecond
+                                        resolution */
+#define ADJ_NANO              0x2000 /* select nanosecond
+                                        resolution */
 #define ADJ_TICK              0x4000 /* tick value */
-#define ADJ_OFFSET_SINGLESHOT 0x8001 /* old-fashioned adjtime() */
+#define ADJ_OFFSET_SINGLESHOT 0x8001 /* old-fashioned adjtime */
+#define ADJ_OFFSET_SS_READ    0xa001 /* read-only adjtime */
 .fi
 .in
 .PP
-- 
2.2.1.62.g3f15098

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
