From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 21/24] tsearch.3: Fix prototype
Date: Wed, 21 May 2014 16:57:52 +0200
Message-ID: <1400684275-20972-22-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The rootp argument to tfind is void *const void*, not const void **.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/tsearch.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/tsearch.3 b/man3/tsearch.3
index 83eceae..618fb54 100644
--- a/man3/tsearch.3
+++ b/man3/tsearch.3
@@ -32,7 +32,7 @@ tsearch, tfind, tdelete, twalk, tdestroy \- manage a binary tree
 .BI "void *tsearch(const void *" key ", void **" rootp ,
 .BI "                int (*" compar ")(const void *, const void *));"
 .sp
-.BI "void *tfind(const void *" key ", const void **" rootp ,
+.BI "void *tfind(const void *" key ", void *const *" rootp ,
 .BI "                int (*" compar ")(const void *, const void *));"
 .sp
 .BI "void *tdelete(const void *" key ", void **" rootp ,
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
