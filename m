From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Wed, 9 Jul 2008 00:22:15 +0200
Message-ID: <cfd18e0f0807081522u710a15e1wa1a513843e46ee2f@mail.gmail.com>
References: <4873E122.1010504@ii.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4873E122.1010504-lQF5CfOoLd8@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Nanno,

On Tue, Jul 8, 2008 at 11:50 PM, Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org> wrote:
> Hello,
>
> A few months ago Ulrich Drepper added a family of byteorder conversion
> macros to glibc.

What version of glibc do these appear in?  I can't find them in the
headers or source for glibc 2.8.

Cheers,

Michael

> I've written a rough manpage for them; attached.
>
> The colophon may have the wrong version, I just guessed it.
>
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
>
> Also, the existing byteorder.3 manpage should get a "SEE ALSO" reference
> to the new family:
> .BR endian (3)
>
>    Regards,
>    Nanno
>
>
> PS. Please CC me explicitly on any email, I'm not on the 'vger' list.
>
>
> .\" Written by Nanno Langstraat, released into the Public Domain
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, this
> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
> .\" responsibility for errors or omissions, or for damages resulting from
> .\" the use of the information contained herein.  The author(s) may not
> .\" have taken the same level of care in the production of this manual,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .TH ENDIAN 3  2008-07-08 "GNU" "Linux Programmer's Manual"
> .SH NAME
> htobeNN, htoleNN, betohNN, letohNN \- convert values between host and
> big/little-endian byte order
> .SH SYNOPSIS
> .nf
> .B #define __USE_BSD
> .B #include <endian.h>
> .sp
> .BI "uint64_t htobe64(uint64_t " host_64bits );
> .sp
> .BI "uint16_t letoh16(uint16_t " little_endian_16bits );
> .sp
> .BI "uint32_t betoh32(uint32_t " big_endian_32bits );
> .sp
>  ...
>  etc.
> .fi
> .SH DESCRIPTION
> These functions convert the byte encoding of integer values from
> the byte order that the current CPU (the "host") happens to use,
> to the standard little-endian / big-endian byte orders, and back
> again.
>
> The functions all follow the following naming pattern:
> .BR {SRC} to {DST}{BITS} ().
>
> .BI {SRC}
> is the byte order of the input parameter,
> .BI {DST}
> is the byte order of the desired return value.
> These can be
> .BI be
> for "big endian",
> .BI le
> for "little endian", or
> .BI h
> for "host".
>
> .BI {BITS}
> is the number of bits of the value. It can currently be
> .BI 16
> ,
> .BI 32
> or
> .BI 64 .
>
>
> .SH VERSIONS
> These function were added to GNU glibc version 2.8.90.
>
> .SH "CONFORMING TO"
> OpenBSD contains these functions, but requires <sys/endian.h> instead of
> <endian.h>.
>
> FreeBSD has not (as of 2008) adopted these functions.
>
> .SH NOTES
> These
> .BR endian (3)
> functions are similar to the older
> .BR byteorder (3)
> family of functions.
>
> For example,
> .BR betoh32 ()
> is identical to
> .BR ntohl () .
>
> The advantage of the
> .BR byteorder (3)
> functions is that they are available on most operating systems. Their drawback
> is that they were designed only for use in the context of TCP/IP. They
> therefore lack 64-bit variants and little-endian variants.
>
> .SH EXAMPLE
> Given the following code:
>    uint8_t   file_input[4] = { 0x12, 0x34, 0x56, 0x78 };
>    uint32_t  out = betoh32( (uint32_t*)file_input );
>
> Variable "out" will equal 0x12345678.
>
> (Unrelated side note: this short code example is not alignment-safe in
> the (uint32_t*) pointer cast)
>
> .SH "SEE ALSO"
> .BR byteorder (3)
> .SH COLOPHON
> This page is part of release 3.04 of the Linux
> .I man-pages
> project.
> A description of the project,
> and information about reporting bugs,
> can be found at
> http://www.kernel.org/doc/man-pages/.
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
