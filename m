From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 07/10] Fix prototype for mbind(2)
Date: Wed, 30 Apr 2014 21:42:39 +0200
Message-ID: <1398886962-10633-8-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The nmask argument is const. The return type in numaif.h is long.

---
Well, at least <numaif.h> says nmask is const. The current kernel does
not define it as a const argument, but sys_mbind() only passes it to
get_nodes(), which does treat it as const.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/mbind.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/mbind.2 b/man2/mbind.2
index 2a690e6..6cff10a 100644
--- a/man2/mbind.2
+++ b/man2/mbind.2
@@ -49,9 +49,9 @@ mbind \- set memory policy for a memory range
 .nf
 .B "#include <numaif.h>"
 .sp
-.BI "int mbind(void *" addr ", unsigned long " len  ", int " mode ,
-.BI "          unsigned long *" nodemask  ", unsigned long " maxnode ,
-.BI "          unsigned " flags );
+.BI "long mbind(void *" addr ", unsigned long " len  ", int " mode ,
+.BI "           const unsigned long *" nodemask  ", unsigned long " maxnode ,
+.BI "           unsigned " flags );
 .sp
 Link with \fI\-lnuma\fP.
 .fi
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
