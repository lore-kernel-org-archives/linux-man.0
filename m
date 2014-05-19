From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 10/20] inet_net_pton.3: srcfix, cfix
Date: Tue, 20 May 2014 01:02:16 +0200
Message-ID: <1400540546-25578-11-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Use a consistent style throughout the man-pages.
---
 man3/inet_net_pton.3 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/man3/inet_net_pton.3 b/man3/inet_net_pton.3
index 8276012..340a849 100644
--- a/man3/inet_net_pton.3
+++ b/man3/inet_net_pton.3
@@ -37,8 +37,7 @@ inet_net_pton, inet_net_ntop \- Internet network number conversion
 .BI "                    char *" pres ", size_t " psize );
 .fi
 .sp
-Link with
-.IR \-lresolv .
+Link with \fI\-lresolv\fP.
 .sp
 .in -4n
 Feature Test Macro Requirements for glibc (see
@@ -331,7 +330,7 @@ Raw address:              c1a80180
 .in
 .SS Program source
 .nf
-/* Link with -lresolv */
+/* Link with "\-lresolv" */
 
 #include <arpa/inet.h>
 #include <stdio.h>
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
