From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 19/19] prctl.2: tfix
Date: Sun,  6 Dec 2015 19:47:32 +0100
Message-ID: <1449427652-3585-19-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/prctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 7a75b4f..5cea3bb 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -1290,7 +1290,7 @@ or tried to set a flag whose corresponding locked flag was set
 .I option
 is
 .BR PR_SET_KEEPCAPS ,
-and the callers's
+and the caller's
 .B SECURE_KEEP_CAPS_LOCKED
 flag is set
 (see
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
