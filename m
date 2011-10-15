From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] wcrtomb.3: ffix
Date: Fri, 14 Oct 2011 21:24:51 -0400
Message-ID: <1318641891-6313-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Signed-off-by: David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 man3/wcrtomb.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/wcrtomb.3 b/man3/wcrtomb.3
index 4a80705..0727fbc 100644
--- a/man3/wcrtomb.3
+++ b/man3/wcrtomb.3
@@ -36,7 +36,7 @@ that is, the number of bytes
 written at \fIs\fP.
 .PP
 A different case is when \fIs\fP is not NULL,
- but \fIwc\fP is a null wide character (L\(aq\\0\(aq).
+but \fIwc\fP is a null wide character (L\(aq\\0\(aq).
 In this
 case the
 .BR wcrtomb ()
--=20
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
