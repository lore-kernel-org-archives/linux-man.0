From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] mallopt.3: ffix
Date: Fri, 23 Mar 2012 17:49:55 -0400
Message-ID: <1332539395-4867-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Author: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/mallopt.3 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/mallopt.3 b/man3/mallopt.3
index bab7dd0..f8848ab 100644
--- a/man3/mallopt.3
+++ b/man3/mallopt.3
@@ -483,9 +483,9 @@ $ \fB./a.out\fP
 /lib/libc.so.6(+0x6c501)[0x523501]
 /lib/libc.so.6(+0x6dd70)[0x524d70]
 /lib/libc.so.6(cfree+0x6d)[0x527e5d]
-./a.out[0x80485db]
+\&./a.out[0x80485db]
 /lib/libc.so.6(__libc_start_main+0xe7)[0x4cdce7]
-./a.out[0x8048471]
+\&./a.out[0x8048471]
 ======= Memory map: ========
 001e4000\-001fe000 r\-xp 00000000 08:06 1083555    /lib/libgcc_s.so.1
 001fe000\-001ff000 r\-\-p 00019000 08:06 1083555    /lib/libgcc_s.so.1
-- 
1.7.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
