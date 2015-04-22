From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 2/3] resolv.conf.5: ffix
Date: Wed, 22 Apr 2015 02:21:10 +0200
Message-ID: <1429662071-23797-2-git-send-email-saulery@free.fr>
References: <1429662071-23797-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429662071-23797-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, saulery-GANU6spQydw@public.gmane.org
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/resolv.conf.5 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 7b6804a..ac43184 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -263,7 +263,9 @@ so that if two requests from the same port are not =
handled correctly it will
 close the socket and open a new one before sending the second request.
 .TP
 .BR no-tld-query " (since glibc 2.14)"
-sets RES_NOTLDQUERY in
+sets
+.BR RES_NOTLDQUERY
+in
 .IR _res.options .
 This option causes
 .BR res_nsearch ()
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
