From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] proc.5: add description for softirq line in /proc/stat
Date: Sat, 2 Sep 2017 15:58:56 +0200
Message-ID: <20170902135856.GA27895@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 077bde2..d308b32 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -3815,6 +3815,13 @@ Number of processes in runnable state.
 \fIprocs_blocked 2\fP
 Number of processes blocked waiting for I/O to complete.
 (Linux 2.5.45 onward.)
+.TP
+.I softirq 229245889 94 60001584 13619 5175704 2471304 28 51212741 59130143 0 51240672
+.\" commit d3d64df21d3d0de675a0d3ffa7c10514f3644b30
+This line shows the number of softirq for all CPUs.
+The first column is the total of all softirqs and
+each subsequent column is the total for particular softirq.
+(since Linux 2.6.31)
 .RE
 .TP
 .I /proc/swaps
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
