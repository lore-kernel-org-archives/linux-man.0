From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 17/19] pthread_rwlockattr_setkind_np.3: tfix
Date: Sun,  6 Dec 2015 19:47:30 +0100
Message-ID: <1449427652-3585-17-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/pthread_rwlockattr_setkind_np.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/pthread_rwlockattr_setkind_np.3 b/man3/pthread_rwlockattr_setkind_np.3
index bf7f7c6..c90d9a5 100644
--- a/man3/pthread_rwlockattr_setkind_np.3
+++ b/man3/pthread_rwlockattr_setkind_np.3
@@ -6,7 +6,7 @@
 .\" preserved on all copies.
 .\"
 .\" Permission is granted to copy and distribute modified versions of this
-.\" manual under the conditions for verbat`im copying, provided that the
+.\" manual under the conditions for verbatim copying, provided that the
 .\" entire resulting derived work is distributed under the terms of a
 .\" permission notice identical to this one.
 .\"
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
