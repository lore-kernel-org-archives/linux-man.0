From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify.7: wfix
Date: Tue,  4 Nov 2014 01:01:03 +0100
Message-ID: <1415059263-2658-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Removed duplicate "using".

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/fanotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/fanotify.7 b/man7/fanotify.7
index d6f2542..9d7ae7f 100644
--- a/man7/fanotify.7
+++ b/man7/fanotify.7
@@ -489,7 +489,7 @@ As of Linux 3.17,
 the following bugs exist:
 .IP * 3
 On Linux, a filesystem object may be accessible through multiple paths,
-for example, a part of a filesystem may be remounted using using the
+for example, a part of a filesystem may be remounted using the
 .IR \-\-bind
 option of
 .BR mount (8).
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
