From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], mdoc.samples(7): Warnings from [ng]roff, corrections
Date: Thu, 7 Jun 2012 23:53:54 +1200
Message-ID: <CAKgNAkgOiEwCVjyWnmLK0U3YT1qUwBQGVYNvRTZwG477nr6-AA@mail.gmail.com>
References: <20120515192223.GA15939@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120515192223.GA15939-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Bjarni,

On Wed, May 16, 2012 at 7:22 AM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "man -ww ..." (groff -ww ...):
>
> <standard input>:541: warning: tab character in unquoted macro argume=
nt
> <standard input>:542: warning: tab character in unquoted macro argume=
nt
> <standard input>:543: warning: tab character in unquoted macro argume=
nt
> <standard input>:544: warning: tab character in unquoted macro argume=
nt
> <standard input>:813: warning: macro `Pu' not defined
> Usage: .Rv -std in sections 2 and 3 only (#1669)
> mdoc warning: A .Bl directive has no matching .El (#1821)
>
> =A0String "Pu" defined as a row of punctuations
>
> =A0".Bl" and ".El" fixed
>
> =A0Some arguments, that start with a period or are the name of a
> macro, protected with "\&".
>
> =A0Variable name for macro ".Rv" corrected.


Thanks. Applied for 3.42.

Cheers,

Michael


> --- mdoc.samples.7 =A0 =A0 =A02012-04-26 22:58:40.000000000 +0000
> +++ mdoc.samples.7.new =A02012-05-15 01:09:17.000000000 +0000
> @@ -36,6 +36,8 @@
> =A0.\" times and is guaranteed to give a worst case performance
> =A0.\" for an already extremely slow package.
> =A0.\"
> +.\" String \*(Pu was not defined, probably means punctuation
> +.ds Pu "[ .,:;()[]?! ]
> =A0.Dd December 30, 1993
> =A0.Os
> =A0.Dt MDOC.SAMPLES 7
> @@ -535,10 +537,10 @@
> =A0.\" PS1 =A0 =A0 =A0 =A0UNIX Programmer's Supplementary Documents
> =A0.Pp
> =A0.Bl -column SMM -offset indent -compact
> -.It Li AMD =A0 =A0 UNIX Ancestral Manual Documents
> -.It Li SMM =A0 =A0 UNIX System Manager's Manual
> -.It Li URM =A0 =A0 UNIX Reference Manual
> -.It Li PRM =A0 =A0 UNIX Programmer's Manual
> +.It Li "AMD =A0 =A0UNIX Ancestral Manual Documents"
> +.It Li "SMM =A0 =A0UNIX System Manager's Manual"
> +.It Li "URM =A0 =A0UNIX Reference Manual"
> +.It Li "PRM =A0 =A0UNIX Programmer's Manual"
> =A0.El
> =A0.Pp
> =A0The default volume labeling is
> @@ -808,7 +810,7 @@
> =A0of the form addr1[,addr2[,addr3]].
> =A0.Pp
> =A0.Dl Usage: .Ad address ... \*(Pu
> -.Bl -tag -width ".Ad f1 , f2 , f3 :" -compact -offset 14n
> +.Bl -tag -width "\&.Ad f1 , f2 , f3 :" -compact -offset 14n
> =A0.It Li \&.Ad addr1
> =A0.Ad addr1
> =A0.It Li \&.Ad addr1\ .
> @@ -835,7 +837,7 @@
> =A0to be punctuation.
> =A0.Pp
> =A0.Dl Usage: .An author_name \*(Pu
> -.Bl -tag -width ".An Joe Author ) ) ," -compact -offset 14n
> +.Bl -tag -width "\&.An Joe Author ) ) ," -compact -offset 14n
> =A0.It Li \&.An Joe\ Author
> =A0.An Joe Author
> =A0.It Li \&.An Joe\ Author\ ,
> @@ -860,7 +862,7 @@
> =A0a command-line argument is referenced.
> =A0.Pp
> =A0.Dl Usage: .Ar argument ... \*(Pu
> -.Bl -tag -width ".Ar file1 file2" -compact -offset 15n
> +.Bl -tag -width "\&.Ar file1 file2" -compact -offset 15n
> =A0.It Li \&.Ar
> =A0.Ar
> =A0.It Li \&.Ar file1
> @@ -878,7 +880,7 @@
> =A0If
> =A0.Ql \&.Ar
> =A0is called without arguments
> -.Ql Ar
> +.Ql \&Ar
> =A0is assumed.
> =A0The
> =A0.Ql \&.Ar
> @@ -916,7 +918,7 @@
> =A0.Ql \&.Dv .
> =A0.Pp
> =A0.Dl Usage: .Dv defined_variable ... \*(Pu
> -.Bl -tag -width ".Dv MAXHOSTNAMELEN" -compact -offset 14n
> +.Bl -tag -width "\&.Dv MAXHOSTNAMELEN" -compact -offset 14n
> =A0.It Li ".Dv MAXHOSTNAMELEN"
> =A0.Dv MAXHOSTNAMELEN
> =A0.It Li ".Dv TIOCGPGRP )"
> @@ -942,7 +944,7 @@
> =A0a section two manual page.
> =A0.Pp
> =A0.Dl Usage: .Er ERRNOTYPE ... \*(Pu
> -.Bl -tag -width ".Bq Er ENOTDIR" -compact -offset 14n
> +.Bl -tag -width "\&.Bq Er ENOTDIR" -compact -offset 14n
> =A0.It Li \&.Er ENOENT
> =A0.Er ENOENT
> =A0.It Li \&.Er ENOENT\ )\ ;
> @@ -963,7 +965,7 @@
> =A0macro specifies an environment variable.
> =A0.Pp
> =A0.Dl Usage: .Ev argument ... \*(Pu
> -.Bl -tag -width ".Ev PRINTER ) ) ," -compact -offset 14n
> +.Bl -tag -width "\&.Ev PRINTER ) ) ," -compact -offset 14n
> =A0.It Li \&.Ev DISPLAY
> =A0.Ev =A0DISPLAY
> =A0.It Li \&.Ev PATH\ .
> @@ -999,7 +1001,7 @@
> =A0may also be used to refer to structure members.
> =A0.Pp
> =A0.Dl Usage: .Fa function_argument ... \*(Pu
> -.Bl -tag -width ".Fa d_namlen\ )\ )\ ," -compact -offset 14n
> +.Bl -tag -width "\&.Fa d_namlen\ )\ )\ ," -compact -offset 14n
> =A0.It Li \&.Fa d_namlen\ )\ )\ ,
> =A0.Fa d_namlen ) ) ,
> =A0.It Li \&.Fa iov_len
> @@ -1049,7 +1051,7 @@
> =A0macro is identical, but without the dash.
> =A0.Pp
> =A0.Dl Usage: .Fl argument ... \*(Pu
> -.Bl -tag -width ".Fl \-s \-t \-v" -compact -offset 14n
> +.Bl -tag -width "\&.Fl \-s \-t \-v" -compact -offset 14n
> =A0.It Li \&.Fl
> =A0.Fl
> =A0.It Li \&.Fl cfv
> @@ -1079,7 +1081,7 @@
> =A0.Bd -literal
> =A0Usage: .Fn [type] function [[type] parameters ... \*(Pu]
> =A0.Ed
> -.Bl -tag -width ".Fn _int align_ _const * char *sptrsxx" -compact
> +.Bl -tag -width "\&.Fn _int align_ _const * char *sptrsxx" -compact
> =A0.It Li "\&.Fn getchar"
> =A0.Fn getchar
> =A0.It Li "\&.Fn strlen ) ,"
> @@ -1190,7 +1192,7 @@
> =A0macro designates an interactive or internal command.
> =A0.Pp
> =A0.Dl Usage: .Ic argument ... \*(Pu
> -.Bl -tag -width ".Ic setenv , unsetenvxx" -compact -offset 14n
> +.Bl -tag -width "\&.Ic setenv , unsetenvxx" -compact -offset 14n
> =A0.It Li \&.Ic :wq
> =A0.Ic :wq
> =A0.It Li \&.Ic do while {...}
> @@ -1243,7 +1245,7 @@
> =A0it can not recall the first argument it was invoked with.
> =A0.Pp
> =A0.Dl Usage: .Nm argument ... \*(Pu
> -.Bl -tag -width ".Nm mdoc.sample" -compact -offset 14n
> +.Bl -tag -width "\&.Nm mdoc.sample" -compact -offset 14n
> =A0.It Li \&.Nm mdoc.sample
> =A0.Nm mdoc.sample
> =A0.It Li \&.Nm \e-mdoc
> @@ -1271,7 +1273,7 @@
> =A0may be used across one or more lines.
> =A0.Pp
> =A0.Dl Usage: .Op options ... \*(Pu
> -.Bl -tag -width ".Op Fl c Ar objfil Op Ar corfil ," -compact -offset=
 indent
> +.Bl -tag -width "\&.Op Fl c Ar objfil Op Ar corfil ," -compact -offs=
et indent
> =A0.It Li \&.Op
> =A0.Op
> =A0.It Li ".Op Fl k"
> @@ -1322,7 +1324,7 @@
> =A0macro formats pathnames or filenames.
> =A0.Pp
> =A0.Dl Usage: .Pa pathname \*(Pu
> -.Bl -tag -width ".Pa /tmp/fooXXXXX ) ." -compact -offset 14n
> +.Bl -tag -width "\&.Pa /tmp/fooXXXXX ) ." -compact -offset 14n
> =A0.It Li \&.Pa /usr/share
> =A0.Pa /usr/share
> =A0.It Li \&.Pa /tmp/fooXXXXX\ )\ .
> @@ -1336,7 +1338,7 @@
> =A0Generic variable reference:
> =A0.Pp
> =A0.Dl Usage: .Va variable ... \*(Pu
> -.Bl -tag -width ".Va char s ] ) ) ," -compact -offset 14n
> +.Bl -tag -width "\&.Va char s ] ) ) ," -compact -offset 14n
> =A0.It Li \&.Va count
> =A0.Va count
> =A0.It Li \&.Va settimer ,
> @@ -1363,7 +1365,7 @@
> =A0remaining arguments are assumed to be punctuation.
> =A0.Pp
> =A0.Dl Usage: .Xr man_page [1,...,8] \*(Pu
> -.Bl -tag -width ".Xr mdoc 7 ) ) ," -compact -offset 14n
> +.Bl -tag -width "\&.Xr mdoc 7 ) ) ," -compact -offset 14n
> =A0.It Li \&.Xr mdoc
> =A0.Xr mdoc
> =A0.It Li \&.Xr mdoc\ ,
> @@ -1386,7 +1388,7 @@
> =A0.Bd -literal -offset indent -compact
> =A0Usage: .At [v6 | v7 | 32v | V.1 | V.4] ... \*(Pu
> =A0.Ed
> -.Bl -tag -width ".At v6 ) ," -compact -offset 14n
> +.Bl -tag -width "\&.At v6 ) ," -compact -offset 14n
> =A0.It Li ".At"
> =A0.At
> =A0.It Li ".At v6 ."
> @@ -1403,7 +1405,7 @@
> =A0It accepts at most two arguments.
> =A0.Ss BSD Macro
> =A0.Dl Usage: .Bx [Version/release] ... \*(Pu
> -.Bl -tag -width ".Bx 4.3 ) ," -compact -offset 14n
> +.Bl -tag -width "\&.Bx 4.3 ) ," -compact -offset 14n
> =A0.It Li ".Bx"
> =A0.Bx
> =A0.It Li ".Bx 4.3 ."
> @@ -1417,7 +1419,7 @@
> =A0.Bd -literal -offset indent -compact
> =A0Usage: .Fx Version.release ... \*(Pu
> =A0.Ed
> -.Bl -tag -width ".Fx 2.2 ) ," -compact -offset 14n
> +.Bl -tag -width "\&.Fx 2.2 ) ," -compact -offset 14n
> =A0.It Li ".Fx 2.2 ."
> =A0.Fx 2.2 .
> =A0.El
> @@ -1432,7 +1434,7 @@
> =A0It accepts at most two arguments.
> =A0.Ss UNIX Macro
> =A0.Dl Usage: .Ux ... \*(Pu
> -.Bl -tag -width ".Ux 4.3 ) ," -compact -offset 14n
> +.Bl -tag -width "\&.Ux 4.3 ) ," -compact -offset 14n
> =A0.It Li ".Ux"
> =A0.Ux
> =A0.El
> @@ -1518,7 +1520,7 @@
> =A0.Pp
> =A0.ne 4
> =A0Examples of quoting:
> -.Bl -tag -width ".Aq Pa ctype.h ) ,xxxxxxxx" -compact -offset indent
> +.Bl -tag -width "\&.Aq Pa ctype.h ) ,xxxxxxxx" -compact -offset inde=
nt
> =A0.It Li \&.Aq
> =A0.Aq
> =A0.It Li \&.Aq \&Ar ctype.h\ )\ ,
> @@ -1576,7 +1578,7 @@
> =A0macro eliminates unwanted spaces in between macro requests.
> =A0It is useful for old style argument lists where there is no space
> =A0between the flag and argument:
> -.Bl -tag -width ".Op Fl I Ns Ar directoryxx" -offset indent
> +.Bl -tag -width "\&.Op Fl I Ns Ar directoryxx" -offset indent
> =A0.It Li ".Op Fl I Ns Ar directory"
> =A0produces
> =A0.Op Fl I Ns Ar directory
> @@ -1661,11 +1663,13 @@
> =A0.Ql \&.Rv -std atexit
> =A0will generate the following text:
> =A0.Pp
> -.\" fake chapter 3 to avoid error message from Rv
> -.ds cH 3
> +.\" fake section 3 to avoid error message from Rv
> +.\".ds cH 3
> +.ds section 3
> =A0.Rv -std atexit
> =A0.\" and back to 7 again
> -.ds cH 7
> +.\".ds cH 7
> +.ds section 7
> =A0.Pp
> =A0The
> =A0.Fl std
> @@ -1675,7 +1679,7 @@
> =A0all upper case words longer than two characters.
> =A0.Pp
> =A0.Dl Usage: .Tn symbol ... \*(Pu
> -.Bl -tag -width ".Tn ASCII" -compact -offset 14n
> +.Bl -tag -width "\&.Tn ASCII" -compact -offset 14n
> =A0.It Li \&.Tn DEC
> =A0.Tn DEC
> =A0.It Li \&.Tn ASCII
> @@ -1815,7 +1819,7 @@
> =A0.Ql \&.Sh
> =A0macro can take up to nine arguments.
> =A0It is parsed and but is not callable.
> -.Bl -tag -width ".Sh SYNOPSIS"
> +.Bl -tag -width "\&.Sh SYNOPSIS"
> =A0.It \&.Sh NAME
> =A0The
> =A0.Ql \&.Sh NAME
> @@ -1868,6 +1872,7 @@
> =A0configuration device usage macro.
> =A0Several other macros may be necessary to produce
> =A0the synopsis line as shown below:
> +.El
> =A0.Pp
> =A0.Bd -filled -offset indent
> =A0.Nm cat
> @@ -1902,6 +1907,7 @@
> =A0.Sx PREDEFINED STRINGS
> =A0for a usable \*(Ba
> =A0character in other situations.
> +.Bl -tag
> =A0.It \&.Sh DESCRIPTION
> =A0In most cases the first text in the
> =A0.Sx DESCRIPTION
> @@ -2233,6 +2239,7 @@
> =A0The display-type must be one of the following four types and
> =A0may have an offset specifier for indentation:
> =A0.Ql \&.Bd .
> +.El
> =A0.Pp
> =A0.Bl -tag -width "file file_name =A0" -compact
> =A0.It Fl ragged
> @@ -2291,7 +2298,6 @@
> =A0work and perhaps may never do the right thing by
> =A0.Xr troff .
> =A0.El
> -.El
> =A0.It ".Ed"
> =A0End-display.
> =A0.El
> @@ -2305,7 +2311,7 @@
> =A0The usual font for emphasis is italic.
> =A0.Pp
> =A0.Dl Usage: .Em argument ... \*(Pu
> -.Bl -tag -width ".Em vide infra ) ) ," -compact -offset 14n
> +.Bl -tag -width "\&.Em vide infra ) ) ," -compact -offset 14n
> =A0.It Li ".Em does not"
> =A0.Em does not
> =A0.It Li ".Em exceed 1024 ."
> @@ -2328,7 +2334,7 @@
> =A0would be typed.
> =A0.Pp
> =A0.Dl Usage: .Li argument ... \*(Pu
> -.Bl -tag -width ".Li cntrl-D ) ," =A0-compact -offset 14n
> +.Bl -tag -width "\&.Li cntrl-D ) ," =A0-compact -offset 14n
> =A0.It Li \&.Li \een
> =A0.Li \en
> =A0.It Li \&.Li M1 M2 M3\ ;
> @@ -2347,10 +2353,9 @@
> =A0either the symbolic sense or the traditional English usage.
> =A0.Pp
> =A0.Dl Usage: .Sy symbol ... \*(Pu
> -.Bl -tag -width ".Sy Important Noticex" -compact -offset 14n
> +.Bl -tag -width "\&.Sy Important Noticex" -compact -offset 14n
> =A0.It Li \&.Sy Important Notice
> =A0.Sy Important Notice
> -.El
> =A0.Pp
> =A0The
> =A0.Ql \&.Sy
> @@ -2358,6 +2363,7 @@
> =A0Arguments to
> =A0.Ql \&.Sy
> =A0may be quoted.
> +.El
> =A0.It Li \&.Bf
> =A0Begin font mode.
> =A0The
> @@ -2444,6 +2450,7 @@
> =A0\&Lastly item three goes here.
> =A0\&.El
> =A0.Ed
> +.El
> =A0.Pp
> =A0The results:
> =A0.Pp
> @@ -2474,6 +2481,7 @@
> =A0Bullet two here.
> =A0.El
> =A0.Pp
> +.Bl -ohang -compact
> =A0.It Fl tag
> =A0.It Fl diag
> =A0.It Fl hang
> @@ -2491,13 +2499,14 @@
> =A0.Em tagged .
> =A0This
> =A0list was constructed with the
> -.Ql Fl ohang
> +.Ql \&Fl ohang
> =A0list-type.
> =A0The
> =A0.Ql \&.It
> =A0macro is parsed only for the inset, hang
> =A0and tag list-types and is not callable.
> =A0Here is an example of inset labels:
> +.El
> =A0.Bl -inset -offset indent
> =A0.It Em Tag
> =A0The tagged list (also called a tagged paragraph) is the
> @@ -2621,7 +2630,6 @@
> =A0again, the width is set to the constant width of the string
> =A0given.
> =A0.El
> -.El
> =A0.Pp
> =A0If a width is not specified for the tag list type, the first
> =A0time
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
