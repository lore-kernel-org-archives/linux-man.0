From: Dmitry Deshevoy <mityada-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] fcntl.2: tfix
Date: Wed, 25 Feb 2015 17:51:45 +0400
Message-ID: <1424872305-450-1-git-send-email-mityada@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Deshevoy <mityada-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Dmitry Deshevoy <mityada-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/fcntl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fcntl.2 b/man2/fcntl.2
index 60cec41..143c61f 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -1703,7 +1703,7 @@ but work is being done to have them included in the next version of POSIX.1.
 .BR F_ADD_SEALS
 and
 .BR F_GET_SEALS
-are Lnux-specific.
+are Linux-specific.
 .\" FIXME . Once glibc adds support, add a note about FTM requirements
 .SH NOTES
 The errors returned by
-- 
2.3.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
