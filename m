From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 -- clarify PERF_SAMPLE_DATA_SRC usage
Date: Mon, 14 Jul 2014 10:33:04 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1407141025570.16796@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


When checking the fields in the PERF_SAMPLE_DATA_SRC type samples you need 
to shift the masks before doing the compare.

Although the value you are checking (perf_mem_data_src) is specified as a 
bitfield so this might all far apart if trying to access the field in a 
cross-endian way.  The Power people were working on this issue, not sure
if they resolved it.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 47e9984..3d70300 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1935,7 +1935,9 @@ Executable code
 .PD
 .TP
 .I mem_lvl
-Memory hierarchy level hit or miss, a bitwise combination of:
+Memory hierarchy level hit or miss, a bitwise combination of
+the following, shifted left by 
+.BR PERF_MEM_LVL_SHIFT :
 
 .PD 0
 .RS
@@ -1985,7 +1987,8 @@ Uncached memory
 .PD
 .TP
 .I mem_snoop
-Snoop mode, a bitwise combination of:
+Snoop mode, a bitwise combination of the following, shifted left by
+.BR PERF_MEM_SNOOP_SHIFT :
 
 .PD 0
 .RS
@@ -2008,7 +2011,8 @@ Snoop hit modified
 .PD
 .TP
 .I mem_lock
-Lock instruction, a bitwise combination of:
+Lock instruction, a bitwise combination of the following, shifted left by
+.BR PERF_MEM_LOCK_SHIFT :
 
 .PD 0
 .RS
@@ -2022,7 +2026,9 @@ Locked transaction
 .PD
 .TP
 .I mem_dtlb
-TLB access hit or miss, a bitwise combination of:
+TLB access hit or miss, a bitwise combination of the following, shifted
+left by
+.BR PERF_MEM_TLB_SHIFT :
 
 .PD 0
 .RS
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
