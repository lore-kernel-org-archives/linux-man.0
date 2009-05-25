From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 3/3] splice.2, tee.2, vmsplice.2: Update return type
Date: Mon, 25 May 2009 21:29:01 +0000 (UTC)
Message-ID: <1835422551-6657-3-git-send-email-mark@pogo.org.uk>
References: <1835422551-6657-1-git-send-email-mark@pogo.org.uk>
 <1835422551-6657-2-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Date: Tue, 29 Feb 2028 07:35:51 +0000
In-Reply-To: <1835422551-6657-2-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Return type is ssize_t since glibc-2.7, see /usr/include/bits/fcntl.h
---
 man2/splice.2   |    6 +++---
 man2/tee.2      |    4 ++--
 man2/vmsplice.2 |    6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/man2/splice.2 b/man2/splice.2
index d9c192a..0bb5f17 100644
--- a/man2/splice.2
+++ b/man2/splice.2
@@ -23,7 +23,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH SPLICE 2 2009-02-20 "Linux" "Linux Programmer's Manual"
+.TH SPLICE 2 2009-05-25 "Linux" "Linux Programmer's Manual"
 .SH NAME
 splice \- splice data to/from a pipe
 .SH SYNOPSIS
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
index 323bee5..1bea317 100644
--- a/man2/tee.2
+++ b/man2/tee.2
@@ -23,7 +23,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH TEE 2 2006-04-28 "Linux" "Linux Programmer's Manual"
+.TH TEE 2 2009-05-22 "Linux" "Linux Programmer's Manual"
 .SH NAME
 tee \- duplicating pipe content
 .SH SYNOPSIS
@@ -31,7 +31,7 @@ tee \- duplicating pipe content
 .B #define _GNU_SOURCE
 .B #include <fcntl.h>
 
-.BI "long tee(int " fd_in ", int " fd_out ", size_t " len \
+.BI "ssize_t tee(int " fd_in ", int " fd_out ", size_t " len \
 ", unsigned int " flags );
 .fi
 .SH DESCRIPTION
diff --git a/man2/vmsplice.2 b/man2/vmsplice.2
index 2c95893..8a67880 100644
--- a/man2/vmsplice.2
+++ b/man2/vmsplice.2
@@ -23,7 +23,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH VMSPLICE 2 2006-04-28 "Linux" "Linux Programmer's Manual"
+.TH VMSPLICE 2 2009-05-25 "Linux" "Linux Programmer's Manual"
 .SH NAME
 vmsplice \- splice user pages into a pipe
 .SH SYNOPSIS
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
1.6.2.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
