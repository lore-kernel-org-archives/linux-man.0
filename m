From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 exclude_host/exclude_guest clarification
Date: Fri, 5 Dec 2014 10:41:05 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1412051027470.10310@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gleb Natapov <gleb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello

The PAPI developers recently ran into some issues with the various virtual 
machine related settings in the perf_event_open() system call.

What follows is what my proposed updated manpage sections look like; I'm 
hoping to get some sort of feedback about the correctness of these statements.


	exclude_hv
		If this bit is set, the count excludes events that happen in 
		the hypervisor.  This is mainly for PMUs that have 
		built-in hardware support for this feature (such as POWER;
		this setting is silently ignored on x86). 

...

	exclude_host (since Linux 3.2)
		When  conducting  measurements that include processes 
		running VM instances (i.e. have executed a KVM_RUN 
		ioctl(2) ) only  measure events happening inside a guest 
		instance.  This is only meaningful outside the guests; 
		this setting does not change counts gathered inside of a 
		guest.  Currently this functionality is x86 only.

	exclude_guest (since Linux 3.2)
		When conducting measurements that include processes 
		running VM instances  (i.e.  have executed a KVM_RUN 
		ioctl(2) ) do not measure events happening inside guest
		instances.  This is only meaningful outside the guests;  
		this setting does not change counts gathered inside of a 
		guest.  Currently this functionality is x86 only.



Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 638124c..a413c13 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -833,10 +833,9 @@ If this bit is set, the count excludes events that happen in kernel-space.
 .IR "exclude_hv"
 If this bit is set, the count excludes events that happen in the
 hypervisor.
-This is mainly for PMUs that have built-in support for handling this
-(such as POWER).
-Extra support is needed for handling hypervisor measurements on most
-machines.
+This is mainly for PMUs that have built-in hardware support
+for this feature (such as POWER; this setting is silently
+ignored on x86).
 .TP
 .IR "exclude_idle"
 If set, don't count when the CPU is idle.
@@ -978,10 +977,24 @@ struct sample_id {
 .fi
 .TP
 .IR "exclude_host" " (since Linux 3.2)"
-Do not measure time spent in VM host.
+When conducting measurements that include processes running
+VM instances (i.e. have executed a
+.I KVM_RUN
+.BR ioctl (2)
+) only measure events happening inside a guest instance.
+This is only meaningful outside the guests; this setting does
+not change counts gathered inside of a guest.
+Currently this functionality is x86 only.
 .TP
 .IR "exclude_guest" " (since Linux 3.2)"
-Do not measure time spent in VM guest.
+When conducting measurements that include processes running
+VM instances (i.e. have executed a
+.I KVM_RUN
+.BR ioctl (2)
+) do not measure events happening inside guest instances.
+This is only meaningful outside the guests; this setting does
+not change counts gathered inside of a guest.
+Currently this functionality is x86 only.
 .TP
 .IR "exclude_callchain_kernel" " (since Linux 3.7)"
 Do not include kernel callchains.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
