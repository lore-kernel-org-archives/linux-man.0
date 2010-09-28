From: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Subject: [patch] nl_langinfo.3: better explaination
Date: Tue, 28 Sep 2010 13:45:36 +0200
Message-ID: <E1P0Ycq-0004ph-WB@fangorn.moria.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

it could be more clear that nl_langinfo() interacts with setlocale().
I made a patch against 3.27 and added a short example to query the
terminal character set.

Michael
----------------------------------------------------------------------
--- ./nl_langinfo.3.orig	2010-09-28 13:14:39.000000000 +0200
+++ ./nl_langinfo.3	2010-09-28 13:33:26.000000000 +0200
@@ -10,8 +10,9 @@
 .\"   OpenGroup's Single Unix specification http://www.UNIX-systems.org/online.html
 .\"
 .\" Corrected prototype, 2002-10-18, aeb
+.\" Modified 2010-09-28 by Michael Haardt
 .\"
-.TH NL_LANGINFO 3  2001-05-11 "GNU" "Linux Programmer's Manual"
+.TH NL_LANGINFO 3 "GNU" "Linux Programmer's Manual"
 .SH NAME
 nl_langinfo \- query language and locale information
 .SH SYNOPSIS
@@ -97,7 +98,9 @@
 For a more detailed list, consult
 .IR "The GNU C Library Reference Manual" .
 .SH "RETURN VALUE"
-If no locale has been selected for the appropriate category,
+If no locale has been selected by
+.BR setlocale ()
+for the appropriate category,
 .BR nl_langinfo ()
 returns a pointer to the corresponding string in the
 "C" locale.
@@ -109,6 +112,23 @@
 .BR nl_langinfo ()
 or
 .BR setlocale (3).
+.SH "EXAMPLE"
+This program sets the character type locale according to the
+environment and queries the terminal character set.
+.LP
+.nf
+#include <langinfo.h>
+#include <locale.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+int main(int argc, char *argv[])
+{
+  setlocale(LC_CTYPE,"");
+  printf("%s\\n",nl_langinfo(CODESET));
+  exit(EXIT_SUCCESS);
+}
+.fi
 .SH "CONFORMING TO"
 SUSv2, POSIX.1-2001.
 .SH "SEE ALSO"
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
