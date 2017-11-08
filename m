From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] strverscmp.c: tfix
Date: Wed, 8 Nov 2017 16:21:05 +0900
Message-ID: <22d10c60-33e7-a4ef-4130-b2e76d0da56b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 man3/strverscmp.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/strverscmp.3 b/man3/strverscmp.3
index a19a94421..720159159 100644
--- a/man3/strverscmp.3
+++ b/man3/strverscmp.3
@@ -121,7 +121,7 @@ An example of its use is the following:
 .PP
 .in +4n
 .EX
-$ i\fB./a.out jan1 jan10\fP
+$ \fB./a.out jan1 jan10\fP
 jan1 < jan10
 .EE
 .in
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
