From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] listxattr.2: tfix
Date: Sat,  6 Jun 2015 19:11:54 +0200
Message-ID: <1433610714-27588-1-git-send-email-jann@thejh.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/listxattr.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/listxattr.2 b/man2/listxattr.2
index 779fdb7..7519bff 100644
--- a/man2/listxattr.2
+++ b/man2/listxattr.2
@@ -138,7 +138,7 @@ is set appropriately.
 .B E2BIG
 The size of the list of attribute names for this file exceeds
 the system-imposed limit.
-See BUSG.
+See BUGS.
 .TP
 .B ENOTSUP
 Extended attributes are not supported by the filesystem, or are disabled.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
