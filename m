From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: ffix
Date: Sat,  2 Aug 2014 23:13:00 +0200
Message-ID: <1407013980-31378-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 040db32..942156b 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4062,7 +4062,9 @@ The statistics can be retrieved by:
 
     $ cat /proc/timer_stats
 
-While sampling is enabled, each readout from /proc/timer_stats will see
+While sampling is enabled, each readout from
+.I /proc/timer_stats
+will see
 newly updated statistics.
 Once sampling is disabled, the sampled information
 is kept until a new sample period is started.
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
