From: Julian Orth <ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] capget.2: capset works with gettid not getpid.
Date: Wed, 10 Jun 2015 21:56:33 +0200
Message-ID: <1433966193-19774-1-git-send-email-ju.orth@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julian Orth <ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/capget.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/capget.2 b/man2/capget.2
index 44ba568..014b974 100644
--- a/man2/capget.2
+++ b/man2/capget.2
@@ -140,7 +140,7 @@ That is, with VFS support, for
 calls the only permitted values for
 .I hdrp->pid
 are 0 or
-.BR getpid (2),
+.BR gettid (2),
 which are equivalent.
 .SS Without VFS capability support
 When the kernel does not support VFS capabilities,
-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
