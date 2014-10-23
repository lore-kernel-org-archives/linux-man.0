From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify.7: kernel version in BUGS section
Date: Thu, 23 Oct 2014 22:06:43 +0200
Message-ID: <1414094803-3486-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Change kernel version in BUGS section to 3.17

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/fanotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/fanotify.7 b/man7/fanotify.7
index b6456d5..bc5a11c 100644
--- a/man7/fanotify.7
+++ b/man7/fanotify.7
@@ -485,7 +485,7 @@ Monitoring mounts offers the capability to monitor a whole directory tree.
 The event queue can overflow.
 In this case, events are lost.
 .SH BUGS
-As of Linux 3.15,
+As of Linux 3.17,
 the following bugs exist:
 .IP * 3
 .\" FIXME . A patch was proposed.
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
