From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/2] inotify.7: BUGS fallocate fixed
Date: Mon, 27 Apr 2015 23:26:35 +0200
Message-ID: <1430169995-23006-2-git-send-email-xypron.glpk@gmx.de>
References: <1430169995-23006-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430169995-23006-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since Linux 3.19 (820c12d5d6c0890bc93dd63893924a13041fdc35)
fallocate.2 creates FAN_MODIFY and IN_MODIFY events.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/inotify.7 | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 3742bb8..ec62d16 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -752,10 +752,6 @@ and also the possibility that there may not be any
 .B IN_MOVED_TO
 event.
 .SH BUGS
-As of kernel 3.17, calling
-.BR fallocate (2)
-does not create any inotify events.
