From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fork(2): add ENOSYS
Date: Tue,  1 May 2012 00:50:02 -0400
Message-ID: <1335847802-15646-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/fork.2 |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man2/fork.2 b/man2/fork.2
index 4089fb9..fb604ac 100644
--- a/man2/fork.2
+++ b/man2/fork.2
@@ -184,6 +184,10 @@ capability.
 .B ENOMEM
 .BR fork ()
 failed to allocate the necessary kernel structures because memory is tight.
+.TP
+.B ENOSYS
+.BR fork ()
+is not supported on this platform (e.g. a no-mmu setup).
 .SH "CONFORMING TO"
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.7.9.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
