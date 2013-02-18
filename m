From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: wfix
Date: Mon, 18 Feb 2013 21:31:26 +0100
Message-ID: <1361219486-9750-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

A write to /proc/profile may *set* interrupt frequency to that value.
---
 man5/proc.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 30ca3a9..1e13b60 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1966,7 +1966,7 @@ Writing (e.g., an empty string) to this file resets the profiling counters;
 on some architectures,
 writing a binary integer "profiling multiplier" of size
 .IR sizeof(int)
-resets the profiling interrupt frequency.
+sets the profiling interrupt frequency.
 
 .TP
 .I /proc/scsi
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
