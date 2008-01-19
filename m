From: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Man page bugs?
Date: Sat, 19 Jan 2008 21:00:29 +0800
Message-ID: <20080119130029.GC2466@hacking>
Reply-To: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Hi, Michael and list!

I found two problems in the man pages. The first one should
be a bug. It is that the type of the 2nd and 4th arguments
of splice(2) is wrong. The current prototype of splice(2)
in current man page is:

       long splice(int fd_in, off_t *off_in, int fd_out,
                   off_t *off_out, size_t len, unsigned int flags);

However, they should be 'loff_t' instead of 'off_t'. If we
use 'off_t', gcc will generate a warning. Patch is in the end
of this email and it's against 2.76 release. ;)

The second one is a bit confused. The example given in tee(2)
even can not run normally. I got this error:

$ ./example bar.txt
tee: Invalid argument

I looked at tee(2), it is said that:

EINVAL fd_in  or  fd_out  does not refer to a pipe; or fd_in and fd_out
       refer to the same pipe.

So the first two arguments of tee(2) in the example is wrong,
since neither STDIN_FILENO nor STDOUT_FILENO refers to a pipe.
But I am not so sure, because I am new to tee(2). ;) If you can
comfirm this is really a bug, I can send a patch to fix this too.

I have checked the newest release of man pages and my kernel version
is 2.6.21-1.3194.fc7. Did I miss something obvious?

(And please Cc me as I am not in the list.)

Thank you!

---

Index: man-pages-2.76/man2/splice.2
===================================================================
--- man-pages-2.76.orig/man2/splice.2
+++ man-pages-2.76/man2/splice.2
@@ -31,8 +31,8 @@ splice \- splice data to/from a pipe
 .B #define _GNU_SOURCE
 .B #include <fcntl.h>
 
-.BI "long splice(int " fd_in ", off_t *" off_in ", int " fd_out ,
-.BI "            off_t *" off_out ", size_t " len \
+.BI "long splice(int " fd_in ", loff_t *" off_in ", int " fd_out ,
+.BI "            loff_t *" off_out ", size_t " len \
 ", unsigned int " flags );
 .fi
 .SH DESCRIPTION
