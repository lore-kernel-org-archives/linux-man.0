From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] perf_event_open.2: ffix and wfix
Date: Sun, 24 Feb 2013 21:51:55 -0400
Message-ID: <1361757115-26228-1-git-send-email-taffit@debian.org>
References: <1361551634-17115-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361551634-17115-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 |   18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index eb989d4..42ec49f 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -334,7 +334,11 @@ is 72, corresponding to the addition of breakpoints in Linux 2.6.33.
 is 80, corresponding to the addition of branch sampling in Linux 3.4.
 .B PERF_ATR_SIZE_VER3
 is 96, corresponding to the addition
-of sample_regs_user and sample_stack_user in Linux 3.7.
+of
+.I sample_regs_user
+and
+.I sample_stack_user
+in Linux 3.7.
 
 .TP
 .I "config"
@@ -682,12 +686,16 @@ file descriptor.
 .RS
 .TP
 .B PERF_FORMAT_TOTAL_TIME_ENABLED
-Adds the 64-bit "time_enabled" field.
+Adds the 64-bit
+.I time_enabled
+field.
 This can be used to calculate estimated totals if
 the PMU is overcommitted and multiplexing is happening.
 .TP
 .B PERF_FORMAT_TOTAL_TIME_RUNNING
-Adds the 64-bit "time_running" field.
+Adds the 64-bit
+.I time_running
+field.
 This can be used to calculate estimated totals if
 the PMU is overcommitted and  multiplexing is happening.
 .TP
@@ -1012,7 +1020,7 @@ See
 
 .TP
 .IR "sample_stack_user" " (Since Linux 3.7)"
-This defines the size of the user stack to dump on sample.
+This defines the size of the user stack to dump on samples.
 
 .RE
 
@@ -1603,7 +1611,7 @@ follow.
 This is the current callchain.
 
 .TP
-.IR size ", " data
+.IR size ", " data[size]
 If
 .B PERF_SAMPLE_RAW
 is enabled, then a 32-bit value indicating size
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
