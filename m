From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 2/4] open_by_handle_at.2: Add reference to feature_test_macros(7)
Date: Wed,  4 Jun 2014 18:33:26 +0200
Message-ID: <1401899608-30515-3-git-send-email-rv@rasmusvillemoes.dk>
References: <1401899608-30515-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401899608-30515-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/open_by_handle_at.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open_by_handle_at.2 b/man2/open_by_handle_at.2
index 45df008..1d22339 100644
--- a/man2/open_by_handle_at.2
+++ b/man2/open_by_handle_at.2
@@ -28,7 +28,7 @@ name_to_handle_at, open_by_handle_at \- obtain handle
 for a pathname and open file via a handle
 .SH SYNOPSIS
 .nf
-.B #define _GNU_SOURCE
+.B "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
 .B #include <sys/types.h>
 .B #include <sys/stat.h>
 .B #include <fcntl.h>
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
