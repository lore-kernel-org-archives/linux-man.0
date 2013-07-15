From: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [RFC 1/2] proc.5: Add description of VmFlags field
Date: Tue, 16 Jul 2013 01:00:28 +0400
Message-ID: <1373922029-1923-2-git-send-email-gorcunov@openvz.org>
References: <1373922029-1923-1-git-send-email-gorcunov@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373922029-1923-1-git-send-email-gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man5/proc.5 | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 375a131..c1e01db 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -889,6 +889,8 @@ Shared_Clean:       424 kB
 Shared_Dirty:         0 kB
 Private_Clean:        0 kB
 Private_Dirty:        0 kB
+\&...
+VmFlags: rd ex mr mw me de
 
 .fi
 .in
@@ -900,6 +902,43 @@ the amount of the mapping that is currently resident in RAM,
 the number of clean and dirty shared pages in the mapping,
 and the number of clean and dirty private pages in the mapping.
 
+The
+.I VmFlags
+field (since Linux 3.8) represents the kernel flags associated with
+the particular virtual memory area in two letter encoded manner.
+The codes are the following:
+.nf
+.in +5
+rd = readable
+wr = writeable
+ex = executable
+sh = shared
+mr = may read
+mw = may write
+me = may execute
+ms = may share
+gd = stack segment growns down
+pf = pure PFN range
+dw = disabled write to the mapped file
+lo = pages are locked in memory
+io = memory mapped I/O area
+sr = sequential read advise provided
+rr = random read advise provided
+dc = do not copy area on fork
+de = do not expand area on remapping
+ac = area is accountable
+nr = swap space is not reserved for the area
+ht = area uses huge tlb pages
+nl = non-linear mapping
+ar = architecture specific flag
+dd = do not include area into core dump
+mm = mixed map area
+hg = huge page advise flag
+nh = no-huge page advise flag
+mg = mergable advise flag
+.fi
+.in
+
 This file is present only if the
 .B CONFIG_MMU
 kernel configuration
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
