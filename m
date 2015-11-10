From: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
Subject: [PATCH] getdirentries: Add a simple example rather than just referencing
Date: Tue, 10 Nov 2015 05:13:07 -0600
Message-ID: <1447153987-1742-1-git-send-email-der.herr@hofr.at>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The manpage of getdirentries basically just repeats the limited information
from dirent.h and does not explain the content of the returned buffer.

Further it refers the reader to "the Linux library source code for details", 
which is not really that helpful - a simple example including the need to
check available fields, and showing that the returned buffer contains 
struct direntries would simplify things.

Signed-off-by: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
---

The ifdef ugliness is intentional as one actually can not write portable
code using getdirenties without checking these macros.

 man3/getdirentries.3 | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/man3/getdirentries.3 b/man3/getdirentries.3
index 2030e3a..962710f 100644
--- a/man3/getdirentries.3
+++ b/man3/getdirentries.3
@@ -60,7 +60,50 @@ If an error occurs, \-1 is returned, and
 .I errno
 is set appropriately.
 .SH ERRORS
-See the Linux library source code for details.
+.PP
+The returned buffer contains the struct dirent of the directory entries.
+The available fields depend on the macros defined in dirent.h and need to be checked
+A basic examples usage (based on libsysio) is shown below
+.SS Program source
+.nf
+#define _BSD_SOURCE
+#include <dirent.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+
+#define BUFSIZE 128
+
+int
+main(int argc, char *argv[])
+{
+    ssize_t len;
+    int fd;
+    off_t base;
+    char buf[BUFSIZE];
+    struct dirent *dp;
+
+    fd = open(".", O_RDONLY);
+    while ((len = getdirentries(fd, (char *)buf, BUFSIZE, &base)) > 0) {
+        dp = (struct dirent *)buf;
+        while (len > 0) {
+            printf("%s:\n"
+#if defined _DIRENT_HAVE_D_TYPE
+                "\t type %llu\n",
+#endif
+                dp->d_name,
+#if defined _DIRENT_HAVE_D_TYPE
+                dp->d_type
+#endif
+                );
+            len -= dp->d_reclen;
+            dp = (struct dirent *)((char *)dp + dp->d_reclen);
+        }
+    }
+    return 0;
+}
+.fi
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
