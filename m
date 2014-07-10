From: Mijo Safradin <mijo-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] proc.5: Add missing fields to /proc/PID/stat
Date: Thu, 10 Jul 2014 11:10:20 +0200
Message-ID: <1404983420-21338-1-git-send-email-mijo@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mijo Safradin <mijo-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Merge stat fields from upstream file 'fs/proc/array.c'

Fields to add:
'start_data', 'end_data', 'start_brk', 'arg_start',
'arg_end', 'env_start', 'env_end', 'exit_code'
---
 man5/proc.5 |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 239d8ac..617c20a 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1383,6 +1383,31 @@ for a guest operating system), measured in clock ticks (divide by
 \fIcguest_time\fP %ld (since Linux 2.6.24)
 (44) Guest time of the process's children, measured in clock ticks (divide by
 .IR sysconf(_SC_CLK_TCK) ).
+.TP
+\fIstartdata\fP %lu
+(45) address above which program data+bss is placed.
+.TP
+\fIenddata\fP %lu
+(46) address below which program data+bss is placed.
+.TP
+\fIstartbrk\fP %lu
+(47) address above which program heap can be expanded with brk().
+.TP
+\fIargstart\fP %lu
+(48) address above which program command line is placed.
+.TP
+\fIargend\fP %lu
+(49) address below which program command line is placed.
+.TP
+\fIenvstart\fP %lu
+(50) address above which program environment is placed.
+.TP
+\fIenvend\fP %lu
+(51) address below which program environment is placed.
+.TP
+\fIexitcode\fP %lu
+(52) the thread's exit_code in the form reported by the waitpid system call.
+.TP
 .RE
 .TP
 .I /proc/[pid]/statm
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
