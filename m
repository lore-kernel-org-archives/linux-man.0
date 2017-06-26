From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ttyslot.3: tfix
Date: Mon, 26 Jun 2017 18:22:54 +0200
Message-ID: <20170626162254.2762-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/ttyslot.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/ttyslot.3 b/man3/ttyslot.3
index d82bb718e..a73349a02 100644
--- a/man3/ttyslot.3
+++ b/man3/ttyslot.3
@@ -159,7 +159,7 @@ On BSD-like systems and Linux, the declaration of
 .BR ttyslot ()
 is provided by
 .IR <unistd.h> .
-On Systsem V-like systems, the declaration is provided by
+On System V-like systems, the declaration is provided by
 .IR <stdlib.h> .
 Since glibc 2.24,
 .IR <stdlib.h>
-- 
2.13.1.518.g3df882009

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
