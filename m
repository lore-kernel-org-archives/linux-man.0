From: Jessica McKellar <jesstess-3s7WtUTddSA@public.gmane.org>
Subject: [patch] open.2: fix grammar in O_DIRECT description
Date: Sun, 12 Feb 2012 15:27:55 -0500
Message-ID: <CAKDZRciFBUuznH5hhySfNwVxBD_oJCmtBPxBEht2pHbUKmTFqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae939954f64d2c504b8ca3242
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae939954f64d2c504b8ca3242
Content-Type: text/plain; charset=ISO-8859-1

Hi,

The following patch (also attached) makes some small grammar fixes to
the O_DIRECT description in man2/open.2. The patch is against master
in git:

===

diff --git a/man2/open.2 b/man2/open.2
index 69324dd..a97158a 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -281,11 +281,11 @@ special situations, such as when applications do
their own caching.
 File I/O is done directly to/from user space buffers.
 The
 .B O_DIRECT
-flag on its own makes at an effort to transfer data synchronously,
+flag on its own makes an effort to transfer data synchronously,
 but does not give the guarantees of the
 .B O_SYNC
-that data and necessary metadata are transferred.
-To guarantee synchronous I/O the
+flag that data and necessary metadata are transferred.
+To guarantee synchronous I/O,
 .B O_SYNC
 must be used in addition to
 .BR O_DIRECT .

===

Regards,
-Jessica

--
Jessica McKellar
http://jesstess.com

--14dae939954f64d2c504b8ca3242
Content-Type: application/octet-stream; name="O_DIRECT.diff"
Content-Disposition: attachment; filename="O_DIRECT.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gykiryd00

ZGlmZiAtLWdpdCBhL21hbjIvb3Blbi4yIGIvbWFuMi9vcGVuLjIKaW5kZXggNjkzMjRkZC4uYTk3
MTU4YSAxMDA2NDQKLS0tIGEvbWFuMi9vcGVuLjIKKysrIGIvbWFuMi9vcGVuLjIKQEAgLTI4MSwx
MSArMjgxLDExIEBAIHNwZWNpYWwgc2l0dWF0aW9ucywgc3VjaCBhcyB3aGVuIGFwcGxpY2F0aW9u
cyBkbyB0aGVpciBvd24gY2FjaGluZy4KIEZpbGUgSS9PIGlzIGRvbmUgZGlyZWN0bHkgdG8vZnJv
bSB1c2VyIHNwYWNlIGJ1ZmZlcnMuCiBUaGUKIC5CIE9fRElSRUNUCi1mbGFnIG9uIGl0cyBvd24g
bWFrZXMgYXQgYW4gZWZmb3J0IHRvIHRyYW5zZmVyIGRhdGEgc3luY2hyb25vdXNseSwKK2ZsYWcg
b24gaXRzIG93biBtYWtlcyBhbiBlZmZvcnQgdG8gdHJhbnNmZXIgZGF0YSBzeW5jaHJvbm91c2x5
LAogYnV0IGRvZXMgbm90IGdpdmUgdGhlIGd1YXJhbnRlZXMgb2YgdGhlCiAuQiBPX1NZTkMKLXRo
YXQgZGF0YSBhbmQgbmVjZXNzYXJ5IG1ldGFkYXRhIGFyZSB0cmFuc2ZlcnJlZC4KLVRvIGd1YXJh
bnRlZSBzeW5jaHJvbm91cyBJL08gdGhlCitmbGFnIHRoYXQgZGF0YSBhbmQgbmVjZXNzYXJ5IG1l
dGFkYXRhIGFyZSB0cmFuc2ZlcnJlZC4KK1RvIGd1YXJhbnRlZSBzeW5jaHJvbm91cyBJL08sCiAu
QiBPX1NZTkMKIG11c3QgYmUgdXNlZCBpbiBhZGRpdGlvbiB0bwogLkJSIE9fRElSRUNUIC4K
--14dae939954f64d2c504b8ca3242--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
