From: Kasparek Tomas <kasparek-AzIEtyGJxgYp1Coe8Ar9gA@public.gmane.org>
Subject: New man pages as students' projects
Date: Tue, 14 May 2013 11:09:23 +0200
Message-ID: <20130514090923.GV12900@fit.vutbr.cz>
References: <20120229072547.GE5054@fit.vutbr.cz>
 <CAKgNAkg_RDeH+N0mJxP7XF6mP9qRTxPhdYybSvHse7knQxknUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WgiIge0Euz4ksITr"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkg_RDeH+N0mJxP7XF6mP9qRTxPhdYybSvHse7knQxknUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--WgiIge0Euz4ksITr
Content-Type: multipart/mixed; boundary="k+UaUX7feRqSnTdd"
Content-Disposition: inline


--k+UaUX7feRqSnTdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2012 at 07:04:10AM +1300, Michael Kerrisk (man-pages) wrote:
> > as a part of a course on FIT BUT, students few students are requested to
> > create new man pages based on
> >
> > http://www.kernel.org/doc/man-pages/missing_pages.html
> > What is the best/easiest way to get the results used/get included?
>=20
> See here:
> http://www.kernel.org/doc/man-pages/contributing.html

Hello,

I send another bunch of man pages from our students for revisions.

Best regards

--=20

  Tomas Kasparek               E-mail: kasparek-AzIEtyGJxgYp1Coe8Ar9gA@public.gmane.org
  CVT FIT VUT Brno, L127       Web:    http://www.fit.vutbr.cz/~kasparek
  Bozetechova 1, 612 66        Fax:    +420 54114-1270
  Brno, Czech Republic         Phone:  +420 54114-1220

  jabber: tomas.kasparek-2ASvDZBniIelVyrhU4qvOw@public.gmane.org
  GPG:    2F1E 1AAF FD3B CFA3 1537  63BD DCBE 18FF A035 53BC

  May the command line live forever!

--k+UaUX7feRqSnTdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hostalias.3"

.\" Copyright (c) 2013 by Josef Lusticky (josef-SK7Uk42+BjXtwjQa/ONI9g@public.gmane.org)
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
.TH HOSTALIAS 3  2013-03-20 "GNU" "Linux Programmer's Manual"
.SH NAME
hostalias \- search for host alias
.SH SYNOPSIS
.nf
.B #include <resolv.h>
.sp
.BI "const char *hostalias(const char *name)
.fi
.sp
Link with \fI\-lresolv\fP.
.SH DESCRIPTION
.BR hostalias ()
searches for host with alias
.IR name
in the alias file pointed to by the environment variable
.BR HOSTALIASES .
Aliases in the file specified by the environment variable
.BR HOSTALIASES
are kept in the form:
.RS
host alias
.RE
.SH RETURN VALUE
.BR hostalias ()
returns the name of host if found. Otherwise, a null pointer is returned.
.SH SEE ALSO
.BR gethostbyname (3),
.BR getenv (3)

--k+UaUX7feRqSnTdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="parse_printf_format.3"

.\" Copyright (c) 2013 by Tomas Korec (korec.tomas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
.\" Based on printf.h, printf-prs.c source codes and The GNU C Library manual.
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
.TH PARSE_PRINTF_FORMAT 3 2013-03-18 "Linux" "Linux Programmer's Manual"
.SH NAME
parse_printf_format \- parse types of arguments from printf format
.SH SYNOPSIS
.nf
.B #include <printf.h>
.sp
.BI "size_t parse_printf_format(const char * " fmt ", size_t " n ", int * " argtypes );
.fi
.SH DESCRIPTION
.BR parse_printf_format ()
parses the template string
.IR fmt
and provides information about the number and types of arguments needed for the conversions specified by
.IR fmt .
The information is stored in the array
.IR argtypes ,
at most
.IR n
elements will be stored. Each element of this array describes one argument.
.PP
The information about arguments is encoded using the 'PA_' macros:
.TP 11
.B PA_INT
specifies that the base type is
.B int
.TP
.B PA_CHAR
specifies that the base type is
.B int,
cast to
.B char
.TP
.B PA_STRING
specifies that the base type is
.B char *,
a null-terminated string
.TP
.B PA_POINTER
specifies that the base type is
.B void *,
an arbitrary pointer
.TP
.B PA_FLOAT
specifies that the base type is
.B float
.TP
.B PA_DOUBLE
specifies that the base type is
.B double
.TP
.B PA_LAST
a new type can be defined as an offset from
.B PA_LAST.
For example, new data types 'foo' and 'bar' could be defined as:
.br
.B #define PA_FOO PA_LAST
.br
.B #define PA_BAR (PA_LAST + 1)
.PP
A basic type can be modified by the following flag bits using inclusive-or:
.TP 20
.B PA_FLAG_MASK
is a bitmask for the type modifier flag bits. For example, expression
.B (argtypes[i] & PA_FLAG_MASK)
extracts only the flag bits for an argument and expression
.B (argtypes[i] & ~PA_FLAG_MASK)
extracts only the basic type code.
.TP
.B PA_FLAG_PTR
indicates that the encoded type is a pointer to the base type. For example,
.B 'PA_INT|PA_FLAG_PTR'
represents the type
.B 'int *'.
.TP
.B PA_FLAG_SHORT
indicates that the base type is modified with
.B short.
(This corresponds to the
.B 'h'
type modifier.)
.TP
.B PA_FLAG_LONG
indicates that the base type is modified with
.B long.
(This corresponds to the
.B 'l'
type modifier.)
.TP
.B PA_FLAG_LONG_LONG
indicates that the base type is modified with
.B long long.
(This corresponds to the
.B 'L'
type modifier.)
.TP
.B PA_FLAG_LONG_DOUBLE
synonym for
.B PA_FLAG_LONG_LONG,
used by convention with a base type of
.B PA_DOUBLE
to indicate a type of
.B long double.
.SH RETURN VALUE
Function returns the total number of arguments required by
.IR fmt .
If this number is greater than
.IR n ,
the information returned describes only the first
.IR n
arguments.
.SH SEE ALSO
.BR printf (3),
.BR stdarg (3)

--k+UaUX7feRqSnTdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="re_match.3"
Content-Transfer-Encoding: quoted-printable

=2E\" Copyright (c) 2013 by David Spurek (spurek.d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
=2E\"
=2E\" %%%LICENSE_START(GPLv2+_DOC_FULL)
=2E\" This is free documentation; you can redistribute it and/or
=2E\" modify it under the terms of the GNU General Public License as
=2E\" published by the Free Software Foundation; either version 2 of
=2E\" the License, or (at your option) any later version.
=2E\"
=2E\" The GNU General Public License's references to "object code"
=2E\" and "executables" are to be interpreted as the output of any
=2E\" document formatting or typesetting system, including
=2E\" intermediate and printed output.
=2E\"
=2E\" This manual is distributed in the hope that it will be useful,
=2E\" but WITHOUT ANY WARRANTY; without even the implied warranty of
=2E\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
=2E\" GNU General Public License for more details.
=2E\"
=2E\" You should have received a copy of the GNU General Public
=2E\" License along with this manual; if not, see
=2E\" <http://www.gnu.org/licenses/>.
=2E\" %%%LICENSE_END
=2E\"
=2E\" Example and informations are taken from=20
=2E\" <http://www.inf.enst.fr/~demaille/a2ps/doc-4.10>
=2E\"
=2ETH RE_MATCH 3  2013-03-17 "GNU" "Linux Programmer's Manual"
=2ESH NAME
re_match \- searches for a match in a string using a named regular expressi=
on
=2ESH SYNOPSIS
=2Enf
=2EB #include <regex.h>
=2Esp
=2EBI "int re_match (struct re_pattern_buffer " "*pattern_buffer" ","
=2EBI "const char "  "*string"  ", const int "  "size" ","
=2EBI "const int " "start" ", struct re_registers "  "*regs" );
=2Efi
=2ESH DESCRIPTION
=2EPP
The
=2EBR re_match ()
function trying to match as much of a=20
=2EI string
as possible starting at a position within it you specify.
Once you've compiled a pattern into a pattern buffer
(using=20
=2EBR re_compile_pattern()
or
=2EBR re_create()
function), you can ask the matcher to match that pattern against
a
=2EI string
using=20
=2EBR re_match ().
=2ESS Explanation of the input parameters
=2ETP
=2EB pattern_buffer
is the address of a pattern buffer containing a compiled pattern.=20
=2ETP
=2EB string
is the string you want to match; it can contain newline and
null characters.=20
=2ETP
=2EB size
is the length of that string.=20
=2ETP
=2EB start
is the string index at which you want to begin matching;
the first character of string is at index zero.=20
=2ETP
=2EB regs
is a group in regular expression that can match
a (posssibly empty) substring of the string that regular
expression as a whole matched. The matcher remembers the
beginning and end of the substring matched by each group.
To find out what they matched, pass a nonzero regs argument.
For more informations see
=2EBR re_registers ()
function.
=2ESH RETURN VALUE
The
=2EBR re_match ()
function returns -1 if the compiled pattern does not
match any part of string and -2 if an internal
error happens; otherwise, it returns how many
(possibly zero) characters of string the pattern matched.
=2ESH EXAMPLE
Suppose=20
=2EI pattern_buffer
points to a pattern buffer containing
the compiled pattern for 'a*', and
=2EI string
points to 'aaaaab' (where upon
=2EI size
should be 6).
Then if
=2EI start
is 2,=20
=2EBR re_match ()
returns 3, i.e., 'a*' would have matched the last
three a's in
=2EI string.
If=20
=2EI start
is 0,=20
=2EBR re_match ()
returns 5, i.e., 'a*' would have matched all the
'a's in
=2EI string.
If=20
=2EI start=20
is either 5 or 6, it returns zero.
If=20
=2EI start
is not between zero and=20
=2EI size
, then=20
=2EBR re_match ()
returns -1.
=2ESH SEE ALSO
=2EBR regcomp (3),
=2EBR regex (7),
GNU regex manual

--k+UaUX7feRqSnTdd
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: attachment; filename="register_printf_function.3"
Content-Transfer-Encoding: quoted-printable

=2E\" Manpage for register_printf_function.
=2E\" Contact xdohna25-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org to correct errors or typos.
=2ETH REGISTER_PRINTF_FUNCTION 3 2013-03-15 "GNU" "Linux Programmer's Manua=
l"
=2ESH NAME
register_printf_function \- register a new output conversion
=2ESH SYNOPSIS
=2Enf
=2EB #include <printf.h>
=2Esp
=2EBI "typedef int printf_function (FILE *"__stream ,
=2EBI "                             const struct printf_info *"__info ,
=2EBI "                             const void *const *"__args );
=2Esp
=2EBI "typedef int printf_arginfo_function (const struct printf_info *"__in=
fo ,
=2EBI "                                     size_t " __n ", int *"__argtype=
s );
=2Esp
=2EBI "int register_printf_function (int " spec ,
=2EBI "                              printf_function " handler_f,
=2EBI "                              printf_arginfo_function " arginfo_f );
=2ESH DESCRIPTION
The
=2EBR register_printf_function ()
function defines (or redefines) the conversion specifier for
=2EBR printf (3)
template strings.
=2EPP
The argument
=2EI spec
is conversion specifier to be defined.=20
It is advisable not to use lowercase letter, since the ISO C standard
warns that additional lowercase letters may be standardized in future
editions of the standard.
Furthermore flag characters like '#' and type modifiers like 'l' are
ignored.
=2EPP
The argument
=2EI handler_f
is the function called by
=2EBR printf (3)
and friends when this conversion appears in a template string.=20
The=20
=2EI stream
argument passed to the handler function is the stream to which it
should write output.=20
The
=2EI info
argument is a pointer to a structure that contains information about the
various options that were included with the conversion in the template
string.=20
You should not modify this structure inside your handler function.
The
=2EI args
is a vector of pointers to the arguments data.
The number of arguments was determined by calling the argument information
function provided by the user.=20
Handler function should return a value just like printf does: it should
return the number of characters it has written, or a negative value to
indicate an error.
=2EPP
The
=2EI arginfo_f
is the function called by
=2EBR parse_printf_format (3)
when this conversion appears in a template string.
The return value from the function should be the number of arguments the
conversion expects.
The function should also fill in no more than
=2EI n
elements of the
=2EI argtypes
array with information about the types of each of these arguments.
This information is encoded using the various =E2=80=98PA_=E2=80=99 macros.
=2ESH RETURN VALUE
The function=20
=2EBR register_printf_function ()
returns 0 on success, and -1 on failure.
=2ESH VERSIONS
In the GNU C Library versions before 2.0 the=20
=2EI arginfo_f
function did not need to be installed unless the user used the
=2EBR parse_printf_format (3)
function.
This has changed.
Now a call to any of the
=2EBR printf (3)
functions will call this function when this format specifier appears=20
in the format string.
=2ESH CONFORMING TO
The ability to extend the syntax of=20
=2EBR printf (3)
template strings is a GNU extension.
=2ESH SEE ALSO
=2EBR printf (3),=20
=2EBR parse_printf_format (3)

--k+UaUX7feRqSnTdd--

--WgiIge0Euz4ksITr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (FreeBSD)

iEYEARECAAYFAlGR/0MACgkQFiofPpFRnYigwACeIifM3fpM82vN3AmvBqE497PO
ZFsAoKSv1lRj/DWsxCRs6a+gMeKEqOSw
=8ncE
-----END PGP SIGNATURE-----

--WgiIge0Euz4ksITr--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
