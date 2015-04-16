From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch 01/10] perf_event_open.2: 4.1 PERF_SAMPLE_BRANCH_CALL_STACK
Date: Thu, 16 Apr 2015 14:11:50 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1504161410430.15181@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of the
PERF_SAMPLE_BRANCH_CALL_STACK functionaliry added in the
following commit:

	commit 2c44b1936bb3b135a3fac8b3493394d42e51cf70
	Author: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

	perf/x86/intel: Expose LBR callstack to user space tooling
    
	With LBR call stack feature enable, there are three callchain options.
	Enable the 3rd callchain option (LBR callstack) to user space tooling.
    
	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
	Cc: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
	Cc: Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
	Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
	Cc: Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
	Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
	Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
	Cc: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
	Cc: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
	Link: http://lkml.kernel.org/r/20141105093759.GQ10501-IIpfhp3q70z/8w/KjCw3T+5/BudmfyzbbVWyRVo5IupeoWH0uzbU5w@public.gmane.org
	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 01ee579..691b16b 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1203,6 +1203,11 @@ Branch in transactional memory transaction.
 .BR PERF_SAMPLE_BRANCH_NO_TX " (since Linux 3.11)"
 .\" commit 135c5612c460f89657c4698fe2ea753f6f667963
 Branch not in transactional memory transaction.
+.BR PERF_SAMPLE_BRANCH_CALL_STACK " (since Linux 4.1)"
+.\" commit 2c44b1936bb3b135a3fac8b3493394d42e51cf70
+Branch is part of a hardware generated call stack.
+This requires hardware support, currently only found
+on Intel x86 Haswell or newer.
 .RE
 
 .TP
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
