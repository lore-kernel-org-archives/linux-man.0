From: =?utf-8?q?Andr=C3=A9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] strcpy.3: Avoid redundantly filling the position 'n - 1' two times in strncpy() example code
Date: Wed, 24 Sep 2008 11:01:34 -0300
Message-ID: <200809241101.34334.andre.goddard@gmail.com>
References: <200809210310.43647.andre.goddard@gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_+gk2I10lUElrX/j"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200809210310.43647.andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Boundary-00=_+gk2I10lUElrX/j
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

RnJvbSA4OGEwMjg0NWM2MDY0MTM0NDRiZmIwNTU5MzUzMDNiNDg5NmQwMjcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P3V0Zi04P3E/QW5kcj1DMz1BOT0yMEdvZGRhcmQ9MjBSb3Nh
Pz0gPGFuZHJlLmdvZGRhcmRAZ21haWwuY29tPgpEYXRlOiBXZWQsIDI0IFNlcCAyMDA4IDEwOjI1
OjA4IC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gQXZvaWQgcmVkdW5kYW50bHkgZmlsbGluZyB0aGUg
cG9zaXRpb24gJ24gLSAxJyB0d28gdGltZXMgaW4gc3RybmNweSgpIGV4YW1wbGUgY29kZS4KTUlN
RS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PXV0Zi04CkNv
bnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCldoZW4gd2UgdXNlICdzdHJuY3B5KGJ1Ziwg
c3RyLCBuKScsIHN0cm5jcHkoKSB3aWxsIGZpbGwgY2hhcnMgZnJvbSAwLi4obiAtIDEpLgpBcyB3
ZSBmb3JjZSB0aGUgY2hhcmFjdGVyIGF0IHBvc2l0aW9uICduIC0gMScgdG8gYmUgJ1wwJyBhbnl3
YXksIGRvbid0IGZpbGwgaXQgaW4gc3RybmNweSgpIGJlZm9yZS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHLDqSBHb2RkYXJkIFJvc2EgPGFuZHJlLmdvZGRhcmRAZ21haWwuY29tPgotLS0KIG1hbjMvc3Ry
Y3B5LjMgfCAgICAyICstCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tYW4zL3N0cmNweS4zIGIvbWFuMy9zdHJjcHkuMwppbmRl
eCA3YTgwOTFmLi5kMmUwOGEzIDEwMDY0NAotLS0gYS9tYW4zL3N0cmNweS4zCisrKyBiL21hbjMv
c3RyY3B5LjMKQEAgLTExNSw3ICsxMTUsNyBAQCBhcyBmb2xsb3dzOgogLmluICs0bgogLm5mCiAK
LXN0cm5jcHkoYnVmLCBzdHIsIG4pOworc3RybmNweShidWYsIHN0ciwgbiBcLSAxKTsKIGlmIChu
ID4gMCkKICAgICBidWZbbiBcLSAxXT0gXChhcVxcMFwoYXE7CiAuZmkKLS0gCjEuNi4wLjIuNTA4
LmcyNDU5MwoKAAo=

--Boundary-00=_+gk2I10lUElrX/j
Content-Type: text/x-patch;
  charset="utf-8";
  name="0001-Avoid-redundantly-filling-the-position-n-1-two-t.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-Avoid-redundantly-filling-the-position-n-1-two-t.patch"

=46rom 88a02845c606413444bfb055935303b4896d0271 Mon Sep 17 00:00:00 2001
=46rom: =3D?utf-8?q?Andr=3DC3=3DA9=3D20Goddard=3D20Rosa?=3D <andre.goddard@=
gmail.com>
Date: Wed, 24 Sep 2008 10:25:08 -0300
Subject: [PATCH] Avoid redundantly filling the position 'n - 1' two times i=
n strncpy() example code.
MIME-Version: 1.0
Content-Type: text/plain; charset=3Dutf-8
Content-Transfer-Encoding: 8bit

When we use 'strncpy(buf, str, n)', strncpy() will fill chars from 0..(n - =
1).
As we force the character at position 'n - 1' to be '\0' anyway, don't fill=
 it in strncpy() before.

Signed-off-by: Andr=C3=A9 Goddard Rosa <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2D--
 man3/strcpy.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/strcpy.3 b/man3/strcpy.3
index 7a8091f..d2e08a3 100644
=2D-- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -115,7 +115,7 @@ as follows:
 .in +4n
 .nf
=20
=2Dstrncpy(buf, str, n);
+strncpy(buf, str, n \- 1);
 if (n > 0)
     buf[n \- 1]=3D \(aq\\0\(aq;
 .fi
=2D-=20
1.6.0.2.508.g24593


--Boundary-00=_+gk2I10lUElrX/j--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
