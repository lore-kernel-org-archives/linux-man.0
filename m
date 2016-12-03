From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add strfrom.3
Date: Sat, 3 Dec 2016 15:14:09 +0100
Message-ID: <c5d0be31-9c1d-000a-89ac-a18909ef4ac5@gmail.com>
References: <ac388dba-b7e4-b33e-7c43-eda88a8e4ac5@gmail.com>
 <20161202195509.10640-1-wainersm@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161202195509.10640-1-wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Wainer,

Thanks!

This is a very nice first draft. I have a just a few minor suggestions.

1. Name the page "strfromd", rather than "strfrom" (and adjust the
link files accordingly, and also the .TH within the file).
I suggest this, because this is a typical pattern used in many 
other pages.

2. Please make this into a patch series, if possible, with the 
link files each as a separate patch.

3. Add some patches that add strfromd(3) to the SEE ALSO
section of other pages, such as printf(3) and atod(3).

Are these functions affected by the locale settings?
There should be a statement about this in this page.

On 12/02/2016 08:55 PM, Wainer dos Santos Moschetta wrote:
> 
> The ISO/IEC TS 18661-1 specifies the strfrom() class
> of functions that convert a float-point value to string.
> 
> The strfromd(), strfromf(), and strfroml() functions are
> introduced (commit 6962682ffe5e) in GNU C Library 2.25.
> 
> Signed-off-by: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man3/strfrom.3  | 220 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  man3/strfromd.3 |   1 +
>  man3/strfromf.3 |   1 +
>  man3/strfroml.3 |   1 +
>  4 files changed, 223 insertions(+)
>  create mode 100644 man3/strfrom.3
>  create mode 100644 man3/strfromd.3
>  create mode 100644 man3/strfromf.3
>  create mode 100644 man3/strfroml.3
-- 
> diff --git a/man3/strfrom.3 b/man3/strfrom.3
> new file mode 100644
> index 0000000..fdc15cc
> --- /dev/null
> +++ b/man3/strfrom.3
> @@ -0,0 +1,220 @@
> +.\" Copyright (c) 2016, IBM Corporation.
> +.\" Written by Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.\"
> +.\" References consulted:
> +.\"   Glibc 2.25 source code and manual.
> +.\"   C99 standard document.
> +.\"   ISO/IEC TS 18661-1 technical specification.
> +.\"   snprintf and other man.3 pages.
> +.\"
> +.TH STRFROM 3 2016-12-02 "GNU C Library"

So, make this "STRFROMD".

> +.SH NAME
> +strfromd, strfromf, strfroml \- convert a floating-point value into a string.
> +.SH SYNOPSIS
> +.B #include <stdlib.h>
> +.sp
> +.BI "int strfromd (char * restrict " str ", size_t " n ", const char * restrict " format ", double " fp ");"

Please wrap these long declarations, and remove the space after "*":

.BI "int strfromd (char *restrict " str ", size_t " n ,
.BI "              const char *restrict " format ", double " fp ");"

> +.sp
> +.BI "int strfromf (char * restrict " str ", size_t " n ", const char * restrict " format ", float "fp ");"
> +.sp
> +.BI "int strfroml (char * restrict " str ", size_t " n ", const char * restrict " format ", long double " fp ");"
> +.sp
> +.in -4
> +Feature Test Macro Requirements for glibc (see
> +.BR feature_test_macros (7)):
> +.in
> +.sp
> +.ad l
> +.BR strfromd (),
> +.BR strfromf (),
> +.BR strfroml ():
> +.RS 4
> +__STDC_WANT_IEC_60559_BFP_EXT__
> +.RE
> +.ad b
> +.SH DESCRIPTION
> +The
> +.BR strfrom ()
> +class of functions converts a floating-point value
> +.I fp
> +into a string of characters
> +.IR str ,
> +with a configurable
> +.IR format
> +string. At most

Please start new sentences on new source lines. (And the same for 
many instances below.)

> +.I n
> +characters are stored into
> +.IR str .
> +.sp
> +The terminating null character ('\\0') is written if and only if
> +.I n
> +is sufficiently large, otherwise the written string is truncated at
> +.I n
> +characters.
> +.sp
> +The
> +.BR strfromd (),
> +.BR strfromf (),
> +and
> +.BR strfroml ()
> +functions are equivalent to
> +.sp
> +.in +4
> +.BI "snprintf (str,  n, format, fp)"
> +.in
> +.sp
> +except for the
> +.I format
> +string.
> +.SS Format of the format string
> +The
> +.I format
> +string must start with the character %. This is followed by an optional precision which starts with period character (.), followed by an optional 
decimal integer. If no integer is specified after the period character, the precision used is zero. Finally, it should have one of the conversion specifiers

Please wrap source lines to a maximum of 75 characters, and start new sentence on new lines.

> +.BR a ,
> +.BR A ,
> +.BR e ,
> +.BR E ,
> +.BR f ,
> +.BR F ,
> +.BR g ,
> +or
> +.BR G .
> +.sp
> +The conversion specifier is applied based on the floating-point type indicated by the function suffix. Therefore, unlike
> +.BR snprintf (),
> +the format string does not have a length modifier character. See
> +.BR snprintf (3)
> +for a detailed description of these conversion specifiers.
> +.sp
> +The implementation conforms to C99 standard on conversion of NaN and infinity values:

sto/to the/

> +.sp
> +.in +4
> +If
> +.I fp
> +is a NaN, +NaN, or -NaN, and
> +.BR f
> +(or
> +.BR a ,
> +.BR e ,
> +.BR g )
> +is the conversion specifier, the conversion is to "nan", "nan", "-nan", respectively. If

s/"-nan"/or "-nan"/

> +.B F
> +(or
> +.BR A ,
> +.BR E ,
> +.BR G )
> +is the conversion specifier, the conversion is to "NAN" or "-NAN".
> +.sp
> +Likewise if
> +.I fp
> +is infinity, it is converted to [-]inf or [-]INF.
> +.in
> +.sp
> +A malformed
> +.I format
> +string results in undefined behavior.
> +.SH RETURN VALUE
> +The
> +.BR strfromd (),
> +.BR strfromf (),
> +and
> +.BR strfroml ()
> +functions return the number of characters that would have been written in
> +.I str
> +if
> +.I n
> +had enough space,
> +not counting the terminating null character. Thus, a return value of
> +.I n
> +or more means that the output was truncated.

s/more/greater/

> +.SH VERSIONS
> +The
> +.BR strfromd (),
> +.BR strfromf (),
> +and
> +.BR strfroml ()
> +functions are available in glibc since version 2.25.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7)
> +and

s/and/and the/

> +.B POSIX Safety Concepts
> +section in GNU C Library manual.
> +.sp
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR strfromd (),
> +.BR strfromf (),
> +.BR strfroml ()
> +T}	Thread safety	MT-Safe locale
> +\^	Asynchronous signal safety	AS-Unsafe heap
> +\^	Asynchronous cancellation safety	AC-Unsafe mem
> +.TE
> +.sp
> +Note: these attributes are preliminary.
> +.SH CONFORMING TO
> +C99, ISO/IEC TS 18661-1.
> +.SH EXAMPLES
> +To convert the 12.1 value as a float type to string using decimal notation, resulting in "12.100000":

s/the 12.1 value/the value 12.1/

(And various other similar fixes below.)

> +.sp
> +.in +4
> +.nf
> +#define __STDC_WANT_IEC_60559_BFP_EXT__
> +#include <stdlib.h>
> +int ssize = 10;
> +char *s = (char *) malloc (ssize);

s/malloc /malloc/

(And again below.)

> +strfromf (s, ssize, "%f", 12.1);
> +.fi
> +.in
> +.sp
> +To convert the 12.3456 value as a float type to string using decimal notation with two digits of precision, resulting in "12.35":

s/string/a string/

> +.sp
> +.in +4
> +.nf
> +#define __STDC_WANT_IEC_60559_BFP_EXT__
> +#include <stdlib.h>
> +int ssize = 10;
> +char *s = (char *) malloc (ssize);
> +strfromf (s, ssize, "%.2f", 12.3456);
> +.fi
> +.in
> +.sp
> +To convert the 12.345e19 value as a double type to string using scientific notation with zero digits of precision, resulting in "1E+20":
> +.sp
> +.in +4
> +.nf
> +#define __STDC_WANT_IEC_60559_BFP_EXT__
> +#include <stdlib.h>
> +int ssize = 10;
> +char *s = (char *) malloc (ssize);
> +strfromd (s, ssize, "%.E", 12.345e19);
> +.fi
> +.in
> +.SH SEE ALSO

Add "atod(3)" here.

> +.BR snprintf (3)
> diff --git a/man3/strfromd.3 b/man3/strfromd.3
> new file mode 100644
> index 0000000..7d8d5e4
> --- /dev/null
> +++ b/man3/strfromd.3
> @@ -0,0 +1 @@
> +.so man3/strfrom.3

Remove the above

> diff --git a/man3/strfromf.3 b/man3/strfromf.3
> new file mode 100644
> index 0000000..7d8d5e4
> --- /dev/null
> +++ b/man3/strfromf.3
> @@ -0,0 +1 @@
> +.so man3/strfrom.3

s/strfrom/strfromd/

> diff --git a/man3/strfroml.3 b/man3/strfroml.3
> new file mode 100644
> index 0000000..7d8d5e4
> --- /dev/null
> +++ b/man3/strfroml.3
> @@ -0,0 +1 @@
> +.so man3/strfrom.3

s/strfrom/strfromd/

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
