From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 16/24] rtime.3: Replace header
Date: Wed, 21 May 2014 16:57:47 +0200
Message-ID: <1400684275-20972-17-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The header <rpc/des_crypt.h> does not provide rtime();
<rpc/auth_des.h> does, as is also implied in both the NOTES and
EXAMPLE sections.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/rtime.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/rtime.3 b/man3/rtime.3
index 2471db0..c6324a4 100644
--- a/man3/rtime.3
+++ b/man3/rtime.3
@@ -14,7 +14,7 @@
 rtime \- get time from a remote machine
 .SH SYNOPSIS
 .nf
-.B "#include <rpc/des_crypt.h>"
+.B "#include <rpc/auth_des.h>"
 .sp
 .BI "int rtime(struct sockaddr_in *" addrp ", struct rpc_timeval *" timep ,
 .BI "          struct rpc_timeval *" timeout );
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
