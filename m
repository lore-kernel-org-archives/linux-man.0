From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH] closedir.3: Fix typo
Date: Mon, 27 Apr 2009 18:45:14 +0100
Message-ID: <1240854314-3161-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man3/closedir.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/closedir.3 b/man3/closedir.3
index 264a3e9..170d49d 100644
--- a/man3/closedir.3
+++ b/man3/closedir.3
@@ -44,7 +44,7 @@ function closes the directory stream associated with
 \fIdirp\fP.
 A successful call to
 .BR closedir ()
-also closes the underlying file descripotr associated with
+also closes the underlying file descriptor associated with
 .IR dirp .
 The directory stream descriptor \fIdirp\fP is not available
 after this call.
-- 
1.6.2.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
