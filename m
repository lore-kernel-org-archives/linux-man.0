From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] cp1251.7: tfix
Date: Sat, 12 Jul 2014 14:08:59 +0400
Message-ID: <1405159739-3067-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/cp1251.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/cp1251.7 b/man7/cp1251.7
index bfc9adb..de89469 100644
--- a/man7/cp1251.7
+++ b/man7/cp1251.7
@@ -113,7 +113,7 @@ _
 304	196	C4	=D0=94	CYRILLIC CAPITAL LETTER DE
 305	197	C5	=D0=95	CYRILLIC CAPITAL LETTER IE
 306	198	C6	=D0=96	CYRILLIC CAPITAL LETTER ZHE
-307	199	C7	v	CYRILLIC CAPITAL LETTER ZE
+307	199	C7	=D0=97	CYRILLIC CAPITAL LETTER ZE
 310	200	C8	=D0=98	CYRILLIC CAPITAL LETTER I
 311	201	C9	=D0=99	CYRILLIC CAPITAL LETTER SHORT I
 312	202	CA	=D0=9A	CYRILLIC CAPITAL LETTER KA
--=20
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
