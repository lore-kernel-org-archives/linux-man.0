From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.1: New page for iconv(1)
Date: Tue, 10 Jun 2014 21:28:54 +0200
Message-ID: <53975C76.7060302@gmail.com>
References: <5396C41B.2040707@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5396C41B.2040707-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 06/10/2014 10:38 AM, Marko Myllynen wrote:
> Hi,
>=20
> while updating the locale pages I noticed there was no iconv(1) page
> in upstream so I wrote one, please see below.

Thanks for doing this. Could I ask you to look at the comments below, a=
nd send
a revised version, please.

>>From 006b3e251ae3883b3652bfb3f32a8d72ba803960 Mon Sep 17 00:00:00 200=
1
> From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Mon, 9 Jun 2014 08:09:57 +0300
> Subject: [PATCH] iconv.1: New page for iconv(1)
>=20
> ---
>  man1/iconv.1 |  156 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++
>  1 files changed, 156 insertions(+), 0 deletions(-)
>  create mode 100644 man1/iconv.1
>=20
> diff --git a/man1/iconv.1 b/man1/iconv.1
> new file mode 100644
> index 0000000..ece7e6a
> --- /dev/null
> +++ b/man1/iconv.1
> @@ -0,0 +1,156 @@
> +'\" t -*- coding: UTF-8 -*-
> +.\"
> +.\" Copyright (C) 2014 Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.\" %%%LICENSE_END
> +.\"
> +.TH ICONV 1 2014-06-06 "GNU" "Linux User Manual"
> +.SH NAME
> +iconv \- convert text from one character encoding to another
> +.SH SYNOPSIS
> +.B iconv
> +.RI [ options ]
> +.RI "[-f " from-encoding "]"
> +.RI "[-t " to-encoding "]"
> +.RI [ inputfile ]...
> +.SH DESCRIPTION
> +The
> +.B iconv
> +program reads in text in one encoding and outputs the text in anothe=
r
> +encoding. If no input files are given, or if it is given as a dash (=
\-),
             ^
Please always start new sentences on new source lines.

> +.B iconv
> +reads from the standard input. If no output file is given,
                                  ^

> +.B iconv
> +writes to the standard output.
> +.PP
> +If no
> +.I from-encoding
> +is given, the default is derived from the current locale.
> +If no
> +.I to-encoding
> +is given, the default is derived from the current locale.

Maybe some more precision here is warranted? How is the
default derived?

> +.SH OPTIONS
> +.TP
> +.BI \-f " from-encoding" ", \-\-from-code=3D" from-encoding
> +Use
> +.I from-encoding
> +for input characters.
> +.TP
> +.BI \-t " to-encoding" ", \-\-to-code=3D" to-encoding
> +Use
> +.I to-encoding
> +for output characters.
> +
> +If
> +.I to-encoding
> +is appended with
> +.BR //IGNORE ,
> +characters that cannot be converted are discarded and an error is
> +printed after conversion.
> +
> +If
> +.I to-encoding
> +is appended with
> +.BR //TRANSLIT ,
> +characters being converted are transliterated when needed and possib=
le.
> +Characters that are outside of the target character set and cannot b=
e
> +transliterated are replaced with the question mark (?) in the output=
=2E

s/the/a/

> +.TP
> +.B "\-l, \-\-list"
> +List all known character set encodings.
> +.TP
> +.B "\-c"
> +Silently discard characters that cannot be converted instead of
> +aborting on them.

What does "aborting on them" mean? Does the program terminate?

> +.TP
> +.BI \-o " outputfile" ", \-\-output=3D" outputfile
> +Use
> +.I outputfile
> +for output.
> +.TP
> +.B "\-s, \-\-silent"
> +This option is ignored, it is provided only for compatibility.
> +.TP
> +.B "\-\-verbose"
> +Print progress information on the standard error when processing

s/the//

> +multiple files.
> +.TP
> +.B "\-\-help"
> +Print a usage summary and exit.
> +.TP
> +.B "\-\-usage"
> +Print a short usage summary and exit.
> +.TP
> +.B "\-V, \-\-version"
> +Print the version number, license, and disclaimer of warranty for
> +.BR iconv .
> +.SH EXIT STATUS
> +Zero on success, non-zero on errors.
> +.SH ENVIRONMENT
> +The
> +.B iconv
> +program supports any character set for which a
> +corresponding gconv configuration and module are provided for.

I think a sentence to explain "gconv configuration" is in order.
The reader otherwise is a bit lost at this point.

> +By default the system provided gconv configuration and modules

s/default/default,/

> +are used but

s/used/used,/

> +.B GCONV_PATH
> +can be defined as a list of pathnames, separated by colons (\(aq:\(a=
q),
> +for gconv configuration and module search path,
> +to be searched prior to the system provided configuration and module=
s.
> +If
> +.B GCONV_PATH
> +is set, the system gconv module configuration cache (created by
> +.BR iconvconfig (8))
> +will not be used. Only directories containing the
                      ^

> +.I gconv-modules
> +configuration files will be looked for the specified gconv modules.

s/looked/searched/

> +.SH FILES
> +.TP
> +.I /usr/lib/gconv
> +Usual default gconv module path.
> +.TP
> +.I /usr/lib/gconv/gconv-modules
> +Usual default gconv module configuration.
> +.TP
> +.I /usr/lib/gconv/gconv-modules.cache
> +Usual default gconv module configuration cache.
> +.SH CONFORMING TO
> +POSIX.1-2001.
> +.SH EXAMPLE
> +Convert text from the ISO 8859-15 character encoding to UTF-8
> +encoding:
> +.PP
> +.RS
> +iconv \-f ISO\-8859\-15 -t UTF\-8 < input.txt > output.txt
> +.RE
> +.PP
> +The next example converts from UTF-8 to ASCII, transliterating when
> +possible, resulting "abc ss ? EUR abc" printed (without quotes) to t=
he
> +standard output:

Here, rather than explaining what the output would be, simply show
a shell session with command and the output.

Cheers,

Michael


> +.PP
> +.RS
> +echo abc =C3=9F =CE=B1 =E2=82=AC =C3=A0=E1=B8=83=C3=A7 | iconv \-f U=
TF\-8 \-t ASCII//TRANSLIT
> +.RE
> +.SH "SEE ALSO"
> +.BR locale (1),
> +.BR charsets (7),
> +.BR iconvconfig (8)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
