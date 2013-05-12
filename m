From: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] alloca.3: correct information on getting non-inlined version with gcc+glibc
Date: Sun, 12 May 2013 14:26:07 +0300
Message-ID: <1368357967-8813-1-git-send-email-bunk@kernel.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

- remove the incorrect information that -fno-builtin would help
- add -std=c11 to the list of strict options
- emphasize more that both the gcc option and not including
  alloca.h are needed
- add the #ifdef from the glibc alloca.h to make the situation clearer

Signed-off-by: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 man3/alloca.3 |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/man3/alloca.3 b/man3/alloca.3
index 73b88f5..0d593ed 100644
--- a/man3/alloca.3
+++ b/man3/alloca.3
@@ -40,7 +40,7 @@
 .\"     Various rewrites and additions (notes on longjmp() and SIGSEGV).
 .\"     Weaken warning against use of alloca() (as per Debian bug 461100).
 .\"
-.TH ALLOCA 3 2008-01-24 "GNU" "Linux Programmer's Manual"
+.TH ALLOCA 3 2013-05-12 "GNU" "Linux Programmer's Manual"
 .SH NAME
 alloca \- allocate memory that is automatically freed
 .SH SYNOPSIS
@@ -110,20 +110,22 @@ This is not done when either the
 .IR "\-std=c89" ,
 .IR "\-std=c99" ,
 or the
-.IR "\-fno\-builtin"
+.IR "\-std=c11"
 option is given
-(and the header
+.BR and
+the header
 .I <alloca.h>
-is not included).
-But beware!
-By default the glibc version of
+is not included.
+Otherwise (without an \-ansi or \-std=c* option) the glibc version of
 .I <stdlib.h>
 includes
 .I <alloca.h>
-and that contains the line:
+and that contains the lines:
 .nf
 
+    #ifdef  __GNUC__
     #define alloca(size)   __builtin_alloca (size)
+    #endif
 
 .fi
 with messy consequences if one has a private version of this function.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
