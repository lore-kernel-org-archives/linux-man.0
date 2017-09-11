From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/15] proc.5: document removal of timer_stats file
Date: Mon, 11 Sep 2017 05:04:07 +0200
Message-ID: <20170911030407.GA30085@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

timer_stats was removed in Linux commit commit v4.11-rc1~177^2~5 citing
security concerns.

* man5/proc.5 (.SS Files and directories) <.TP .I /proc/timer_stats>:
Mention the last Linux version where the file was available along with
the reasons of removal.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 71486cc..7af4e02 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -5326,10 +5326,12 @@ This read-only file exposes a list of all currently pending
 (high-resolution) timers,
 all clock-event sources, and their parameters in a human-readable form.
 .TP
-.IR /proc/timer_stats " (since Linux 2.6.21)"
+.IR /proc/timer_stats " (since Linux 2.6.21, before Linux 4.11)"
 .\" commit 82f67cd9fca8c8762c15ba7ed0d5747588c1e221
 .\"	Date:   Fri Feb 16 01:28:13 2007 -0800
 .\" Text largely derived from Documentation/timers/timer_stats.txt
+.\" removed in commit dfb4357da6ddbdf57d583ba64361c9d792b0e0b1
+.\"     Date:   Wed Feb 8 11:26:59 2017 -0800
 This is a debugging facility to make timer (ab)use in a Linux
 system visible to kernel and user-space developers.
 It can be used by kernel and user-space developers to verify that
@@ -5423,6 +5425,10 @@ the function where the timer was initialized; and
 (in parentheses)
 the callback function that is associated with the timer.
 .RE
+.IP
+During the Linux 4.11 development cycle this functionality has been removed,
+as it exposes information across namespaces, and there is possibility to obtain
+the same information via in-kernel tracing facilities such as ftrace.
 .TP
 .I /proc/tty
 Subdirectory containing the pseudo-files and subdirectories for
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
