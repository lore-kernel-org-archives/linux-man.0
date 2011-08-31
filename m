From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] mkstemp.3, perror(3): minor fixes in SYNOPSIS
Date: Wed, 31 Aug 2011 23:53:35 +0900
Message-ID: <4E5E4AEF.5090508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: A whitespace was removed, and the formatting corrected.


diff --git a/man3/mkstemp.3 b/man3/mkstemp.3
--- a/man3/mkstemp.3
+++ b/man3/mkstemp.3
@@ -39,7 +39,7 @@ mkstemp, mkostemp \- create a unique temporary file
.sp
.BI "int mkstemp(char *" template );
.sp
-.BI "int mkostemp (char *" template ", int " flags );
+.BI "int mkostemp(char *" template ", int " flags );
.sp
.BI "int mkstemps(char *" template ", int " suffixlen );
.sp
diff --git a/man3/perror.3 b/man3/perror.3
--- a/man3/perror.3
+++ b/man3/perror.3
@@ -33,7 +33,7 @@ perror \- print a system error message
.SH SYNOPSIS
.B #include <stdio.h>
.sp
-.BI "void perror(const char " *s );
+.BI "void perror(const char *" s );
.sp
.B #include <errno.h>
.sp

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
