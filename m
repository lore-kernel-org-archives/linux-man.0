From: Shawn Landden <slandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] copy_file_range: update for glibc compatibility
Date: Sun, 31 Dec 2017 20:12:59 -0800
Message-ID: <20180101041259.642-1-slandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <slandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <slandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/copy_file_range.2 | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/man2/copy_file_range.2 b/man2/copy_file_range.2
index 6e50ea6ec..3a3a6aa9f 100644
--- a/man2/copy_file_range.2
+++ b/man2/copy_file_range.2
@@ -27,7 +27,7 @@
 copy_file_range \- Copy a range of data from one file to another
 .SH SYNOPSIS
 .nf
-.B #include <sys/syscall.h>
+.B #define _GNU_SOURCE
 .B #include <unistd.h>
 .PP
 .BI "ssize_t copy_file_range(int " fd_in ", loff_t *" off_in ,
@@ -124,12 +124,13 @@ are not on the same mounted filesystem.
 .SH VERSIONS
 The
 .BR copy_file_range ()
-system call first appeared in Linux 4.5.
-Library support was added in glibc 2.27.
+system call first appeared in Linux 4.5, but glibc 2.27 provides a user-space
+emulation when it is not available.
+.\" https://sourceware.org/git/?p=glibc.git;a=commit;f=posix/unistd.h;h=bad7a0c81f501fbbcc79af9eaa4b8254441c4a1f
 .SH CONFORMING TO
 The
 .BR copy_file_range ()
-system call is a nonstandard Linux extension.
+system call is a nonstandard Linux and GNU extension.
 .SH NOTES
 If
 .I file_in
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
