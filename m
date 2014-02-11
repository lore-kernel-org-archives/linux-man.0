From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] endian.3: ffix
Date: Tue, 11 Feb 2014 23:34:12 +0100
Message-ID: <1392158052-30473-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

ffd4dec0f7eba4c12abba647a2d7e58bbcaa4cd5 and
7a9d6ddecee80d8fecc8618e223d560bb1fa455b fix were not the appropriate
ones.
---
 man3/endian.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/endian.3 b/man3/endian.3
index f751049..402cdf2 100644
--- a/man3/endian.3
+++ b/man3/endian.3
@@ -95,7 +95,7 @@ family of functions.
 For example,
 .BR be32toh ()
 is identical to
-.BR ntohl ()
+.BR ntohl ().
 
 The advantage of the
 .BR byteorder (3)
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
