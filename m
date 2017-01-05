From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ioctl_fideduperange.2: ffix
Date: Thu,  5 Jan 2017 13:47:47 +0100
Message-ID: <20170105124747.7204-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Add empty line between "struct file_dedupe_range" definition and the
following paragraph.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/ioctl_fideduperange.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/ioctl_fideduperange.2 b/man2/ioctl_fideduperange.2
index 5db25be70..d0a43854b 100644
--- a/man2/ioctl_fideduperange.2
+++ b/man2/ioctl_fideduperange.2
@@ -68,6 +68,7 @@ struct file_dedupe_range {
 };
 .fi
 .in
+
 Deduplication is atomic with regards to concurrent writes, so no locks need to
 be taken to obtain a consistent deduplicated copy.
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
