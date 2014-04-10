From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] duplocale.3: tfix
Date: Wed,  9 Apr 2014 21:16:46 -0400
Message-ID: <1397092606-11046-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/duplocale.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/duplocale.3 b/man3/duplocale.3
index bb54301..b9fad7a 100644
--- a/man3/duplocale.3
+++ b/man3/duplocale.3
@@ -123,7 +123,7 @@ and
 .BR duplocale ()
 to obtain a handle for the current locale which is then passed to
 .BR toupper_l (3).
-The program takes one command-liane argument,
+The program takes one command-line argument,
 a string of characters that is converted to uppercase and
 displayed on standard output.
 An example of its use is the following:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
