From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] Document fork() behaviour for the Linux native AIO io_context
Date: Tue, 14 Apr 2009 13:54:07 -0400
Message-ID: <x49r5zvxgsg.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, zach.brown-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

It was noted on lkml that the fork behaviour is documented for the posix
AIO calls, but not for the Linux native calls.  Here is a patch which
adds a small blurb that folks will hopefully find useful.

Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Upon fork, the child process does not inherit the io_context_t data structures
returned by io_setup, and thus cannot submit further asynchronous I/O or
reap event completions for said contexts.
diff --git a/man2/fork.2 b/man2/fork.2
index ce93b3e..fb9008e 100644
--- a/man2/fork.2
+++ b/man2/fork.2
@@ -83,7 +83,9 @@ The child does not inherit timers from its parent
 The child does not inherit outstanding asynchronous I/O operations
 from its parent
 .RB ( aio_read (3),
-.BR aio_write (3)).
+.BR aio_write (3)),
+nor does it inherit the asynchronous io_context returned by
+.BR io_setup (2).
 .PP
 The process attributes in the preceding list are all specified
 in POSIX.1-2001.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
