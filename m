From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: malloc_stats(3) man page for review
Date: Sat, 5 May 2012 12:08:07 +1200
Message-ID: <CAKgNAkiC4Qb-yBoEf1mmSBcUFuH3yB0OT6Vvni5z_Lci5=6eSA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae93404bf1f1a1e04bf3ed695
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae93404bf1f1a1e04bf3ed695
Content-Type: text/plain; charset=ISO-8859-1

I've written the man page page below to document glibc's
malloc_stats(3). Review comments welcome!

Cheers,

Michael


'\" t
.\" Copyright (c) 2012 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
.TH MALLOC_STATS 3  2012-04-28 "Linux" "Linux Programmer's Manual"
.SH NAME
mall_stats \- print memory allocation statistics
.SH SYNOPSIS
.B #include <malloc.h>

.B void malloc_stats(void);
.SH DESCRIPTION
The
.BR malloc_stats ()
function prints (on standard error) statistics about memory allocated by
.BR malloc (3)
and related functions.
For each arena (allocation area), this function prints
the total amount of memory allocated by means other than
.BR mmap (2)
and the total number of bytes consumed by in-use allocations.
(These two values correspond to the
.I arena
and
.I uordblks
fields retrieved by
.BR mallinfo (3).)
In addition,
the function prints the sum of these two statistics for all arenas,
and the maximum number of blocks and bytes that were ever simultaneously
allocated using
.BR mmap (2).
.\" .SH VERSIONS
.\" Available already in glibc 2.0, possibly earlier
.SH CONFORMING TO
This function is a GNU extension.
.SH NOTES
More detailed information about memory allocations in the main arena
can be obtained using
.BR mallinfo (3).
.SH SEE ALSO
.BR mmap (2),
.BR mallinfo (3),
.BR malloc (3),
.BR malloc_info (3),
.BR mallopt (3)

--14dae93404bf1f1a1e04bf3ed695
Content-Type: application/octet-stream; name="malloc_stats.3"
Content-Disposition: attachment; filename="malloc_stats.3"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h1ip5hd30

J1wiIHQKLlwiIENvcHlyaWdodCAoYykgMjAxMiBieSBNaWNoYWVsIEtlcnJpc2sgPG10ay5tYW5w
YWdlc0BnbWFpbC5jb20+Ci5cIgouXCIgUGVybWlzc2lvbiBpcyBncmFudGVkIHRvIG1ha2UgYW5k
IGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzIG9mIHRoaXMKLlwiIG1hbnVhbCBwcm92aWRlZCB0
aGUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBhcmUKLlwiIHBy
ZXNlcnZlZCBvbiBhbGwgY29waWVzLgouXCIKLlwiIFBlcm1pc3Npb24gaXMgZ3JhbnRlZCB0byBj
b3B5IGFuZCBkaXN0cmlidXRlIG1vZGlmaWVkIHZlcnNpb25zIG9mIHRoaXMKLlwiIG1hbnVhbCB1
bmRlciB0aGUgY29uZGl0aW9ucyBmb3IgdmVyYmF0aW0gY29weWluZywgcHJvdmlkZWQgdGhhdCB0
aGUKLlwiIGVudGlyZSByZXN1bHRpbmcgZGVyaXZlZCB3b3JrIGlzIGRpc3RyaWJ1dGVkIHVuZGVy
IHRoZSB0ZXJtcyBvZiBhCi5cIiBwZXJtaXNzaW9uIG5vdGljZSBpZGVudGljYWwgdG8gdGhpcyBv
bmUuCi5cIgouXCIgU2luY2UgdGhlIExpbnV4IGtlcm5lbCBhbmQgbGlicmFyaWVzIGFyZSBjb25z
dGFudGx5IGNoYW5naW5nLCB0aGlzCi5cIiBtYW51YWwgcGFnZSBtYXkgYmUgaW5jb3JyZWN0IG9y
IG91dC1vZi1kYXRlLiAgVGhlIGF1dGhvcihzKSBhc3N1bWUgbm8KLlwiIHJlc3BvbnNpYmlsaXR5
IGZvciBlcnJvcnMgb3Igb21pc3Npb25zLCBvciBmb3IgZGFtYWdlcyByZXN1bHRpbmcgZnJvbQou
XCIgdGhlIHVzZSBvZiB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbi4gIFRoZSBhdXRo
b3IocykgbWF5IG5vdAouXCIgaGF2ZSB0YWtlbiB0aGUgc2FtZSBsZXZlbCBvZiBjYXJlIGluIHRo
ZSBwcm9kdWN0aW9uIG9mIHRoaXMgbWFudWFsLAouXCIgd2hpY2ggaXMgbGljZW5zZWQgZnJlZSBv
ZiBjaGFyZ2UsIGFzIHRoZXkgbWlnaHQgd2hlbiB3b3JraW5nCi5cIiBwcm9mZXNzaW9uYWxseS4K
LlwiCi5cIiBGb3JtYXR0ZWQgb3IgcHJvY2Vzc2VkIHZlcnNpb25zIG9mIHRoaXMgbWFudWFsLCBp
ZiB1bmFjY29tcGFuaWVkIGJ5Ci5cIiB0aGUgc291cmNlLCBtdXN0IGFja25vd2xlZGdlIHRoZSBj
b3B5cmlnaHQgYW5kIGF1dGhvcnMgb2YgdGhpcyB3b3JrLgouXCIKLlRIIE1BTExPQ19TVEFUUyAz
ICAyMDEyLTA0LTI4ICJMaW51eCIgIkxpbnV4IFByb2dyYW1tZXIncyBNYW51YWwiCi5TSCBOQU1F
Cm1hbGxfc3RhdHMgXC0gcHJpbnQgbWVtb3J5IGFsbG9jYXRpb24gc3RhdGlzdGljcwouU0ggU1lO
T1BTSVMKLkIgI2luY2x1ZGUgPG1hbGxvYy5oPgoKLkIgdm9pZCBtYWxsb2Nfc3RhdHModm9pZCk7
Ci5TSCBERVNDUklQVElPTgpUaGUKLkJSIG1hbGxvY19zdGF0cyAoKQpmdW5jdGlvbiBwcmludHMg
KG9uIHN0YW5kYXJkIGVycm9yKSBzdGF0aXN0aWNzIGFib3V0IG1lbW9yeSBhbGxvY2F0ZWQgYnkK
LkJSIG1hbGxvYyAoMykKYW5kIHJlbGF0ZWQgZnVuY3Rpb25zLgpGb3IgZWFjaCBhcmVuYSAoYWxs
b2NhdGlvbiBhcmVhKSwgdGhpcyBmdW5jdGlvbiBwcmludHMKdGhlIHRvdGFsIGFtb3VudCBvZiBt
ZW1vcnkgYWxsb2NhdGVkIGJ5IG1lYW5zIG90aGVyIHRoYW4KLkJSIG1tYXAgKDIpCmFuZCB0aGUg
dG90YWwgbnVtYmVyIG9mIGJ5dGVzIGNvbnN1bWVkIGJ5IGluLXVzZSBhbGxvY2F0aW9ucy4KKFRo
ZXNlIHR3byB2YWx1ZXMgY29ycmVzcG9uZCB0byB0aGUKLkkgYXJlbmEKYW5kCi5JIHVvcmRibGtz
CmZpZWxkcyByZXRyaWV2ZWQgYnkKLkJSIG1hbGxpbmZvICgzKS4pCkluIGFkZGl0aW9uLAp0aGUg
ZnVuY3Rpb24gcHJpbnRzIHRoZSBzdW0gb2YgdGhlc2UgdHdvIHN0YXRpc3RpY3MgZm9yIGFsbCBh
cmVuYXMsCmFuZCB0aGUgbWF4aW11bSBudW1iZXIgb2YgYmxvY2tzIGFuZCBieXRlcyB0aGF0IHdl
cmUgZXZlciBzaW11bHRhbmVvdXNseQphbGxvY2F0ZWQgdXNpbmcKLkJSIG1tYXAgKDIpLgouXCIg
LlNIIFZFUlNJT05TCi5cIiBBdmFpbGFibGUgYWxyZWFkeSBpbiBnbGliYyAyLjAsIHBvc3NpYmx5
IGVhcmxpZXIKLlNIIENPTkZPUk1JTkcgVE8KVGhpcyBmdW5jdGlvbiBpcyBhIEdOVSBleHRlbnNp
b24uCi5TSCBOT1RFUwpNb3JlIGRldGFpbGVkIGluZm9ybWF0aW9uIGFib3V0IG1lbW9yeSBhbGxv
Y2F0aW9ucyBpbiB0aGUgbWFpbiBhcmVuYQpjYW4gYmUgb2J0YWluZWQgdXNpbmcKLkJSIG1hbGxp
bmZvICgzKS4KLlNIIFNFRSBBTFNPCi5CUiBtbWFwICgyKSwKLkJSIG1hbGxpbmZvICgzKSwKLkJS
IG1hbGxvYyAoMyksCi5CUiBtYWxsb2NfaW5mbyAoMyksCi5CUiBtYWxsb3B0ICgzKQo=
--14dae93404bf1f1a1e04bf3ed695--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
