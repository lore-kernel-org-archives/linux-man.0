From: Filipe David Manana <fdmanana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] fallocate.2: Reference header linux/falloc.h
Date: Sun, 16 Dec 2012 15:08:11 +0000
Message-ID: <CAL3q7H6SXux13tVdjaUwXOA4Zu7kTtFJcyOKAmyyYCZvjgFzWw@mail.gmail.com>
Reply-To: fdmanana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0015175cb6840e5b6804d0f9a2a6
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--0015175cb6840e5b6804d0f9a2a6
Content-Type: text/plain; charset=UTF-8

This affects all versions of the man pages that include fallocate.2
(to my knowledge).

Attempting to compile a program that calls fallocate() and references
the modes FALLOC_FL_KEEP_SIZE or FALLOC_FL_PUNCH_HOLE fails, because
these constants are not defined in fcntl.h (the only header referenced
in the man page for fallocate.2).

Patch follows inline below, and as an attachment as well.
Thank you.

>From 50b3cac563f6646fc75ffb8658064b25529cadea Mon Sep 17 00:00:00 2001
From: Filipe David Borba Manana <fdmanana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sun, 16 Dec 2012 14:56:47 +0000
Subject: [PATCH] fallocate.2: Reference header linux/falloc.h

This header file is where the constants used for the
mode parameter are defined (FALLOC_FL_KEEP_SIZE and
FALLOC_FL_PUNCH_HOLE at the moment).
---
 man2/fallocate.2 |    1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 363e50f..4aea591 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -12,6 +12,7 @@ fallocate \- manipulate file space
 .nf
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <fcntl.h>
+.B #include <linux/falloc.h>

 .BI "int fallocate(int " fd ", int " mode ", off_t " offset \
 ", off_t " len ");
-- 
1.7.9.5



-- 
Filipe David Manana,

"Reasonable men adapt themselves to the world.
 Unreasonable men adapt the world to themselves.
 That's why all progress depends on unreasonable men."

--0015175cb6840e5b6804d0f9a2a6
Content-Type: application/octet-stream;
	name="0001-fallocate.2-Reference-header-linux-falloc.h.patch"
Content-Disposition: attachment;
	filename="0001-fallocate.2-Reference-header-linux-falloc.h.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hasawejo0

RnJvbSA1MGIzY2FjNTYzZjY2NDZmYzc1ZmZiODY1ODA2NGIyNTUyOWNhZGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGaWxpcGUgRGF2aWQgQm9yYmEgTWFuYW5hIDxmZG1hbmFuYUBn
bWFpbC5jb20+CkRhdGU6IFN1biwgMTYgRGVjIDIwMTIgMTQ6NTY6NDcgKzAwMDAKU3ViamVjdDog
W1BBVENIXSBmYWxsb2NhdGUuMjogUmVmZXJlbmNlIGhlYWRlciBsaW51eC9mYWxsb2MuaAoKVGhp
cyBoZWFkZXIgZmlsZSBpcyB3aGVyZSB0aGUgY29uc3RhbnRzIHVzZWQgZm9yIHRoZQptb2RlIHBh
cmFtZXRlciBhcmUgZGVmaW5lZCAoRkFMTE9DX0ZMX0tFRVBfU0laRSBhbmQKRkFMTE9DX0ZMX1BV
TkNIX0hPTEUgYXQgdGhlIG1vbWVudCkuCi0tLQogbWFuMi9mYWxsb2NhdGUuMiB8ICAgIDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbWFuMi9mYWxsb2Nh
dGUuMiBiL21hbjIvZmFsbG9jYXRlLjIKaW5kZXggMzYzZTUwZi4uNGFlYTU5MSAxMDA2NDQKLS0t
IGEvbWFuMi9mYWxsb2NhdGUuMgorKysgYi9tYW4yL2ZhbGxvY2F0ZS4yCkBAIC0xMiw2ICsxMiw3
IEBAIGZhbGxvY2F0ZSBcLSBtYW5pcHVsYXRlIGZpbGUgc3BhY2UKIC5uZgogLkJSICIjZGVmaW5l
IF9HTlVfU09VUkNFIiAiICAgICAgICAgICAgIC8qIFNlZSBmZWF0dXJlX3Rlc3RfbWFjcm9zKDcp
ICovIgogLkIgI2luY2x1ZGUgPGZjbnRsLmg+CisuQiAjaW5jbHVkZSA8bGludXgvZmFsbG9jLmg+
CiAKIC5CSSAiaW50IGZhbGxvY2F0ZShpbnQgIiBmZCAiLCBpbnQgIiBtb2RlICIsIG9mZl90ICIg
b2Zmc2V0IFwKICIsIG9mZl90ICIgbGVuICIpOwotLSAKMS43LjkuNQoK
--0015175cb6840e5b6804d0f9a2a6--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
