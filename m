From: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Subject: [PATCH] poll.2, select.2: fix erroneous description of "available for write".
Date: Tue, 19 Aug 2014 23:27:21 +0930
Message-ID: <87oavgk2f2.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

POSIX says: "POLLOUT Normal data may be written without blocking.".
This is "may" is misleading, see the POSIX write page:

  Write requests to a pipe or FIFO shall be handled in the same way as a regular file with the following exceptions:
...
	If the O_NONBLOCK flag is clear, a write request may cause the thread to block, but on normal completion it shall return nbyte.

...
  When attempting to write to a file descriptor (other than a pipe or FIFO) that supports non-blocking writes and cannot accept the data immediately:

    If the O_NONBLOCK flag is clear, write() shall block the calling thread until the data can be accepted.

    If the O_NONBLOCK flag is set, write() shall not block the thread. If some data can be written without blocking the thread, write() shall write what it can and return the number of bytes written. Otherwise, it shall return -1 and set errno to [EAGAIN].

The net result is that write() of more than 1 byte on a socket, pipe or FIFO
which is "ready" may block: write() (unlike read!) will attempt to write
the entire buffer and only return a short write under exceptional
circumstances.

Indeed, this is the behaviour we see in Linux:

https://github.com/rustyrussell/ccan/commit/897626152d12d7fd13a8feb36989eb5c8c1f3485
https://plus.google.com/103188246877163594460/posts/BkTGTMHDFgZ

Signed-off-by: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>

diff --git a/man2/poll.2 b/man2/poll.2
index 53aec82..9167472 100644
--- a/man2/poll.2
+++ b/man2/poll.2
@@ -167,7 +167,10 @@ There is urgent data to read (e.g., out-of-band data on TCP socket;
 pseudoterminal master in packet mode has seen state change in slave).
 .TP
 .B POLLOUT
-Writing now will not block.
+Writing is now possible, though a write larger that the available space
+in a socket or pipe will still block (unless
+.B O_NONBLOCK
+is set).
 .TP
 .BR POLLRDHUP " (since Linux 2.6.17)"
 Stream socket peer closed connection,
diff --git a/man2/select.2 b/man2/select.2
index ac70b85..ea35986 100644
--- a/man2/select.2
+++ b/man2/select.2
@@ -86,9 +86,10 @@ allow a program to monitor multiple file descriptors,
 waiting until one or more of the file descriptors become "ready"
 for some class of I/O operation (e.g., input possible).
 A file descriptor is considered ready if it is possible to
-perform the corresponding I/O operation (e.g.,
-.BR read (2))
-without blocking.
+perform a corresponding I/O operation (e.g.,
+.BR read (2)
+without blocking, or a sufficiently small
+.BR write (2)).
 .PP
 The operation of
 .BR select ()
@@ -131,8 +132,8 @@ available for reading (more precisely, to see if a read will not
 block; in particular, a file descriptor is also ready on end-of-file),
 those in
 .I writefds
-will be watched to see if a write will not block, and
-those in
+will be watched to see if space is available for write (though a large
+write may still block), and those in
 .I exceptfds
 will be watched for exceptions.
 On exit, the sets are modified in place
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
