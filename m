From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] init_module.2: ffix
Date: Wed, 30 Jan 2013 17:31:25 -0400
Message-ID: <1359581485-3062-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/init_module.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/init_module.2 b/man2/init_module.2
index 5b884b3..2215aac 100644
--- a/man2/init_module.2
+++ b/man2/init_module.2
@@ -31,7 +31,7 @@ init_module, finit_module \- load a kernel module
 .BI "                const char *" param_values );
 
 .BI "int finit_module(int " fd ", const char *" param_values ,
-.BI "                 int flags );
+.BI "                 int " flags );
 .fi
 
 .IR Note :
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
