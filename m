From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH] isfdtype.3: wsfix
Date: Mon, 29 Dec 2014 12:27:08 +0100
Message-ID: <1419852428-22516-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/isfdtype.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/isfdtype.3 b/man3/isfdtype.3
index bd7414e..292ecf5 100644
--- a/man3/isfdtype.3
+++ b/man3/isfdtype.3
@@ -31,7 +31,7 @@ isfdtype \- test file type of a file descriptor
 .B #include <sys/stat.h>
 .B #include <sys/socket.h>
 
-.BI "int isfdtype(int " fd ", int" fdtype );
+.BI "int isfdtype(int " fd ", int " fdtype );
 .fi
 .sp
 .in -4n
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
