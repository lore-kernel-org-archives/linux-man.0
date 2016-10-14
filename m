From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2: PERF_SAMPLE_BRANCH_IND_JUMP
 branch_sample_type
Date: Fri, 14 Oct 2016 16:31:47 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610141628010.29438@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Linux 4.2 added a new branch_sample_type: PERF_SAMPLE_BRANCH_IND_JUMP

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index afdee49..cd49cbb 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1247,6 +1247,10 @@ Any return branch.
 .B PERF_SAMPLE_BRANCH_IND_CALL
 Indirect calls.
 .TP
+.BR PERF_SAMPLE_BRANCH_IND_JUMP " (since Linux 4.2)"
+.\" commit c9fdfa14c3792c0160849c484e83aa57afd80ccc
+Indirect jumps.
+.TP
 .BR PERF_SAMPLE_BRANCH_COND " (since Linux 3.16)"
 .\" commit bac52139f0b7ab31330e98fd87fc5a2664951050
 Conditional branches.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
