From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: new: bswap_32.1
Date: Sun, 16 Sep 2012 17:55:35 +0200
Message-ID: <5055F677.4010708@bfs.de>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010907060503080606050201"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------010907060503080606050201
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

hi,
attached you will find a new man-page describing the swap_x macros.
These are part of libc. In contrast to htonl() etc they swap bytes
unconditionaly. (handy if you need it.)

re,
 wh

.\"Copyright 2012 walter harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
.\"  Distributed under GPL
.TH BSWAP 3  2012-09-16 "GNU" "Linux Programmer's Manual"
.SH NAME
bswap_16, bswap_32, bswap_64 \-  swap bytes
.SH  SYNOPSIS
.nf
.B #include <byteswap.h>
.sp
.BI bswap_16 (x);
.sp
.BI bswap_32 (x);
.sp
.BI bswap_64 (x);
.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.ad l
.sp
.BR bswap_64 ()
.RS
__GNUC__ && __GNUC__ >= 2
.RE
.ad
.SH DESCRIPTION
These is a series off macros that swap all bytes unconditionaly.
.sp
.SH EXAMPLE
This example will swap 01020304 into 04030201.
.nf
#include <stdio.h>
#include <stdint.h>
#include <byteswap.h>

int main()
{
        uint32_t x=0x01020304;
        printf("%08x bswap:%08x\\n",x,bswap_32(x));
        return 0;
}
.fi
.SH "CONFORMING TO"
This is a glibc extension.
.SH SEE ALSO
.BR swap (3),
.BR byteorder (3)


--------------010907060503080606050201
Content-Type: text/plain;
 name="bswap_32.3"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="bswap_32.3"

LlwiQ29weXJpZ2h0IDIwMDIgd2FsdGVyIGhhcm1zICh3YWx0ZXIuaGFybXNAaW5mb3JtYXRp
ay51bmktb2xkZW5idXJnLmRlKQouXCIgIERpc3RyaWJ1dGVkIHVuZGVyIEdQTAouVEggQlNX
QVAgMyAgMjAxMi0wOS0xNiAiR05VIiAiTGludXggUHJvZ3JhbW1lcidzIE1hbnVhbCIKLlNI
IE5BTUUKYnN3YXBfMTYsIGJzd2FwXzMyLCBic3dhcF82NCBcLSAgc3dhcCBieXRlcwouU0gg
IFNZTk9QU0lTCi5uZgouQiAjaW5jbHVkZSA8Ynl0ZXN3YXAuaD4KLnNwCi5CSSBic3dhcF8x
NiAoeCk7Ci5zcAouQkkgYnN3YXBfMzIgKHgpOwouc3AKLkJJIGJzd2FwXzY0ICh4KTsKLmZp
Ci5zcAouaW4gLTRuCkZlYXR1cmUgVGVzdCBNYWNybyBSZXF1aXJlbWVudHMgZm9yIGdsaWJj
IChzZWUKLkJSIGZlYXR1cmVfdGVzdF9tYWNyb3MgKDcpKToKLmluCi5hZCBsCi5zcAouQlIg
YnN3YXBfNjQgKCkKLlJTCl9fR05VQ19fICYmIF9fR05VQ19fID49IDIKLlJFCi5hZAouU0gg
REVTQ1JJUFRJT04KVGhlc2UgaXMgYSBzZXJpZXMgb2ZmIG1hY3JvcyB0aGF0IHN3YXAgYWxs
IGJ5dGVzIHVuY29uZGl0aW9uYWx5Lgouc3AKLlNIIEVYQU1QTEUKVGhpcyBleGFtcGxlIHdp
bGwgc3dhcCAwMTAyMDMwNCBpbnRvIDA0MDMwMjAxLgoubmYKI2luY2x1ZGUgPHN0ZGlvLmg+
CiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPGJ5dGVzd2FwLmg+CgppbnQgbWFpbigp
CnsKICAgICAgICB1aW50MzJfdCB4PTB4MDEwMjAzMDQ7CiAgICAgICAgcHJpbnRmKCIlMDh4
IGJzd2FwOiUwOHhcXG4iLHgsYnN3YXBfMzIoeCkpOwogICAgICAgIHJldHVybiAwOwp9Ci5m
aQouU0ggIkNPTkZPUk1JTkcgVE8iClRoaXMgaXMgYSBnbGliYyBleHRlbnNpb24uCi5TSCBT
RUUgQUxTTwouQlIgc3dhcCAoMyksCi5CUiBieXRlb3JkZXIgKDMpCgo=
--------------010907060503080606050201--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
