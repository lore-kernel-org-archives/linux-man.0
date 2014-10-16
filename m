From: =?ISO-8859-1?Q?Manuel_L=F3pez=2DIb=E1=F1ez?=
	<lopezibanez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] pow.3: Add note on performance characteristics of pow
Date: Fri, 17 Oct 2014 01:51:53 +0200
Message-ID: <CAESRpQDx5TfgfRp1q69NiuCB5ve8+fR1NC2up9h5LOkogMKkqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=f46d043c815e127e89050592f077
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--f46d043c815e127e89050592f077
Content-Type: text/plain; charset=ISO-8859-1

Hello,

This patch documents
https://sourceware.org/bugzilla/show_bug.cgi?id=13932 as requested in
https://sourceware.org/bugzilla/show_bug.cgi?id=15267. It would be
nice to add more details, but it seems the behavior and its
consequences is not well understood. The purpose of the note is to
warn users of this behavior and thus avoid frustration
(http://entropymine.com/imageworsener/slowpow/).

This is my first patch. I followed (hopefully correctly) the instructions here:
https://www.kernel.org/doc/man-pages/patches.html

Cheers,

Manuel.

--f46d043c815e127e89050592f077
Content-Type: text/plain; charset=US-ASCII; name="pow.diff"
Content-Disposition: attachment; filename="pow.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i1cre79o0

ZGlmZiAtLWdpdCBhL21hbjMvcG93LjMgYi9tYW4zL3Bvdy4zCmluZGV4IGQwYTJlYTguLjNkMjE1
MWEgMTAwNjQ0Ci0tLSBhL21hbjMvcG93LjMKKysrIGIvbWFuMy9wb3cuMwpAQCAtMzIwLDYgKzMy
MCwxNyBAQCBUaGUgdmFyaWFudCByZXR1cm5pbmcKIGFsc28gY29uZm9ybXMgdG8KIFNWcjQsIDQu
M0JTRCwgQzg5LgogLlNIIEJVR1MKK09uIDY0LWJpdHMsCisuXCIKKy5cIiBodHRwczovL3NvdXJj
ZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMzkzMgorLkJSIHBvdyAoKQorbWF5
IGJlIG1vcmUgdGhhbiAxMCwwMDAgdGltZXMgc2xvd2VyIGZvciBzb21lIGlucHV0cyB0aGFuIGZv
ciBvdGhlciBuZWFyYnkKK2lucHV0cy4gVGhlIGlucHV0cyB0aGF0IHByb2R1Y2Ugc3VjaCBiZWhh
dmlvciBhcmUgZGlmZmVyZW50IGZvcgorLkJSIHBvd2YgKCksCisuQlIgcG93ICgpCithbmQKKy5C
UiBwb3dsICgpLgorCiBJbiBnbGliYyAyLjkgYW5kIGVhcmxpZXIsCiAuXCIKIC5cIiBodHRwOi8v
c291cmNlcy5yZWRoYXQuY29tL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD02Nzc2Cg==
--f46d043c815e127e89050592f077--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
