From: Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] prctl.2, proc.5: proposal to reflect http://lwn.net/Articles/484162
Date: Fri,  6 Apr 2012 13:02:49 +0400
Message-ID: <1333702969-28795-1-git-send-email-dmitry.antipov@linaro.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Document PR_GET_TIMERSLACK and PR_SET_TIMERSLACK for prctl (2).
Document /proc/sys/kernel/timer_slack for proc (5).

Signed-off-by: Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 man2/prctl.2 |   15 +++++++++++++++
 man5/proc.5  |    4 ++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index effad2a..dcf803f 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -378,6 +378,21 @@ Return the current per-process machine check kill policy.
 All unused
 .BR prctl ()
 arguments must be zero.
+.TP
+.BR PR_GET_TIMERSLACK " (since Linux 2.6.28)"
+Return the current per-thread high-resolution timers slack, in nanoseconds.
+.TP
+.BR PR_SET_TIMERSLACK " (since Linux 2.6.28)"
+Set the current per-thread high-resolution timers slack. If arg2 is less than or
+equal to zero, system-wide default value is restored. The system-wide default can
+be read and set by /proc/sys/kernel/timer_slack (see
+.BR proc (5)).
+Otherwise, if arg2 is less than or equal to HRTIMER_MAX_SLACK (which is a kernel
+constant defined in include/linux/hrtimer.h), this value is set up as a new slack.
+Slack is not inherited across
+.BR fork (2);
+new process initially uses system-wide default slack, and new thread inherits
+it's slack from the group leader.
 .SH "RETURN VALUE"
 On success,
 .BR PR_GET_DUMPABLE ,
diff --git a/man5/proc.5 b/man5/proc.5
index 54ccdd8..0493b6b 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2407,6 +2407,10 @@ date behind it indicates the time the kernel was built.
 This file specifies the system-wide limit on the number of
 threads (tasks) that can be created on the system.
 .TP
+.IR /proc/sys/kernel/timer_slack
+This file specifies the system-wide default slack for
+high-resolution timers, in nanoseconds.
+.TP
 .IR /proc/sys/kernel/zero-paged " (PowerPC only) "
 This file
 contains a flag.
-- 
1.7.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
