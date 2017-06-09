From: Quentin Rameau <quinq-UlqG2OPX9a0ue8ZPuPpd/Q@public.gmane.org>
Subject: [PATCH] getaddrinfo.3: Fix _POSIX_C_SOURCE value for getaddrinfo()
Date: Sat, 10 Jun 2017 01:00:20 +0200
Message-ID: <20170609230020.GA62868@alpha.fifth.space>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The correct _POSIX_C_SOURCE value is 200112L, not 201112L in features.h.
---
 man3/getaddrinfo.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index f058e5a80..2f89c099b 100644
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
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
