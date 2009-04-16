From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] Note in fmemopen() that no file descriptor is allocated
Date: Thu, 16 Apr 2009 16:58:04 +0200
Message-ID: <20090416145804.GZ8940@machine.or.cz>
References: <9c3275a90904151642n7a13cf06w6e1834b849d37f1a@mail.gmail.com> <20090416082503.GH21271@machine.or.cz> <9c3275a90904160726i68a4c1f6u8173f72365042e65@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9c3275a90904160726i68a4c1f6u8173f72365042e65-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Lamaison <awl03-CezfXpuMXD6Fxr2TtlUqVg@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: libc-help-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Alexander Lamaison <awl03-CezfXpuMXD6Fxr2TtlUqVg@public.gmane.org> pointed out that this is
not obvious from the documentation, citing an example with passing
the FILE * handle to a function that tries to fstat() its fileno()
in order to determine the buffer size.

This also moves BUGS before EXAMPLE according to the recommended
section order.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
index 608e16f..3ed6930 100644
--- a/man3/fmemopen.3
+++ b/man3/fmemopen.3
@@ -173,6 +173,22 @@ POSIX.1-2008.
 These functions are not specified in POSIX.1-2001,
 and are not widely available on other systems.
 These functions are GNU extensions.
+.SH NOTES
+There is no valid file descriptor associated with
+the returned handle, therefore
+.BR fileno (3)
+will return a negative value.
+Thus, you e.g. cannot determine the buffer size using
+.I fstat(fileno(f), &stat)
+and looking at
+.IR stat.st_size .
+.SH BUGS
+In glibc before version 2.7, seeking past the end of a stream created by
+.BR open_memstream ()
+does not enlarge the buffer; instead the
+.BR fseek ()
+call fails, returning \-1.
+.\" http://sourceware.org/bugzilla/show_bug.cgi?id=1996
 .SH "EXAMPLE"
 The program below uses
 .BR fmemopen ()
@@ -236,13 +252,6 @@ main(int argc, char *argv[])
     exit(EXIT_SUCCESS);
 }
 .fi
-.SH BUGS
-In glibc before version 2.7, seeking past the end of a stream created by
-.BR open_memstream ()
-does not enlarge the buffer; instead the
-.BR fseek ()
-call fails, returning \-1.
-.\" http://sourceware.org/bugzilla/show_bug.cgi?id=1996
 .SH "SEE ALSO"
 .BR fopen (3),
 .BR fopencookie (3),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
