From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] perfmonctl.2: tfix
Date: Fri, 22 Jan 2016 20:13:15 +0100
Message-ID: <1453489995-4990-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/perfmonctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/perfmonctl.2 b/man2/perfmonctl.2
index c942def..e061e2a 100644
--- a/man2/perfmonctl.2
+++ b/man2/perfmonctl.2
@@ -148,7 +148,7 @@ Restart monitoring after receiving an overflow notification.
 .B PFM_GET_FEATURES
 .\" pfm_get_features()
 .nf
-.BI  "perfmonctl(int " fd ", PFM_GET_FEARURES, pfarg_features_t *" arg ", 1);
+.BI  "perfmonctl(int " fd ", PFM_GET_FEATURES, pfarg_features_t *" arg ", 1);
 .fi
 .TP
 .B PFM_DEBUG
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
