From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 1/4] getdate.3: Use blank definition of _GNU_SOURCE
Date: Wed,  4 Jun 2014 18:33:25 +0200
Message-ID: <1401899608-30515-2-git-send-email-rv@rasmusvillemoes.dk>
References: <1401899608-30515-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401899608-30515-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Only the definedness of _GNU_SOURCE matters, so eliminate a possible
source of confusion by not using a specific replacement text in the
example program.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---

Notes:
    Or maybe the intention was to define _XOPEN_SOURCE to the value 500,
    since that is the minimal requirement for getdate(), and getdate_r()
    is not used in the example.

 man3/getdate.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getdate.3 b/man3/getdate.3
index f286f98..df882b9 100644
--- a/man3/getdate.3
+++ b/man3/getdate.3
@@ -272,7 +272,7 @@ Call 3 ("12:22:33") succeeded:
 .SS Program source
 \&
 .nf
-#define _GNU_SOURCE 500
+#define _GNU_SOURCE
 #include <time.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
