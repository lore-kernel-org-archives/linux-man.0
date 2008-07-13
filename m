From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: math_error.7 page for review
Date: Sun, 13 Jul 2008 18:24:09 +0200
Message-ID: <487A2C29.8060303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andries (and others),

I'd appreciate comments on the following, especially the FIXMES.

Cheers,

Michael


.\" Copyright (c) 2008, Linux Foundation, written by Michael Kerrisk
.\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
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
.\"
.TH MATH_ERROR 7 2008-07-15 "Linux" "Linux Programmer's Manual"
.SH NAME
math_error \- detecting errors from mathematical functions
.SH DESCRIPTION
The common convention of returning \-1 on error does not carry over well
to mathematical functions
(i.e., those declared in
.IR <math.h> )
since: \-1 may be a valid success return;
and many mathematical functions return a floating-point result.
Therefore, most mathematical functions use a different convention,
described in this page, for indicating errors.

A program that needs to check for an error from a mathematical
function should set
.I errno
to zero, and make the following call
.in +4n
.nf

feclearexcept(FE_ALL_EXCEPT);

.fi
.in
before calling a mathematical function.

Upon return from the mathematical function, if
.I errno
is non-zero, or the following call (see
.BR fenv (3))
returns non-zero
.in +4n
.nf

fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
              FE_UNDERFLOW);

.fi
.in
.\" enum
.\" {
.\" FE_INVALID = 0x01,
.\" __FE_DENORM = 0x02,
.\" FE_DIVBYZERO = 0x04,
.\" FE_OVERFLOW = 0x08,
.\" FE_UNDERFLOW = 0x10,
.\" FE_INEXACT = 0x20
.\" };
then an error occurred in the mathematical function.
.\" FIXME My understanding is that you must check *both* errno and
.\" fetestexcep() and an error has occurred if *either* of them
.\" is non-zero.  SUSv3 seems a little ambiguous on this point.
.\" I'd appreciate confirmation/contradiction that my understanding
.\" is correct.

The error conditions that can occur for mathematical functions
are described below.
.SS Domain Error
A
.I domain error
occurs when a mathematical function is supplied with an argument whose
value falls outside the domain for which the mathematical function
is defined (e.g., giving a negative argument to a logarithm function).
When a domain error occurs,
.I errno
is set to
.BR EDOM .
.SS Pole Error
A
.I pole error
occurs if the mathematical result of a function is an exact infinity
(e.g., the logarithm of 0 is negative infinity).
When a pole error occurs,
the function returns the value
.BR HUGE_VAL ,
.BR HUGE_VALF ,
or
.BR HUGE_VALL ,
depending on whether the function result type is
.IR double ,
.IR float ,
or
.IR "long double" .
The sign of the result is that which is mathematically correct for
the function.
.I errno
is set to
.BR ERANGE .
.SS Range Error
A
.I range error
occurs when the magnitude of the function result means that it
cannot be represented in the result type of the function.
When a range error occurs,
.I errno
is set to
.BR ERANGE .
The return value of the function depends on whether the range error
was an overflow or an underflow.

A floating result
.I overflows
if the  result is finite,
but is too large to represented in the result type.
When an overflow occurs, the function returns the value
.BR HUGE_VAL ,
.BR HUGE_VALF ,
or
.BR HUGE_VALL ,
depending on whether the function result type is
.IR double ,
.IR float ,
or
.IR "long double" .

A floating result
.I underflows
if the result is too small to be represented in the result type
without extraordinary roundoff error.
If an underflow occurs,
the mathematical function returns an implementation-defined value
whose magnitude is no greater than the smallest normalized
positive number of the result type.
.SH NOTES
.\" FIXME I'd appreciate confirmation on the following:
The
.I math_errhandling
identifier defined by POSIX.1 is not supported.
.\" See CONFORMANCE in the glibc 2.8 (and earlier) source.
.SH SEE ALSO
.BR errno (3),
.BR fenv (3),
.BR fpclassify (3),
.BR INFINITY (3),
.BR nan (3)


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
