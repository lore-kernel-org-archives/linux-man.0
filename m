From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Typo in hsearch.3
Date: Sun, 25 Sep 2011 22:23:31 +0200
Message-ID: <CAMqf4EHJgM7Usuirj3P86TLgFVXKv8QMRf9CHf5coTT182b3mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=bcaec520f4151efc2a04adc9d2da
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--bcaec520f4151efc2a04adc9d2da
Content-Type: text/plain; charset=UTF-8

Hello Michael,

Here is a patch against current master.

Denis

diff --git a/man3/hsearch.3 b/man3/hsearch.3
index 2fef68d..a939b46 100644
--- a/man3/hsearch.3
+++ b/man3/hsearch.3
@@ -247,7 +247,7 @@
 The
 .BR hdestroy ()
 and
-.BR hdestroy _r ()
+.BR hdestroy_r ()
 functions do not free the buffers pointed to by the
 .I key
 and

--bcaec520f4151efc2a04adc9d2da
Content-Type: text/x-patch; charset=US-ASCII; name="hsearch.patch"
Content-Disposition: attachment; filename="hsearch.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gt0h7vbs0

ZGlmZiAtLWdpdCBhL21hbjMvaHNlYXJjaC4zIGIvbWFuMy9oc2VhcmNoLjMKaW5kZXggMmZlZjY4
ZC4uYTkzOWI0NiAxMDA2NDQKLS0tIGEvbWFuMy9oc2VhcmNoLjMKKysrIGIvbWFuMy9oc2VhcmNo
LjMKQEAgLTI0Nyw3ICsyNDcsNyBAQAogVGhlCiAuQlIgaGRlc3Ryb3kgKCkKIGFuZAotLkJSIGhk
ZXN0cm95IF9yICgpCisuQlIgaGRlc3Ryb3lfciAoKQogZnVuY3Rpb25zIGRvIG5vdCBmcmVlIHRo
ZSBidWZmZXJzIHBvaW50ZWQgdG8gYnkgdGhlCiAuSSBrZXkKIGFuZAo=
--bcaec520f4151efc2a04adc9d2da--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
