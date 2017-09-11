From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/15] proc.5: document removal of htab-reclaim sysctl file
Date: Mon, 11 Sep 2017 05:04:05 +0200
Message-ID: <20170911030405.GA30045@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This PPC-specific sysctl option has been removed in Linux 2.4.9.2,
according to historic Linux repository commit log.

* man5/proc.5 (.SS Files and directories)
<.TP .I /proc/sys/kernel/htab-reclaim>: Mention the last Linux version
where the option was available.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 136a2fb..71486cc 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4399,9 +4399,11 @@ contains the path for the hotplug policy agent.
 The default value in this file is
 .IR /sbin/hotplug .
 .TP
-.I /proc/sys/kernel/htab-reclaim
+.\" Removed in commit 87f504e5c78b910b0c1d6ffb89bc95e492322c84 (tglx/history.git)
+.IR /proc/sys/kernel/htab-reclaim " (before Linux 2.4.9.2)"
 (PowerPC only) If this file is set to a nonzero value,
 the PowerPC htab
+.\" removed in commit 1b483a6a7b2998e9c98ad985d7494b9b725bd228, before 2.6.28
 (see kernel file
 .IR Documentation/powerpc/ppc_htab.txt )
 is pruned
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
