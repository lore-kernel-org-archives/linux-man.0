From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH] splice.2, tee.2, vmsplice.2: Update return type
Date: Wed,  9 Sep 2009 21:48:00 +0100
Message-ID: <1252529280-3366-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Return type is ssize_t since glibc-2.7, see /usr/include/bits/fcntl.h
---
 man2/splice.2   |    4 ++--
 man2/tee.2      |    2 +-
 man2/vmsplice.2 |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/man2/splice.2 b/man2/splice.2
index d9c192a..1d4b74f 100644
--- a/man2/splice.2
+++ b/man2/splice.2
@@ -31,8 +31,8 @@ splice \- splice data to/from a pipe
 .B #define _GNU_SOURCE
 .B #include <fcntl.h>
 
-.BI "long splice(int " fd_in ", loff_t *" off_in ", int " fd_out ,
-.BI "            loff_t *" off_out ", size_t " len \
+.BI "ssize_t splice(int " fd_in ", loff_t *" off_in ", int " fd_out ,
+.BI "               loff_t *" off_out ", size_t " len \
 ", unsigned int " flags );
 .fi
 .SH DESCRIPTION
diff --git a/man2/tee.2 b/man2/tee.2
index 323bee5..feda6c8 100644
--- a/man2/tee.2
+++ b/man2/tee.2
@@ -31,7 +31,7 @@ tee \- duplicating pipe content
 .B #define _GNU_SOURCE
 .B #include <fcntl.h>
 
-.BI "long tee(int " fd_in ", int " fd_out ", size_t " len \
+.BI "ssize_t tee(int " fd_in ", int " fd_out ", size_t " len \
 ", unsigned int " flags );
 .fi
 .SH DESCRIPTION
diff --git a/man2/vmsplice.2 b/man2/vmsplice.2
index 2c95893..91b2d04 100644
--- a/man2/vmsplice.2
+++ b/man2/vmsplice.2
@@ -32,8 +32,8 @@ vmsplice \- splice user pages into a pipe
 .B #include <fcntl.h>
 .B #include <sys/uio.h>
 
-.BI "long vmsplice(int " fd ", const struct iovec *" iov ,
-.BI "              unsigned long " nr_segs ", unsigned int " flags );
+.BI "ssize_t vmsplice(int " fd ", const struct iovec *" iov ,
+.BI "                 unsigned long " nr_segs ", unsigned int " flags );
 .fi
 .SH DESCRIPTION
 .\" Linus: vmsplice() system call to basically do a "write to
-- 
1.6.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
