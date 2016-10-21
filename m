From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2: update time_shift sample code
Date: Fri, 21 Oct 2016 00:38:06 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610210036000.3240@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Linux 4.3 (b20112edeadf0b8a1416de061caa4beb11539902) improved
the accuracy of the clock/ns conversion routines.  As a result
the shift factor can now be 32.  This value is directly
exported in the perf_event_open() mmap page, and this
potentially breaks the sample code that shifts 1 left by
the shift value.

Add a cast in the sample code so that a proper 64-bit value
results from the shift.  This is the same change that was
made to the sample code in include/uapi/linux/perf_event.h
in Linux 4.4 (b9511cd761faafca7a1acc059e792c1399f9d7c6).

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index ae15cc6..fade28c 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1619,7 +1619,7 @@ delta since
     u64 quot, rem;
     u64 delta;
     quot = (cyc >> time_shift);
-    rem = cyc & ((1 << time_shift) \- 1);
+    rem = cyc & (((u64)1 << time_shift) \- 1);
     delta = time_offset + quot * time_mult +
             ((rem * time_mult) >> time_shift);
 .fi
@@ -1664,7 +1664,7 @@ And vice versa:
 
 .nf
     quot = cyc >> time_shift;
-    rem  = cyc & ((1 << time_shift) - 1);
+    rem  = cyc & (((u64)1 << time_shift) - 1);
     timestamp = time_zero + quot * time_mult +
         ((rem * time_mult) >> time_shift);
 .fi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
