From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] strdup: doesn't make sense to document errno codes, when NULL means error
Date: Tue, 14 Aug 2012 19:05:21 -0700
Message-ID: <1344996321-14959-1-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

man 3 malloc doesn't do this, and its kinda confusing
---
 man3/strdup.3 |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/man3/strdup.3 b/man3/strdup.3
index 3b5c543..45ea2be 100644
--- a/man3/strdup.3
+++ b/man3/strdup.3
@@ -104,10 +104,6 @@ The
 .BR strdup ()
 function returns a pointer to the duplicated
 string, or NULL if insufficient memory was available.
-.SH ERRORS
-.TP
-.B ENOMEM
-Insufficient memory available to allocate duplicate string.
 .SH "CONFORMING TO"
 .\" 4.3BSD-Reno, not (first) 4.3BSD.
 .BR strdup ()
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
