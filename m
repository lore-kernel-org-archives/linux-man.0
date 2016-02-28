From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] capabilities.7: spfix
Date: Mon, 29 Feb 2016 00:40:56 +0100
Message-ID: <1456702856-6077-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Fix capitalization in the reference to section "Effect of user ID
changes on capabilities".

Capitalization of the section name was changed in
c634028ab5768a042196fd71a38088499b21de12, but the reference remained
unchanged.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/capabilities.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 26de609..b4824ba 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -1096,7 +1096,7 @@ Setting this flag stops the kernel from adjusting capability sets when
 the thread's effective and filesystem UIDs are switched between
 zero and nonzero values.
 (See the subsection
-.IR "Effect of User ID Changes on Capabilities" .)
+.IR "Effect of user ID changes on capabilities" .)
 .TP
 .B SECBIT_NOROOT
 If this bit is set, then the kernel does not grant capabilities
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
