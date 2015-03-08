From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] resolv.conf.5: tfix
Date: Sun,  8 Mar 2015 13:18:35 +0100
Message-ID: <1425817115-2617-1-git-send-email-saulery@free.fr>
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
 man5/resolv.conf.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 1777c8a..f01bf57 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -203,7 +203,7 @@ sets
 .BR RES_USE_INET6
 in
 .IR _res.options .
-This has the effect of trying a AAAA query before an A query inside th=
e
+This has the effect of trying an AAAA query before an A query inside t=
he
 .BR gethostbyname (3)
 function, and of mapping IPv4 responses in IPv6 "tunneled form"
 if no AAAA records are found but an A record set exists.
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
