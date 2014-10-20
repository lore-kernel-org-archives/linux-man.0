From: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Subject: [PATCH] credentials.7: Cross-reference getgroups(2)
Date: Mon, 20 Oct 2014 01:07:26 -0700
Message-ID: <20141020080724.GA22792@thin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Since credentials.7 discusses supplementary GIDs, it should reference
getgroups(2).

Signed-off-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
---
 man7/credentials.7 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man7/credentials.7 b/man7/credentials.7
index 51d5312..acb799d 100644
--- a/man7/credentials.7
+++ b/man7/credentials.7
@@ -309,6 +309,7 @@ is carried through to all of the POSIX threads in a process.
 .BR execve (2),
 .BR faccessat (2),
 .BR fork (2),
+.BR getgroups (2),
 .BR getpgrp (2),
 .BR getpid (2),
 .BR getppid (2),
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
