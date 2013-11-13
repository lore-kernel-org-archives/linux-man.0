From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: Update description for mmap_data
 bit
Date: Wed, 13 Nov 2013 12:59:33 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1311131254380.348@vincent-weaver-1.um.maine.edu>
References: <1384291959-5329-1-git-send-email-dsahern@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384291959-5329-1-git-send-email-dsahern-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ahern <dsahern-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnaldo Carvalho de Melo <acme-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Here's an updated version of the patch that expands the "mmap" definition 
as well as that of "mmap_data".  Also some manpage related formatting
improvements from the original patch.

I'm not really sure how signed-off-by's and other tags work when modifying 
a patch like this so sorry if I mixed that up.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: David Ahern <dsahern-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnaldo Carvalho de Melo <acme-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Link: https://lkml.org/lkml/2013/11/11/505

---

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 1889689..5ba1a42 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -805,7 +805,16 @@ If set, don't count when the CPU is idle.
 .IR "mmap"
 The
 .I mmap
-bit enables recording of exec mmap events.
+bit enables generation of
+.I PERF_RECORD_MMAP
+samples for every
+.BR mmap (2)
+call that has
+.I PROT_EXEC
+set.
+This allows tools to notice new executable code being mapped into
+a program (dynamic shared libraries for example)
+so that addresses can be mapped back to the original code.
 .TP
 .IR "comm"
 The
@@ -884,8 +893,14 @@ See also
 .IR "mmap_data" " (Since Linux 2.6.36)"
 The counterpart of the
 .I mmap
-field, but enables including data mmap events
-in the ring-buffer.
+field.
+This enables generation of
+.I PERF_RECORD_MMAP
+samples for
+.BR mmap (2)
+calls that do not have
+.I PROT_EXEC
+set (for example data and SysV shared memory).
 .TP
 .IR "sample_id_all" " (Since Linux 2.6.38)"
 If set, then TID, TIME, ID, STREAM_ID, and CPU can
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
