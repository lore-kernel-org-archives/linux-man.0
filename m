From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 04/24] malloc_trim.3: Fix prototype
Date: Wed, 21 May 2014 16:57:35 +0200
Message-ID: <1400684275-20972-5-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As mentioned further down, malloc_trim returns an integer.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/malloc_trim.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/malloc_trim.3 b/man3/malloc_trim.3
index 4c9bf48..bdcafbd 100644
--- a/man3/malloc_trim.3
+++ b/man3/malloc_trim.3
@@ -29,7 +29,7 @@ malloc_trim \- release free memory from the top of the heap
 .SH SYNOPSIS
 .B #include <malloc.h>
 
-.BI "void malloc_trim(size_t "  pad );
+.BI "int malloc_trim(size_t "  pad );
 .SH DESCRIPTION
 The
 .BR malloc_trim ()
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
