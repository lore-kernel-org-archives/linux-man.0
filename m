From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], tty_ioctl(4): One warning from "groff", orthography
Date: Sun, 6 May 2012 20:57:44 +0000
Message-ID: <20120506205744.GA1681@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: man-pages
Version: 3.40
Severity: minor
Tags: patch

  Warning from "groff -ww ..." (or "man --warnings=w ..."):

<standard input>:252: warning: tab character in unquoted macro argument

  One misspelling corrected, period (full stop) in an ellipis
"protected" with "\&".

  Patch:

--- tty_ioctl.4	2012-04-26 22:58:39.000000000 +0000
+++ tty_ioctl.4.new	2012-05-06 20:29:46.307796209 +0000
@@ -8,7 +8,7 @@
 .SH SYNOPSIS
 .B "#include <termios.h>"
 .sp
-.BI "int ioctl(int " fd ", int " cmd ", ...);"
+.BI "int ioctl(int " fd ", int " cmd ", \&...);"
 .SH DESCRIPTION
 The
 .BR ioctl (2)
@@ -246,7 +246,7 @@
 equals 1, in which case the terminal is stolen, and all processes that had
 it as controlling terminal lose it.
 .TP
-.B TIOCNOTTY	void
+.B "TIOCNOTTY	void"
 If the given terminal was the controlling terminal of the calling process,
 give up this controlling terminal.
 If the process was session leader,
@@ -299,7 +299,7 @@
 .TP
 .BI "TIOCSETD	const int *" argp
 Set the line discipline of the terminal.
-.SS "Psuedoterminal ioctls"
+.SS "Pseudoterminal ioctls"
 .TP
 .BI "TIOCPKT	const int *" argp
 Enable (when

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
