From: David Malcolm <dmalcolm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Quarantine "gets.3" into its own "do not use" manpage
Date: Wed, 13 Nov 2013 14:20:34 -0500
Message-ID: <1384370434.15325.33.camel@surprise>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Y+rXpITIEER8/pxSVFyK"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-Y+rXpITIEER8/pxSVFyK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently man3/gets.3 documents various safe I/O functions, along with
the toxic "gets" function.

At the risk of being melodramatic, this strikes me as akin to storing
rat poison in a food cabinet, in the same style of packaging as the
food, but with a post-it note on it saying "see warnings below".

I think such "never use this" functions should be quarantined into their
own manpages, rather than listing them alongside sane functions.

The attached patch does this for "gets", moving the documentation of the
good functions from man3/gets.3 into man3/fgetc.3, updating the SO links
in the relevant functions to point at the latter.

It then rewrites man3/gets.3 to spell out that "gets" is toxic and
should never be used (with a link to CWE-242 for good measure).

Thoughts?
Dave

[Note to self: I filed this downstream as:
https://bugzilla.redhat.com/show_bug.cgi?id=1030030 ]



--=-Y+rXpITIEER8/pxSVFyK
Content-Disposition: attachment; filename="die-gets-die.patch"
Content-Type: text/x-patch; name="die-gets-die.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

commit b80d17cf9cee57ab88d8d2b1bf01a2d82aef26e8
Author: David Malcolm <dmalcolm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Nov 13 14:14:58 2013 -0500

    Move gets.3 into its own page and more clearly label it as toxic

diff --git a/man3/fgetc.3 b/man3/fgetc.3
index 4636db7..d8eef50 100644
--- a/man3/fgetc.3
+++ b/man3/fgetc.3
@@ -1 +1,150 @@
-.so man3/gets.3
+.\" Copyright (c) 1993 by Thomas Koenig (ig25-L38z05uLna+pU24hk/rHShvVK+yQ3ZXh@public.gmane.org)
+.\"
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.\"
+.\" Modified Wed Jul 28 11:12:07 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
+.\" Modified Fri Sep  8 15:48:13 1995 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
+.TH FGETC 3  2012-01-18 "GNU" "Linux Programmer's Manual"
+.SH NAME
+fgetc, fgets, getc, getchar, ungetc \- input of characters and strings
+.SH SYNOPSIS
+.nf
+.B #include <stdio.h>
+.sp
+.BI "int fgetc(FILE *" stream );
+
+.BI "char *fgets(char *" "s" ", int " "size" ", FILE *" "stream" );
+
+.BI "int getc(FILE *" stream );
+
+.B "int getchar(void);"
+
+.BI "int ungetc(int " c ", FILE *" stream );
+.fi
+.SH DESCRIPTION
+.BR fgetc ()
+reads the next character from
+.I stream
+and returns it as an
+.I unsigned char
+cast to an
+.IR int ,
+or
+.B EOF
+on end of file or error.
+.PP
+.BR getc ()
+is equivalent to
+.BR fgetc ()
+except that it may be implemented as a macro which evaluates
+.I stream
+more than once.
+.PP
+.BR getchar ()
+is equivalent to
+.BI "getc(" stdin ) \fR.
+.PP
+.BR fgets ()
+reads in at most one less than
+.I size
+characters from
+.I stream
+and stores them into the buffer pointed to by
+.IR s .
+Reading stops after an
+.B EOF
+or a newline.
+If a newline is read, it is stored into the buffer.
+A terminating null byte (\(aq\e0\(aq)
+is stored after the last character in the buffer.
+.PP
+.BR ungetc ()
+pushes
+.I c
+back to
+.IR stream ,
+cast to
+.IR "unsigned char" ,
+where it is available for subsequent read operations.
+Pushed-back characters
+will be returned in reverse order; only one pushback is guaranteed.
+.PP
+Calls to the functions described here can be mixed with each other and with
+calls to other input functions from the
+.I stdio
+library for the same input stream.
+.PP
+For nonlocking counterparts, see
+.BR unlocked_stdio (3).
+.SH RETURN VALUE
+.BR fgetc (),
+.BR getc ()
+and
+.BR getchar ()
+return the character read as an
+.I unsigned char
+cast to an
+.I int
+or
+.B EOF
+on end of file or error.
+.PP
+.BR fgets ()
+returns
+.I s
+on success, and NULL
+on error or when end of file occurs while no characters have been read.
+.PP
+.BR ungetc ()
+returns
+.I c
+on success, or
+.B EOF
+on error.
+.SH CONFORMING TO
+C89, C99, POSIX.1-2001.
+
+.PP
+It is not advisable to mix calls to input functions from the
+.I stdio
+library with low-level calls to
+.BR read (2)
+for the file descriptor associated with the input stream; the results
+will be undefined and very probably not what you want.
+.SH SEE ALSO
+.BR read (2),
+.BR write (2),
+.BR ferror (3),
+.BR fgetwc (3),
+.BR fgetws (3),
+.BR fopen (3),
+.BR fread (3),
+.BR fseek (3),
+.BR getline (3),
+.BR getwchar (3),
+.BR puts (3),
+.BR gets (3),
+.BR scanf (3),
+.BR ungetwc (3),
+.BR unlocked_stdio (3),
+.BR feature_test_macros (7)
diff --git a/man3/fgets.3 b/man3/fgets.3
index 4636db7..2f6585a 100644
--- a/man3/fgets.3
+++ b/man3/fgets.3
@@ -1 +1 @@
-.so man3/gets.3
+.so man3/fgetc.3
diff --git a/man3/getc.3 b/man3/getc.3
index 4636db7..2f6585a 100644
--- a/man3/getc.3
+++ b/man3/getc.3
@@ -1 +1 @@
-.so man3/gets.3
+.so man3/fgetc.3
diff --git a/man3/getchar.3 b/man3/getchar.3
index 4636db7..2f6585a 100644
--- a/man3/getchar.3
+++ b/man3/getchar.3
@@ -1 +1 @@
-.so man3/gets.3
+.so man3/fgetc.3
diff --git a/man3/gets.3 b/man3/gets.3
index 85747ef..96abb20 100644
--- a/man3/gets.3
+++ b/man3/gets.3
@@ -26,46 +26,16 @@
 .\" Modified Fri Sep  8 15:48:13 1995 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .TH GETS 3  2012-01-18 "GNU" "Linux Programmer's Manual"
 .SH NAME
-fgetc, fgets, getc, getchar, gets, ungetc \- input of characters and strings
+gets \- Unsafe function; do not use (see
+.BR fgets ()
+instead).
 .SH SYNOPSIS
 .nf
 .B #include <stdio.h>
 .sp
-.BI "int fgetc(FILE *" stream );
-
-.BI "char *fgets(char *" "s" ", int " "size" ", FILE *" "stream" );
-
-.BI "int getc(FILE *" stream );
-
-.B "int getchar(void);"
-
 .BI "char *gets(char *" "s" );
-
-.BI "int ungetc(int " c ", FILE *" stream );
 .fi
 .SH DESCRIPTION
-.BR fgetc ()
-reads the next character from
-.I stream
-and returns it as an
-.I unsigned char
-cast to an
-.IR int ,
-or
-.B EOF
-on end of file or error.
-.PP
-.BR getc ()
-is equivalent to
-.BR fgetc ()
-except that it may be implemented as a macro which evaluates
-.I stream
-more than once.
-.PP
-.BR getchar ()
-is equivalent to
-.BI "getc(" stdin ) \fR.
-.PP
 .BR gets ()
 reads a line from
 .I stdin
@@ -75,69 +45,17 @@ until either a terminating newline or
 .BR EOF ,
 which it replaces with a null byte (\(aq\e0\(aq).
 No check for buffer overrun is performed (see BUGS below).
-.PP
-.BR fgets ()
-reads in at most one less than
-.I size
-characters from
-.I stream
-and stores them into the buffer pointed to by
-.IR s .
-Reading stops after an
-.B EOF
-or a newline.
-If a newline is read, it is stored into the buffer.
-A terminating null byte (\(aq\e0\(aq)
-is stored after the last character in the buffer.
-.PP
-.BR ungetc ()
-pushes
-.I c
-back to
-.IR stream ,
-cast to
-.IR "unsigned char" ,
-where it is available for subsequent read operations.
-Pushed-back characters
-will be returned in reverse order; only one pushback is guaranteed.
-.PP
-Calls to the functions described here can be mixed with each other and with
-calls to other input functions from the
-.I stdio
-library for the same input stream.
-.PP
-For nonlocking counterparts, see
-.BR unlocked_stdio (3).
+
 .SH RETURN VALUE
-.BR fgetc (),
-.BR getc ()
-and
-.BR getchar ()
-return the character read as an
-.I unsigned char
-cast to an
-.I int
-or
-.B EOF
-on end of file or error.
-.PP
 .BR gets ()
-and
-.BR fgets ()
-return
+is supposed to return
 .I s
 on success, and NULL
 on error or when end of file occurs while no characters have been read.
-.PP
-.BR ungetc ()
-returns
-.I c
-on success, or
-.B EOF
-on error.
-.SH CONFORMING TO
-C89, C99, POSIX.1-2001.
+However, given the lack of buffer overrun checking, there can be no
+guarantees that the function will even return.
 
+.SH CONFORMING TO
 LSB deprecates
 .BR gets ().
 POSIX.1-2008 marks
@@ -163,14 +81,18 @@ It has been used to break computer security.
 Use
 .BR fgets ()
 instead.
-.PP
-It is not advisable to mix calls to input functions from the
-.I stdio
-library with low-level calls to
-.BR read (2)
-for the file descriptor associated with the input stream; the results
-will be undefined and very probably not what you want.
+
+For more information, see CWE-242 (aka "Use of Inherently Dangerous
+Function") at
+http://cwe.mitre.org/data/definitions/242.html
+
 .SH SEE ALSO
+
+.BR fgetc (3),
+.BR fgets (3),
+.BR getc (3),
+.BR getchar (3),
+.BR ungetc(3),
 .BR read (2),
 .BR write (2),
 .BR ferror (3),
diff --git a/man3/ungetc.3 b/man3/ungetc.3
index 4636db7..2f6585a 100644
--- a/man3/ungetc.3
+++ b/man3/ungetc.3
@@ -1 +1 @@
-.so man3/gets.3
+.so man3/fgetc.3

--=-Y+rXpITIEER8/pxSVFyK--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
