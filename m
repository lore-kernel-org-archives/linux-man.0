From: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] rint.3: Document that halfway cases are rounded to even.
Date: Thu, 12 Mar 2015 18:43:27 -0700
Message-ID: <1426211007-9986-1-git-send-email-mattst88@gmail.com>
References: <CAEdQ38EGO7wONjO-3qBNm_aWMX+1WOj0xGrRvE81hTpG-xE79w@mail.gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEdQ38EGO7wONjO-3qBNm_aWMX+1WOj0xGrRvE81hTpG-xE79w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
 man3/rint.3 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man3/rint.3 b/man3/rint.3
index d1bd302..59402a7 100644
--- a/man3/rint.3
+++ b/man3/rint.3
@@ -94,7 +94,9 @@ format, using the current rounding direction (see
 .BR fesetround (3))
 and without raising the
 .I inexact
-exception.
+exception. When the current rounding direction is to nearest, these
+functions round halfway cases to the even integer in accordance with
+IEEE-754.
 .LP
 The
 .BR rint (),
-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
