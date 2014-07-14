From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] charsets.7: Tidy up list
Date: Sun, 13 Jul 2014 23:19:13 -0400
Message-ID: <1405307953-24884-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Remove German from main list as Dutch and French were.
---
 man7/charsets.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/charsets.7 b/man7/charsets.7
index 300d819..45d18ce 100644
--- a/man7/charsets.7
+++ b/man7/charsets.7
@@ -68,7 +68,7 @@ Here are brief descriptions of each set:
 .TP
 8859-1 (Latin-1)
 Latin-1 covers many West European languages such as Albanian, Basque,
-Danish, English, Faroese, Galician, German, Icelandic, Irish, Italian,
+Danish, English, Faroese, Galician, Icelandic, Irish, Italian,
 Norwegian, Portuguese, Spanish, and Swedish.
 The lack of the ligatures Dutch =C4=B2/=C4=B3, French =C5=93, and old-=
style =E2=80=9EGerman=E2=80=9C
 quotation marks was considered tolerable.
--=20
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
