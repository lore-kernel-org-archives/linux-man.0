From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] scanf(3): update %a vs %m documentation
Date: Wed, 30 Jan 2013 22:40:00 -0500
Message-ID: <1359603600-16294-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

POSIX.1-2008 adopted the m flag for dynamic allocation.  Update the scanf
spec to cover it and relegate the glibc-specific a flag to the NOTES.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/scanf.3 | 91 ++++++++++++++++++++++++++++--------------------------------
 1 file changed, 42 insertions(+), 49 deletions(-)

diff --git a/man3/scanf.3 b/man3/scanf.3
index 1e6f32d..b8985a3 100644
--- a/man3/scanf.3
+++ b/man3/scanf.3
@@ -47,7 +47,7 @@
 .\"     Add ERRORS section.
 .\"     Document the 'a' and 'm' modifiers for dynamic string allocation.
 .\"
-.TH SCANF 3  2011-09-28 "GNU" "Linux Programmer's Manual"
+.TH SCANF 3  2013-01-30 "GNU" "Linux Programmer's Manual"
 .SH NAME
 scanf, fscanf, sscanf, vscanf, vsscanf, vfscanf \- input format conversion
 .SH SYNOPSIS
@@ -198,7 +198,7 @@ included in the count of successful assignments returned by
 .BR scanf ().
 .TP
 \(bu
-An optional \(aqa\(aq character.
+An optional \(aqm\(aq character.
 This is used with string conversions, and relieves the caller of the
 need to allocate a corresponding buffer to hold the input: instead,
 .BR scanf ()
@@ -211,9 +211,6 @@ variable (this variable does not need to be initialized before the call).
 The caller should subsequently
 .BR free (3)
 this buffer when it is no longer required.
-This is a GNU extension;
-C99 employs the \(aqa\(aq character as a conversion specifier (and
-it can also be used as such in the GNU implementation).
 .TP
 \(bu
 An optional decimal integer which specifies the
@@ -604,51 +601,13 @@ documentation of
 .I libc (glibc-1.08)
 for a more concise description.
 .SH NOTES
-The GNU C library supports a nonstandard extension that causes
-the library to dynamically allocate a string of sufficient size
-for input strings for the
-.B %s
-and
-\fB%a[\fP\fIrange\fP\fB]\fP
-conversion specifiers.
-.\" This feature seems to be present at least as far back as glibc 2.0.
-To make use of this feature, specify
+The GNU C library supported the dynamic allocation conversion specifier
+(as a nonstandard extension) via the
 .B a
-as a length modifier (thus
-.B %as
-or
-\fB%a[\fP\fIrange\fP\fB]\fP).
-The caller must
-.BR free (3)
-the returned string, as in the following example:
-.in +4n
-.nf
-
-char *p;
-int n;
-
-errno = 0;
-n = scanf("%a[a-z]", &p);
-if (n == 1) {
-    printf("read: %s\\n", p);
-    free(p);
-} else if (errno != 0) {
-    perror("scanf");
-} else {
-    fprintf(stderr, "No matching characters\\n");
-}
-.fi
-.in
+character.  This feature
+seems to be present at least as far back as glibc 2.0.
 .PP
-As shown in the above example, it is only necessary to call
-.BR free (3)
-if the
-.BR scanf ()
-call successfully read a string.
-.PP
-The
-.B a
-modifier is not available if the program is compiled with
+It is not available if the program is compiled with
 .I "gcc -std=c99"
 or
 .IR "gcc -D_ISOC99_SOURCE"
@@ -678,7 +637,41 @@ floating-point conversion specifier (and is unaffected by
 .IR "gcc -std=c99"
 etc.)
 .IP *
-It is specified in the upcoming revision of the POSIX.1 standard.
+It is specified in the POSIX.1-2008 standard.
+.SH EXAMPLE
+To use the dynamic allocation conversion specifier, specify
+.B m
+as a length modifier (thus
+.B %ms
+or
+\fB%m[\fP\fIrange\fP\fB]\fP).
+The caller must
+.BR free (3)
+the returned string, as in the following example:
+.in +4n
+.nf
+
+char *p;
+int n;
+
+errno = 0;
+n = scanf("%m[a-z]", &p);
+if (n == 1) {
+    printf("read: %s\\n", p);
+    free(p);
+} else if (errno != 0) {
+    perror("scanf");
+} else {
+    fprintf(stderr, "No matching characters\\n");
+}
+.fi
+.in
+.PP
+As shown in the above example, it is only necessary to call
+.BR free (3)
+if the
+.BR scanf ()
+call successfully read a string.
 .SH BUGS
 All functions are fully C89 conformant, but provide the
 additional specifiers
-- 
1.8.0.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
