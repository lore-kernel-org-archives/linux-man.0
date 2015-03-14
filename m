From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] socket.2: SEE ALSO close(2)
Date: Sat, 14 Mar 2015 15:01:10 +0100
Message-ID: <1426341670-27668-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The description mentions close(2). Hence it should also be referenced
in the SEE ALSO section.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/socket.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/socket.2 b/man2/socket.2
index 448e922..86a4e98 100644
--- a/man2/socket.2
+++ b/man2/socket.2
@@ -397,6 +397,7 @@ is shown in
 .SH SEE ALSO
 .BR accept (2),
 .BR bind (2),
+.BR close (2),
 .BR connect (2),
 .BR fcntl (2),
 .BR getpeername (2),
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
