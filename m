From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] if_nameindex.3: New page documenting if_nameindex(3) and if_freenameindex(3)
Date: Thu, 22 Nov 2012 05:40:25 +0100
Message-ID: <CAKgNAkgJ28rsi4fLb_afX=mdfhsYvAm3H_k0qHpihoTfNFF0og@mail.gmail.com>
References: <201211161728.qAGHSMj0015535@94.43.138.210.xn.2iij.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae93408b9097d0904cf0e122f
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201211161728.qAGHSMj0015535-3Be77hNiKzq6hyM1GC9nJ01gUKqpuoTTXqFh9Ls21Oc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae93408b9097d0904cf0e122f
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 6:28 PM, YOSHIFUJI Hideaki
<yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org> wrote:
> Please review.

Thanks Hideaki.

I've merged this into a branch, made a number of fixes, and added an
example program. Could you check my changes in the diff below. (The
complete page is attached.)

Cheers,

Michael

diff --git a/man3/if_nameindex.3 b/man3/if_nameindex.3
index 60bfd39..23eaa5a 100644
--- a/man3/if_nameindex.3
+++ b/man3/if_nameindex.3
@@ -1,4 +1,5 @@
 .\" Copyright (c) 2012 YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
+.\" and Copyright (c) 2012 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\"
 .\" Permission is granted to make and distribute verbatim copies of this
 .\" manual provided the copyright notice and this permission notice are
@@ -20,7 +21,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH IF_NAMEINDEX 3 2012-11-16 "GNU" "Linux Programmer's Manual"
+.TH IF_NAMEINDEX 3 2012-11-21 "GNU" "Linux Programmer's Manual"
 .SH NAME
 if_nameindex, if_freenameindex \- get network interface names and indexes
 .SH SYNOPSIS
@@ -33,32 +34,34 @@ if_nameindex, if_freenameindex \- get network
interface names and indexes
 .SH DESCRIPTION
 The
 .BR if_nameindex ()
-function creates an array of structures, one structure per
-interface, each describing network interface name and
-corresponding network index of the local system.
-
+function returns an array of
+.I if_nameindex
+structures, each containing information
+about one of the network interfaces on the local system.
 The
 .I if_nameindex
 structure contains at least the following entries:
 .sp
 .in +4n
 .nf
-    unsigned int if_index;  /* 1, 2, ... */
-    char *if_name;          /* null terminated name: "eth0", ... */
+    unsigned int if_index; /* Index of interface (1, 2, ...) */
+    char        *if_name;  /* Null-terminated name ("eth0", etc.) */
 .fi
 .in
 .PP
 The
 .I if_index
-field contains the interface index,
-or zero if this is the last item of the array.
-.PP
+field contains the interface index.
 The
 .I ifa_name
-field points to the null-terminated interface name,
-or NULL pointer if this is the last item of the array.
+field points to the null-terminated interface name.
+The end of the array is indicated by entry with
+.I if_index
+set to zero and
+.I ifa_name
+set to NULL.
 .PP
-The data returned by
+The data structure returned by
 .BR if_nameindex ()
 is dynamically allocated and should be freed using
 .BR if_freenameindex ()
@@ -67,7 +70,7 @@ when no longer needed.
 On success,
 .BR if_nameindex ()
 returns pointer to the array;
-on error, A NULL pointer is returned, and
+on error, a NULL pointer is returned, and
 .I errno
 is set appropriately.
 .SH ERRORS
@@ -77,7 +80,7 @@ may fail and set
 if:
 .TP
 .B ENOBUFS
-Sufficient resources unavailable.
+Insufficient resources unavailable.
 .PP
 .BR if_nameindex ()
 may also fail for any of the errors specified for
@@ -92,13 +95,51 @@ or
 .SH VERSIONS
 The
 .BR if_nameindex ()
-function first appeared in glibc 2.3, but before glibc 2.3.3,
+function first appeared in glibc 2.1, but before glibc 2.3.4,
 the implementation only supported interfaces with IPv4 addresses.
-Support of interfaces without IPv4 addresses is only available
+Support of interfaces that don't have IPv4 addresses is only available
 on kernels that support netlink.
+.SH EXAMPLE
+The program below demonstrates the use of the functions described
+on this page.
+An example of the output this program might produce is the following:
+.in +4n
+.nf
+$ \fB./a.out\fI
+1: lo
+2: wlan0
+3: em1
+.fi
+.in
+.SS Program source
+.nf
+#include <net/if.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+int
+main(int argc, char *argv[])
+{
+    struct if_nameindex *if_ni, *i;
+
+    if_ni = if_nameindex();
+    if (if_ni == NULL) {
+        perror("if_nameindex");
+        exit(EXIT_FAILURE);
+    }
+
+    for (i = if_ni; ! (i\->if_index == 0 && i\->if_name == NULL); i++)
+        printf("%d: %s\\n", i\->if_index, i\->if_name);
+
+    if_freenameindex(if_ni);
+
+    exit(EXIT_SUCCESS);
+}
+.fi
 .SH CONFORMING TO
 RFC\ 3493, POSIX.1-2001.
-.SH HISTORY
+
 This function first appeared in BSDi.
 .SH SEE ALSO
 .BR getsockopt (2),

--14dae93408b9097d0904cf0e122f
Content-Type: application/octet-stream; name="if_nameindex.3"
Content-Disposition: attachment; filename="if_nameindex.3"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h9shp3wc0

LlwiIENvcHlyaWdodCAoYykgMjAxMiBZT1NISUZVSkkgSGlkZWFraSA8eW9zaGZ1amlAbGludXgt
aXB2Ni5vcmc+Ci5cIiBhbmQgQ29weXJpZ2h0IChjKSAyMDEyIE1pY2hhZWwgS2VycmlzayA8bXRr
Lm1hbnBhZ2VzQGdtYWlsLmNvbT4KLlwiIAouXCIgUGVybWlzc2lvbiBpcyBncmFudGVkIHRvIG1h
a2UgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzIG9mIHRoaXMKLlwiIG1hbnVhbCBwcm92
aWRlZCB0aGUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBhcmUK
LlwiIHByZXNlcnZlZCBvbiBhbGwgY29waWVzLgouXCIKLlwiIFBlcm1pc3Npb24gaXMgZ3JhbnRl
ZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIG1vZGlmaWVkIHZlcnNpb25zIG9mCi5cIiB0aGlzIG1h
bnVhbCB1bmRlciB0aGUgY29uZGl0aW9ucyBmb3IgdmVyYmF0aW0gY29weWluZywgcHJvdmlkZWQg
dGhhdAouXCIgdGhlIGVudGlyZSByZXN1bHRpbmcgZGVyaXZlZCB3b3JrIGlzIGRpc3RyaWJ1dGVk
IHVuZGVyIHRoZSB0ZXJtcyBvZgouXCIgYSBwZXJtaXNzaW9uIG5vdGljZSBpZGVudGljYWwgdG8g
dGhpcyBvbmUuCi5cIgouXCIgU2luY2UgdGhlIExpbnV4IGtlcm5lbCBhbmQgbGlicmFyaWVzIGFy
ZSBjb25zdGFudGx5IGNoYW5naW5nLCB0aGlzCi5cIiBtYW51YWwgcGFnZSBtYXkgYmUgaW5jb3Jy
ZWN0IG9yIG91dC1vZi1kYXRlLiAgVGhlIGF1dGhvcihzKSBhc3N1bWUuCi5cIiBubyByZXNwb25z
aWJpbGl0eSBmb3IgZXJyb3JzIG9yIG9taXNzaW9ucywgb3IgZm9yIGRhbWFnZXMgcmVzdWx0aW5n
LgouXCIgZnJvbSB0aGUgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluLiAg
VGhlIGF1dGhvcihzKSBtYXkuCi5cIiBub3QgaGF2ZSB0YWtlbiB0aGUgc2FtZSBsZXZlbCBvZiBj
YXJlIGluIHRoZSBwcm9kdWN0aW9uIG9mIHRoaXMuCi5cIiBtYW51YWwsIHdoaWNoIGlzIGxpY2Vu
c2VkIGZyZWUgb2YgY2hhcmdlLCBhcyB0aGV5IG1pZ2h0IHdoZW4gd29ya2luZy4KLlwiIHByb2Zl
c3Npb25hbGx5LgouXCIKLlwiIEZvcm1hdHRlZCBvciBwcm9jZXNzZWQgdmVyc2lvbnMgb2YgdGhp
cyBtYW51YWwsIGlmIHVuYWNjb21wYW5pZWQgYnkKLlwiIHRoZSBzb3VyY2UsIG11c3QgYWNrbm93
bGVkZ2UgdGhlIGNvcHlyaWdodCBhbmQgYXV0aG9ycyBvZiB0aGlzIHdvcmsuCi5cIgouVEggSUZf
TkFNRUlOREVYIDMgMjAxMi0xMS0yMSAiR05VIiAiTGludXggUHJvZ3JhbW1lcidzIE1hbnVhbCIK
LlNIIE5BTUUKaWZfbmFtZWluZGV4LCBpZl9mcmVlbmFtZWluZGV4IFwtIGdldCBuZXR3b3JrIGlu
dGVyZmFjZSBuYW1lcyBhbmQgaW5kZXhlcwouU0ggU1lOT1BTSVMKLm5mCi5CICNpbmNsdWRlIDxu
ZXQvaWYuaD4KLnNwCi5CSSAic3RydWN0IGlmX25hbWVpbmRleCAqaWZfbmFtZWluZGV4KHZvaWQp
OwouQkkgInZvaWQgaWZfZnJlZW5hbWVpbmRleChzdHJ1Y3QgaWZfbmFtZWluZGV4ICoiICJwdHIi
ICk7Ci5maQouU0ggREVTQ1JJUFRJT04KVGhlCi5CUiBpZl9uYW1laW5kZXggKCkKZnVuY3Rpb24g
cmV0dXJucyBhbiBhcnJheSBvZiAKLkkgaWZfbmFtZWluZGV4CnN0cnVjdHVyZXMsIGVhY2ggY29u
dGFpbmluZyBpbmZvcm1hdGlvbgphYm91dCBvbmUgb2YgdGhlIG5ldHdvcmsgaW50ZXJmYWNlcyBv
biB0aGUgbG9jYWwgc3lzdGVtLgpUaGUKLkkgaWZfbmFtZWluZGV4CnN0cnVjdHVyZSBjb250YWlu
cyBhdCBsZWFzdCB0aGUgZm9sbG93aW5nIGVudHJpZXM6Ci5zcAouaW4gKzRuCi5uZgogICAgdW5z
aWduZWQgaW50IGlmX2luZGV4OyAvKiBJbmRleCBvZiBpbnRlcmZhY2UgKDEsIDIsIC4uLikgKi8K
ICAgIGNoYXIgICAgICAgICppZl9uYW1lOyAgLyogTnVsbC10ZXJtaW5hdGVkIG5hbWUgKCJldGgw
IiwgZXRjLikgKi8KLmZpCi5pbgouUFAKVGhlCi5JIGlmX2luZGV4CmZpZWxkIGNvbnRhaW5zIHRo
ZSBpbnRlcmZhY2UgaW5kZXguClRoZQouSSBpZmFfbmFtZQpmaWVsZCBwb2ludHMgdG8gdGhlIG51
bGwtdGVybWluYXRlZCBpbnRlcmZhY2UgbmFtZS4KVGhlIGVuZCBvZiB0aGUgYXJyYXkgaXMgaW5k
aWNhdGVkIGJ5IGVudHJ5IHdpdGgKLkkgaWZfaW5kZXgKc2V0IHRvIHplcm8gYW5kCi5JIGlmYV9u
YW1lCnNldCB0byBOVUxMLgouUFAKVGhlIGRhdGEgc3RydWN0dXJlIHJldHVybmVkIGJ5Ci5CUiBp
Zl9uYW1laW5kZXggKCkKaXMgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGFuZCBzaG91bGQgYmUgZnJl
ZWQgdXNpbmcKLkJSIGlmX2ZyZWVuYW1laW5kZXggKCkKd2hlbiBubyBsb25nZXIgbmVlZGVkLgou
U0ggUkVUVVJOIFZBTFVFCk9uIHN1Y2Nlc3MsCi5CUiBpZl9uYW1laW5kZXggKCkKcmV0dXJucyBw
b2ludGVyIHRvIHRoZSBhcnJheTsKb24gZXJyb3IsIGEgTlVMTCBwb2ludGVyIGlzIHJldHVybmVk
LCBhbmQKLkkgZXJybm8KaXMgc2V0IGFwcHJvcHJpYXRlbHkuCi5TSCBFUlJPUlMKLkJSIGlmX25h
bWVpbmRleCAoKQptYXkgZmFpbCBhbmQgc2V0Ci5JIGVycm5vCmlmOgouVFAKLkIgRU5PQlVGUwpJ
bnN1ZmZpY2llbnQgcmVzb3VyY2VzIHVuYXZhaWxhYmxlLgouUFAKLkJSIGlmX25hbWVpbmRleCAo
KQptYXkgYWxzbyBmYWlsIGZvciBhbnkgb2YgdGhlIGVycm9ycyBzcGVjaWZpZWQgZm9yCi5CUiBz
b2NrZXQgKDIpLAouQlIgYmluZCAoMiksCi5CUiBpb2N0bCAoMiksCi5CUiBnZXRzb2NrbmFtZSAo
MiksCi5CUiByZWN2bXNnICgyKSwKLkJSIHNlbmR0byAoMiksCm9yCi5CUiBtYWxsb2MgKDMpLgou
U0ggVkVSU0lPTlMKVGhlCi5CUiBpZl9uYW1laW5kZXggKCkKZnVuY3Rpb24gZmlyc3QgYXBwZWFy
ZWQgaW4gZ2xpYmMgMi4xLCBidXQgYmVmb3JlIGdsaWJjIDIuMy40LAp0aGUgaW1wbGVtZW50YXRp
b24gb25seSBzdXBwb3J0ZWQgaW50ZXJmYWNlcyB3aXRoIElQdjQgYWRkcmVzc2VzLgpTdXBwb3J0
IG9mIGludGVyZmFjZXMgdGhhdCBkb24ndCBoYXZlIElQdjQgYWRkcmVzc2VzIGlzIG9ubHkgYXZh
aWxhYmxlCm9uIGtlcm5lbHMgdGhhdCBzdXBwb3J0IG5ldGxpbmsuCi5TSCBFWEFNUExFClRoZSBw
cm9ncmFtIGJlbG93IGRlbW9uc3RyYXRlcyB0aGUgdXNlIG9mIHRoZSBmdW5jdGlvbnMgZGVzY3Jp
YmVkCm9uIHRoaXMgcGFnZS4KQW4gZXhhbXBsZSBvZiB0aGUgb3V0cHV0IHRoaXMgcHJvZ3JhbSBt
aWdodCBwcm9kdWNlIGlzIHRoZSBmb2xsb3dpbmc6Ci5pbiArNG4KLm5mCiQgXGZCLi9hLm91dFxm
SQoxOiBsbwoyOiB3bGFuMAozOiBlbTEKLmZpCi5pbgouU1MgUHJvZ3JhbSBzb3VyY2UKLm5mCiNp
bmNsdWRlIDxuZXQvaWYuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4K
I2luY2x1ZGUgPHVuaXN0ZC5oPgoKaW50Cm1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKewog
ICAgc3RydWN0IGlmX25hbWVpbmRleCAqaWZfbmksICppOwoKICAgIGlmX25pID0gaWZfbmFtZWlu
ZGV4KCk7CiAgICBpZiAoaWZfbmkgPT0gTlVMTCkgewogICAgICAgIHBlcnJvcigiaWZfbmFtZWlu
ZGV4Iik7CiAgICAgICAgZXhpdChFWElUX0ZBSUxVUkUpOwogICAgfQoKICAgIGZvciAoaSA9IGlm
X25pOyAhIChpXC0+aWZfaW5kZXggPT0gMCAmJiBpXC0+aWZfbmFtZSA9PSBOVUxMKTsgaSsrKSAK
ICAgICAgICBwcmludGYoIiVkOiAlc1xcbiIsIGlcLT5pZl9pbmRleCwgaVwtPmlmX25hbWUpOwoK
ICAgIGlmX2ZyZWVuYW1laW5kZXgoaWZfbmkpOwoKICAgIGV4aXQoRVhJVF9TVUNDRVNTKTsKfSAK
LmZpCi5TSCBDT05GT1JNSU5HIFRPClJGQ1wgMzQ5MywgUE9TSVguMS0yMDAxLgoKVGhpcyBmdW5j
dGlvbiBmaXJzdCBhcHBlYXJlZCBpbiBCU0RpLgouU0ggU0VFIEFMU08KLkJSIGdldHNvY2tvcHQg
KDIpLAouQlIgc2V0c29ja29wdCAoMiksCi5CUiBnZXRpZmFkZHJzICgzKSwKLkJSIGlmX2luZGV4
dG9uYW1lICgzKSwKLkJSIGlmX25hbWVpbmRleCAoMyksCi5CUiBpZl9uYW1ldG9pbmRleCAoMyks
Ci5CUiBpZmNvbmZpZyAoOCkK
--14dae93408b9097d0904cf0e122f--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
