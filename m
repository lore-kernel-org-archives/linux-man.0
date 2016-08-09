From: andrew-cyX/yU1dXXmLwutG50LtGA@public.gmane.org
Subject: [PATCH] getaddrinfo.3: correct FTM requirements for glibc 2.22
Date: Tue,  9 Aug 2016 21:47:55 +0100
Message-ID: <1470775675-23283-1-git-send-email-andrew@adoakley.name>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Oakley <andrew-cyX/yU1dXXmLwutG50LtGA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Andrew Oakley <andrew-cyX/yU1dXXmLwutG50LtGA@public.gmane.org>

This appears to be a typo in the requirements, the correct version is
200112L.  See 8737be806407be51f046b358d8824c4c968912de in glibc.

Signed-off-by: Andrew Oakley <andrew-cyX/yU1dXXmLwutG50LtGA@public.gmane.org>
---
 man3/getaddrinfo.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 7dde559..d308864 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -69,7 +69,7 @@ Feature Test Macro Requirements for glibc (see
 .BR getaddrinfo (),
 .BR freeaddrinfo (),
 .BR gai_strerror ():
-    Since glibc 2.22: _POSIX_C_SOURCE >= 201112L
+    Since glibc 2.22: _POSIX_C_SOURCE >= 200112L
     Glibc 2.21 and earlier: _POSIX_C_SOURCE
 .ad b
 .SH DESCRIPTION
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
