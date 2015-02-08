From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] listxattr.2: provide example code
Date: Sun,  8 Feb 2015 17:22:08 +0100
Message-ID: <1423412528-11512-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Andreas Gruenbacher <a.gruenbacher-bdq14YP6qtRg9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The description of listxattr did not point out how that the array
of attributes itself is null-terminated.

The missing information has been added.

Furthermore example code is provided.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/listxattr.2 | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 139 insertions(+), 5 deletions(-)

diff --git a/man2/listxattr.2 b/man2/listxattr.2
index a67592f..05197c4 100644
--- a/man2/listxattr.2
+++ b/man2/listxattr.2
@@ -1,5 +1,6 @@
 .\" Copyright (C) Andreas Gruenbacher, February 2001
 .\" Copyright (C) Silicon Graphics Inc, September 2001
+.\" Copyright (C) 2015 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
 .\"
 .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
 .\" This is free documentation; you can redistribute it and/or
@@ -22,7 +23,7 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.TH LISTXATTR 2 2014-02-06 "Linux" "Linux Programmer's Manual"
+.TH LISTXATTR 2 2015-02-08 "Linux" "Linux Programmer's Manual"
 .SH NAME
 listxattr, llistxattr, flistxattr \- list extended attribute names
 .SH SYNOPSIS
@@ -95,13 +96,14 @@ size of a buffer which is sufficiently large to hold the list of names.
 .SS Example
 The
 .I list
-of names is returned as an unordered array of null-terminated character
-strings (attribute names are separated by null bytes (\(aq\\0\(aq)), like this:
+of names is returned as a null-terminated unordered array of
+null-terminated character strings
+(attribute names are separated by null bytes (\(aq\\0\(aq)), like this:
 .fam C
 .RS
 .nf
 
-user.name1\\0system.name1\\0user.name2\\0
+user.name1\\0system.name1\\0user.name2\\0\\0
 .fi
 .RE
 .fam T
@@ -114,7 +116,7 @@ like this:
 .RS
 .nf
 
-system.posix_acl_access\\0system.posix_acl_default\\0
+system.posix_acl_access\\0system.posix_acl_default\\0\\0
 .fi
 .RE
 .fam T
@@ -150,6 +152,138 @@ These system calls are Linux-specific.
 .\" and the SGI XFS development team,
 .\" .RI < linux-xfs-VZNHf3L845pBDgjK7y7TUQ@public.gmane.org >.
 .\" Please send any bug reports or comments to these addresses.
+.SH EXAMPLE
+The following program demonstrates the usage of
+.BR listxattr ()
+and
+.BR getxattr (2).
+For a path provided, it lists all extended file attributes and their values.
+
+The following output was recorded when first creating a file, setting
+some extended file attributes, and then listing them with the example code.
+
+.SS Example output
+.in +4n 
+.nf
+$ touch /tmp/foo
+$ setfattr -n user.fred -v chocolate /tmp/foo
+$ setfattr -n user.frieda -v bar /tmp/foo
+$ setfattr -n user.empty /tmp/foo
+$ ./listxattr /tmp/foo
+user.fred: chocolate
+user.frieda: bar
+user.empty: <no value>
+.fi
+.in
+.SS Program source
+.nf
+#include <malloc.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <attr/xattr.h>
+#include <sys/types.h>
+
+int
+main(int argc, char *argv[])
+{
+    ssize_t buflen;
+    char *buf, *p, *val;
+
+    if (argc != 2) {
+        fprintf(stderr, "usage: %s path\\n", argv[0]);
+        exit(EXIT_FAILURE);
+    }
+
+    /*
+     * determine the length of the buffer needed
+     */
+    buflen = listxattr(argv[1], NULL, 0);
+    if (buflen == \-1) {
+        perror("listxattr");
+        exit(EXIT_FAILURE);
+    }
+    if (buflen == 0) {
+        printf("%s has no attibutes.\\n", argv[1]);
+        exit(EXIT_SUCCESS);
+    }
+
+    /*
+     * allocate the buffer
+     */
+    buf = malloc(buflen);
+    if (buf == NULL) {
+        perror("malloc");
+        exit(EXIT_FAILURE);
+    }
+
+    /*
+     * copy the attribute list to the buffer
+     */
+    buflen = listxattr(argv[1], buf, buflen);
+    if (buflen == \-1) {
+        perror("listxattr");
+        exit(EXIT_FAILURE);
+    }
+
+    /*
+     * The end of the list is marked by zero terminated string
+     * of length zero.
+     */
+    p = buf;
+    while (*p) {
+
+        /*
+         * output attribute name
+         */
+        printf("%s: ", p);
+
+        /*
+         * determine length of value
+         */
+        buflen = getxattr(argv[1], p, NULL, 0);
+        if (buflen == \-1)
+            perror("getxattr");
+
+        if (buflen > 0) {
+            /*
+             * allocate value buffer
+             */
+            val = malloc(buflen);
+            if (val == NULL) {
+                perror("malloc");
+                exit(EXIT_FAILURE);
+            }
+
+            /*
+             * read value to buffer
+             */
+            buflen = getxattr(argv[1], p, val, buflen);
+            if (buflen == \-1)
+                perror("getxattr");
+            else
+                /*
+                 * output attribute value
+                 */
+                printf("%s", val);
+
+            free(val);
+        } else
+            printf("<no value>");
+
+        printf("\\n");
+
+        /*
+         *forward to next attribute name
+         */
+        while(*++p);
+        ++p;
+    }
+
+    free(buf);
+    exit(EXIT_SUCCESS);
+}
+.nf
+.fi
 .SH SEE ALSO
 .BR getfattr (1),
 .BR setfattr (1),
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
