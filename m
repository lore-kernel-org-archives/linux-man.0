From: Thibault MEYER <thibault.meyer-r+tYf39mQ+Fulxpn9UvDqw@public.gmane.org>
Subject: [manpage] man 3 register_printf_specifier
Date: Sun, 1 Jul 2012 10:08:12 +0200
Message-ID: <CAMQiJFxKcscEXN7G8+05-DWNkUM22EUuMRQS1YS0fD2tDFAd7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

.\" Copyright (c) 2012 Thibault Meyer (thibault.meyer-r+tYf39mQ+Fulxpn9UvDqw@public.gmane.org)
.\"
.\" This is free documentation; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public License as
.\" published by the Free Software Foundation; either version 2 of
.\" the License, or (at your option) any later version.
.\"
.\" The GNU General Public License's references to "object code"
.\" and "executables" are to be interpreted as the output of any
.\" document formatting or typesetting system, including
.\" intermediate and printed output.
.\"
.\" This manual is distributed in the hope that it will be useful,
.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
.\" GNU General Public License for more details.
.\"
.\" You should have received a copy of the GNU General Public
.\" License along with this manual; if not, write to the Free
.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
.\" USA.
.\"
.TH REGISTER_PRINTF_SPECIFIER 3 2011-12-08 "GNU" "Linux Programmer's Manual"
.SH NAME
register_printf_specifier \- Add new format specifier to printf function
.SH SYNOPSIS
.B #include <printf.h>
.sp
.BI "typedef int printf_function (FILE *"stream ",struct printf_info
*" info ", void **"args ");"
.br
.BI "typedef int printf_arginfo_size_function (struct printf_info *"
info ", size_t "n ", int *"argtype ");"
.sp
.sp
.BI "int register_printf_specifier (int "spec ", printf_function "fct
", printf_arginfo_size_function "arginfo ");"
.sp
.SH DESCRIPTION
The function
.BR register_printf_specifier ()
allow developer to extend functionalities of
.BR printf ()
by registering new conversion format
.IR specifier .
Also you can redefine the standard output conversions specifier, but
this is not a good idea.
.SS Parameters
-
.IR spec
is the specifier that you like to implement on printf-family function.
If the specifier is 'B', it defines the conversion '%B'.
.br
-
.IR fct
represent the handler-function called by printf-family functions when
your defined
.IR spec
was found in format string.
.br
-
.IR arginfo
is the function called by
.BR parse_printf_format ()
when your defined
.IR spec
was found in format string.
.SS Return value
The function
.BR register_printf_specifier ()
return
.BR 0
on success and
.BR -1
if an error is encountered.
.sp
.SH BASIC EXAMPLE
Below you can found an basic example how to use
register_printf_specifier() function to implement the 'b' specifier to
allow binary output conversion.
.SS Code
#include <printf.h>

int	my_binary_info(const struct printf_info* info __attribute__
((unused)), size_t n, int* argtype, int* size __attribute__
((unused)))
.br
{}

int	my_binary(FILE *stream, const struct printf_info *info, const void
*const *args)
.br
{}

int	main(void)
.br
{
.br
   register_printf_specifier('b', my_binary, my_binary_info);
.br
   printf("binary: %ld -> %b\n", 65536, 65536);
.br
   printf("binary: %ld -> %b\n", 42, 42);
.br
   printf("binary: %ld -> %b\n", 2, 2);
.br
   return (0);
.br
}
.sp
.SH COLOPHON
This  page  is  part  of  release 3.27 of the Linux
.IR man-pages
project.  A description of the project, and information about
reporting bugs, can be found at http://www.kernel.org/doc/man-pages/.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
