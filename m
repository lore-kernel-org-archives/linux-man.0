From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] iconv.1: tfix
Date: Wed, 25 Jan 2017 16:58:45 +0100
Message-ID: <20170125155846.4908-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Escape hyphens in option names and pathnames.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man1/iconv.1 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/man1/iconv.1 b/man1/iconv.1
index 92542a5e3..8c7e2447d 100644
--- a/man1/iconv.1
+++ b/man1/iconv.1
@@ -29,8 +29,8 @@ iconv \- convert text from one character encoding to another
 .SH SYNOPSIS
 .B iconv
 .RI [ options ]
-.RI "[-f " from-encoding "]"
-.RI "[-t " to-encoding "]"
+.RI "[\-f " from-encoding "]"
+.RI "[\-t " to-encoding "]"
 .RI [ inputfile ]...
 .SH DESCRIPTION
 The
@@ -55,12 +55,12 @@ from the current locale's character
 encoding.
 .SH OPTIONS
 .TP
-.BI \-f " from-encoding" ", \-\-from-code=" from-encoding
+.BI \-f " from-encoding" ", \-\-from\-code=" from-encoding
 Use
 .I from-encoding
 for input characters.
 .TP
-.BI \-t " to-encoding" ", \-\-to-code=" to-encoding
+.BI \-t " to-encoding" ", \-\-to\-code=" to-encoding
 Use
 .I to-encoding
 for output characters.
@@ -171,10 +171,10 @@ directories.
 .I /usr/lib/gconv
 Usual default gconv module path.
 .TP
-.I /usr/lib/gconv/gconv-modules
+.I /usr/lib/gconv/gconv\-modules
 Usual system default gconv module configuration file.
 .TP
-.I /usr/lib/gconv/gconv-modules.cache
+.I /usr/lib/gconv/gconv\-modules.cache
 Usual system gconv module configuration cache.
 .SH CONFORMING TO
 POSIX.1-2001.
@@ -183,7 +183,7 @@ Convert text from the ISO 8859-15 character encoding to UTF-8:
 
 .in +4n
 .nf
-$ \fBiconv \-f ISO\-8859\-15 -t UTF\-8 < input.txt > output.txt\fP
+$ \fBiconv \-f ISO\-8859\-15 \-t UTF\-8 < input.txt > output.txt\fP
 .fi
 .in
 .PP
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
