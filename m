From: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] rint.3: Document that halfway cases are rounded to even.
Date: Thu, 12 Mar 2015 17:43:36 -0700
Message-ID: <1426207416-7539-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Per IEEE-754 rounding rules.

The round(3) page describes the behavior of rint and nearbyint in the
halfway cases by saying:

   These functions round x to the nearest integer, but round halfway
   cases away from zero [...], instead of to the nearest even integer
   like rint(3)

Signed-off-by: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/rint.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/rint.3 b/man3/rint.3
index d1bd302..06724e3 100644
--- a/man3/rint.3
+++ b/man3/rint.3
@@ -92,7 +92,7 @@ and
 functions round their argument to an integer value in floating-point
 format, using the current rounding direction (see
 .BR fesetround (3))
-and without raising the
+and round halfway cases to the nearest even integer, without raising the
 .I inexact
 exception.
 .LP
-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
