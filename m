From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] setmntent() takes a filename, not fp
Date: Wed,  2 Sep 2009 08:03:27 -0400
Message-ID: <1251893007-18490-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/getmntent.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/getmntent.3 b/man3/getmntent.3
index f775fa1..32078a5 100644
--- a/man3/getmntent.3
+++ b/man3/getmntent.3
@@ -68,7 +68,7 @@ These routines are used to access the file system description file
 The
 .BR setmntent ()
 function opens the file system description file
-\fIfp\fP and returns a file pointer which can be used by
+\fIfilename\fP and returns a file pointer which can be used by
 .BR getmntent ().
 The argument \fItype\fP is the type of access
 required and can take the same values as the \fImode\fP argument of
-- 
1.6.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
