From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] resolver.3: RES_IGNTC is implemented
Date: Tue, 10 Mar 2015 23:52:58 +0100
Message-ID: <1426027978-2703-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man3/resolver.3 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man3/resolver.3 b/man3/resolver.3
index 06704b1..4a1c97d 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -210,7 +210,6 @@ Query primary domain name server only.
 .B RES_IGNTC
 Ignore truncation errors.
 Don't retry with TCP.
-[Not currently implemented].
 .TP
 .B RES_RECURSE
 Set the recursion desired bit in queries.
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
