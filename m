From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc(5): maps: document the "pathname" field
Date: Fri, 15 Mar 2013 17:47:14 -0400
Message-ID: <1363384034-11106-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Add some info for people who aren't "in the know".

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man5/proc.5 | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index cd41e06..6755f62 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -367,6 +367,30 @@ p = private (copy on write)
 0 indicates that no inode is associated with the memory region,
 as the case would be with BSS (uninitialized data).
 
+"pathname" will be usually be the file that is backing the mapping.  For ELF
+files, You can easily coordinate with the "offset" field by looking at the
+Offset field in the ELF's program headers (`readelf -l`).
+
+There are additional helpful pseudo paths:
+
+.nf
+.in +5
+[stack]   = The initial process's (aka the main thread's) stack
+[stack:#] = A thread's stack (where the # is the thread's TID)
+[vdso]    = The virtual dynamically linked shared object
+[heap]    = The process's heap (no joke!)
+.in
+.fi
+
+The TID syntax was added in Linux 3.4.  It corresponds to the
+.IR /proc/[pid]/task/[TID]/
+path.
+
+If the field is blank, this is an anonymous mapping as obtained via the
+.BR mmap (2)
+function.  There is no easy way to coordinate this back to a process's
+source short of running it through gdb/strace/etc...  Sorry!
+
 Under Linux 2.0 there is no field giving pathname.
 .TP
 .I /proc/[pid]/mem
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
