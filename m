From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] termios.3: 'ECHO' not 'IECHO'
Date: Mon, 23 Apr 2012 11:40:34 +0100
Message-ID: <4F9531A2.3060300@ubuntu.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080108050800020404020406"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------080108050800020404020406
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Kind regards,

James
--
James Hunt
____________________________________
http://upstart.ubuntu.com/cookbook
http://upstart.ubuntu.com/cookbook/upstart_cookbook.pdf

--------------080108050800020404020406
Content-Type: text/x-diff;
 name="0001-Typo-IECHO-should-be-ECHO.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Typo-IECHO-should-be-ECHO.patch"

>From 057ceb437f1600ceb4afcadf9c186291f268d274 Mon Sep 17 00:00:00 2001
From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Date: Mon, 23 Apr 2012 11:37:18 +0100
Subject: [PATCH] Typo: 'IECHO' should be 'ECHO'.

Signed-off-by: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
---
 man3/termios.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/termios.3 b/man3/termios.3
index dd16721..f768d1e 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -409,7 +409,7 @@ or
 .BR _SVID_SOURCE ]
 .TP
 .B ECHOPRT
-(not in POSIX) If \fBICANON\fP and \fBIECHO\fP are also set, characters
+(not in POSIX) If \fBICANON\fP and \fBECHO\fP are also set, characters
 are printed as they are being erased.
 [requires
 .B _BSD_SOURCE
-- 
1.7.9.5


--------------080108050800020404020406--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
