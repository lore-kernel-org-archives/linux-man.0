From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] sigpause.3: srcfix
Date: Sun, 14 Feb 2016 15:49:52 +0100
Message-ID: <1455461393-23525-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/sigpause.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/sigpause.3 b/man3/sigpause.3
index dbc10de..d70bacf 100644
--- a/man3/sigpause.3
+++ b/man3/sigpause.3
@@ -67,7 +67,7 @@ T{
 .\" marking in glibc manual is more detailed.
 .\" sigpause: MT-Unsafe race:sigprocmask/!bsd!linux
 .\" glibc manual says /!linux!bsd indicate the preceding marker only applies
-./" when the underlying kernel is neither Linux nor a BSD kernel.
+.\" when the underlying kernel is neither Linux nor a BSD kernel.
 .\" So, it is safety in Linux kernel.
 T}	Thread safety	MT-Safe
 .TE
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
