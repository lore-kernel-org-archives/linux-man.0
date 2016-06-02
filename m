From: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/1] mmap.2: improve example
Date: Thu,  2 Jun 2016 23:26:27 +0530
Message-ID: <1464890187-4141-1-git-send-email-rahulbedarkar89@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

free resources on error paths and at the end after use.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/mmap.2 | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/man2/mmap.2 b/man2/mmap.2
index 0f2f277..cede984 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -765,8 +765,10 @@ main(int argc, char *argv[])
     if (fd == \-1)
         handle_error("open");
 
-    if (fstat(fd, &sb) == \-1)           /* To obtain file size */
+    if (fstat(fd, &sb) == \-1) {          /* To obtain file size */
+        close(fd);
         handle_error("fstat");
+    }
 
     offset = atoi(argv[2]);
     pa_offset = offset & ~(sysconf(_SC_PAGE_SIZE) \- 1);
@@ -774,6 +776,7 @@ main(int argc, char *argv[])
 
     if (offset >= sb.st_size) {
         fprintf(stderr, "offset is past end of file\\n");
+        close(fd);
         exit(EXIT_FAILURE);
     }
 
@@ -789,18 +792,27 @@ main(int argc, char *argv[])
 
     addr = mmap(NULL, length + offset \- pa_offset, PROT_READ,
                 MAP_PRIVATE, fd, pa_offset);
-    if (addr == MAP_FAILED)
+    if (addr == MAP_FAILED) {
+        close(fd);
         handle_error("mmap");
+    }
 
     s = write(STDOUT_FILENO, addr + offset \- pa_offset, length);
     if (s != length) {
-        if (s == \-1)
+        if (s == \-1) {
+            munmap(addr, length + offset \- pa_offset);
+            close(fd);
             handle_error("write");
+        }
 
+        munmap(addr, length + offset \- pa_offset);
+        close(fd);
         fprintf(stderr, "partial write");
         exit(EXIT_FAILURE);
     }
 
+    munmap(addr, length + offset \- pa_offset);
+    close(fd);
     exit(EXIT_SUCCESS);
 }
 .fi
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
