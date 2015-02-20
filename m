From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [patch] getsockopt.2: Corrected the RETURN VALUE
Date: Fri, 20 Feb 2015 16:22:24 +0200
Message-ID: <54ed8560054c044dac40e28887da7b7a@shemyak.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_0d09190572742aecdea966464ab14dbd"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--=_0d09190572742aecdea966464ab14dbd
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

Hello,

An almost trivial patch - but does not fit in any "XXXfix" categories.
'man setsockopt' tells that the return value in case of success is 0.
But since at least 2007, setsockopt() calls the registered handler of
the corresponding option, and returns the result of that call.

Patch is made against master as of 20 Feb. 2015 (commit 35800487b675),
both inline below and attached.

Konstantin Shemyak.

 From 19ac3ce52c7935c8f0792836dc27e02a9f26359a Mon Sep 17 00:00:00 2001
 From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Date: Fri, 20 Feb 2015 15:59:19 +0200
Subject: [PATCH] Corrected RETURN VALUE for getsockopt/setsockopt(2)

---
  man2/getsockopt.2 | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man2/getsockopt.2 b/man2/getsockopt.2
index 1287efc..1c78fdc 100644
--- a/man2/getsockopt.2
+++ b/man2/getsockopt.2
@@ -129,7 +129,10 @@ For a description of the available socket options 
see
  .BR socket (7)
  and the appropriate protocol man pages.
  .SH RETURN VALUE
-On success, zero is returned.
+On success, the return value from the corresponding option handler
+previously registered by
+.I nf_register_sockopt()
+is returned.
  On error, \-1 is returned, and
  .I errno
  is set appropriately.
-- 
1.9.1

--=_0d09190572742aecdea966464ab14dbd
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
 name=0001-Corrected-RETURN-VALUE-for-getsockopt-setsockopt-2.patch
Content-Disposition: attachment;
 filename=0001-Corrected-RETURN-VALUE-for-getsockopt-setsockopt-2.patch;
 size=831

RnJvbSAxOWFjM2NlNTJjNzkzNWM4ZjA3OTI4MzZkYzI3ZTAyYTlmMjYzNTlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLb25zdGFudGluIFNoZW15YWsgPGtvbnN0YW50aW5Ac2hlbXlh
ay5jb20+CkRhdGU6IEZyaSwgMjAgRmViIDIwMTUgMTU6NTk6MTkgKzAyMDAKU3ViamVjdDogW1BB
VENIXSBDb3JyZWN0ZWQgUkVUVVJOIFZBTFVFIGZvciBnZXRzb2Nrb3B0L3NldHNvY2tvcHQoMikK
Ci0tLQogbWFuMi9nZXRzb2Nrb3B0LjIgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWFuMi9nZXRzb2Nrb3B0LjIg
Yi9tYW4yL2dldHNvY2tvcHQuMgppbmRleCAxMjg3ZWZjLi4xYzc4ZmRjIDEwMDY0NAotLS0gYS9t
YW4yL2dldHNvY2tvcHQuMgorKysgYi9tYW4yL2dldHNvY2tvcHQuMgpAQCAtMTI5LDcgKzEyOSwx
MCBAQCBGb3IgYSBkZXNjcmlwdGlvbiBvZiB0aGUgYXZhaWxhYmxlIHNvY2tldCBvcHRpb25zIHNl
ZQogLkJSIHNvY2tldCAoNykKIGFuZCB0aGUgYXBwcm9wcmlhdGUgcHJvdG9jb2wgbWFuIHBhZ2Vz
LgogLlNIIFJFVFVSTiBWQUxVRQotT24gc3VjY2VzcywgemVybyBpcyByZXR1cm5lZC4KK09uIHN1
Y2Nlc3MsIHRoZSByZXR1cm4gdmFsdWUgZnJvbSB0aGUgY29ycmVzcG9uZGluZyBvcHRpb24gaGFu
ZGxlcgorcHJldmlvdXNseSByZWdpc3RlcmVkIGJ5CisuSSBuZl9yZWdpc3Rlcl9zb2Nrb3B0KCkK
K2lzIHJldHVybmVkLgogT24gZXJyb3IsIFwtMSBpcyByZXR1cm5lZCwgYW5kCiAuSSBlcnJubwog
aXMgc2V0IGFwcHJvcHJpYXRlbHkuCi0tIAoxLjkuMQoK
--=_0d09190572742aecdea966464ab14dbd--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
