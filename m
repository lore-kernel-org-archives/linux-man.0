From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Wed, 14 Jan 2009 23:24:48 +1300
Message-ID: <496DBD70.2010601@gmail.com>
References: <4873E122.1010504@ii.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4873E122.1010504-lQF5CfOoLd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nanno

> A few months ago Ulrich Drepper added a family of byteorder conversion
> macros to glibc.
> 
> I've written a rough manpage for them; attached.

Thanks for that!  I used some pieces from this, but rewrote much of
the page.

> The colophon may have the wrong version, I just guessed it.

That piece is automatically added by scripts.

> The endian.3 file needs an big bundle of links to it, listed below:
> betoh64
> betoh32
> betoh16
> htobe64
> htobe32
> htobe16
> letoh64
> letoh32
> letoh16
> htole64
> htole32
> htole16

The above names aren't all correct.  e.g., betoh64 should be be64toh,
etc.  (Were the names different in the initial implementation?)

> Also, the existing byteorder.3 manpage should get a "SEE ALSO" reference
> to the new family:
> .BR endian (3)

Thanks for thinking of that.  Done.

The version of the page that is currently committed for release in
man-pages-3.17 is shown below.  Let me know if you see anything
that needs fixing.


Thanks,

Michael


.\" Copyright (C) 2009, Linux Foundation, written by Michael Kerrisk
.\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\" a few pieces remain from an earlier version
.\" Copyright (C) 2008, Nanno Langstraat <nal-lQF5CfOoLd8@public.gmane.org>
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
.TH ENDIAN 3  2009-01-15 "GNU" "Linux Programmer's Manual"
.SH NAME
htobe16, htole16, be16toh, le16toh, htobe32, htole32, be32toh, le32toh,
htobe64, htole64, be64toh, le64toh \-
convert values between host and big-/little-endian byte order
.SH SYNOPSIS
.nf
.B #define _BSD_SOURCE
.B #include <endian.h>

.BI "uint16_t htobe16(uint16_t " host_16bits );
.BI "uint16_t htole16(uint16_t " host_16bits );
.BI "uint16_t be16toh(uint16_t " big_endian_16bits );
.BI "uint16_t le16toh(uint16_t " little_endian_16bits );

.BI "uint32_t htobe32(uint32_t " host_32bits );
.BI "uint32_t htole32(uint32_t " host_32bits );
.BI "uint32_t be32toh(uint32_t " big_endian_32bits );
.BI "uint32_t le32toh(uint32_t " little_endian_32bits );

.BI "uint64_t htobe64(uint64_t " host_64bits );
.BI "uint64_t htole64(uint64_t " host_64bits );
.BI "uint64_t be64toh(uint64_t " big_endian_64bits );
.BI "uint64_t le64toh(uint64_t " little_endian_64bits );
.fi
.SH DESCRIPTION
These functions convert the byte encoding of integer values from
the byte order that the current CPU (the "host") uses,
to and from little-endian and big-endian byte order.

The number,
.IR nn ,
in the name of each function indicates the size of
integer handled by the function, either 16, 32, or 64 bits.

The functions with names of the form "htobe\fInn\fP" convert
from host byte order to big-endian order.

The functions with names of the form "htole\fInn\fP" convert
from host byte order to little-endian order.

The functions with names of the form "be\fInn\fPtoh" convert
from big-endian order to host byte order.

The functions with names of the form "le\fInn\fPtoh" convert
from little-endian order to host byte order.
.SH VERSIONS
These function were added to glibc in version 2.9.
.SH "CONFORMING TO"
These functions are non-standard, but present on the BSDs,
where the required header file is
.I <sys/endian.h>
instead of
.IR <endian.h> .
.SH NOTES
These functions are similar to the older
.BR byteorder (3)
family of functions.
For example,
.BR be32toh ()
is identical to
.BR ntohl () .

The advantage of the
.BR byteorder (3)
functions is that they are standard functions available
on all Unix systems.
On the other hand, the fact that they were designed
for use in the context of TCP/IP means that
they lack the 64-bit and little-endian variants described in this page.
.SH EXAMPLE
The program below display the results of converting an integer
from host byte order to both little-endian and big-endian byte order.
Since host byte order is either little-endian or big-endian,
only one of these conversions will have an effect.
When we run this program on a little-endian system such as x86-32,
we see the following:
.in +4n
.nf

$ \fB./a.out\fP
x.u32 = 0x44332211
htole32(x.u32) = 0x44332211
htobe32(x.u32) = 0x11223344
.fi
.in
.SS Program source
\&
.nf
#include <endian.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char *argv[])
{
    union {
        uint32_t u32;
        uint8_t arr[4];
    } x;

    x.arr[0] = 0x11;    /* Lowest-address byte */
    x.arr[1] = 0x22;
    x.arr[2] = 0x33;
    x.arr[3] = 0x44;    /* Highest-address byte */

    printf("x.u32 = 0x%x\\n", x.u32);
    printf("htole32(x.u32) = 0x%x\\n", htole32(x.u32));
    printf("htobe32(x.u32) = 0x%x\\n", htobe32(x.u32));

    exit(EXIT_SUCCESS);
}
.fi
.SH "SEE ALSO"
.BR byteorder (3)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
