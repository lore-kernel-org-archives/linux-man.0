From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] open.2: ffix
Date: Tue, 15 May 2012 22:07:00 -0400
Message-ID: <1337134020-10063-1-git-send-email-taffit@debian.org>
References: <1337127028-4505-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337127028-4505-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Another similar one I only noticed on review.

---
 man2/open.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index 5ea16f6..ad318b1 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -776,7 +776,7 @@ I/Os should never be run concurrently with the
 system call,
 if the memory buffer is a private mapping
 (i.e., any mapping created with the
-.BR mmap(2)
+.BR mmap (2)
 .BR MAP_PRIVATE
 flag;
 this includes memory allocated on the heap and statically allocated buffers).
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
