From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 3/3] proc.5: tfix
Date: Wed, 25 Jan 2017 16:37:33 +0100
Message-ID: <20170125153733.3588-3-jwilk@jwilk.net>
References: <20170125153733.3588-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125153733.3588-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/proc.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 8a7b6bee7..c1d1a51eb 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4024,7 +4024,7 @@ A nonzero value enables leases.
 .\" commit d29216842a85c7970c536108e093963f02714498
 The value in this file specifies the maximum number of mounts that may exist
 in a mount namespace.
-The default vslue in this file is 100,000.
+The default value in this file is 100,000.
 .TP
 .IR /proc/sys/fs/mqueue " (since Linux 2.6.6)"
 This directory contains files
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
