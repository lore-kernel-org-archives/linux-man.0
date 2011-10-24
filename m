From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: [patch] qsort.3: add qsort_r() function
Date: Mon, 24 Oct 2011 16:03:07 +0100
Message-ID: <44083.1319468587@proseconsulting.co.uk>
Reply-To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_32e6e763b52ba1a887de5b2d7056442b"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=_32e6e763b52ba1a887de5b2d7056442b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Please find attached a patch for the qsort.3 man page from 3.35 to add the
qsort_r() function.  I've also copied it inline below.

Best regards,
Mark.

--- qsort.3.old	2011-10-04 07:34:44.000000000 +0100
+++ qsort.3	2011-10-24 16:00:44.000000000 +0100
@@ -28,18 +28,22 @@
 .\" Modified 1993-03-29, David Metcalfe
 .\" Modified 1993-07-24, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" 2006-01-15, mtk, Added example program.
+.\" Modified 2011-10-24, Mark R. Bannister (cambridge-Rn4VEauK+AKRv+LV9MX5uv+2+P5yyue3@public.gmane.org=
t)
+.\"				to add qsort_r()
 .\"
-.\" FIXME glibc 2.8 added qsort_r(), which needs to be documented.
-.\"
-.TH QSORT 3 2009-09-15 "" "Linux Programmer's Manual"
+.TH QSORT 3 2011-10-24 "" "Linux Programmer's Manual"
 .SH NAME
-qsort \- sorts an array
+qsort, qsort_r \- sorts an array
 .SH SYNOPSIS
 .nf
 .B #include <stdlib.h>
 .sp
 .BI "void qsort(void *" base ", size_t " nmemb ", size_t " size ,
 .BI "           int(*" compar ")(const void *, const void *));"
+.sp
+.BI "void qsort_r(void *" base ", size_t " nmemb ", size_t " size ,
+.BI "           int(*" compar ")(const void *, const void *, void *),"
+.BI "           void *" arg ");"
 .fi
 .SH DESCRIPTION
 The
@@ -58,16 +62,34 @@
 less than, equal to, or greater than the second.
 If two members compare
 as equal, their order in the sorted array is undefined.
+.PP
+The
+.BR qsort_r ()
+function is identical to
+.BR qsort ()
+except that the comparison function
+.I compar
+takes a third argument.  A pointer is passed to the comparison function vi=
a
+.IR arg .
+In this way, the comparison function does not need to use global variables=
 to
+pass through arbitrary arguments, and is therefore re-entrant and safe to
+use in threads.
 .SH "RETURN VALUE"
 The
 .BR qsort ()
-function returns no value.
+and
+.BR qsort_r ()
+functions return no value.
 .SH "CONFORMING TO"
-SVr4, 4.3BSD, C89, C99.
+The
+.BR qsort ()
+function conforms to SVr4, 4.3BSD, C89, C99.
 .SH NOTES
 Library routines suitable for use as the
 .I compar
-argument include
+argument to
+.BR qsort ()
+include
 .BR alphasort (3)
 and
 .BR versionsort (3).


--=_32e6e763b52ba1a887de5b2d7056442b
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream;
 name="qsort.3.patch";
Content-Disposition: attachment;
 filename="qsort.3.patch";

LS0tIHFzb3J0LjMub2xkCTIwMTEtMTAtMDQgMDc6MzQ6NDQuMDAwMDAwMDAwICswMTAwCisrKyBx
c29ydC4zCTIwMTEtMTAtMjQgMTY6MDA6NDQuMDAwMDAwMDAwICswMTAwCkBAIC0yOCwxOCArMjgs
MjIgQEAKIC5cIiBNb2RpZmllZCAxOTkzLTAzLTI5LCBEYXZpZCBNZXRjYWxmZQogLlwiIE1vZGlm
aWVkIDE5OTMtMDctMjQsIFJpayBGYWl0aCAoZmFpdGhAY3MudW5jLmVkdSkKIC5cIiAyMDA2LTAx
LTE1LCBtdGssIEFkZGVkIGV4YW1wbGUgcHJvZ3JhbS4KKy5cIiBNb2RpZmllZCAyMDExLTEwLTI0
LCBNYXJrIFIuIEJhbm5pc3RlciAoY2FtYnJpZGdlQHVzZXJzLnNvdXJjZWZvcmdlLm5ldCkKKy5c
IgkJCQl0byBhZGQgcXNvcnRfcigpCiAuXCIKLS5cIiBGSVhNRSBnbGliYyAyLjggYWRkZWQgcXNv
cnRfcigpLCB3aGljaCBuZWVkcyB0byBiZSBkb2N1bWVudGVkLgotLlwiCi0uVEggUVNPUlQgMyAy
MDA5LTA5LTE1ICIiICJMaW51eCBQcm9ncmFtbWVyJ3MgTWFudWFsIgorLlRIIFFTT1JUIDMgMjAx
MS0xMC0yNCAiIiAiTGludXggUHJvZ3JhbW1lcidzIE1hbnVhbCIKIC5TSCBOQU1FCi1xc29ydCBc
LSBzb3J0cyBhbiBhcnJheQorcXNvcnQsIHFzb3J0X3IgXC0gc29ydHMgYW4gYXJyYXkKIC5TSCBT
WU5PUFNJUwogLm5mCiAuQiAjaW5jbHVkZSA8c3RkbGliLmg+CiAuc3AKIC5CSSAidm9pZCBxc29y
dCh2b2lkICoiIGJhc2UgIiwgc2l6ZV90ICIgbm1lbWIgIiwgc2l6ZV90ICIgc2l6ZSAsCiAuQkkg
IiAgICAgICAgICAgaW50KCoiIGNvbXBhciAiKShjb25zdCB2b2lkICosIGNvbnN0IHZvaWQgKikp
OyIKKy5zcAorLkJJICJ2b2lkIHFzb3J0X3Iodm9pZCAqIiBiYXNlICIsIHNpemVfdCAiIG5tZW1i
ICIsIHNpemVfdCAiIHNpemUgLAorLkJJICIgICAgICAgICAgIGludCgqIiBjb21wYXIgIikoY29u
c3Qgdm9pZCAqLCBjb25zdCB2b2lkICosIHZvaWQgKiksIgorLkJJICIgICAgICAgICAgIHZvaWQg
KiIgYXJnICIpOyIKIC5maQogLlNIIERFU0NSSVBUSU9OCiBUaGUKQEAgLTU4LDE2ICs2MiwzNCBA
QAogbGVzcyB0aGFuLCBlcXVhbCB0bywgb3IgZ3JlYXRlciB0aGFuIHRoZSBzZWNvbmQuCiBJZiB0
d28gbWVtYmVycyBjb21wYXJlCiBhcyBlcXVhbCwgdGhlaXIgb3JkZXIgaW4gdGhlIHNvcnRlZCBh
cnJheSBpcyB1bmRlZmluZWQuCisuUFAKK1RoZQorLkJSIHFzb3J0X3IgKCkKK2Z1bmN0aW9uIGlz
IGlkZW50aWNhbCB0bworLkJSIHFzb3J0ICgpCitleGNlcHQgdGhhdCB0aGUgY29tcGFyaXNvbiBm
dW5jdGlvbgorLkkgY29tcGFyCit0YWtlcyBhIHRoaXJkIGFyZ3VtZW50LiAgQSBwb2ludGVyIGlz
IHBhc3NlZCB0byB0aGUgY29tcGFyaXNvbiBmdW5jdGlvbiB2aWEKKy5JUiBhcmcgLgorSW4gdGhp
cyB3YXksIHRoZSBjb21wYXJpc29uIGZ1bmN0aW9uIGRvZXMgbm90IG5lZWQgdG8gdXNlIGdsb2Jh
bCB2YXJpYWJsZXMgdG8KK3Bhc3MgdGhyb3VnaCBhcmJpdHJhcnkgYXJndW1lbnRzLCBhbmQgaXMg
dGhlcmVmb3JlIHJlLWVudHJhbnQgYW5kIHNhZmUgdG8KK3VzZSBpbiB0aHJlYWRzLgogLlNIICJS
RVRVUk4gVkFMVUUiCiBUaGUKIC5CUiBxc29ydCAoKQotZnVuY3Rpb24gcmV0dXJucyBubyB2YWx1
ZS4KK2FuZAorLkJSIHFzb3J0X3IgKCkKK2Z1bmN0aW9ucyByZXR1cm4gbm8gdmFsdWUuCiAuU0gg
IkNPTkZPUk1JTkcgVE8iCi1TVnI0LCA0LjNCU0QsIEM4OSwgQzk5LgorVGhlCisuQlIgcXNvcnQg
KCkKK2Z1bmN0aW9uIGNvbmZvcm1zIHRvIFNWcjQsIDQuM0JTRCwgQzg5LCBDOTkuCiAuU0ggTk9U
RVMKIExpYnJhcnkgcm91dGluZXMgc3VpdGFibGUgZm9yIHVzZSBhcyB0aGUKIC5JIGNvbXBhcgot
YXJndW1lbnQgaW5jbHVkZQorYXJndW1lbnQgdG8KKy5CUiBxc29ydCAoKQoraW5jbHVkZQogLkJS
IGFscGhhc29ydCAoMykKIGFuZAogLkJSIHZlcnNpb25zb3J0ICgzKS4K
--=_32e6e763b52ba1a887de5b2d7056442b--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
