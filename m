From: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Note that there's no glibc wrapper for set_tid_address.
Date: Mon, 7 Aug 2017 08:53:10 -0700
Message-ID: <CAJgzZoqVFhcEU_Fmrbteq7YSCgpxendHk9aePUvFazgNd=KZmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="001a114477dc31943f05562bd9f9"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--001a114477dc31943f05562bd9f9
Content-Type: text/plain; charset="UTF-8"

---
 man2/set_tid_address.2 | 6 ++++++
 1 file changed, 6 insertions(+)

--001a114477dc31943f05562bd9f9
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-Note-that-there-s-no-glibc-wrapper-for-set_tid_addre.patch"
Content-Disposition: attachment;
	filename="0001-Note-that-there-s-no-glibc-wrapper-for-set_tid_addre.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j62c615k0

RnJvbSA0Y2NmMWJhMjQ2YzFkYTQ4ODkzODY1YmQzZGM5ZTAyOWRiZjdmZDNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFbGxpb3R0IEh1Z2hlcyA8ZW5oQGdvb2dsZS5jb20+CkRhdGU6
IE1vbiwgNyBBdWcgMjAxNyAwODo1MToyOCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIE5vdGUgdGhh
dCB0aGVyZSdzIG5vIGdsaWJjIHdyYXBwZXIgZm9yIHNldF90aWRfYWRkcmVzcy4KCi0tLQogbWFu
Mi9zZXRfdGlkX2FkZHJlc3MuMiB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvbWFuMi9zZXRfdGlkX2FkZHJlc3MuMiBiL21hbjIvc2V0X3Rp
ZF9hZGRyZXNzLjIKaW5kZXggNDQ2YjkwMDlhLi5iMTljYjA4MjMgMTAwNjQ0Ci0tLSBhL21hbjIv
c2V0X3RpZF9hZGRyZXNzLjIKKysrIGIvbWFuMi9zZXRfdGlkX2FkZHJlc3MuMgpAQCAtMzEsNiAr
MzEsOSBAQCBzZXRfdGlkX2FkZHJlc3MgXC0gc2V0IHBvaW50ZXIgdG8gdGhyZWFkIElECiAuc3AK
IC5CSSAibG9uZyBzZXRfdGlkX2FkZHJlc3MoaW50ICoiIHRpZHB0ciApOwogLmZpCisKKy5JUiBO
b3RlIDoKK1RoZXJlIGlzIG5vIGdsaWJjIHdyYXBwZXIgZm9yIHRoaXMgc3lzdGVtIGNhbGw7IHNl
ZSBOT1RFUy4KIC5TSCBERVNDUklQVElPTgogRm9yIGVhY2ggdGhyZWFkLCB0aGUga2VybmVsIG1h
aW50YWlucyB0d28gYXR0cmlidXRlcyAoYWRkcmVzc2VzKSBjYWxsZWQKIC5JIHNldF9jaGlsZF90
aWQKQEAgLTk2LDYgKzk5LDkgQEAgVGhpcyBjYWxsIGlzIHByZXNlbnQgc2luY2UgTGludXggMi41
LjQ4LgogRGV0YWlscyBhcyBnaXZlbiBoZXJlIGFyZSB2YWxpZCBzaW5jZSBMaW51eCAyLjUuNDku
CiAuU0ggQ09ORk9STUlORyBUTwogVGhpcyBzeXN0ZW0gY2FsbCBpcyBMaW51eC1zcGVjaWZpYy4K
Ky5TSCBOT1RFUworR2xpYmMgZG9lcyBub3QgcHJvdmlkZSBhIHdyYXBwZXIgZm9yIHRoaXMgc3lz
dGVtIGNhbGw7IGNhbGwgaXQgdXNpbmcKKy5CUiBzeXNjYWxsICgyKS4KIC5TSCBTRUUgQUxTTwog
LkJSIGNsb25lICgyKSwKIC5CUiBmdXRleCAoMiksCi0tIAoyLjE0LjAucmMxLjM4My5nZDFjZTM5
NGZlMi1nb29nCgo=
--001a114477dc31943f05562bd9f9--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
