From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 07/20] adjtime.3: add required header
Date: Tue, 20 May 2014 01:02:13 +0200
Message-ID: <1400540546-25578-8-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The prototype for adjtime(3) is declared in <sys/time.h>.
---
 man3/adjtime.3 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/man3/adjtime.3 b/man3/adjtime.3
index 878955b..aa2311f 100644
--- a/man3/adjtime.3
+++ b/man3/adjtime.3
@@ -27,6 +27,8 @@
 adjtime \- correct the time to synchronize the system clock
 .SH SYNOPSIS
 .nf
+.B #include <sys/time.h>
+.sp
 .BI "int adjtime(const struct timeval *" delta ", struct timeval *" olddelta );
 .fi
 .sp
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
