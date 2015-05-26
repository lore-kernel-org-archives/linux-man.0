From: Mark Hills <mark-tknEL9DgK0w@public.gmane.org>
Subject: [PATCH] Refactoring the description of nonblocking splice
 behaviour
Date: Tue, 26 May 2015 15:58:23 +0100 (BST)
Message-ID: <1505261556150.21456@jazz.pogo.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Rather than the detail of SPLICE_F_NONBLOCK getting long, move this
to its own section where it can grow to include the information with
greater clarity.

Added a description of the behaviour against a blocking file
descriptor, including an important gotcha.

I have aimed to keep to the section headings specified in man-pages(7).

The description that "splice() may nevertheless block because the file
descriptors that are spliced to/from may block" remains although I did
not observe or investigate this behaviour myself.
---
 man2/splice.2 |   47 ++++++++++++++++++++++++++++++++++++++++-------
 1 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/man2/splice.2 b/man2/splice.2
index 035aac4..cf1e2f6 100644
--- a/man2/splice.2
+++ b/man2/splice.2
@@ -105,13 +105,11 @@ call);
 in the future, a correct implementation may be restored.
 .TP
 .B SPLICE_F_NONBLOCK
-Do not block on I/O.
-This makes the splice pipe operations nonblocking, but
-.BR splice ()
-may nevertheless block because the file descriptors that
-are spliced to/from may block (unless they have the
-.B O_NONBLOCK
-flag set).
+Make the splice operation itself nonblocking. See the
+.B NOTES
+on
+.B Nonblocking behaviours
+below.
 .TP
 .B SPLICE_F_MORE
 More data will be coming in a subsequent splice.
@@ -184,6 +182,41 @@ library support was added to glibc in version 2.5.
 .SH CONFORMING TO
 This system call is Linux-specific.
 .SH NOTES
+.SS Nonblocking behaviours
+Whether 
+.BR splice ()
+may block is influenced by the
+.B O_NONBLOCK
+flag on 
+.I fd_in
+and
+.IR fd_out ,
+and the 
+.B SPLICE_F_NONBLOCK
+flag.
+
+Without
+.B SPLICE_F_NONBLOCK
+the behaviour of the underlying
+file descriptors defines when the
+.BR splice()
+operation will block.
+
+If
+.B SPLICE_F_NONBLOCK
+is set then the movement of data within
+.BR splice()
+is unblocking.
+However,
+.BR splice()
+may nevertheless block because the file descriptors that
+are spliced to/from may block.
+Care should be taken with this flag as
+.BR splice()
+will not block if data from a blocking file descriptor is not resident
+in memory; there can be a difference in behaviour where file
+content is or is not already cached to RAM.
+.SS Related calls
 The three system calls
 .BR splice (),
 .BR vmsplice (2),
-- 
1.7.1


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
