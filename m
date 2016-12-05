From: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 1/6] Add strfromd.3
Date: Mon,  5 Dec 2016 16:30:33 -0200
Message-ID: <22cf57d5501526616e3f63d00102ce7cbf7e7287.1480961953.git.wainersm@linux.vnet.ibm.com>
References: <c5d0be31-9c1d-000a-89ac-a18909ef4ac5@gmail.com>
 <cover.1480961953.git.wainersm@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1480961953.git.wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.1480961953.git.wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
References: <cover.1480961953.git.wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The ISO/IEC TS 18661-1 specifies the strfrom() class
of functions that convert a float-point value to string.

The strfromd(), strfromf(), and strfroml() functions are
introduced (commit 6962682ffe5e) in GNU C Library 2.25.

Signed-off-by: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man3/strfromd.3 | 255 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)
 create mode 100644 man3/strfromd.3

diff --git a/man3/strfromd.3 b/man3/strfromd.3
new file mode 100644
index 0000000..4b1aced
--- /dev/null
+++ b/man3/strfromd.3
@@ -0,0 +1,255 @@
+.\" Copyright (c) 2016, IBM Corporation.
+.\" Written by Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
+.\"
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided that
+.\" the entire resulting derived work is distributed under the terms of
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume.
+.\" no responsibility for errors or omissions, or for damages resulting.
+.\" from the use of the information contained herein.  The author(s) may.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when working.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.\"
+.\" References consulted:
+.\"   Glibc 2.25 source code and manual.
+.\"   C99 standard document.
+.\"   ISO/IEC TS 18661-1 technical specification.
+.\"   snprintf and other man.3 pages.
+.\"
+.TH STRFROMD 3 2016-12-02 "GNU C Library"
+.SH NAME
+strfromd, strfromf, strfroml \- convert a floating-point value into
+a string.
+.SH SYNOPSIS
+.B #include <stdlib.h>
+.sp
+.BI "int strfromd (char *restrict " str ", size_t " n ",
+.br
+.BI "              const char *restrict " format ", double " fp ");"
+.br
+.BI "int strfromf (char *restrict " str ", size_t " n ",
+.br
+.BI "              const char *restrict " format ", float "fp ");"
+.br
+.BI "int strfroml (char *restrict " str ", size_t " n ",
+.br
+.BI "              const char *restrict " format ", long double " fp ");"
+.sp
+.in -4
+Feature Test Macro Requirements for glibc (see
+.BR feature_test_macros (7)):
+.in
+.sp
+.ad l
+.BR strfromd (),
+.BR strfromf (),
+.BR strfroml ():
+.RS 4
+__STDC_WANT_IEC_60559_BFP_EXT__
+.RE
+.ad b
+.SH DESCRIPTION
+The
+.BR strfrom ()
+class of functions converts a floating-point value
+.I fp
+into a string of characters
+.IR str ,
+with a configurable
+.IR format
+string.
+At most
+.I n
+characters are stored into
+.IR str .
+.sp
+The terminating null character ('\\0') is written if and only if
+.I n
+is sufficiently large, otherwise the written string is truncated at
+.I n
+characters.
+.sp
+The
+.BR strfromd (),
+.BR strfromf (),
+and
+.BR strfroml ()
+functions are equivalent to
+.sp
+.in +4
+.BI "snprintf (str,  n, format, fp)"
+.in
+.sp
+except for the
+.I format
+string.
+.SS Format of the format string
+The
+.I format
+string must start with the character %.
+This is followed by an optional precision which starts with period
+character (.), followed by an optional decimal integer.
+If no integer is specified after the period character, the precision used
+is zero.
+Finally, it should have one of the conversion specifiers
+.BR a ,
+.BR A ,
+.BR e ,
+.BR E ,
+.BR f ,
+.BR F ,
+.BR g ,
+or
+.BR G .
+.sp
+The conversion specifier is applied based on the floating-point type
+indicated by the function suffix.
+Therefore, unlike
+.BR snprintf (),
+the format string does not have a length modifier character.
+See
+.BR snprintf (3)
+for a detailed description of these conversion specifiers.
+.sp
+The implementation conforms to the C99 standard on conversion of NaN and
+infinity values:
+.sp
+.in +4
+If
+.I fp
+is a NaN, +NaN, or -NaN, and
+.BR f
+(or
+.BR a ,
+.BR e ,
+.BR g )
+is the conversion specifier, the conversion is to "nan", "nan", or "-nan",
+respectively.
+If
+.B F
+(or
+.BR A ,
+.BR E ,
+.BR G )
+is the conversion specifier, the conversion is to "NAN" or "-NAN".
+.sp
+Likewise if
+.I fp
+is infinity, it is converted to [-]inf or [-]INF.
+.in
+.sp
+A malformed
+.I format
+string results in undefined behavior.
+.SH RETURN VALUE
+The
+.BR strfromd (),
+.BR strfromf (),
+and
+.BR strfroml ()
+functions return the number of characters that would have been written in
+.I str
+if
+.I n
+had enough space,
+not counting the terminating null character.
+Thus, a return value of
+.I n
+or greater means that the output was truncated.
+.SH VERSIONS
+The
+.BR strfromd (),
+.BR strfromf (),
+and
+.BR strfroml ()
+functions are available in glibc since version 2.25.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7)
+and the
+.B POSIX Safety Concepts
+section in GNU C Library manual.
+.sp
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR strfromd (),
+.BR strfromf (),
+.BR strfroml ()
+T}	Thread safety	MT-Safe locale
+\^	Asynchronous signal safety	AS-Unsafe heap
+\^	Asynchronous cancellation safety	AC-Unsafe mem
+.TE
+.sp
+Note: these attributes are preliminary.
+.SH CONFORMING TO
+C99, ISO/IEC TS 18661-1.
+.SH NOTES
+The behavior of
+.BR strfromd (),
+.BR strfromf (),
+and
+.BR strfroml ()
+functions depends on the
+.B LC_NUMERIC
+category of the current locale.
+
+.SH EXAMPLES
+To convert the value 12.1 as a float type to a string using decimal
+notation, resulting in "12.100000":
+.sp
+.in +4
+.nf
+#define __STDC_WANT_IEC_60559_BFP_EXT__
+#include <stdlib.h>
+int ssize = 10;
+char *s = (char *) malloc(ssize);
+strfromf(s, ssize, "%f", 12.1);
+.fi
+.in
+.sp
+To convert the value 12.3456 as a float type to a string using
+decimal notation with two digits of precision, resulting in "12.35":
+.sp
+.in +4
+.nf
+#define __STDC_WANT_IEC_60559_BFP_EXT__
+#include <stdlib.h>
+int ssize = 10;
+char *s = (char *) malloc(ssize);
+strfromf(s, ssize, "%.2f", 12.3456);
+.fi
+.in
+.sp
+To convert the value 12.345e19 as a double type to a string using
+scientific notation with zero digits of precision, resulting in "1E+20":
+.sp
+.in +4
+.nf
+#define __STDC_WANT_IEC_60559_BFP_EXT__
+#include <stdlib.h>
+int ssize = 10;
+char *s = (char *) malloc(ssize);
+strfromd(s, ssize, "%.E", 12.345e19);
+.fi
+.in
+.SH SEE ALSO
+.BR atof (3),
+.BR snprintf (3),
+.BR strtod (3)
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
