From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Sun,  7 Aug 2016 12:47:18 +0200
Message-ID: <1470566838-8148-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/proc.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 351c33b..8fa4aa3 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2359,7 +2359,7 @@ Until Linux 4.2, the presence of this file was governed by the
 kernel configuration option.
 Since Linux 4.2,
 .\" commit 2e13ba54a2682eea24918b87ad3edf70c2cf085b
-it it is governed by the
+it is governed by the
 .B CONFIG_PROC_CHILDREN
 option.
 .TP
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
