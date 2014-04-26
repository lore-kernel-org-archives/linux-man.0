From: Alan Curry <rlwinm-WF+c3Tt1nJM@public.gmane.org>
Subject: [patch] sigaction.2 - bad cross-reference
Date: Sat, 26 Apr 2014 20:47:45 +0000 (UTC)
Message-ID: <201404262047.s3QKljjh003218@sdf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The syscall that reports child CPU usage is times(2), not time(2)

--- a/man2/sigaction.2	2014-04-20 04:06:16.000000000 -0500
+++ b/man2/sigaction.2	2014-04-26 15:39:35.087503556 -0500
@@ -366,7 +366,7 @@
 these fields do not include the times used by waited-for children (unlike
 .BR getrusage (2)
 and
-.BR time (2)).
+.BR times (2)).
 In kernels up to 2.6, and since 2.6.27, these fields report
 CPU time in units of
 .IR sysconf(_SC_CLK_TCK) .

-- 
Alan Curry
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
