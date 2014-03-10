From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: For review: isalpha.3 additions for is*_l() functions
Date: Mon, 10 Mar 2014 14:27:07 +0100
Message-ID: <531DBDAB.20300@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020003070408050700050000"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, walter harms <WHarms-fPG8STNUNVg@public.gmane.org>, Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------020003070408050700050000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello all,

I've written the patch below to isalpha.3 to document the is*_l()
functions (isalpha_l(), isupper_l(), etc). (It also updates various
pieces in CONFORMING TO.)

Review comments welcome. The patch is below, and the entire current 
draft of the entire page is attached.

Thanks,

Michael

PS newlocale(3), duplocale(3), and uselocale(3) pages are on the way.


diff --git a/man3/isalpha.3 b/man3/isalpha.3
index 332ea00..d9a8f31 100644
--- a/man3/isalpha.3
+++ b/man3/isalpha.3
@@ -30,16 +30,17 @@
 .TH ISALPHA 3 2014-01-27 "GNU" "Linux Programmer's Manual"
 .SH NAME
 isalnum, isalpha, isascii, isblank, iscntrl, isdigit, isgraph, islower,
-isprint, ispunct, isspace, isupper, isxdigit \- character
-classification routines
+isprint, ispunct, isspace, isupper, isxdigit,
+isalnum_l, isalpha_l, isascii_l, isblank_l, iscntrl_l,
+isdigit_l, isgraph_l, islower_l,
+isprint_l, ispunct_l, isspace_l, isupper_l, isxdigit_l
+\- character classification functions
 .SH SYNOPSIS
 .nf
 .B #include <ctype.h>
 .sp
 .BI "int isalnum(int " c );
 .BI "int isalpha(int " c );
-.BI "int isascii(int " c );
-.BI "int isblank(int " c );
 .BI "int iscntrl(int " c );
 .BI "int isdigit(int " c );
 .BI "int isgraph(int " c );
@@ -49,6 +50,24 @@ classification routines
 .BI "int isspace(int " c );
 .BI "int isupper(int " c );
 .BI "int isxdigit(int " c );
+
+.BI "int isascii(int " c );
+.BI "int isblank(int " c );
+
+.BI "int isalnum_l(int " c ", locale_t " locale );
+.BI "int isalpha_l(int " c ", locale_t " locale );
+.BI "int isblank_l(int " c ", locale_t " locale );
+.BI "int iscntrl_l(int " c ", locale_t " locale );
+.BI "int isdigit_l(int " c ", locale_t " locale );
+.BI "int isgraph_l(int " c ", locale_t " locale );
+.BI "int islower_l(int " c ", locale_t " locale );
+.BI "int isprint_l(int " c ", locale_t " locale );
+.BI "int ispunct_l(int " c ", locale_t " locale );
+.BI "int isspace_l(int " c ", locale_t " locale );
+.BI "int isupper_l(int " c ", locale_t " locale );
+.BI "int isxdigit_l(int " c ", locale_t " locale );
+
+.BI "int isascii_l(int " c ", locale_t " locale );
 .fi
 .sp
 .in -4n
@@ -62,6 +81,7 @@ Feature Test Macro Requirements for glibc (see
 _BSD_SOURCE || _SVID_SOURCE || _XOPEN_SOURCE
 .br
 .RE
+
 .BR isblank ():
 .RS 4
 _XOPEN_SOURCE\ >=\ 600 || _ISOC99_SOURCE ||
@@ -70,6 +90,41 @@ _POSIX_C_SOURCE\ >=\ 200112L;
 or
 .I cc\ -std=c99
 .RE
+
+.BR isalnum_l (),
+.BR isalpha_l (),
+.BR isblank_l (),
+.BR iscntrl_l (),
+.BR isdigit_l (),
+.BR isgraph_l (),
+.BR islower_l (),
+.BR isprint_l (),
+.BR ispunct_l (),
+.BR isspace_l (),
+.BR isupper_l (),
+.BR isxdigit_l ():
+.PD 0
+.RS 4
+.TP
+Since glibc 2.10:
+_XOPEN_SOURCE\ >=\ 700
+.TP
+Before glibc 2.10:
+_GNU_SOURCE
+.RE
+.PD
+
+.BR isascii_l (),
+.PD 0
+.RS 4
+.TP
+Since glibc 2.10:
+_XOPEN_SOURCE\ >=\ 700 && (_SVID_SOURCE || _BSD_SOURCE)
+.TP
+Before glibc 2.10:
+_GNU_SOURCE
+.RE
+.PD
 .ad
 .SH DESCRIPTION
 These functions check whether
@@ -78,7 +133,26 @@ which must have the value of an
 .I unsigned char
 or
 .BR EOF ,
-falls into a certain character class according to the current locale.
+falls into a certain character class according to the specified locale.
+The functions without the
+"_l" suffix perform the check based on the current locale.
+
+The functions with the "_l" suffix perform the check
+based on the locale specified by the locale object
+.IR locale .
+The behavior of these functions is undefined if
+.I locale
+is the special locale object
+.B LC_GLOBAL_LOCALE
+(see
+.BR duplocale (3))
+or is not a valid locale object handle.
+
+The list below explains the operation of the functions without
+the "_l" suffix;
+the functions with the "_l" suffix differ only in using the locale object
+.I locale
+instead of the current locale.
 .TP
 .BR isalnum ()
 checks for an alphanumeric character; it is equivalent to
@@ -141,14 +215,13 @@ and vertical tab
 checks for an uppercase letter.
 .TP
 .BR isxdigit ()
-checks for a hexadecimal digits, that is, one of
+checks for hexadecimal digits, that is, one of
 .br
 .BR "0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F" .
 .SH RETURN VALUE
 The values returned are nonzero if the character
 .I c
-falls into the tested class, and a zero value
-if not.
+falls into the tested class, and zero if not.
 .SH ATTRIBUTES
 .SS Multithreading (see pthreads(7))
 The
@@ -167,23 +240,74 @@ The
 and
 .BR isxdigit ()
 functions are thread-safe.
+.\" FIXME: need a thread-safety statement about the *_l functions
+.SH VERSIONS
+.BR isalnum_l (),
+.BR isalpha_l (),
+.BR isblank_l (),
+.BR iscntrl_l (),
+.BR isdigit_l (),
+.BR isgraph_l (),
+.BR islower_l (),
+.BR isprint_l (),
+.BR ispunct_l (),
+.BR isspace_l (),
+.BR isupper_l (),
+.BR isxdigit_l (),
+and
+.BR isascii_l ()
+are available since glibc 2.3.
 .SH CONFORMING TO
-C99, 4.3BSD.
-C89 specifies all of these functions except
+C89 specifies
+.BR isalnum (),
+.BR isalpha (),
+.BR iscntrl (),
+.BR isdigit (),
+.BR isgraph (),
+.BR islower (),
+.BR isprint (),
+.BR ispunct (),
+.BR isspace (),
+.BR isupper (),
+and
+.BR isxdigit (),
+but not
 .BR isascii ()
 and
 .BR isblank ().
+POSIX.1-2001
+also specifies those functions, and also 
 .BR isascii ()
-is a BSD extension
-and is also an SVr4 extension.
-.BR isblank ()
-conforms to POSIX.1-2001 and C99 7.4.1.3.
+(as an XSI extension)
+and
+.BR isblank ().
+C99 specifies all of the preceding functions, except
+.BR isascii ().
+
 POSIX.1-2008 marks
 .BR isascii ()
 as obsolete,
 noting that it cannot be used portably in a localized application.
+
+POSIX.-1-2008 specifies
+.BR isalnum_l (),
+.BR isalpha_l (),
+.BR isblank_l (),
+.BR iscntrl_l (),
+.BR isdigit_l (),
+.BR isgraph_l (),
+.BR islower_l (),
+.BR isprint_l (),
+.BR ispunct_l (),
+.BR isspace_l (),
+.BR isupper_l (),
+and
+.BR isxdigit_l ().
+
+.BR isascii_l ()
+is a GNU extension.
 .SH NOTES
-The details of what characters belong into which class depend on the current
+The details of what characters belong to which class depend on the
 locale.
 For example,
 .BR isupper ()
@@ -203,7 +327,9 @@ locale.
 .BR iswspace (3),
 .BR iswupper (3),
 .BR iswxdigit (3),
+.BR newlocale (3),
 .BR setlocale (3),
+.BR uselocale (3),
 .BR toascii (3),
 .BR tolower (3),
 .BR toupper (3),

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--------------020003070408050700050000
Content-Type: application/x-troff-man;
 name="isalpha.3"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="isalpha.3"

.\" Copyright (c) 1993 by Thomas Koenig (ig25-L38z05uLna+pU24hk/rHShvVK+yQ3ZXh@public.gmane.org)
.\"
.\" %%%LICENSE_START(VERBATIM)
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\" %%%LICENSE_END
.\"
.\" Modified Sat Jul 24 19:10:00 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
.\" Modified Sun Aug 21 17:51:50 1994 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
.\" Modified Sat Sep  2 21:52:01 1995 by Jim Van Zandt <jrv-krxCGfS0CTlN0jTZmbxGZA@public.gmane.org>
.\" Modified Mon May 27 22:55:26 1996 by Martin Schulze (joey-fxUVXftIFDk@public.gmane.org)
.\"
.TH ISALPHA 3 2014-01-27 "GNU" "Linux Programmer's Manual"
.SH NAME
isalnum, isalpha, isascii, isblank, iscntrl, isdigit, isgraph, islower,
isprint, ispunct, isspace, isupper, isxdigit,
isalnum_l, isalpha_l, isascii_l, isblank_l, iscntrl_l,
isdigit_l, isgraph_l, islower_l,
isprint_l, ispunct_l, isspace_l, isupper_l, isxdigit_l
\- character classification functions
.SH SYNOPSIS
.nf
.B #include <ctype.h>
.sp
.BI "int isalnum(int " c );
.BI "int isalpha(int " c );
.BI "int iscntrl(int " c );
.BI "int isdigit(int " c );
.BI "int isgraph(int " c );
.BI "int islower(int " c );
.BI "int isprint(int " c );
.BI "int ispunct(int " c );
.BI "int isspace(int " c );
.BI "int isupper(int " c );
.BI "int isxdigit(int " c );

.BI "int isascii(int " c );
.BI "int isblank(int " c );

.BI "int isalnum_l(int " c ", locale_t " locale );
.BI "int isalpha_l(int " c ", locale_t " locale );
.BI "int isblank_l(int " c ", locale_t " locale );
.BI "int iscntrl_l(int " c ", locale_t " locale );
.BI "int isdigit_l(int " c ", locale_t " locale );
.BI "int isgraph_l(int " c ", locale_t " locale );
.BI "int islower_l(int " c ", locale_t " locale );
.BI "int isprint_l(int " c ", locale_t " locale );
.BI "int ispunct_l(int " c ", locale_t " locale );
.BI "int isspace_l(int " c ", locale_t " locale );
.BI "int isupper_l(int " c ", locale_t " locale );
.BI "int isxdigit_l(int " c ", locale_t " locale );

.BI "int isascii_l(int " c ", locale_t " locale );
.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.ad l
.BR isascii ():
.RS 4
_BSD_SOURCE || _SVID_SOURCE || _XOPEN_SOURCE
.br
.RE

.BR isblank ():
.RS 4
_XOPEN_SOURCE\ >=\ 600 || _ISOC99_SOURCE ||
_POSIX_C_SOURCE\ >=\ 200112L;
.br
or
.I cc\ -std=c99
.RE

.BR isalnum_l (),
.BR isalpha_l (),
.BR isblank_l (),
.BR iscntrl_l (),
.BR isdigit_l (),
.BR isgraph_l (),
.BR islower_l (),
.BR isprint_l (),
.BR ispunct_l (),
.BR isspace_l (),
.BR isupper_l (),
.BR isxdigit_l ():
.PD 0
.RS 4
.TP
Since glibc 2.10:
_XOPEN_SOURCE\ >=\ 700
.TP
Before glibc 2.10:
_GNU_SOURCE
.RE
.PD

.BR isascii_l (),
.PD 0
.RS 4
.TP
Since glibc 2.10:
_XOPEN_SOURCE\ >=\ 700 && (_SVID_SOURCE || _BSD_SOURCE)
.TP
Before glibc 2.10:
_GNU_SOURCE
.RE
.PD
.ad
.SH DESCRIPTION
These functions check whether
.IR c ,
which must have the value of an
.I unsigned char
or
.BR EOF ,
falls into a certain character class according to the specified locale.
The functions without the
"_l" suffix perform the check based on the current locale.

The functions with the "_l" suffix perform the check
based on the locale specified by the locale object
.IR locale .
The behavior of these functions is undefined if
.I locale
is the special locale object
.B LC_GLOBAL_LOCALE
(see
.BR duplocale (3))
or is not a valid locale object handle.

The list below explains the operation of the functions without
the "_l" suffix;
the functions with the "_l" suffix differ only in using the locale object
.I locale
instead of the current locale.
.TP
.BR isalnum ()
checks for an alphanumeric character; it is equivalent to
.BI "(isalpha(" c ") || isdigit(" c "))" \fR.
.TP
.BR isalpha ()
checks for an alphabetic character; in the standard \fB"C"\fP
locale, it is equivalent to
.BI "(isupper(" c ") || islower(" c "))" \fR.
In some locales, there may be additional characters for which
.BR isalpha ()
is true\(emletters which are neither uppercase nor lowercase.
.TP
.BR isascii ()
checks whether \fIc\fP is a 7-bit
.I unsigned char
value that fits into
the ASCII character set.
.TP
.BR isblank ()
checks for a blank character; that is, a space or a tab.
.TP
.BR iscntrl ()
checks for a control character.
.TP
.BR isdigit ()
checks for a digit (0 through 9).
.TP
.BR isgraph ()
checks for any printable character except space.
.TP
.BR islower ()
checks for a lowercase character.
.TP
.BR isprint ()
checks for any printable character including space.
.TP
.BR ispunct ()
checks for any printable character which is not a space or an
alphanumeric character.
.TP
.BR isspace ()
checks for white-space characters.
In the
.B """C"""
and
.B """POSIX"""
locales, these are: space, form-feed
.RB ( \(aq\ef\(aq ),
newline
.RB ( \(aq\en\(aq ),
carriage return
.RB ( \(aq\er\(aq ),
horizontal tab
.RB ( \(aq\et\(aq ),
and vertical tab
.RB ( \(aq\ev\(aq ).
.TP
.BR isupper ()
checks for an uppercase letter.
.TP
.BR isxdigit ()
checks for hexadecimal digits, that is, one of
.br
.BR "0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F" .
.SH RETURN VALUE
The values returned are nonzero if the character
.I c
falls into the tested class, and zero if not.
.SH ATTRIBUTES
.SS Multithreading (see pthreads(7))
The
.BR isalnum (),
.BR isalpha (),
.BR isascii (),
.BR isblank (),
.BR iscntrl (),
.BR isdigit (),
.BR isgraph (),
.BR islower (),
.BR isprint (),
.BR ispunct (),
.BR isspace (),
.BR isupper (),
and
.BR isxdigit ()
functions are thread-safe.
.\" FIXME: need a thread-safety statement about the *_l functions
.SH VERSIONS
.BR isalnum_l (),
.BR isalpha_l (),
.BR isblank_l (),
.BR iscntrl_l (),
.BR isdigit_l (),
.BR isgraph_l (),
.BR islower_l (),
.BR isprint_l (),
.BR ispunct_l (),
.BR isspace_l (),
.BR isupper_l (),
.BR isxdigit_l (),
and
.BR isascii_l ()
are available since glibc 2.3.
.SH CONFORMING TO
C89 specifies
.BR isalnum (),
.BR isalpha (),
.BR iscntrl (),
.BR isdigit (),
.BR isgraph (),
.BR islower (),
.BR isprint (),
.BR ispunct (),
.BR isspace (),
.BR isupper (),
and
.BR isxdigit (),
but not
.BR isascii ()
and
.BR isblank ().
POSIX.1-2001
also specifies those functions, and also 
.BR isascii ()
(as an XSI extension)
and
.BR isblank ().
C99 specifies all of the preceding functions, except
.BR isascii ().

POSIX.1-2008 marks
.BR isascii ()
as obsolete,
noting that it cannot be used portably in a localized application.

POSIX.-1-2008 specifies
.BR isalnum_l (),
.BR isalpha_l (),
.BR isblank_l (),
.BR iscntrl_l (),
.BR isdigit_l (),
.BR isgraph_l (),
.BR islower_l (),
.BR isprint_l (),
.BR ispunct_l (),
.BR isspace_l (),
.BR isupper_l (),
and
.BR isxdigit_l ().

.BR isascii_l ()
is a GNU extension.
.SH NOTES
The details of what characters belong to which class depend on the
locale.
For example,
.BR isupper ()
will not recognize an A-umlaut (\(:A) as an uppercase letter in the default
.B "C"
locale.
.SH SEE ALSO
.BR iswalnum (3),
.BR iswalpha (3),
.BR iswblank (3),
.BR iswcntrl (3),
.BR iswdigit (3),
.BR iswgraph (3),
.BR iswlower (3),
.BR iswprint (3),
.BR iswpunct (3),
.BR iswspace (3),
.BR iswupper (3),
.BR iswxdigit (3),
.BR newlocale (3),
.BR setlocale (3),
.BR uselocale (3),
.BR toascii (3),
.BR tolower (3),
.BR toupper (3),
.BR ascii (7),
.BR locale (7)

--------------020003070408050700050000--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
