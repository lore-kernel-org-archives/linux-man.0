From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Subject: [PATCH] semctl.2: CONFORMING TO: change a POSIX.1-2001 to POSIX.1-2008
Date: Mon, 26 Sep 2016 11:35:18 -0400
Message-ID: <20160926153518.16677-1-wfp5p@worldbroken.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The section had POSIX.1-2001 listed twice in a row instead of
POSIX.1-2001 and POSIX.1-2008

Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
---
 man2/semctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/semctl.2 b/man2/semctl.2
index 2897de7a4bb1..8cdb1f6f6cd8 100644
--- a/man2/semctl.2
+++ b/man2/semctl.2
@@ -457,7 +457,7 @@ is to be set (for some semaphore of the set) is less than 0
 or greater than the implementation limit
 .BR SEMVMX .
 .SH CONFORMING TO
-POSIX.1-2001, POSIX.1-2001, SVr4.
+POSIX.1-2001, POSIX.1-2008, SVr4.
 .\" SVr4 documents more error conditions EINVAL and EOVERFLOW.
 
 POSIX.1 specifies the
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
