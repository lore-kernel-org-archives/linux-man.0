From: Nikos Mavrogiannopoulos <nmav-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
Subject: [patch] select.2: Mention the fd size limitation early and refer to
 poll
Date: Fri, 29 Jan 2016 10:08:52 +0100
Message-ID: <1454058532.3459.1.camel@gnutls.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-IOyadHvJsLeQ3obURuVu"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-IOyadHvJsLeQ3obURuVu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

That is because the serious limitation of select imposing a limit
on the values a file descriptor can have, is mentioned too late
in the documentation in the notes section. The manpage should
warn and refer to poll as soon as possible.

(patch attached)

--=-IOyadHvJsLeQ3obURuVu
Content-Disposition: attachment;
	filename*0=0001-select.2-Mention-the-fd-size-limitation-early-and-re.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-select.2-Mention-the-fd-size-limitation-early-and-re.patch";
	charset="UTF-8"

RnJvbSBjYTNmMWRjYzIyODFmZjdiZGQxNGY4MGE3NThiMzEyMzk1NzFkNWNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWtvcyBNYXZyb2dpYW5ub3BvdWxvcyA8bm1hdkBnbnV0bHMu
b3JnPgpEYXRlOiBGcmksIDI5IEphbiAyMDE2IDEwOjAzOjQ1ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gc2VsZWN0LjI6IE1lbnRpb24gdGhlIGZkIHNpemUgbGltaXRhdGlvbiBlYXJseSBhbmQgcmVm
ZXIgdG8KIHBvbGwKClRoYXQgaXMgYmVjYXVzZSB0aGUgc2VyaW91cyBsaW1pdGF0aW9uIG9mIHNl
bGVjdCBpbXBvc2luZyBhIGxpbWl0Cm9uIHRoZSB2YWx1ZXMgYSBmaWxlIGRlc2NyaXB0b3IgY2Fu
IGhhdmUsIGlzIG1lbnRpb25lZCB0b28gbGF0ZQppbiB0aGUgZG9jdW1lbnRhdGlvbiBpbiB0aGUg
bm90ZXMgc2VjdGlvbi4gVGhlIG1hbnBhZ2Ugc2hvdWxkCndhcm4gYW5kIHJlZmVyIHRvIHBvbGwg
YXMgc29vbiBhcyBwb3NzaWJsZS4KClNpZ25lZC1vZmYtYnk6IE5pa29zIE1hdnJvZ2lhbm5vcG91
bG9zIDxubWF2QGdudXRscy5vcmc+Ci0tLQogbWFuMi9zZWxlY3QuMiB8IDcgKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21hbjIvc2VsZWN0LjIg
Yi9tYW4yL3NlbGVjdC4yCmluZGV4IDE1MTkzMmUuLjZjNzZlMWMgMTAwNjQ0Ci0tLSBhL21hbjIv
c2VsZWN0LjIKKysrIGIvbWFuMi9zZWxlY3QuMgpAQCAtOTEsNiArOTEsMTMgQEAgcGVyZm9ybSBh
IGNvcnJlc3BvbmRpbmcgSS9PIG9wZXJhdGlvbiAoZS5nLiwKIHdpdGhvdXQgYmxvY2tpbmcsIG9y
IGEgc3VmZmljaWVudGx5IHNtYWxsCiAuQlIgd3JpdGUgKDIpKS4KIC5QUAorVGhlIGZpbGUgZGVz
Y3JpcHRvcnMKKy5CUiBzZWxlY3QgKCkKK2NhbiBtb25pdG9yIGNhbm5vdCBiZSBsYXJnZXIgdGhh
bgorLkIgRkRfU0VUU0laRS4KKy5CUiBwb2xsICgyKSwKK2RvZXMgbm90IGhhdmUgdGhpcyBsaW1p
dGF0aW9uLgorLlBQCiBUaGUgb3BlcmF0aW9uIG9mCiAuQlIgc2VsZWN0ICgpCiBhbmQKLS0gCjIu
NS4xCgo=


--=-IOyadHvJsLeQ3obURuVu--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
