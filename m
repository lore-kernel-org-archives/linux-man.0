From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 14/20] gcvt.3: fix prototype
Date: Tue, 20 May 2014 01:02:20 +0200
Message-ID: <1400540546-25578-15-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The ndigit paramenter to gcvt() has type int.
---
 man3/gcvt.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/gcvt.3 b/man3/gcvt.3
index 2d7049b..77d910a 100644
--- a/man3/gcvt.3
+++ b/man3/gcvt.3
@@ -34,7 +34,7 @@ gcvt \- convert a floating-point number to a string
 .nf
 .B #include <stdlib.h>
 .sp
-.BI "char *gcvt(double " number ", size_t " ndigit ", char *" buf );
+.BI "char *gcvt(double " number ", int " ndigit ", char *" buf );
 .fi
 .sp
 .in -4n
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
