From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 09/10] Fix prototype for set_mempolicy(2)
Date: Wed, 30 Apr 2014 21:42:41 +0200
Message-ID: <1398886962-10633-10-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The nodemask argument is const, and the return type is long.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/set_mempolicy.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/set_mempolicy.2 b/man2/set_mempolicy.2
index 843208c..b17cf30 100644
--- a/man2/set_mempolicy.2
+++ b/man2/set_mempolicy.2
@@ -31,8 +31,8 @@ set_mempolicy \- set default NUMA memory policy for a process and its children
 .nf
 .B "#include <numaif.h>"
 .sp
-.BI "int set_mempolicy(int " mode ", unsigned long *" nodemask ,
-.BI "                  unsigned long " maxnode );
+.BI "long set_mempolicy(int " mode ", const unsigned long *" nodemask ,
+.BI "                   unsigned long " maxnode );
 .sp
 Link with \fI\-lnuma\fP.
 .fi
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
