From: Ben <software-QW8DL1zPdzBaa/9Udqfwiw@public.gmane.org>
Subject: [patch] qsort.3: document qsort_r
Date: Thu, 29 Dec 2011 20:50:25 +0000
Message-ID: <1325191825.10184.6.camel@tinky>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-K15umBsUGOzJXdO/xthk"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-K15umBsUGOzJXdO/xthk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Following a discussion on comp.lang.c, I noticed that glibc's qsort_r is
not documented in the man pages.  Following the model of strtok_r (and
the FIXME in qsort.3) I include a patch that adds qsort_r to the man
page for qsort (inline and as an attachment):

--- qsort.3.orig	2011-12-29 16:12:51.000000000 +0000
+++ qsort.3	2011-12-29 15:30:33.000000000 +0000
@@ -28,19 +28,32 @@
 .\" Modified 1993-03-29, David Metcalfe
 .\" Modified 1993-07-24, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" 2006-01-15, mtk, Added example program.
+.\" Modified 2011-12-29, Ben Bacarisse (software-QW8DL1zPdzBaa/9Udqfwiw@public.gmane.org), qsort_r
 .\"
-.\" FIXME glibc 2.8 added qsort_r(), which needs to be documented.
-.\"
-.TH QSORT 3 2009-09-15 "" "Linux Programmer's Manual"
+.TH QSORT 3 2011-12-29 "" "Linux Programmer's Manual"
 .SH NAME
-qsort \- sorts an array
+qsort, qsort_r \- sorts an array
 .SH SYNOPSIS
 .nf
 .B #include <stdlib.h>
 .sp
 .BI "void qsort(void *" base ", size_t " nmemb ", size_t " size ,
-.BI "           int(*" compar ")(const void *, const void *));"
+.BI "           int (*" compar ")(const void *, const void *));"
+.sp
+.BI "void qsort_r(void *" base ", size_t " nmemb ", size_t " size ,
+.BI "             int (*" compar ")(const void *, const void *, void
*),"
+.BI "             void *" data ");"
 .fi
+.sp
+.in -4n
+Feature Test Macro Requirements for glibc (see
+.BR feature_test_macros (7)):
+.in
+.sp
+.ad l
+.BR qsort_r ():
+_GNU_SOURCE
+.ad b
 .SH DESCRIPTION
 The
 .BR qsort ()
@@ -58,12 +71,29 @@
 less than, equal to, or greater than the second.
 If two members compare
 as equal, their order in the sorted array is undefined.
+
+.BR qsort_r ()
+permits a pointer to an arbitrary piece of data to be passed to the
+comparisson function.
+The \fIdata\fP argument to
+.BR qsort_r ()
+is passed as the third argument in every call to \fIcompar\fP.
 .SH "RETURN VALUE"
 The
 .BR qsort ()
-function returns no value.
+and
+.BR qsort_r ()
+functions return no value.
 .SH "CONFORMING TO"
+.TP
+.BR qsort ()
 SVr4, 4.3BSD, C89, C99.
+.TP
+.BR qsort_r ()
+is a GNU extension.  Note that the argument order and the type of the
+comparison function are different to that used by BSD's
+.BR qsort_r ()
+function.
 .SH NOTES
 Library routines suitable for use as the
 .I compar

--=20
Ben.


--=-K15umBsUGOzJXdO/xthk
Content-Disposition: attachment; filename="qsort_r.patch"
Content-Type: text/x-patch; name="qsort_r.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

LS0tIHFzb3J0LjMub3JpZwkyMDExLTEyLTI5IDE2OjEyOjUxLjAwMDAwMDAwMCArMDAwMA0KKysr
IHFzb3J0LjMJMjAxMS0xMi0yOSAxNTozMDozMy4wMDAwMDAwMDAgKzAwMDANCkBAIC0yOCwxOSAr
MjgsMzIgQEANCiAuXCIgTW9kaWZpZWQgMTk5My0wMy0yOSwgRGF2aWQgTWV0Y2FsZmUNCiAuXCIg
TW9kaWZpZWQgMTk5My0wNy0yNCwgUmlrIEZhaXRoIChmYWl0aEBjcy51bmMuZWR1KQ0KIC5cIiAy
MDA2LTAxLTE1LCBtdGssIEFkZGVkIGV4YW1wbGUgcHJvZ3JhbS4NCisuXCIgTW9kaWZpZWQgMjAx
MS0xMi0yOSwgQmVuIEJhY2FyaXNzZSAoc29mdHdhcmVAYnNiLm1lLnVrKSwgcXNvcnRfcg0KIC5c
Ig0KLS5cIiBGSVhNRSBnbGliYyAyLjggYWRkZWQgcXNvcnRfcigpLCB3aGljaCBuZWVkcyB0byBi
ZSBkb2N1bWVudGVkLg0KLS5cIg0KLS5USCBRU09SVCAzIDIwMDktMDktMTUgIiIgIkxpbnV4IFBy
b2dyYW1tZXIncyBNYW51YWwiDQorLlRIIFFTT1JUIDMgMjAxMS0xMi0yOSAiIiAiTGludXggUHJv
Z3JhbW1lcidzIE1hbnVhbCINCiAuU0ggTkFNRQ0KLXFzb3J0IFwtIHNvcnRzIGFuIGFycmF5DQor
cXNvcnQsIHFzb3J0X3IgXC0gc29ydHMgYW4gYXJyYXkNCiAuU0ggU1lOT1BTSVMNCiAubmYNCiAu
QiAjaW5jbHVkZSA8c3RkbGliLmg+DQogLnNwDQogLkJJICJ2b2lkIHFzb3J0KHZvaWQgKiIgYmFz
ZSAiLCBzaXplX3QgIiBubWVtYiAiLCBzaXplX3QgIiBzaXplICwNCi0uQkkgIiAgICAgICAgICAg
aW50KCoiIGNvbXBhciAiKShjb25zdCB2b2lkICosIGNvbnN0IHZvaWQgKikpOyINCisuQkkgIiAg
ICAgICAgICAgaW50ICgqIiBjb21wYXIgIikoY29uc3Qgdm9pZCAqLCBjb25zdCB2b2lkICopKTsi
DQorLnNwDQorLkJJICJ2b2lkIHFzb3J0X3Iodm9pZCAqIiBiYXNlICIsIHNpemVfdCAiIG5tZW1i
ICIsIHNpemVfdCAiIHNpemUgLA0KKy5CSSAiICAgICAgICAgICAgIGludCAoKiIgY29tcGFyICIp
KGNvbnN0IHZvaWQgKiwgY29uc3Qgdm9pZCAqLCB2b2lkICopLCINCisuQkkgIiAgICAgICAgICAg
ICB2b2lkICoiIGRhdGEgIik7Ig0KIC5maQ0KKy5zcA0KKy5pbiAtNG4NCitGZWF0dXJlIFRlc3Qg
TWFjcm8gUmVxdWlyZW1lbnRzIGZvciBnbGliYyAoc2VlDQorLkJSIGZlYXR1cmVfdGVzdF9tYWNy
b3MgKDcpKToNCisuaW4NCisuc3ANCisuYWQgbA0KKy5CUiBxc29ydF9yICgpOg0KK19HTlVfU09V
UkNFDQorLmFkIGINCiAuU0ggREVTQ1JJUFRJT04NCiBUaGUNCiAuQlIgcXNvcnQgKCkNCkBAIC01
OCwxMiArNzEsMjkgQEANCiBsZXNzIHRoYW4sIGVxdWFsIHRvLCBvciBncmVhdGVyIHRoYW4gdGhl
IHNlY29uZC4NCiBJZiB0d28gbWVtYmVycyBjb21wYXJlDQogYXMgZXF1YWwsIHRoZWlyIG9yZGVy
IGluIHRoZSBzb3J0ZWQgYXJyYXkgaXMgdW5kZWZpbmVkLg0KKw0KKy5CUiBxc29ydF9yICgpDQor
cGVybWl0cyBhIHBvaW50ZXIgdG8gYW4gYXJiaXRyYXJ5IHBpZWNlIG9mIGRhdGEgdG8gYmUgcGFz
c2VkIHRvIHRoZQ0KK2NvbXBhcmlzc29uIGZ1bmN0aW9uLg0KK1RoZSBcZklkYXRhXGZQIGFyZ3Vt
ZW50IHRvDQorLkJSIHFzb3J0X3IgKCkNCitpcyBwYXNzZWQgYXMgdGhlIHRoaXJkIGFyZ3VtZW50
IGluIGV2ZXJ5IGNhbGwgdG8gXGZJY29tcGFyXGZQLg0KIC5TSCAiUkVUVVJOIFZBTFVFIg0KIFRo
ZQ0KIC5CUiBxc29ydCAoKQ0KLWZ1bmN0aW9uIHJldHVybnMgbm8gdmFsdWUuDQorYW5kDQorLkJS
IHFzb3J0X3IgKCkNCitmdW5jdGlvbnMgcmV0dXJuIG5vIHZhbHVlLg0KIC5TSCAiQ09ORk9STUlO
RyBUTyINCisuVFANCisuQlIgcXNvcnQgKCkNCiBTVnI0LCA0LjNCU0QsIEM4OSwgQzk5Lg0KKy5U
UA0KKy5CUiBxc29ydF9yICgpDQoraXMgYSBHTlUgZXh0ZW5zaW9uLiAgTm90ZSB0aGF0IHRoZSBh
cmd1bWVudCBvcmRlciBhbmQgdGhlIHR5cGUgb2YgdGhlDQorY29tcGFyaXNvbiBmdW5jdGlvbiBh
cmUgZGlmZmVyZW50IHRvIHRoYXQgdXNlZCBieSBCU0Qncw0KKy5CUiBxc29ydF9yICgpDQorZnVu
Y3Rpb24uDQogLlNIIE5PVEVTDQogTGlicmFyeSByb3V0aW5lcyBzdWl0YWJsZSBmb3IgdXNlIGFz
IHRoZQ0KIC5JIGNvbXBhcg0K


--=-K15umBsUGOzJXdO/xthk--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
