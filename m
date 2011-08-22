From: Alon Bar-Lev <alon.barlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ld.so - add environment placeholders
Date: Mon, 22 Aug 2011 22:21:18 +0300
Message-ID: <CAOazyz0=jopXbWJBtBLgxF087nmHph4u3q9nG=5CjPSzKqD8Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000e0cd56700c413c904ab1cfbc8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--000e0cd56700c413c904ab1cfbc8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Discussion is here[1].

Apparently there is a hidden feature in ld.so, it support variable
placeholders within environment.

This is great for supporting mixed multilib environment.

Example:

export LD_LIBRARY_PATH=3D"${LD_LIBRARY_PATH}:/opt/my/\${LIB}"

I believe this worth a documentation, as almost nobody knows this.

---
 ENVIRONMENT
+       ld.so understands the strings $ORIGIN, $LIB and $PLATFORM  (or  equ=
iva=E2=80=90
+       lently   ${var})   in  some  of  the  environment  variables,  such=
  as
+       LD_LIBRARY_PATH and LD_PRELOAD:
+
+              ORIGIN is expanded to the location of the binary which  is  =
cur=E2=80=90
+              rently loaded.
+
+              LIB  is  expanded to lib, lib64 or any other multilib config=
ura=E2=80=90
+              tion based on the ld configuration.  Use when mixed  environ=
ment
+              (32bit and 64bit) searches for same libraries names.
+
+              PLATFORM is expanded to the running platform.

        There are four important environment variables.
---

Any test will do! as long as this feature gets documented.

Signed-off-by: Alon Bar-Lev <alon.barlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[1] http://sourceware.org/ml/libc-alpha/2011-08/msg00089.html

---

[Attached]
I am not subscribed, so please CC me.

--000e0cd56700c413c904ab1cfbc8
Content-Type: plain/text; name="man-pages-master-ld.so.8-vars.diff"
Content-Disposition: attachment;
	filename="man-pages-master-ld.so.8-vars.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_grntxssd1

W1BBVENIXSBsZC5zbyAtIGFkZCBlbnZpcm9ubWVudCBwbGFjZWhvbGRlcnMKCkRpc2N1c3Npb24g
aXMgaGVyZVsxXS4KCkFwcGFyZW50bHkgdGhlcmUgaXMgYSBoaWRkZW4gZmVhdHVyZSBpbiBsZC5z
bywgaXQgc3VwcG9ydCB2YXJpYWJsZQpwbGFjZWhvbGRlcnMgd2l0aGluIGVudmlyb25tZW50LgoK
VGhpcyBpcyBncmVhdCBmb3Igc3VwcG9ydGluZyBtaXhlZCBtdWx0aWxpYiBlbnZpcm9ubWVudC4K
CkV4YW1wbGU6CgpleHBvcnQgTERfTElCUkFSWV9QQVRIPSIke0xEX0xJQlJBUllfUEFUSH06L29w
dC9teS9cJHtMSUJ9IgoKSSBiZWxpZXZlIHRoaXMgd29ydGggYSBkb2N1bWVudGF0aW9uLCBhcyBh
bG1vc3Qgbm9ib2R5IGtub3dzIHRoaXMuCgotLS0KIEVOVklST05NRU5UCisgICAgICAgbGQuc28g
dW5kZXJzdGFuZHMgdGhlIHN0cmluZ3MgJE9SSUdJTiwgJExJQiBhbmQgJFBMQVRGT1JNICAob3Ig
IGVxdWl2YeKAkAorICAgICAgIGxlbnRseSAgICR7dmFyfSkgICBpbiAgc29tZSAgb2YgIHRoZSAg
ZW52aXJvbm1lbnQgIHZhcmlhYmxlcywgIHN1Y2ggIGFzCisgICAgICAgTERfTElCUkFSWV9QQVRI
IGFuZCBMRF9QUkVMT0FEOgorCisgICAgICAgICAgICAgIE9SSUdJTiBpcyBleHBhbmRlZCB0byB0
aGUgbG9jYXRpb24gb2YgdGhlIGJpbmFyeSB3aGljaCAgaXMgIGN1cuKAkAorICAgICAgICAgICAg
ICByZW50bHkgbG9hZGVkLgorCisgICAgICAgICAgICAgIExJQiAgaXMgIGV4cGFuZGVkIHRvIGxp
YiwgbGliNjQgb3IgYW55IG90aGVyIG11bHRpbGliIGNvbmZpZ3VyYeKAkAorICAgICAgICAgICAg
ICB0aW9uIGJhc2VkIG9uIHRoZSBsZCBjb25maWd1cmF0aW9uLiAgVXNlIHdoZW4gbWl4ZWQgIGVu
dmlyb25tZW50CisgICAgICAgICAgICAgICgzMmJpdCBhbmQgNjRiaXQpIHNlYXJjaGVzIGZvciBz
YW1lIGxpYnJhcmllcyBuYW1lcy4KKworICAgICAgICAgICAgICBQTEFURk9STSBpcyBleHBhbmRl
ZCB0byB0aGUgcnVubmluZyBwbGF0Zm9ybS4KCiAgICAgICAgVGhlcmUgYXJlIGZvdXIgaW1wb3J0
YW50IGVudmlyb25tZW50IHZhcmlhYmxlcy4KLS0tCgpBbnkgdGVzdCB3aWxsIGRvISBhcyBsb25n
IGFzIHRoaXMgZmVhdHVyZSBnZXRzIGRvY3VtZW50ZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbG9uIEJh
ci1MZXYgPGFsb24uYmFybGV2QGdtYWlsLmNvbT4KClsxXSBodHRwOi8vc291cmNld2FyZS5vcmcv
bWwvbGliYy1hbHBoYS8yMDExLTA4L21zZzAwMDg5Lmh0bWwKCi0tLQoKZGlmZiAtLWdpdCBhL21h
bjgvbGQuc28uOCBiL21hbjgvbGQuc28uOAppbmRleCA4NDI3OGQwLi5kYTdlZGFkIDEwMDY0NAot
LS0gYS9tYW44L2xkLnNvLjgKKysrIGIvbWFuOC9sZC5zby44CkBAIC0xMjcsNiArMTI3LDMwIEBA
IFRoaXMgb3B0aW9uIGlzIGlnbm9yZWQgaWYKIC5CIGxkLnNvCiBpcyBzZXQtdXNlci1JRCBvciBz
ZXQtZ3JvdXAtSUQuCiAuU0ggRU5WSVJPTk1FTlQKKy5CIGxkLnNvCit1bmRlcnN0YW5kcyB0aGUg
c3RyaW5ncworLklSICRPUklHSU4gLAorLkkgJExJQgorYW5kCisuSSAkUExBVEZPUk0KKyhvciBl
cXVpdmFsZW50bHkKKy5JUiAke3Zhcn0gKQoraW4gc29tZSBvZiB0aGUgZW52aXJvbm1lbnQgdmFy
aWFibGVzLCBzdWNoIGFzCisuQiBMRF9MSUJSQVJZX1BBVEgKK2FuZAorLkJSIExEX1BSRUxPQUQg
OgorLklQCisuQiBPUklHSU4KK2lzIGV4cGFuZGVkIHRvIHRoZSBsb2NhdGlvbiBvZiB0aGUgYmlu
YXJ5IHdoaWNoIGlzIGN1cnJlbnRseSBsb2FkZWQuCisuSVAKKy5CIExJQgoraXMgZXhwYW5kZWQg
dG8gbGliLCBsaWI2NCBvciBhbnkgb3RoZXIgbXVsdGlsaWIgY29uZmlndXJhdGlvbiBiYXNlZCBv
biB0aGUKK2xkIGNvbmZpZ3VyYXRpb24uCitVc2Ugd2hlbiBtaXhlZCBlbnZpcm9ubWVudCAoMzJi
aXQgYW5kIDY0Yml0KSBzZWFyY2hlcyBmb3Igc2FtZSBsaWJyYXJpZXMgbmFtZXMuCisuSVAKKy5C
IFBMQVRGT1JNCitpcyBleHBhbmRlZCB0byB0aGUgcnVubmluZyBwbGF0Zm9ybS4KKy5QUAogVGhl
cmUgYXJlIGZvdXIgaW1wb3J0YW50IGVudmlyb25tZW50IHZhcmlhYmxlcy4KIC5UUAogLkIgTERf
QklORF9OT1cK
--000e0cd56700c413c904ab1cfbc8--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
