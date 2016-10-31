From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] perf_event_open.2: tfix
Date: Mon, 31 Oct 2016 11:10:43 +0100
Message-ID: <20161031101043.8201-2-jwilk@jwilk.net>
References: <20161031101043.8201-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161031101043.8201-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/perf_event_open.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 6d77d97..0c757cc 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -790,7 +790,7 @@ the register values will return kernel register
 state if the overflow happened while kernel
 code is running.
 If the CPU supports hardware sampling of
-register state (i.e.,, PEBS on Intel x86) and
+register state (i.e., PEBS on Intel x86) and
 .I precise_ip
 is set higher than zero then the register
 values returned are those captured by
@@ -1003,7 +1003,7 @@ See also the description of
 .TP
 .IR "mmap_data" " (since Linux 2.6.36)"
 .\" commit 3af9e859281bda7eb7c20b51879cf43aa788ac2e
-Ths the counterpart of the
+This is the counterpart of the
 .I mmap
 field.
 This enables generation of
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
