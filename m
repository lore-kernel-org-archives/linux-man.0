From: Patrick McLean <patrickm-aTCcZBytkHbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] document FIONREAD on pipe
Date: Fri, 23 Sep 2016 15:17:28 -0700
Message-ID: <CAE2NFgU-hfRvNBxDBhN9=QpZ2AVwmNxx-kCXNajcRv0wfrwYPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=94eb2c111e54cead20053d3424e1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Coles <coles.david-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roderick Colenbrander <roderick-aTCcZBytkHbQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--94eb2c111e54cead20053d3424e1
Content-Type: text/plain; charset=UTF-8

The FIONREAD ioctl can be used on a pipe to get the current amount of
data in the pipe. This ioctl is currently only documented in tty_ioctl
(4). This adds a blurb to the pipe(7) man page about this ioctl.

--94eb2c111e54cead20053d3424e1
Content-Type: text/x-patch; charset=US-ASCII;
	name="man-pages-document-FIONREAD-on-pipe.patch"
Content-Disposition: attachment;
	filename="man-pages-document-FIONREAD-on-pipe.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_itgbuxou0

ZGlmZiAtLWdpdCBhL21hbjcvcGlwZS43IGIvbWFuNy9waXBlLjcKaW5kZXggOTk3N2FjYy4uZDQz
NjcxYiAxMDA2NDQKLS0tIGEvbWFuNy9waXBlLjcKKysrIGIvbWFuNy9waXBlLjcKQEAgLTE0Myw2
ICsxNDMsMTcgQEAgb3BlcmF0aW9ucy4KIFNlZQogLkJSIGZjbnRsICgyKQogZm9yIG1vcmUgaW5m
b3JtYXRpb24uCisKK1RoZSBjdXJyZW50IGFtb3VudCBvZiBkYXRhIHdhaXRpbmcgaW4gYSBwaXBl
IGNhbiBiZSBxdWVyaWVkIHdpdGggdGhlCisuQlIgaW9jdGwgKDIpCitvcGVyYXRpb24KKy5CUiBG
SU9OUkVBRCAuCitTZWUKKy5CUiBpb2N0bCAoMikKK2FuZAorLkJSIHR0eV9pb2N0bCAoNCkKK2Zv
ciBtb3JlIGluZm9ybWF0aW9uIG9uIHVzYWdlIG9mCisuQlIgRklPTlJFQUQgLgogLlwiCiAuU1Mg
UElQRV9CVUYKIFBPU0lYLjEgc2F5cyB0aGF0Cg==
--94eb2c111e54cead20053d3424e1--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
