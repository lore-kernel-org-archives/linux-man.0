From: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Subject: [PATCH] getgroups.2: FTM requirements fix for setgroups(2)
Date: Sat, 12 Nov 2016 14:07:12 +0000
Message-ID: <1478959632-47079-1-git-send-email-andrew@digital-domain.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This fix's commit 51c612f (... Update FTM requirements
(_DEFAULT_SOURCE))

This commit updated numerous pages for the _SVID_SOURCE & _BSD_SOURCE
deprecations and the new use of _DEFAULT_SOURCE.

However during this conversion for setgroups(2) _BSD_SOURCE got replaced
by _SVID_SOURCE under the 'Glibc 2.19 and earlier:' heading.

Put it back to _BSD_SOURCE. This was confirmed by building under a Glibc
2.17 system and using _SVID_SOURCE resulted in a

    warning: implicit declaration of function ‘setgroups’ [-Wimplicit-function-declaration]

message. Using _BSD_SOURCE gives a clean compile.

Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
---
 man2/getgroups.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/getgroups.2 b/man2/getgroups.2
index bd9d7f4..16e9864 100644
--- a/man2/getgroups.2
+++ b/man2/getgroups.2
@@ -52,7 +52,7 @@ Feature Test Macro Requirements for glibc (see
     Since glibc 2.19:
         _DEFAULT_SOURCE
     Glibc 2.19 and earlier:
-        _SVID_SOURCE
+        _BSD_SOURCE
 .SH DESCRIPTION
 .PP
 .BR getgroups ()
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
