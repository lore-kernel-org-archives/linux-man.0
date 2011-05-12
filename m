From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] Typo in select.2
Date: Thu, 12 May 2011 15:40:34 +0200
Message-ID: <BANLkTikA4Mz9OQpat5K3QpVZaPZAcFoN+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=90e6ba6e842a95226f04a3145615
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--90e6ba6e842a95226f04a3145615
Content-Type: text/plain; charset=UTF-8

Hello Michael,

Bernard Siaud reported a typo in our French translation, but I believe
that it is also present in English.  Here is a patch:

Denis

diff --git a/man2/select.2 b/man2/select.2
index 512471d..241694a 100644
--- a/man2/select.2
+++ b/man2/select.2
@@ -147,7 +147,7 @@ clears a set.
 .BR FD_SET ()
 and
 .BR FD_CLR ()
-respectively add and remove a given file descriptor from a set.
+respectively adds and removes a given file descriptor from a set.
 .BR FD_ISSET ()
 tests to see if a file descriptor is part of the set;
 this is useful after

--90e6ba6e842a95226f04a3145615
Content-Type: text/x-diff; charset=US-ASCII; name="select.2.patch"
Content-Disposition: attachment; filename="select.2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gnlqlhrj0

ZGlmZiAtLWdpdCBhL21hbjIvc2VsZWN0LjIgYi9tYW4yL3NlbGVjdC4yCmluZGV4IDUxMjQ3MWQu
LjI0MTY5NGEgMTAwNjQ0Ci0tLSBhL21hbjIvc2VsZWN0LjIKKysrIGIvbWFuMi9zZWxlY3QuMgpA
QCAtMTQ3LDcgKzE0Nyw3IEBAIGNsZWFycyBhIHNldC4KIC5CUiBGRF9TRVQgKCkKIGFuZAogLkJS
IEZEX0NMUiAoKQotcmVzcGVjdGl2ZWx5IGFkZCBhbmQgcmVtb3ZlIGEgZ2l2ZW4gZmlsZSBkZXNj
cmlwdG9yIGZyb20gYSBzZXQuCityZXNwZWN0aXZlbHkgYWRkcyBhbmQgcmVtb3ZlcyBhIGdpdmVu
IGZpbGUgZGVzY3JpcHRvciBmcm9tIGEgc2V0LgogLkJSIEZEX0lTU0VUICgpCiB0ZXN0cyB0byBz
ZWUgaWYgYSBmaWxlIGRlc2NyaXB0b3IgaXMgcGFydCBvZiB0aGUgc2V0OwogdGhpcyBpcyB1c2Vm
dWwgYWZ0ZXIK
--90e6ba6e842a95226f04a3145615--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
