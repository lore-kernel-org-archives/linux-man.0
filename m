From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 18/19] mount.2: tfix
Date: Sun,  6 Dec 2015 19:47:31 +0100
Message-ID: <1449427652-3585-18-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/mount.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/mount.2 b/man2/mount.2
index 0ceaca3..64ed128 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -90,7 +90,7 @@ in the low order 16 bits:
 .\"		can be re-marked PRIVATE.
 .\"	MS_SHARED
 .\"		Mount points that are marked SHARED propagate mount events
-.\"		to one another after bieing cloned.
+.\"		to one another after being cloned.
 
 .\"			mount --make-rshared ==> MS_SHARED | MS_REC
 
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
