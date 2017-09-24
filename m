From: Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Subject: [PATCH 4/4] proc.5: Document /proc/kpagecgroup
Date: Sun, 24 Sep 2017 23:41:38 +0200
Message-ID: <20170924214138.4852-5-oe@outputenable.net>
References: <20170924214138.4852-1-oe@outputenable.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924214138.4852-1-oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

see linux 80ae2fdceba8313b0433f899bdd9c6c463291a17
---
 man5/proc.5 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 0b31dad2f..dd7764d0f 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2927,6 +2927,18 @@ Information in this file is retrieved with the
 .BR dmesg (1)
 program.
 .TP
+.IR /proc/kpagecgroup " (since Linux 4.3)"
+This file contains a 64-bit inode number of
+the memory cgroup each page is charged to,
+indexed by page frame number (see the discussion of
+.IR /proc/[pid]/pagemap ).
+.IP
+The
+.IR /proc/kpagecgroup
+file is present only if the
+.B CONFIG_MEMCG
+kernel configuration option is enabled.
+.TP
 .IR /proc/kpagecount " (since Linux 2.6.25)"
 This file contains a 64-bit count of the number of
 times each physical page frame is mapped,
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
