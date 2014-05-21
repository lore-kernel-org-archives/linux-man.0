From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 24/24] xdr.3: tfix
Date: Wed, 21 May 2014 16:57:55 +0200
Message-ID: <1400684275-20972-25-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/xdr.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/xdr.3 b/man3/xdr.3
index 463f8e8..8f931db 100644
--- a/man3/xdr.3
+++ b/man3/xdr.3
@@ -26,7 +26,7 @@ and make use of the following types:
 
 .BI "typedef int " bool_t ;
 
-.BI "typedef bool_t (*" xdrproc_ti ") (XDR *, void *,...);"
+.BI "typedef bool_t (*" xdrproc_t ") (XDR *, void *,...);"
 .fi
 .in
 .LP
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
