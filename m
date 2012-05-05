From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] unix.7: tfix
Date: Sat,  5 May 2012 16:01:02 -0400
Message-ID: <1336248062-19460-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Introduced in 1e4e3b.
---
 man7/unix.7 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/unix.7 b/man7/unix.7
index adbfd79..44369e6 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -12,7 +12,7 @@
 .\"     address that can appear in the sockaddr_un structure: pathname,
 .\"     unnamed, and abstract.
 .\"
-.TH UNIX  7 2102-04-16 "Linux" "Linux Programmer's Manual"
+.TH UNIX  7 2012-04-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
 unix, AF_UNIX, AF_LOCAL \- Sockets for local
 interprocess communication
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
