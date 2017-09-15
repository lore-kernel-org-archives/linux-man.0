From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ldconfig.8: ffix
Date: Fri, 15 Sep 2017 18:45:53 +0200
Message-ID: <20170915164553.3911-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man8/ldconfig.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/ldconfig.8 b/man8/ldconfig.8
index d4e240282..9d9f5d2e3 100644
--- a/man8/ldconfig.8
+++ b/man8/ldconfig.8
@@ -146,7 +146,7 @@ is also specified, links are still updated.
 Print the lists of directories and candidate libraries stored in
 the current cache.
 .TP
-.BI "\-r  " root
+.BI "\-r " root
 Change to and use
 .I root
 as the root directory.
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
