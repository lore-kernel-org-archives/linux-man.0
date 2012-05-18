From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], suffixes(7): Warnings from "grotty"
Date: Fri, 18 May 2012 17:47:22 +0000
Message-ID: <20120518174722.GA22613@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: manpages
Version: 3.40
Severity: minor
Tags: patch

  From "man ..." ("nroff ..."):

grotty:<standard input> (<standard input>):1763: character above first line discarded
grotty:<standard input> (<standard input>):2688: character above first line discarded
grotty:<standard input> (<standard input>):3286: character above first line discarded

  "man" ("nroff") needs a long page to avoid (imaginary) page
breaks for the long tables.

  The culprit is "Dl 0 -xxxx" (vertical line) where "xxxx" is
one line (40 nroff units) too long.  Or there is a bug in
"grotty".  "nroff" or "tbl" makes an empty line where a page
break is.

  Patch:

--- suffixes.7	2012-04-26 22:58:40.000000000 +0000
+++ suffixes.7.new	2012-05-18 01:22:54.000000000 +0000
@@ -35,6 +35,9 @@
 .\" FIXME, mtk, May 2007: rendering this page yields the error:
 .\" grotty:suffixes.7:1725: character above first line discarded
 .\"
+.\" "nroff" ("man") (or "tbl") needs a long page to avoid warnings
+.\" from "grotty" (at imagined page breaks).  Bug in grotty?
+.if n .pl 1000v
 .TH SUFFIXES 7  2000-11-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
 suffixes \- list of file suffixes

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
