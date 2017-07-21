From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] Changes.old: tfix
Date: Fri, 21 Jul 2017 21:04:06 +0200
Message-ID: <20170721190406.2658-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 Changes.old | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Changes.old b/Changes.old
index 45b5dbafc..445ccf6ab 100644
--- a/Changes.old
+++ b/Changes.old
@@ -45584,7 +45584,7 @@ sigaltstack.2
     Michael Kerrisk
         Note buggy addition of ss.ss_flags==SS_ONSTACK
             Note buggy addition of ss.ss_flags==SS_ONSTACK as a synonym
-            for ss_flags==0. No other implemenation does this, AFAIK.
+            for ss_flags==0. No other implementation does this, AFAIK.
             And it was not needed :-(.
     Michael Kerrisk
         Specifying 'ss' returns the current settings without changing them
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
