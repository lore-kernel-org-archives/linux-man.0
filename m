From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], mdoc.samples(7): Warnings from [ng]roff, corrections
Date: Tue, 15 May 2012 19:22:23 +0000
Message-ID: <20120515192223.GA15939@rhi.hi.is>
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

  From "man -ww ..." (groff -ww ...):

<standard input>:541: warning: tab character in unquoted macro argument
<standard input>:542: warning: tab character in unquoted macro argument
<standard input>:543: warning: tab character in unquoted macro argument
<standard input>:544: warning: tab character in unquoted macro argument
<standard input>:813: warning: macro `Pu' not defined
Usage: .Rv -std in sections 2 and 3 only (#1669)
mdoc warning: A .Bl directive has no matching .El (#1821)

  String "Pu" defined as a row of punctuations

  ".Bl" and ".El" fixed

  Some arguments, that start with a period or are the name of a
macro, protected with "\&".

  Variable name for macro ".Rv" corrected.

--- mdoc.samples.7	2012-04-26 22:58:40.000000000 +0000
+++ mdoc.samples.7.new	2012-05-15 01:09:17.000000000 +0000
@@ -36,6 +36,8 @@
 .\" times and is guaranteed to give a worst case performance
 .\" for an already extremely slow package.
 .\"
+.\" String \*(Pu was not defined, probably means punctuation
+.ds Pu "[ .,:;()[]?! ]
 .Dd December 30, 1993
 .Os
 .Dt MDOC.SAMPLES 7
@@ -535,10 +537,10 @@
 .\" PS1	UNIX Programmer's Supplementary Documents
 .Pp
 .Bl -column SMM -offset indent -compact
-.It Li AMD	UNIX Ancestral Manual Documents
-.It Li SMM	UNIX System Manager's Manual
-.It Li URM	UNIX Reference Manual
-.It Li PRM	UNIX Programmer's Manual
+.It Li "AMD	UNIX Ancestral Manual Documents"
+.It Li "SMM	UNIX System Manager's Manual"
+.It Li "URM	UNIX Reference Manual"
+.It Li "PRM	UNIX Programmer's Manual"
 .El
 .Pp
 The default volume labeling is
@@ -808,7 +810,7 @@
 of the form addr1[,addr2[,addr3]].
 .Pp
 .Dl Usage: .Ad address ... \*(Pu
-.Bl -tag -width ".Ad f1 , f2 , f3 :" -compact -offset 14n
+.Bl -tag -width "\&.Ad f1 , f2 , f3 :" -compact -offset 14n
 .It Li \&.Ad addr1
 .Ad addr1
 .It Li \&.Ad addr1\ .
@@ -835,7 +837,7 @@
 to be punctuation.
 .Pp
 .Dl Usage: .An author_name \*(Pu
-.Bl -tag -width ".An Joe Author ) ) ," -compact -offset 14n
+.Bl -tag -width "\&.An Joe Author ) ) ," -compact -offset 14n
 .It Li \&.An Joe\ Author
 .An Joe Author
 .It Li \&.An Joe\ Author\ ,
@@ -860,7 +862,7 @@
 a command-line argument is referenced.
 .Pp
 .Dl Usage: .Ar argument ... \*(Pu
-.Bl -tag -width ".Ar file1 file2" -compact -offset 15n
+.Bl -tag -width "\&.Ar file1 file2" -compact -offset 15n
 .It Li \&.Ar
 .Ar
 .It Li \&.Ar file1
@@ -878,7 +880,7 @@
 If
 .Ql \&.Ar
 is called without arguments
-.Ql Ar
+.Ql \&Ar
 is assumed.
 The
 .Ql \&.Ar
@@ -916,7 +918,7 @@
 .Ql \&.Dv .
 .Pp
 .Dl Usage: .Dv defined_variable ... \*(Pu
-.Bl -tag -width ".Dv MAXHOSTNAMELEN" -compact -offset 14n
+.Bl -tag -width "\&.Dv MAXHOSTNAMELEN" -compact -offset 14n
 .It Li ".Dv MAXHOSTNAMELEN"
 .Dv MAXHOSTNAMELEN
 .It Li ".Dv TIOCGPGRP )"
@@ -942,7 +944,7 @@
 a section two manual page.
 .Pp
 .Dl Usage: .Er ERRNOTYPE ... \*(Pu
-.Bl -tag -width ".Bq Er ENOTDIR" -compact -offset 14n
+.Bl -tag -width "\&.Bq Er ENOTDIR" -compact -offset 14n
 .It Li \&.Er ENOENT
 .Er ENOENT
 .It Li \&.Er ENOENT\ )\ ;
@@ -963,7 +965,7 @@
 macro specifies an environment variable.
 .Pp
 .Dl Usage: .Ev argument ... \*(Pu
-.Bl -tag -width ".Ev PRINTER ) ) ," -compact -offset 14n
+.Bl -tag -width "\&.Ev PRINTER ) ) ," -compact -offset 14n
 .It Li \&.Ev DISPLAY
 .Ev  DISPLAY
 .It Li \&.Ev PATH\ .
@@ -999,7 +1001,7 @@
 may also be used to refer to structure members.
 .Pp
 .Dl Usage: .Fa function_argument ... \*(Pu
-.Bl -tag -width ".Fa d_namlen\ )\ )\ ," -compact -offset 14n
+.Bl -tag -width "\&.Fa d_namlen\ )\ )\ ," -compact -offset 14n
 .It Li \&.Fa d_namlen\ )\ )\ ,
 .Fa d_namlen ) ) ,
 .It Li \&.Fa iov_len
@@ -1049,7 +1051,7 @@
 macro is identical, but without the dash.
 .Pp
 .Dl Usage: .Fl argument ... \*(Pu
-.Bl -tag -width ".Fl \-s \-t \-v" -compact -offset 14n
+.Bl -tag -width "\&.Fl \-s \-t \-v" -compact -offset 14n
 .It Li \&.Fl
 .Fl
 .It Li \&.Fl cfv
@@ -1079,7 +1081,7 @@
 .Bd -literal
 Usage: .Fn [type] function [[type] parameters ... \*(Pu]
 .Ed
-.Bl -tag -width ".Fn _int align_ _const * char *sptrsxx" -compact
+.Bl -tag -width "\&.Fn _int align_ _const * char *sptrsxx" -compact
 .It Li "\&.Fn getchar"
 .Fn getchar
 .It Li "\&.Fn strlen ) ,"
@@ -1190,7 +1192,7 @@
 macro designates an interactive or internal command.
 .Pp
 .Dl Usage: .Ic argument ... \*(Pu
-.Bl -tag -width ".Ic setenv , unsetenvxx" -compact -offset 14n
+.Bl -tag -width "\&.Ic setenv , unsetenvxx" -compact -offset 14n
 .It Li \&.Ic :wq
 .Ic :wq
 .It Li \&.Ic do while {...}
@@ -1243,7 +1245,7 @@
 it can not recall the first argument it was invoked with.
 .Pp
 .Dl Usage: .Nm argument ... \*(Pu
-.Bl -tag -width ".Nm mdoc.sample" -compact -offset 14n
+.Bl -tag -width "\&.Nm mdoc.sample" -compact -offset 14n
 .It Li \&.Nm mdoc.sample
 .Nm mdoc.sample
 .It Li \&.Nm \e-mdoc
@@ -1271,7 +1273,7 @@
 may be used across one or more lines.
 .Pp
 .Dl Usage: .Op options ... \*(Pu
-.Bl -tag -width ".Op Fl c Ar objfil Op Ar corfil ," -compact -offset indent
+.Bl -tag -width "\&.Op Fl c Ar objfil Op Ar corfil ," -compact -offset indent
 .It Li \&.Op
 .Op
 .It Li ".Op Fl k"
@@ -1322,7 +1324,7 @@
 macro formats pathnames or filenames.
 .Pp
 .Dl Usage: .Pa pathname \*(Pu
-.Bl -tag -width ".Pa /tmp/fooXXXXX ) ." -compact -offset 14n
+.Bl -tag -width "\&.Pa /tmp/fooXXXXX ) ." -compact -offset 14n
 .It Li \&.Pa /usr/share
 .Pa /usr/share
 .It Li \&.Pa /tmp/fooXXXXX\ )\ .
@@ -1336,7 +1338,7 @@
 Generic variable reference:
 .Pp
 .Dl Usage: .Va variable ... \*(Pu
-.Bl -tag -width ".Va char s ] ) ) ," -compact -offset 14n
+.Bl -tag -width "\&.Va char s ] ) ) ," -compact -offset 14n
 .It Li \&.Va count
 .Va count
 .It Li \&.Va settimer ,
@@ -1363,7 +1365,7 @@
 remaining arguments are assumed to be punctuation.
 .Pp
 .Dl Usage: .Xr man_page [1,...,8] \*(Pu
-.Bl -tag -width ".Xr mdoc 7 ) ) ," -compact -offset 14n
+.Bl -tag -width "\&.Xr mdoc 7 ) ) ," -compact -offset 14n
 .It Li \&.Xr mdoc
 .Xr mdoc
 .It Li \&.Xr mdoc\ ,
@@ -1386,7 +1388,7 @@
 .Bd -literal -offset indent -compact
 Usage: .At [v6 | v7 | 32v | V.1 | V.4] ... \*(Pu
 .Ed
-.Bl -tag -width ".At v6 ) ," -compact -offset 14n
+.Bl -tag -width "\&.At v6 ) ," -compact -offset 14n
 .It Li ".At"
 .At
 .It Li ".At v6 ."
@@ -1403,7 +1405,7 @@
 It accepts at most two arguments.
 .Ss BSD Macro
 .Dl Usage: .Bx [Version/release] ... \*(Pu
-.Bl -tag -width ".Bx 4.3 ) ," -compact -offset 14n
+.Bl -tag -width "\&.Bx 4.3 ) ," -compact -offset 14n
 .It Li ".Bx"
 .Bx
 .It Li ".Bx 4.3 ."
@@ -1417,7 +1419,7 @@
 .Bd -literal -offset indent -compact
 Usage: .Fx Version.release ... \*(Pu
 .Ed
-.Bl -tag -width ".Fx 2.2 ) ," -compact -offset 14n
+.Bl -tag -width "\&.Fx 2.2 ) ," -compact -offset 14n
 .It Li ".Fx 2.2 ."
 .Fx 2.2 .
 .El
@@ -1432,7 +1434,7 @@
 It accepts at most two arguments.
 .Ss UNIX Macro
 .Dl Usage: .Ux ... \*(Pu
-.Bl -tag -width ".Ux 4.3 ) ," -compact -offset 14n
+.Bl -tag -width "\&.Ux 4.3 ) ," -compact -offset 14n
 .It Li ".Ux"
 .Ux
 .El
@@ -1518,7 +1520,7 @@
 .Pp
 .ne 4
 Examples of quoting:
-.Bl -tag -width ".Aq Pa ctype.h ) ,xxxxxxxx" -compact -offset indent
+.Bl -tag -width "\&.Aq Pa ctype.h ) ,xxxxxxxx" -compact -offset indent
 .It Li \&.Aq
 .Aq
 .It Li \&.Aq \&Ar ctype.h\ )\ ,
@@ -1576,7 +1578,7 @@
 macro eliminates unwanted spaces in between macro requests.
 It is useful for old style argument lists where there is no space
 between the flag and argument:
-.Bl -tag -width ".Op Fl I Ns Ar directoryxx" -offset indent
+.Bl -tag -width "\&.Op Fl I Ns Ar directoryxx" -offset indent
 .It Li ".Op Fl I Ns Ar directory"
 produces
 .Op Fl I Ns Ar directory
@@ -1661,11 +1663,13 @@
 .Ql \&.Rv -std atexit
 will generate the following text:
 .Pp
-.\" fake chapter 3 to avoid error message from Rv
-.ds cH 3
+.\" fake section 3 to avoid error message from Rv
+.\".ds cH 3
+.ds section 3
 .Rv -std atexit
 .\" and back to 7 again
-.ds cH 7
+.\".ds cH 7
+.ds section 7
 .Pp
 The
 .Fl std
@@ -1675,7 +1679,7 @@
 all upper case words longer than two characters.
 .Pp
 .Dl Usage: .Tn symbol ... \*(Pu
-.Bl -tag -width ".Tn ASCII" -compact -offset 14n
+.Bl -tag -width "\&.Tn ASCII" -compact -offset 14n
 .It Li \&.Tn DEC
 .Tn DEC
 .It Li \&.Tn ASCII
@@ -1815,7 +1819,7 @@
 .Ql \&.Sh
 macro can take up to nine arguments.
 It is parsed and but is not callable.
-.Bl -tag -width ".Sh SYNOPSIS"
+.Bl -tag -width "\&.Sh SYNOPSIS"
 .It \&.Sh NAME
 The
 .Ql \&.Sh NAME
@@ -1868,6 +1872,7 @@
 configuration device usage macro.
 Several other macros may be necessary to produce
 the synopsis line as shown below:
+.El
 .Pp
 .Bd -filled -offset indent
 .Nm cat
@@ -1902,6 +1907,7 @@
 .Sx PREDEFINED STRINGS
 for a usable \*(Ba
 character in other situations.
+.Bl -tag
 .It \&.Sh DESCRIPTION
 In most cases the first text in the
 .Sx DESCRIPTION
@@ -2233,6 +2239,7 @@
 The display-type must be one of the following four types and
 may have an offset specifier for indentation:
 .Ql \&.Bd .
+.El
 .Pp
 .Bl -tag -width "file file_name  " -compact
 .It Fl ragged
@@ -2291,7 +2298,6 @@
 work and perhaps may never do the right thing by
 .Xr troff .
 .El
-.El
 .It ".Ed"
 End-display.
 .El
@@ -2305,7 +2311,7 @@
 The usual font for emphasis is italic.
 .Pp
 .Dl Usage: .Em argument ... \*(Pu
-.Bl -tag -width ".Em vide infra ) ) ," -compact -offset 14n
+.Bl -tag -width "\&.Em vide infra ) ) ," -compact -offset 14n
 .It Li ".Em does not"
 .Em does not
 .It Li ".Em exceed 1024 ."
@@ -2328,7 +2334,7 @@
 would be typed.
 .Pp
 .Dl Usage: .Li argument ... \*(Pu
-.Bl -tag -width ".Li cntrl-D ) ,"  -compact -offset 14n
+.Bl -tag -width "\&.Li cntrl-D ) ,"  -compact -offset 14n
 .It Li \&.Li \een
 .Li \en
 .It Li \&.Li M1 M2 M3\ ;
@@ -2347,10 +2353,9 @@
 either the symbolic sense or the traditional English usage.
 .Pp
 .Dl Usage: .Sy symbol ... \*(Pu
-.Bl -tag -width ".Sy Important Noticex" -compact -offset 14n
+.Bl -tag -width "\&.Sy Important Noticex" -compact -offset 14n
 .It Li \&.Sy Important Notice
 .Sy Important Notice
-.El
 .Pp
 The
 .Ql \&.Sy
@@ -2358,6 +2363,7 @@
 Arguments to
 .Ql \&.Sy
 may be quoted.
+.El
 .It Li \&.Bf
 Begin font mode.
 The
@@ -2444,6 +2450,7 @@
 \&Lastly item three goes here.
 \&.El
 .Ed
+.El
 .Pp
 The results:
 .Pp
@@ -2474,6 +2481,7 @@
 Bullet two here.
 .El
 .Pp
+.Bl -ohang -compact
 .It Fl tag
 .It Fl diag
 .It Fl hang
@@ -2491,13 +2499,14 @@
 .Em tagged .
 This
 list was constructed with the
-.Ql Fl ohang
+.Ql \&Fl ohang
 list-type.
 The
 .Ql \&.It
 macro is parsed only for the inset, hang
 and tag list-types and is not callable.
 Here is an example of inset labels:
+.El
 .Bl -inset -offset indent
 .It Em Tag
 The tagged list (also called a tagged paragraph) is the
@@ -2621,7 +2630,6 @@
 again, the width is set to the constant width of the string
 given.
 .El
-.El
 .Pp
 If a width is not specified for the tag list type, the first
 time

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
