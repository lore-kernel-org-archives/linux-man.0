From: Li Peng <lip-2axScPvBUlJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] proc.5: Formatting fix of .IR
Date: Wed, 11 May 2016 18:09:42 +0800
Message-ID: <1462961382-8374-1-git-send-email-lip@dtdream.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Peng <lip-2axScPvBUlJBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Li Peng <lip-2axScPvBUlJBDgjK7y7TUQ@public.gmane.org>
---
 man5/proc.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index dadac32..8480a85 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2825,7 +2825,7 @@ allocated for the entire 1GB.
 This 1GB is memory which has been "committed" to by the VM
 and can be used at any time by the allocating application.
 With strict overcommit enabled on the system (mode 2 in
-IR /proc/sys/vm/overcommit_memory ),
+.IR /proc/sys/vm/overcommit_memory ),
 allocations which would exceed the
 .I CommitLimit
 will not be permitted.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
