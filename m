From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] open_by_handle_at.2: ffix
Date: Mon,  4 Aug 2014 22:46:05 +0200
Message-ID: <1407185165-23573-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/open_by_handle_at.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open_by_handle_at.2 b/man2/open_by_handle_at.2
index 7badac7..ddf96b7 100644
--- a/man2/open_by_handle_at.2
+++ b/man2/open_by_handle_at.2
@@ -28,7 +28,7 @@ name_to_handle_at, open_by_handle_at \- obtain handle
 for a pathname and open file via a handle
 .SH SYNOPSIS
 .nf
-.B "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
+.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
 .B #include <sys/types.h>
 .B #include <sys/stat.h>
 .B #include <fcntl.h>
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
