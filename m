From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 05/19] fcntl.2: tfix
Date: Sun,  6 Dec 2015 19:47:18 +0100
Message-ID: <1449427652-3585-5-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/fcntl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fcntl.2 b/man2/fcntl.2
index 963c339..c3f7dc2 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -1425,7 +1425,7 @@ Note that shrinking or growing the size of the file is
 still possible and allowed.
 .\" One or more other seals are typically used with F_SEAL_WRITE
 .\" because, given a file with the F_SEAL_WRITE seal set, then,
-.\" while it would no longer be possinle to (say) write zeros into
+.\" while it would no longer be possible to (say) write zeros into
 .\" the last 100 bytes of a file, it would still be possible
 .\" to (say) shrink the file by 100 bytes using ftruncate(), and
 .\" then increase the file size by 100 bytes, which would have
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
