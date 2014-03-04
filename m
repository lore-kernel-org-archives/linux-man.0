From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] link.2: Fix typo.
Date: Tue, 4 Mar 2014 17:02:37 +0100
Message-ID: <20140304160237.GA8347@rei.Home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

protected_hardlink -> protected_hardlinks

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/link.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/link.2 b/man2/link.2
index 20c0b01..0311096 100644
--- a/man2/link.2
+++ b/man2/link.2
@@ -245,7 +245,7 @@ does not support the creation of hard links.
 .BR EPERM " (since Linux 3.6)"
 The caller does not have permission to create a hard link to this file
 (see the description of
-.IR /proc/sys/fs/protected_hardlink
+.IR /proc/sys/fs/protected_hardlinks
 in
 .BR proc (5)).
 .TP
-- 
1.8.3.2


-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
