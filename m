From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] mbsrtowcs, mbsnrtowcs: wfix
Date: Fri, 14 Oct 2011 21:16:26 -0400
Message-ID: <1318641386-24095-1-git-send-email-taffit@debian.org>
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
 man3/mbsnrtowcs.3 |    2 +-
 man3/mbsrtowcs.3  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/mbsnrtowcs.3 b/man3/mbsnrtowcs.3
index bbd1d71..9a7a5bf 100644
--- a/man3/mbsnrtowcs.3
+++ b/man3/mbsnrtowcs.3
@@ -80,7 +80,7 @@ next multibyte sequence to be converted, and the numb=
er of wide characters
 written to \fIdest\fP is returned.
 .IP 3.
 The multibyte string has been completely converted, including the
-terminating null wide character (\(aq\\0\(aq)
+terminating wide character (\(aq\\0\(aq)
 (which has the side effect of bringing back \fI*ps\fP to the
 initial state).
 In this case \fI*src\fP is set to NULL, and the number of wide
diff --git a/man3/mbsrtowcs.3 b/man3/mbsrtowcs.3
index fcf47ca..fc8c802 100644
--- a/man3/mbsrtowcs.3
+++ b/man3/mbsrtowcs.3
@@ -51,7 +51,7 @@ multibyte sequence to be converted,
 and the number of wide characters written to \fIdest\fP is returned.
 .IP 3.
 The multibyte string has been completely converted, including the
-terminating null wide character (\(aq\\0\(aq), which has the side
+terminating null character (\(aq\\0\(aq), which has the side
 effect of bringing back \fI*ps\fP to the
 initial state.
 In this case \fI*src\fP is set to NULL, and the number of wide
--=20
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
