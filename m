From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: For review: newlocale.3
Date: Wed, 12 Mar 2014 16:47:43 +0100
Message-ID: <CAKgNAkhAR_LSqav=Lz_u+xJarZgBr4ft-NBeJirmCw7rd4LFSA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

I've drafted a newlocale(3) man page. Review comments welcome.

Cheers,

Michael

'\" t -*- coding: UTF-8 -*-
=2E\" Copyright (C) 2014 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2E\"
=2E\" %%%LICENSE_START(VERBATIM)
=2E\" Permission is granted to make and distribute verbatim copies of t=
his
=2E\" manual provided the copyright notice and this permission notice a=
re
=2E\" preserved on all copies.
=2E\"
=2E\" Permission is granted to copy and distribute modified versions of=
 this
=2E\" manual under the conditions for verbatim copying, provided that t=
he
=2E\" entire resulting derived work is distributed under the terms of a
=2E\" permission notice identical to this one.
=2E\"
=2E\" Since the Linux kernel and libraries are constantly changing, thi=
s
=2E\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
=2E\" responsibility for errors or omissions, or for damages resulting =
from
=2E\" the use of the information contained herein.  The author(s) may n=
ot
=2E\" have taken the same level of care in the production of this manua=
l,
=2E\" which is licensed free of charge, as they might when working
=2E\" professionally.
=2E\"
=2E\" Formatted or processed versions of this manual, if unaccompanied =
by
=2E\" the source, must acknowledge the copyright and authors of this wo=
rk.
=2E\" %%%LICENSE_END
=2E\"
=2ETH NEWLOCALE 3 2014-03-12 "Linux" "Linux Programmer's Manual"
=2ESH NAME
newlocale, freelocale \- create, modify, and free a locale object
=2ESH SYNOPSIS
=2Enf
=2EB #include <locale.h>

=2EBI "locale_t newlocale(int " category_mask ", const char *" locale "=
,
=2EBI "                   locale_t " base );

=2EBI "void freelocale(locale_t " locobj );
=2Efi
=2Esp
=2Ein -4n
=46eature Test Macro Requirements for glibc (see
=2EBR feature_test_macros (7)):
=2Ein
=2Esp
=2EBR newlocale (),
=2EBR freelocale ():
=2EPD 0
=2ERS 4
=2ETP
Since glibc 2.10:
_XOPEN_SOURCE\ >=3D\ 700
=2ETP
Before glibc 2.10:
_GNU_SOURCE
=2ERE
=2EPD
=2ESH DESCRIPTION
The
=2EBR newlocale ()
function creates a new locale object, or modifies an existing object,
returning a reference to the new or modified object as the function res=
ult.
Whether the call creates a new object or modifies an existing object
is determined by the value of
=2EIR base :
=2EIP * 3
If
=2EI base
is
=2EIR "(locale_t)\ 0" ,
a new object is created.
=2EIP *
If
=2EI base
refers to valid existing locale object
(i.e., an object returned by a previous call to
=2EBR newlocale ()
or
=2EBR duplocale (3)),
then that object is modified by the call.
If the call is successful, the contents of
=2EI base
are unspecified (in particular, the object referred to by
=2EI base
may be freed, and a new object created).
Therefore, the caller should ensure that it stops using
=2EI base
before the call to
=2EBR newlocale (),
and should subsequently refer to the modified object via the
reference returned as the function result.
If the call fails, the contents of
=2EI base
remain valid and unchanged.
=2EPP
The
=2EI category_mask
argument is a bit mask that specifies the locale categories
that are to be set in a newly created locale object
or modified in an existing object.
The mask is constructed by a bitwise OR of the constants
=2EBR LC_CTYPE_MASK ,
=2EBR LC_COLLATE_MASK ,
=2EBR LC_MESSAGES_MASK ,
=2EBR LC_MONETARY_MASK ,
=2EBR LC_NUMERIC_MASK ,
and
=2EBR LC_TIME_MASK .
=46or each category specified in
=2EIR category_mask ,
the locale data from
=2EI locale
will be used in the object returned by
=2EBR newlocale ().
If a new locale object is being created,
data for all categories not specified in
=2EIR category_mask
is taken from the default ("POSIX") locale.

The following preset values of
=2EI locale
are defined for all categories that can be specified in
=2EIR category_mask :
=2ETP
"POSIX"
A minimal locale environment for C language programs.
=2ETP
"C"
Equivalent to "POSIX".
=2ETP
""
An implementation-defined native environment
corresponding to the values of the
=2EBR LC_*
and
=2EB LANG
environment variables (see
=2EBR locale (7)).
=2EPP
If
=2EI base
is the special locale object
=2EBR LC_GLOBAL_LOCALE
(see
=2EBR duplocale (3)),
or is not
=2EIR "(locale_t)\ 0"
and is not a valid locale object handle,
the behavior is undefined.
=2ESS freelocale()
The
=2EBR freelocale ()
function deallocates the resources associated with
=2EIR locobj ,
a locale object previously returned by a call to
=2EBR newlocale ()
or
=2EBR duplocale (3).
If
=2EI locobj
is
=2EBR LC_GLOBAL_LOCALE
or is not valid locale object handle, the results are undefined.

Once a locale object has been freed,
the program should make no further use of it.
=2ESH RETURN VALUE
On success,
=2EBR newlocale ()
returns a handle that can be used in calls to
=2EBR duplocale (3),
=2EBR freelocale (),
and other functions that take a
=2EI locale_t
argument.
On error,
=2EBR newlocale ()
returns
=2EIR "(locale_t)\ 0",
and sets
=2EI errno
to indicate the cause of the error.
=2ESH ERRORS
=2ETP
=2EB EINVAL
One or more bits in
=2EI category_mask
does not correspond to a valid locale category.
=2ETP
=2EB EINVAL
=2EI locale
is NULL.
=2ETP
=2EB ENOENT
=2EI locale
is not a string pointer referring to a valid locale.
=2ETP
=2EB ENOMEM
Insufficient memory to create a locale object.
=2ESH VERSIONS
The
=2EBR newlocale ()
and
=2EBR freelocale ()
functions first appeared in version 2.3 of the GNU C library.
=2ESH CONFORMING TO
POSIX.1-2008.
=2ESH NOTES
Each locale object created by
=2EBR newlocale ()
should be deallocated using
=2EBR freelocale (3).
=2ESH EXAMPLE
The program below takes up to two command-line arguments,
which each identify locales.
The first argument is required, and is used to set the
=2EB LC_NUMERIC
category in a locale object created using
=2EBR newlocale ().
The second command-line argument is optional;
if it is present, it is used to set the
=2EB LC_TIME
category of the locale object.

Having created and initialized the locale object,
the program then applies it using
=2EBR uselocale (),
and then tests the effect of the locale changes by:
=2EIP 1. 3
Displaying a floating-point number with a fractional part.
This output will be affected by the
=2EB LC_NUMERIC
setting.
In many European-language locales,
the fractional part of the number is separated from the integer part
using a comma, rather than a period.
=2EIP 2.
Displaying the date.
The format and language of the output will be affected by the
=2EB LC_TIME
setting.

=2EPP
The following shell sessions show some example runs of this program.

Set the
=2EB LC_NUMERIC
category to
=2EIR fr_FR
(French):
=2Ein +4n
=2Enf

$ \fB./a.out fr_FR\fP
123456,789
=46ri Mar  7 00:25:08 2014
=2Efi
=2Ein

Set the
=2EB LC_NUMERIC
category to
=2EIR fr_FR
(French),
and the
=2EB LC_TIME
category to
=2EIR it_IT
(Italian):
=2Ein +4n
=2Enf

$ \fB./a.out fr_FR it_IT\fP
123456,789
ven 07 mar 2014 00:26:01 CET
=2Efi
=2Ein

Specify the
=2EB LC_TIME
setting as an empty string,
which causes the value to be taken from environment variable settings
(which, here, specify
=2EIR mi_NZ ,
New Zealand M=C4=81ori):
=2Ein +4n
=2Enf

$ LC_ALL=3Dmi_NZ ./a.out fr_FR ""
123456,789
Te Paraire, te 07 o Pout=C5=AB-te-rangi, 2014 00:38:44 CET
=2Efi
=2Ein

=2Ein +4n
=2Enf

=2Efi
=2Ein
=2ESS Program source
=2Enf
#define _XOPEN_SOURCE 700
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <time.h>

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
                        } while (0)

int
main(int argc, char *argv[])
{
    const int BUF_SIZE =3D 100;
    char buf[BUF_SIZE];
    time_t t;
    size_t s;
    struct tm *tm;
    locale_t loc, nloc;

    if (argc < 2) {
        fprintf(stderr, "Usage: %s locale1 [locale2]\\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    /* Create a new locale object, taking the LC_NUMERIC settings
       from the locale specified in argv[1] */

    loc =3D newlocale(LC_NUMERIC_MASK, argv[1], (locale_t) 0);
    if (loc =3D=3D (locale_t) 0)
        errExit("newlocale");

    /* If a second command\-line argument was specified, modify the
       locale object to take the LC_TIME settings from the locale
       specified in argv[2] */

    if (argc > 2) {
        nloc =3D newlocale(LC_TIME_MASK, argv[2], loc);
        if (loc =3D=3D (locale_t) 0)
            errExit("newlocale");
        loc =3D nloc;
    }

    /* Apply the newly created locale to this thread */

    uselocale(loc);

    /* Test effect of LC_NUMERIC */

    printf("%8.3f\\n", 123456.789);

    /* Test effect of LC_TIME */

    t =3D time(NULL);
    tm =3D localtime(&t);
    if (tm =3D=3D NULL)
        errExit("time");

    s =3D strftime(buf, BUF_SIZE, "%c", tm);
    if (s =3D=3D 0)
        errExit("strftime");

    printf("%s\\n", buf);

    /* Free the locale object */

    freelocale(loc);

    exit(EXIT_SUCCESS);
}
=2Efi
=2ESH SEE ALSO
=2EBR locale (1),
=2EBR duplocale (3),
=2EBR setlocale (3),
=2EBR uselocale (3),
=2EBR locale (5),
=2EBR locale (7)



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
