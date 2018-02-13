From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [PATCH] mtrace.1: srcfix; some cleaning of the manual
Date: Tue, 13 Feb 2018 14:33:06 +0000
Message-ID: <20180213143306.GA29232@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Test nr. 2: Fix warning from "groff"

<standard input>:53 (macro BI): only 1 argument, but more are expected
<standard input>:56 (macro BI): only 1 argument, but more are expected

chk_manuals: Output is from: test-groff -Tutf8 -b -e -mandoc -rF0 -t -w w -z

#####

NO PATCH PROVIDED FOR THIS

Test nr. 29: Surround a block of comments with the macros ".ig" and "..".
The .\" at the beginning of each line is then not needed.

  Lines 1-22

#####

  Additionally use font macros instead of font escapes.

27:.BR mtrace " [\fIoption\fR]... [\fIbinary\fR] \fImtracedata\fR"

Signed-off-by: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
---
 man1/mtrace.1 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man1/mtrace.1 b/man1/mtrace.1
index c3f24ce42..7944574ed 100644
--- a/man1/mtrace.1
+++ b/man1/mtrace.1
@@ -24,7 +24,8 @@
 .SH NAME
 mtrace \- interpret the malloc trace log
 .SH SYNOPSIS
-.BR mtrace " [\fIoption\fR]... [\fIbinary\fR] \fImtracedata\fR"
+.B mtrace
+.RI [ option "]... [" binary ] \ mtracedata
 .SH DESCRIPTION
 .B mtrace
 is a Perl script used to interpret and provide human readable output
@@ -50,10 +51,10 @@ script usage, see
 .BR mtrace (3).
 .SH OPTIONS
 .TP
-.BI \fB\-\-help
+.B \-\-help
 Print help and exit.
 .TP
-.BI \fB\-\-version
+.B \-\-version
 Print version information and exit.
 .SH BUGS
 For bug reporting instructions, please see:
-- 
2.15.1

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
