From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] readlink.2: Document using st_size to allocate the buffer
Date: Thu, 21 Apr 2011 05:19:57 +0200
Message-ID: <20110421031957.GA12346@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
---
 man2/readlink.2 |   69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 68 insertions(+), 1 deletions(-)

diff --git a/man2/readlink.2 b/man2/readlink.2
index 1327e08..2601e22 100644
--- a/man2/readlink.2
+++ b/man2/readlink.2
@@ -35,7 +35,7 @@
 .\" Modified Tue Jul  9 23:55:17 1996 by aeb
 .\" Modified Fri Jan 24 00:26:00 1997 by aeb
 .\"
-.TH READLINK 2 2010-09-20 "Linux" "Linux Programmer's Manual"
+.TH READLINK 2 2011-04-20 "Linux" "Linux Programmer's Manual"
 .SH NAME
 readlink \- read value of a symbolic link
 .SH SYNOPSIS
@@ -69,6 +69,21 @@ does not append a null byte to
 It will truncate the contents (to a length of
 .I bufsiz
 characters), in case the buffer is too small to hold all of the contents.
+
+Using a statically sized buffer might not give enough room for the
+symbolic link contents, which might end up getting truncated. The
+needed size for the buffer can be obtained from the symbolic link's
+.I stat
+structure
+.I st_size
+field with
+.BR lstat (),
+but the number of written characters should be checked to make sure the
+symbolic link did not change between both calls, and no truncation
+happened. This also fixes a common portability problem when using
+.I PATH_MAX
+for the buffer size, as this is not guaranteed to be defined per POSIX
+if the system does not have such limit.
 .SH "RETURN VALUE"
 On success,
 .BR readlink ()
@@ -130,6 +145,58 @@ was declared as
 Nowadays, the return type is declared as
 .IR ssize_t ,
 as (newly) required in POSIX.1-2001.
+.SH EXAMPLE
+The following program allocates the space needed by
+.BR readlink ()
+dynamically from the information provided by
+.BR lstat (),
+making sure there's no race condition between both calls.
+.nf
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+int
+main(int argc, char *argv[])
+{
+    struct stat sb;
+    char *linkname;
+    ssize_t r;
+
+    if (argc != 2) {
+        fprintf(stderr, "Usage: %s <pathname>\\n", argv[0]);
+        exit(EXIT_FAILURE);
+    }
+
+    if (lstat(argv[1], &sb) == \-1) {
+        perror("lstat");
+        exit(EXIT_FAILURE);
+    }
+
+    linkname = malloc(sb.st_size + 1);
+    if (linkname == NULL) {
+        fprintf(stderr, "insufficient memory\\n");
+        exit(EXIT_FAILURE);
+    }
+
+    r = readlink(argv[1], linkname, sb.st_size + 1);
+    if (r < 0) {
+        perror("lstat");
+        exit(EXIT_FAILURE);
+    } else if (r != sb.st_size) {
+        fprintf(stderr, "symlink changed between lstat and readlink\\n");
+        exit(EXIT_FAILURE);
+    }
+    linkname[sb.st_size] = '\\0';
+
+    printf("'%s' points to '%s'\\n", argv[1], linkname);
+
+    exit(EXIT_SUCCESS);
+}
+.fi
 .SH "SEE ALSO"
 .BR lstat (2),
 .BR readlinkat (2),
-- 
1.7.4.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
