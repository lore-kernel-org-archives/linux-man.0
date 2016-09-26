From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Subject: [PATCH] vfork.2: wfix
Date: Mon, 26 Sep 2016 11:35:07 -0400
Message-ID: <20160926153507.16627-1-wfp5p@worldbroken.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
---
 man2/vfork.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/vfork.2 b/man2/vfork.2
index 6f20900df4ae..ce03bcd67541 100644
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -202,7 +202,7 @@ can't be implemented on such systems.
 .BR vfork ()
 from the standard; the POSIX rationale for the
 .BR posix_spawn (3)
-function notes that that function,
+function notes that the function,
 which provides functionality equivalent to
 .BR fork (2)+ exec (3),
 is designed to be implementable on systems that lack an MMU.)
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
