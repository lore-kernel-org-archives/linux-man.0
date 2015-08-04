From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] sched.7: Fix swapped descriptions of sched_get_priority_max
 and sched_get_priority_min
Date: Tue, 04 Aug 2015 12:08:40 +0200
Message-ID: <1438682920.3375.7.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/sched.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/sched.7 b/man7/sched.7
index ac518b2..743d52b 100644
--- a/man7/sched.7
+++ b/man7/sched.7
@@ -49,10 +49,10 @@ Set the scheduling parameters of a specified
thread.
 Fetch the scheduling parameters of a specified thread.
 .TP
 .BR sched_get_priority_max (2)
-Return the minimum priority available in a specified scheduling
policy.
+Return the maximum priority available in a specified scheduling
policy.
 .TP
 .BR sched_get_priority_min (2)
-Return the maximum priority available in a specified scheduling
policy.
+Return the minimum priority available in a specified scheduling
policy.
 .TP
 .BR sched_rr_get_interval (2)
 Fetch the quantum used for threads that are scheduled under
-- 
2.4.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
