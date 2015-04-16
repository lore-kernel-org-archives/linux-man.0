From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch 03/10] perf_event_open.2: 4.1 PERF_EVENT_IOC_SET_BPF
 support
Date: Thu, 16 Apr 2015 14:13:48 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1504161412550.15181@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu.pt-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Namhyung Kim <namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of the
PERF_EVENT_IOC_SET_BPF ioctl in the following commit:

	commit 2541517c32be2531e0da59dfd7efc1ce844644f5
	Author: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
    
	tracing, perf: Implement BPF programs attached to kprobes

	Signed-off-by: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
	Reviewed-by: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
	Reviewed-by: Masami Hiramatsu <masami.hiramatsu.pt-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>
	Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
	Cc: Arnaldo Carvalho de Melo <acme-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
	Cc: Arnaldo Carvalho de Melo <acme-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
	Cc: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
	Cc: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
	Cc: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
	Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
	Cc: Namhyung Kim <namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
	Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
	Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
	Link: http://lkml.kernel.org/r/1427312966-8434-4-git-send-email-ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org
	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 01ee579..e08288e 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2480,6 +2480,16 @@ This returns the event ID value for the given event file descriptor.
 
 The argument is a pointer to a 64-bit unsigned integer
 to hold the result.
+.TP
+.BR PERF_EVENT_IOC_SET_BPF " (since Linux 4.1)"
+.\" commit 2541517c32be2531e0da59dfd7efc1ce844644f5
+This allows attaching a Berkeley Packet Filter (BPF)
+program to an existing kprobe tracepoint event.
+
+The argument is a BPF program id that was created by
+a previous
+.BR bpf (2)
+system call.
 .SS Using prctl
 A process can enable or disable all the event groups that are
 attached to it using the
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
