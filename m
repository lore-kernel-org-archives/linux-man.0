From: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ascii(7) fix
Date: Wed, 11 Feb 2009 12:39:14 +0300
Message-ID: <49929CC2.60204@openvz.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090308000408030503000700"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lesya Novaselskaya <shams-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------090308000408030503000700
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

I just tried to print ascii(7) and found out the tables on the second 
page (compact ascii in hex and dec) are screwed because they do not use 
monospaced font. This is of course can not be seen on the terminal.

Attached patch (against man-pages-3.18) fixes that by adding the proper 
.fn (code copy-pasted from the first table). I checked the result both 
in the terminal and on printer.

Regards,
  Kir.

--------------090308000408030503000700
Content-Type: text/plain;
 name="man-pages-3.18-ascii.7.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="man-pages-3.18-ascii.7.patch"

ZGlmZiAtdXJOIG1hbi1wYWdlcy0zLjE4L21hbjcvYXNjaWkuNyBtYW4tcGFnZXMtMy4xOC1t
eS9tYW43L2FzY2lpLjcKLS0tIG1hbi1wYWdlcy0zLjE4L21hbjcvYXNjaWkuNwkyMDA5LTAy
LTA5IDA1OjE0OjI0LjAwMDAwMDAwMCArMDMwMAorKysgbWFuLXBhZ2VzLTMuMTgtbXkvbWFu
Ny9hc2NpaS43CTIwMDktMDItMTEgMTI6MzQ6MzUuMDAwMDAwMDAwICswMzAwCkBAIC0zMCw2
ICszMCw3IEBACiAuXCIgTW9kaWZpZWQgMTk5OS0wNS0zMSBieSBEaW1pdHJpIFBhcGFkb3Bv
dWxvcyAoZHBvQGNsdWItaW50ZXJuZXQuZnIpCiAuXCIgTW9kaWZpZWQgMTk5OS0wOC0wOCBi
eSBNaWNoYWVsIEhhYXJkdCAobWljaGFlbEBtb3JpYS5kZSkKIC5cIiBNb2RpZmllZCAyMDA0
LTA0LTAxIGJ5IGFlYgorLlwiIE1vZGlmaWVkIDIwMDktMDItMTEgYnkgS2lyIEtvbHlzaGtp
biAoa2lyQG9wZW52ei5vcmcpCiAuXCIKIC5USCBBU0NJSSA3IDIwMDktMDItMDQgIkxpbnV4
IiAiTGludXggUHJvZ3JhbW1lcidzIE1hbnVhbCIKIC5TSCBOQU1FCkBAIC0xMTMsNyArMTE0
LDcgQEAKIDA3Mgk1OAkzQQk6CTE3MgkxMjIJN0EJegogMDczCTU5CTNCCTsJMTczCTEyMwk3
Qgl7CiAwNzQJNjAJM0MJPAkxNzQJMTI0CTdDCXwKLTA3NQk2MQkzRAk9IAkxNzUJMTI1CTdE
CX0KKzA3NQk2MQkzRGkJPSAJMTc1CTEyNQk3RAl9CiAwNzYJNjIJM0UJPgkxNzYJMTI2CTdF
CX4KIDA3Nwk2MwkzRgk/CTE3NwkxMjcJN0YJREVMCiAuVEUKQEAgLTEyNSw2ICsxMjYsMTAg
QEAKIEZvciBjb252ZW5pZW5jZSwgbGV0IHVzIGdpdmUgbW9yZSBjb21wYWN0IHRhYmxlcyBp
biBoZXggYW5kIGRlY2ltYWwuCiAuc3AKIC5uZgorLmlmIHQgXHtcCisuaW4gMWkKKy5mdCBD
VworXH0KICAgIDIgMyA0IDUgNiA3ICAgICAgIDMwIDQwIDUwIDYwIDcwIDgwIDkwIDEwMCAx
MTAgMTIwCiAgLS0tLS0tLS0tLS0tLSAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogMDogICAwIEAgUCBcYCBwICAgICAwOiAgICAoICAyICA8ICBGICBQICBaICBk
ICAgbiAgIHgKQEAgLTE0Myw2ICsxNDgsMTAgQEAKIEQ6IFwtID0gTSBdIG0gfQogRTogLiA+
IE4gXiBuIH4KIEY6IC8gPyBPIF8gbyBERUwKKy5pZiB0IFx7XAorLmluCisuZnQgUAorXH0K
IC5maQogLlNIIE5PVEVTCiAuU1MgSGlzdG9yeQo=
--------------090308000408030503000700--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
