From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 05/10] Fix prototype for sched_setaffinity()
Date: Wed, 30 Apr 2014 21:42:37 +0200
Message-ID: <1398886962-10633-6-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The mask argument is const.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/sched_setaffinity.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sched_setaffinity.2 b/man2/sched_setaffinity.2
index 4078b88..b77f5b6 100644
--- a/man2/sched_setaffinity.2
+++ b/man2/sched_setaffinity.2
@@ -41,7 +41,7 @@ set and get a thread's CPU affinity mask
 .B #include <sched.h>
 .sp
 .BI "int sched_setaffinity(pid_t " pid ", size_t " cpusetsize ,
-.BI "                      cpu_set_t *" mask );
+.BI "                      const cpu_set_t *" mask );
 .sp
 .BI "int sched_getaffinity(pid_t " pid ", size_t " cpusetsize ,
 .BI "                      cpu_set_t *" mask );
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
