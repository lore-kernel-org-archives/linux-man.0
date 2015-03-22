From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] resolver.3: More information about RES_INSECURE1 and RES_INSECURE2 option in debug mode
Date: Sun, 22 Mar 2015 21:50:08 +0100
Message-ID: <1427057408-5001-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Asked by Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man3/resolver.3 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man3/resolver.3 b/man3/resolver.3
index 4a1c97d..a070c57 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -240,12 +240,18 @@ This option is used by
 [Enabled by default].
 .TP
 .B RES_INSECURE1
-Accept a response from a wrong server and show it on standard output
-(for debug purpose only).
+Accept a response from a wrong server.
+Potential security hazard could be detected here,
+but you need to compile glibc with debugging enabled and use
+.B RES_DEBUG
+option (for debug purpose only).
 .TP
 .B RES_INSECURE2
-Accept a response which contains a wrong query and show it on standard
-output (for debug purpose only).
+Accept a response which contains a wrong query.
+Potential security hazard could be detected here,
+but you need to compile glibc with debugging enabled and use
+.B RES_DEBUG
+option (for debug purpose only).
 .TP
 .B RES_NOALIASES
 Disable usage of
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
