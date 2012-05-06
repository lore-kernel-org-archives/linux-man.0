From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], console_codes(4): One table too wide for the line length
Date: Sun, 6 May 2012 19:57:51 +0000
Message-ID: <20120506195751.GA968@rhi.hi.is>
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

  From "groff -ww ..." (or "man --warnings=w ..."):

warning: around line 182: table wider than line width

  Default length of line in GNU man is 78.

  Split longest (last) line into two (or use text block).  Reduce
four "l" to three.

  Patch:

--- console_codes.4	2012-04-26 22:58:39.000000000 +0000
+++ console_codes.4.new	2012-05-06 00:54:29.000000000 +0000
@@ -175,7 +175,7 @@
 .PP
 The action of a CSI sequence is determined by its final character.
 .TS
-l l l l.
+l l l.
 @	ICH	Insert the indicated # of blank characters.
 A	CUU	Move cursor up the indicated # of rows.
 B	CUD	Move cursor down the indicated # of rows.
@@ -203,7 +203,8 @@
 d	VPA	Move cursor to the indicated row, current column.
 e	VPR	Move cursor down the indicated # of rows.
 f	HVP	Move cursor to the indicated row, column.
-g	TBC	Without parameter: clear tab stop at the current position.
+g	TBC	Without parameter: clear tab stop at the current
+		position.
 		ESC [ 3 g: delete all tab stops.
 h	SM	Set Mode (see below).
 l	RM	Reset Mode (see below).

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
