From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] localedef.1: tfix
Date: Tue, 10 Jun 2014 21:39:20 +0400
Message-ID: <1402421960-4140-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man1/localedef.1 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man1/localedef.1 b/man1/localedef.1
index a3baca1..493cd5c 100644
--- a/man1/localedef.1
+++ b/man1/localedef.1
@@ -293,7 +293,7 @@ Usual default repertoire map path.
 Usual default locale archive location.
 .TP
 .I outputpath/LC_ADDRESS
-An output file that contains contains information about formatting of
+An output file that contains information about formatting of
 addresses and geography-related items.
 .TP
 .I outputpath/LC_COLLATE
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
