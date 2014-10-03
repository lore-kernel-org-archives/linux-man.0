From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fallocate.2: add include falloc.h
Date: Fri,  3 Oct 2014 02:37:50 +0200
Message-ID: <1412296670-8745-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Include linux/falloc.h provides the constants described in the
manpage.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fallocate.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index ccd0431..68b33b5 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -15,6 +15,7 @@ fallocate \- manipulate file space
 .nf
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <fcntl.h>
+.B #include <linux/falloc.h>
 
 .BI "int fallocate(int " fd ", int " mode ", off_t " offset \
 ", off_t " len ");
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
