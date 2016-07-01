From: Quentin Rameau <quinq-UlqG2OPX9a0ue8ZPuPpd/Q@public.gmane.org>
Subject: [PATCH] mkstemp: fix _POSIX_C_SOURCE value for mkstemp()
Date: Fri, 1 Jul 2016 13:51:17 +0200
Message-ID: <20160701115117.GA25519@alpha.fifth.space>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The correct _POSIX_C_SOURCE value has always been 200809L, not 200112L
---
 man3/mkstemp.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/mkstemp.3 b/man3/mkstemp.3
index 8fcd608..d1d4805 100644
--- a/man3/mkstemp.3
+++ b/man3/mkstemp.3
@@ -59,7 +59,7 @@ Feature Test Macro Requirements for glibc (see
 .PD 0
 _XOPEN_SOURCE\ >=\ 500
 .\"    || _XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED
-    || /* Since glibc 2.12: */ _POSIX_C_SOURCE\ >=\ 200112L
+    || /* Since glibc 2.12: */ _POSIX_C_SOURCE\ >=\ 200809L
     || /* Glibc versions <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE
 .PD
 .RE
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
