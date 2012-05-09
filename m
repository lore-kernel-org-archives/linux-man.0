From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], ascii(7): Indent for "troff" makes table to wide
Date: Wed, 9 May 2012 19:42:14 +0000
Message-ID: <20120509194214.GA23489@rhi.hi.is>
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

  From "groff -t -ww ...":

warning: around line 53: table wider than line width

  Extra indent for "troff" makes the table look misplaced
(default "ps" output).

  Patch:

--- ascii.7	2012-04-26 22:58:39.000000000 +0000
+++ ascii.7.new	2012-05-09 00:46:03.000000000 +0000
@@ -45,7 +45,6 @@
 .LP
 C program \f(CW\(aq\eX\(aq\fP escapes are noted.
 .if t \{\
-.in 1i
 .ft CW
 \}
 .TS

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
