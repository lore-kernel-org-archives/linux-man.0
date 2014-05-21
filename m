From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 06/24] perror.3: Fix declaration
Date: Wed, 21 May 2014 16:57:37 +0200
Message-ID: <1400684275-20972-7-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The elements of the array sys_errlist are also const.

Also, it is probably not desirable to pretend that errno.h defines
errno in the traditional way (errno(3) correctly contains an explicit
warning against this). I don't know what the best solution is, though.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/perror.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/perror.3 b/man3/perror.3
index 57580a9..34f3ec5 100644
--- a/man3/perror.3
+++ b/man3/perror.3
@@ -38,11 +38,11 @@ perror \- print a system error message
 .sp
 .B #include <errno.h>
 .sp
-.BI "const char *" sys_errlist [];
+.BI "const char * const " sys_errlist [];
 .br
 .BI "int " sys_nerr ;
 .br
-.BI "int " errno ;
+.BI "int " errno "; /* Not really declared this way; see errno(3). */"
 .sp
 .in -4n
 Feature Test Macro Requirements for glibc (see
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
