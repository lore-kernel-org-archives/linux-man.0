From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 08/20] bstring.3: Fix prototypes
Date: Tue, 20 May 2014 01:02:14 +0200
Message-ID: <1400540546-25578-9-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The length parameter n has type size_t in bcmp(), bcopy() and bzero().
---
 man3/bstring.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/bstring.3 b/man3/bstring.3
index 451e6a1..70a6535 100644
--- a/man3/bstring.3
+++ b/man3/bstring.3
@@ -37,11 +37,11 @@ memmove, memset \- byte string operations
 .nf
 .B #include <string.h>
 .sp
-.BI "int bcmp(const void *" s1 ", const void *" s2 ", int " n );
+.BI "int bcmp(const void *" s1 ", const void *" s2 ", size_t " n );
 .sp
-.BI "void bcopy(const void *" src ", void *" dest ", int " n );
+.BI "void bcopy(const void *" src ", void *" dest ", size_t " n );
 .sp
-.BI "void bzero(void *" s ", int " n );
+.BI "void bzero(void *" s ", size_t " n );
 .sp
 .BI "void *memccpy(void *" dest ", const void *" src ", int " c ", size_t " n );
 .sp
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
