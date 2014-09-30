From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ascii.7: charset pages unification, minor cleanups
Date: Tue, 30 Sep 2014 13:29:11 +0300
Message-ID: <542A85F7.60603@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

this and the follow-up patches will provide unification of charset pages, minor cleanups, and some unifying cosmetic changes. References are adjusted so that all pages include a reference to charsets(7) which contains description of these sets, stray comments are removed, some obsolete statements (like ISO 8859-1 being the de-facto ASCII replacement..) are removed, and some minor reformatting to minimize diff's between the pages are done.

The actual substance, the character tables, remain unchanged.

This series changes the following pages (under man7): ascii, armscii, cp1251, koi8-r, koi8-u, and all of iso_8859-*. Also adds a new page for cp1252.

CC'ing Lefteris who contributed many of these pages.

-----
- adjust references
- add null char description
- cosmetics
---
 man7/ascii.7 |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/man7/ascii.7 b/man7/ascii.7
index f17c256..12375d9 100644
--- a/man7/ascii.7
+++ b/man7/ascii.7
@@ -1,6 +1,5 @@
 '\" t
 .\" Copyright (c) 1993 Michael Haardt (michael-8s1n8bisGiQ@public.gmane.org)
-.\" Created Fri Apr  2 11:32:09 MET DST 1993
 .\"
 .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
 .\" This is free documentation; you can redistribute it and/or
@@ -23,6 +22,7 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
+.\" Created  1993-04-02 by Michael Haardt (michael-8s1n8bisGiQ@public.gmane.org)
 .\" Modified 1993-07-24 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 1994-05-15 by Daniel Quinlan (quinlan-7x81iamSd18S+FvcfC7Uqw@public.gmane.org)
 .\" Modified 1994-11-22 by Daniel Quinlan (quinlan-7x81iamSd18S+FvcfC7Uqw@public.gmane.org)
@@ -34,12 +34,13 @@
 .\"
 .TH ASCII 7 2014-02-26 "Linux" "Linux Programmer's Manual"
 .SH NAME
-ascii \- ASCII character set encoded in octal, decimal, and hexadecimal
+ascii \- ASCII character set encoded in octal, decimal,
+and hexadecimal
 .SH DESCRIPTION
 ASCII is the American Standard Code for Information Interchange.
 It is a 7-bit code.
 Many 8-bit codes (e.g., ISO 8859-1) contain ASCII as their lower half.
-The international counterpart of ASCII is known as ISO 646.
+The international counterpart of ASCII is known as ISO 646-IRV.
 .LP
 The following table contains the 128 ASCII characters.
 .LP
@@ -51,7 +52,7 @@ C program \f(CW\(aq\eX\(aq\fP escapes are noted.
 l l l l l l l l.
 Oct	Dec	Hex	Char	Oct	Dec	Hex	Char
 _
-000	0	00	NUL \(aq\e0\(aq	100	64	40	@
+000	0	00	NUL \(aq\e0\(aq (null character)	100	64	40	@
 001	1	01	SOH (start of heading)	101	65	41	A
 002	2	02	STX (start of text)	102	66	42	B
 003	3	03	ETX (end of text)	103	67	43	C
@@ -121,7 +122,7 @@ _
 .ft P
 \}
 .SS Tables
-For convenience, let us give more compact tables in hex and decimal.
+For convenience, below are more compact tables in hex and decimal.
 .sp
 .nf
 .if t \{\
@@ -182,9 +183,10 @@ Standards Institute (USASI) in 1968.
 .\" U.S. member body of ISO; private and nonprofit.
 .\"
 .SH SEE ALSO
-.ad l
+.BR charsets (7),
 .BR iso_8859-1 (7),
 .BR iso_8859-10 (7),
+.BR iso_8859-11 (7),
 .BR iso_8859-13 (7),
 .BR iso_8859-14 (7),
 .BR iso_8859-15 (7),
-- 
1.7.1


-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
