From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 09/24] pthread_cleanup_push_defer_np.3: Mention feature test macro
Date: Wed, 21 May 2014 16:57:40 +0200
Message-ID: <1400684275-20972-10-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

One must define _GNU_SOURCE to get pthread_cleanup_push_defer_np and
pthread_cleanup_pop_restore_np.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/pthread_cleanup_push_defer_np.3 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man3/pthread_cleanup_push_defer_np.3 b/man3/pthread_cleanup_push_defer_np.3
index 3538dc2..abc8bf8 100644
--- a/man3/pthread_cleanup_push_defer_np.3
+++ b/man3/pthread_cleanup_push_defer_np.3
@@ -29,6 +29,7 @@ pthread_cleanup_push_defer_np, pthread_cleanup_pop_restore_np \- push and pop
 thread cancellation clean-up handlers while saving cancelability type
 .SH SYNOPSIS
 .nf
+.BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <pthread.h>
 
 .BI "void pthread_cleanup_push_defer_np(void (*" routine ")(void *),"
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
