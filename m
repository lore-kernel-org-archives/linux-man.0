From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH] malloc_get_state.3: Replace header
Date: Wed,  4 Jun 2014 16:38:37 +0200
Message-ID: <1401892717-12014-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The non-standard functions malloc_[gs]et_state are provided by
malloc.h, not stdlib.h

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/malloc_get_state.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/malloc_get_state.3 b/man3/malloc_get_state.3
index cea14c4..5da546d 100644
--- a/man3/malloc_get_state.3
+++ b/man3/malloc_get_state.3
@@ -27,7 +27,7 @@
 malloc_get_state, malloc_set_state \- record and restore state of malloc implementation
 .SH SYNOPSIS
 .nf
-.B #include <stdlib.h>
+.B #include <malloc.h>
 .sp
 .BI "void* malloc_get_state(void);"
 
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
