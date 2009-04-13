From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] execve(2): pending signals are not cleared
Date: Sun, 12 Apr 2009 21:02:23 -0400
Message-ID: <1239584543-13548-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

As pointed out by Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>, the sigpending(2)
contradicts the execve(2) page.

The sigpending(2) page states:
... the pending signal set is preserved across an execve(2).

While the execve(2) page states:
The set of pending signals is cleared (sigpending(2)).

POSIX supports the sigpending(2) statement, so the line from execve(2)
should be dropped.  See this page:
http://www.opengroup.org/onlinepubs/9699919799/functions/exec.html
Where it states:
The new process shall inherit at least the following attributes from the
calling process image:
  * Pending signal (see sigpending())

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/execve.2 |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/man2/execve.2 b/man2/execve.2
index 0602a56..c3a43e1 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -118,9 +118,6 @@ glibc 2.
 All process attributes are preserved during an
 .BR execve (),
 except the following:
-.IP * 3
-The set of pending signals is cleared
-.RB ( sigpending (2)).
 .IP *
 The dispositions of any signals that are being caught are
 reset to being ignored.
-- 
1.6.2.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
