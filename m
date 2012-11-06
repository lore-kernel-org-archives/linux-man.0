From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] init_module.2: ffix
Date: Tue,  6 Nov 2012 10:15:48 -0400
Message-ID: <1352211348-13619-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/init_module.2 |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/man2/init_module.2 b/man2/init_module.2
index a924ec4..eab48ec 100644
--- a/man2/init_module.2
+++ b/man2/init_module.2
@@ -62,13 +62,20 @@ The kernel parses this string and initializes the specified
 parameters.
 Each of the parameter specifications has the form:
 
-.RI "        " name [ =value [ ,value ...]]
+.RI "        " name [\c
+.BI = value\c
+.RB [ ,\c
+.IR value ...]]
 
-The parameter name is one of those defined within the module using
+The parameter
+.I name
+is one of those defined within the module using
 .IR module_param ()
 (see the Linux kernel source file
 .IR include/linux/moduleparam.h ).
-The parameter value is optional in the case of
+The parameter
+.I value
+is optional in the case of
 .I bool
 and
 .I invbool
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
