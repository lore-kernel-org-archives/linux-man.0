From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 07/24] pthread_sigqueue.3: Include needed header
Date: Wed, 21 May 2014 16:57:38 +0200
Message-ID: <1400684275-20972-8-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

One needs to #include <signal.h> to get a declaration of
pthread_sigqueue.

Also, abbreviate the FTM needed to expose it.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/pthread_sigqueue.3 | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/man3/pthread_sigqueue.3 b/man3/pthread_sigqueue.3
index 84611ef..8ad0b63 100644
--- a/man3/pthread_sigqueue.3
+++ b/man3/pthread_sigqueue.3
@@ -27,21 +27,15 @@
 pthread_sigqueue \- queue a signal and data to a thread
 .SH SYNOPSIS
 .nf
+.BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <pthread.h>
+.B #include <signal.h>
 
 .BI "int pthread_sigqueue(pthread_t " thread ", int " sig ,
 .BI "                     const union sigval " value );
-.fi
 .sp
 Compile and link with \fI\-pthread\fP.
-.sp
-.in -4n
-Feature Test Macro Requirements for glibc (see
-.BR feature_test_macros (7)):
-.in
-.sp
-.BR pthread_sigqueue ():
-_GNU_SOURCE
+.fi
 .SH DESCRIPTION
 The
 .BR pthread_sigqueue ()
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
