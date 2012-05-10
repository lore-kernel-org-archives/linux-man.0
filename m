From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], iso_8859-*.7: Explanation of SOFT HYPHEN and the code for
 it
Date: Thu, 10 May 2012 19:42:31 +0000
Message-ID: <20120510194231.GA13127@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
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

  From "groff -ww ...":

<groff: iso_8859-2.7>:89: warning: can't find special character `shc'

  This is the only "iso_8859-*.7" file that has this (now)
undefined character.  The code in column four in "iso_8859-1.7" is
"0x2D" ("HYPHEN, MINUS SIGN" or "HYPHEN-MINUS") instead of "0xAD".=20
See Debian bug 156154 (or package "manpages").

  There should be an explanation for this graphic character and the
code should be 0xAD in iso_8859-1.7 (as in all others), even though
"[gn]roff" does not display a "HYPHEN" in that position of the table.

  The line with "SOFT HYPHEN" gets a footnote and a short
explanation.  The footnote is from the official ISO standard.

  Suggested patch for one of the files:

--- iso_8859-1.7	2012-04-26 22:58:39.000000000 +0000
+++ iso_8859-1.7.new	2012-05-10 16:01:39.000000000 +0000
@@ -71,7 +71,7 @@
 The fourth column will only show the proper glyphs
 in an environment configured for ISO 8859-1.
 .TS
-l l l c lp-1.
+l2 l2 l2 c2 lp-1.
 Oct	Dec	Hex	Char	Description
 _
 240	160	A0	=A0	NO-BREAK SPACE
@@ -87,7 +87,7 @@
 252	170	AA	=AA	FEMININE ORDINAL INDICATOR
 253	171	AB	=AB	LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
 254	172	AC	=AC	NOT SIGN
-255	173	AD	-	SOFT HYPHEN
+255	173	AD	=AD	SOFT HYPHEN (shown as a hyphen at line breaks)=B9
 256	174	AE	=AE	REGISTERED SIGN
 257	175	AF	=AF	MACRON
 260	176	B0	=B0	DEGREE SIGN
@@ -171,6 +171,11 @@
 376	254	FE	=FE	LATIN SMALL LETTER THORN
 377	255	FF	=FF	LATIN SMALL LETTER Y WITH DIAERESIS
 .TE
+  =B9 A graphic character that is imaged by a graphic symbol
+identical with, or similar to, that representing HYPHEN, for use
+when a line break has been established wihin a word.
+.BR "ISO 8859-1:1987" ,
+paragraph 6.3.3.
 .SH "SEE ALSO"
 .BR ascii (7),
 .BR iso_8859-15 (7)

--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
