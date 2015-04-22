From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <agruen-mXXj517/zsQ@public.gmane.org>
Subject: Re: [Acl-devel] Moving attr(5) man page to man-pages
Date: Wed, 22 Apr 2015 12:42:29 +0200
Message-ID: <CAHpGcM+OcP1=z6KmcfqQX2L7TcFyQuQaNHphMim77zNQ_5TqYQ@mail.gmail.com>
References: <5537620E.3000601@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c1812ce0179205144dd1ab
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5537620E.3000601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, acl-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

--001a11c1812ce0179205144dd1ab
Content-Type: text/plain; charset=UTF-8

Michael,

2015-04-22 10:55 GMT+02:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi Andreas,
> I'll move this page into Section 7, since that's where overview
> type pages such as this are normally placed in man-pages, but
> I'll also create a link in Section 5, so that acl(5) references
> will continue to work.

okay.

> I've made a number of edits to the page. Some of these were just
> to bring the page closer to man-pages style,

The \(em dashes don't render in terminals very well.

> but others were to amend incorrect technical details and add new
> details. I'd be pleased if you checked over these commits

Thanks, that all looks good.

In addition, I would remove the list of file systems with extended
attribute support; they are supported pretty much everywhere to some
degree at least, even on  tmpfs.

I'm attaching a patch that also includes a few other minor changes.

Thanks,
Andreas

--001a11c1812ce0179205144dd1ab
Content-Type: text/plain; charset=US-ASCII; name="attr.7.diff"
Content-Disposition: attachment; filename="attr.7.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i8slylkp0

ZGlmZiAtLWdpdCBhL21hbjcvYXR0ci43IGIvbWFuNy9hdHRyLjcKaW5kZXggNzUzNzllNi4uM2Zj
OGY3NiAxMDA2NDQKLS0tIGEvbWFuNy9hdHRyLjcKKysrIGIvbWFuNy9hdHRyLjcKQEAgLTQ4LDEx
ICs0OCw4IEBAIEV4dGVuZGVkIGF0dHJpYnV0ZXMgYXJlIGFjY2Vzc2VkIGFzIGF0b21pYyBvYmpl
Y3RzLgogUmVhZGluZyByZXRyaWV2ZXMgdGhlIHdob2xlIHZhbHVlIG9mIGFuIGF0dHJpYnV0ZSBh
bmQgc3RvcmVzIGl0IGluIGEgYnVmZmVyLgogV3JpdGluZyByZXBsYWNlcyBhbnkgcHJldmlvdXMg
dmFsdWUgd2l0aCB0aGUgbmV3IHZhbHVlLgogLlBQCi1TcGFjZSBjb25zdW1lZCBmb3IgZXh0ZW5k
ZWQgYXR0cmlidXRlcyBpcyBjb3VudGVkIHRvd2FyZHMgdGhlIGRpc2sgcXVvdGFzCitTcGFjZSBj
b25zdW1lZCBmb3IgZXh0ZW5kZWQgYXR0cmlidXRlcyBtYXkgYmUgY291bnRlZCB0b3dhcmRzIHRo
ZSBkaXNrIHF1b3Rhcwogb2YgdGhlIGZpbGUgb3duZXIgYW5kIGZpbGUgZ3JvdXAuCi0uUFAKLUN1
cnJlbnRseSwgdGhlIGZpbGVzeXN0ZW1zIHRoYXQgc3VwcG9ydCBleHRlbmRlZCBhdHRyaWJ1dGVz
IGluY2x1ZGUKLUJ0cmZzLCBleHQyLCBleHQzLCBleHQ0LCBYRlMsIEpGUywgYW5kIFJlaXNlcmZz
LgogLlNTIEV4dGVuZGVkIGF0dHJpYnV0ZSBuYW1lc3BhY2VzCiBBdHRyaWJ1dGUgbmFtZXMgYXJl
IG51bGwtdGVybWluYXRlZCBzdHJpbmdzLgogVGhlIGF0dHJpYnV0ZSBuYW1lIGlzIGFsd2F5cyBz
cGVjaWZpZWQgaW4gdGhlIGZ1bGx5IHF1YWxpZmllZApAQCAtMTMwLDEyICsxMjcsMTMgQEAgYW5k
IGFjY2VzcyB0byBleHRlbmRlZCB1c2VyIGF0dHJpYnV0ZXMgaXMgcmVzdHJpY3RlZCB0byB0aGUK
IG93bmVyIGFuZCB0byB1c2VycyB3aXRoIGFwcHJvcHJpYXRlIGNhcGFiaWxpdGllcyBmb3IgZGly
ZWN0b3JpZXMgd2l0aCB0aGUKIHN0aWNreSBiaXQgc2V0IChzZWUgdGhlCiAuQlIgY2htb2QgKDEp
Ci1tYW51YWwgcGFnZSBmb3IgYW4gZXhwbGFuYXRpb24gb2YgU3RpY2t5IERpcmVjdG9yaWVzKS4K
K21hbnVhbCBwYWdlIGZvciBhbiBleHBsYW5hdGlvbiBvZiB0aGUgc3RpY2t5IGJpdCkuCiAuU1Mg
RmlsZXN5c3RlbSBkaWZmZXJlbmNlcwogVGhlIGtlcm5lbCBhbmQgdGhlIGZpbGVzeXN0ZW0gbWF5
IHBsYWNlIGxpbWl0cyBvbiB0aGUgbWF4aW11bSBudW1iZXIKIGFuZCBzaXplIG9mIGV4dGVuZGVk
IGF0dHJpYnV0ZXMgdGhhdCBjYW4gYmUgYXNzb2NpYXRlZCB3aXRoIGEgZmlsZS4KIFRoZSBWRlMg
aW1wb3NlcyBsaW1pdGF0aW9ucyB0aGF0IGFuIGF0dHJpYnV0ZSBuYW1lcyBpcyBsaW1pdGVkIHRv
IDI1NSBieXRlcwotYW5kIGFuIGF0dHJpYnV0ZSB2YWx1ZSBpZiBsaW1pdGVkIHRvIDY0a0IuCith
bmQgYW4gYXR0cmlidXRlIHZhbHVlIGlmIGxpbWl0ZWQgdG8gNjQga0IuIFRoZSBsaXN0IG9mIGF0
dHJpYnV0ZSBuYW1lcyB0aGF0CitjYW4gYmUgcmV0dXJuZWQgaXMgYWxzbyBsaW1pdGVkIHRvIDY0
IGtCLgogCiBTb21lIGZpbGVzeXN0ZW1zLCBzdWNoIGFzIFJlaXNlcmZzIChhbmQsIGhpc3Rvcmlj
YWxseSwgZXh0MiBhbmQgZXh0MyksCiByZXF1aXJlIHRoZSBmaWxlc3lzdGVtIHRvIGJlIG1vdW50
ZWQgd2l0aCB0aGUKQEAgLTE2MCw3ICsxNTgsNyBAQCBJbiB0aGUgQnRyZnMgZmlsZXN5c3RlbSBp
bXBsZW1lbnRhdGlvbiwKIHRoZSB0b3RhbCBieXRlcyB1c2VkIGZvciB0aGUgbmFtZSwgdmFsdWUs
IGFuZCBpbXBsZW1lbnRhdGlvbiBvdmVyaGVhZCBieXRlcwogaXMgbGltaXRlZCB0byB0aGUgZmls
ZXN5c3RlbQogLkkgbm9kZXNpemUKLXZhbHVlICgxNmtCIGJ5IGRlZmF1bHQpLgordmFsdWUgKDE2
IGtCIGJ5IGRlZmF1bHQpLgogLlNIIENPTkZPUk1JTkcgVE8KIEV4dGVuZGVkIGF0dHJpYnV0ZXMg
YXJlIG5vdCBzcGVjaWZpZWQgaW4gUE9TSVguMSwgYnV0IHNvbWUgb3RoZXIgc3lzdGVtcwogKGUu
Zy4sIHRoZSBCU0RzIGFuZCBTb2xhcmlzKSBwcm92aWRlIGEgc2ltaWxhciBmZWF0dXJlLgo=
--001a11c1812ce0179205144dd1ab--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
