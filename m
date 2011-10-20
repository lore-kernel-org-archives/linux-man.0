From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/6] ld.so.8: move important information toward the top
Date: Thu, 20 Oct 2011 02:06:12 -0500
Message-ID: <20111020070612.GB11485@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111020070037.GA11392-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The novice might wonder why programs need linking at run-time at all,
so point out early on that the purpose of this exercise is linking
against shared libraries that can be upgraded independently of the
applications that use them (as contrasted with static linking).
Wording taken from the Debian glibc package, 2003.

Most readers today won't care about /lib/ld.so and a.out binaries, so
move the passage describing that to the end of the description
section.  This way, it is more likely that the juicy bits (the
overview and the library search path) will fit on the first page.

Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man8/ld.so.8 |   39 +++++++++++++++++++--------------------
 1 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index f0718dd..9fc96c9 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -21,6 +21,12 @@ and
 .B ld-linux.so*
 find and load the shared libraries needed by a program, prepare
 the program to run, and then run it.
+Unless the
+.B \-static
+option was given to
+.BR ld (1)
+during compilation, all Linux programs are incomplete and require
+further linking at run time.
 .LP
 The dynamic linker can be run either indirectly by running some
 dynamically linked program or library (in which case no command-line options
@@ -33,26 +39,6 @@ section of the program is executed) or directly by running
 .I program
 .RI [ arguments ]\*(rq.
 .LP
-Linux binaries require dynamic linking (linking at run time)
-unless the
-.B \-static
-option was given to
-.BR ld (1)
-during compilation.
-.LP
-The program
-.B ld.so
-handles a.out binaries, a format used long ago;
-.B ld-linux.so*
-handles ELF (\fI/lib/ld-linux.so.1\fP for libc5, \fI/lib/ld-linux.so.2\fP
-for glibc2), which everybody has been using for years now.
-Otherwise both have the same behavior, and use the same
-support files and programs
-.BR ldd (1),
-.BR ldconfig (8)
-and
-.IR /etc/ld.so.conf .
-.LP
 The shared libraries needed by the program are searched for
 in the following order:
 .IP o 3
@@ -85,6 +71,19 @@ and then
 If the binary was linked with the
 .B \-z nodeflib
 linker option, this step is skipped.
+.LP
+The program
+.B ld.so
+handles a.out binaries, a format used long ago;
+.B ld-linux.so*
+handles ELF (\fI/lib/ld-linux.so.1\fP for libc5, \fI/lib/ld-linux.so.2\fP
+for glibc2), which everybody has been using for years now.
+Otherwise both have the same behavior, and use the same
+support files and programs
+.BR ldd (1),
+.BR ldconfig (8)
+and
+.IR /etc/ld.so.conf .
 .SS $ORIGIN and rpath
 .PP
 .B ld.so
-- 
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
