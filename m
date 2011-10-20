From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/6] ld.so.8: clarify synopsis
Date: Thu, 20 Oct 2011 02:04:12 -0500
Message-ID: <20111020070412.GA11485@elie.hsd1.il.comcast.net>
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

The <program> argument to ld-linux.so is not optional.

While clarifying that, list supported options in the synopsis, improve
the typography a little, and move information about how the dynamic
linker is usually used from the SYNOPSIS to the DESCRIPTION section.

Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Not from Debian --- this is just me nitpicking to make the page look a
little more conventional.

The most iffy aspects of this patch are probably the use of \*(lq (is
it portable enough?) and the inclusion of the --audit option without
a detailed description in the OPTIONS section.  Naturally I like it
anyway. ;-)

 man8/ld.so.8 |   31 ++++++++++++++++++++++---------
 1 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 84278d0..f0718dd 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -3,22 +3,35 @@
 .SH NAME
 ld.so, ld-linux.so* \- dynamic linker/loader
 .SH SYNOPSIS
+.B /lib/ld-linux.so.*
+.RB [ \-\-list ]
+.RB [ \-\-verify ]
+.RB [ \-\-library-path
+.IR paths ]
+.RB [ \-\-inhibit-rpath
+.IR objects ]
+.RB [ \-\-audit
+.IR auditors ]
+.I program
+.RI [ arg ...]
+.SH DESCRIPTION
+The programs
+.B ld.so
+and
+.B ld-linux.so*
+find and load the shared libraries needed by a program, prepare
+the program to run, and then run it.
+.LP
 The dynamic linker can be run either indirectly by running some
 dynamically linked program or library (in which case no command-line options
 to the dynamic linker can be passed and, in the ELF case, the dynamic linker
 which is stored in the
 .B .interp
-section of the program is executed) or directly by running:
-.P
-.I /lib/ld-linux.so.*
-[OPTIONS] [PROGRAM [ARGUMENTS]]
-.SH DESCRIPTION
-The programs
-.B ld.so
-and
-.B ld-linux.so*
-find and load the shared libraries needed by a program, prepare
-the program to run, and then run it.
+section of the program is executed) or directly by running
+.RB \*(lq /lib/ld-linux.so.*
+.RI [ options ]
+.I program
+.RI [ arguments ]\*(rq.
 .LP
 Linux binaries require dynamic linking (linking at run time)
 unless the
-- 
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
