From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fanotify_mark.2: ffix
Date: Sat, 12 Jul 2014 12:19:58 -0400
Message-ID: <1405181998-3508-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/fanotify_mark.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
index d3c7e7d..488a9ef 100644
--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -229,7 +229,7 @@ If
 is relative, and
 .I dirfd
 has the value
-.BR AT_FDCWD,
+.BR AT_FDCWD ,
 then the filesystem object to be marked is determined by interpreting
 .I pathname
 relative the current working directory.
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
