From: =?utf-8?q?Andr=C3=A9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] hsearch.3: Call hdestroy() after using hash table created by hcreate(), for the sake of completeness
Date: Wed, 24 Sep 2008 11:01:22 -0300
Message-ID: <200809241101.23128.andre.goddard@gmail.com>
References: <200809210310.43647.andre.goddard@gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_zgk2It8UOhshWoC"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200809210310.43647.andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Boundary-00=_zgk2It8UOhshWoC
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

RnJvbSBkYzBmMjZkMzExMjUxOTIyOTY3MWM2MjE4MzJmODdhNDhlOTcyNjQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P3V0Zi04P3E/QW5kcj1DMz1BOT0yMEdvZGRhcmQ9MjBSb3Nh
Pz0gPGFuZHJlLmdvZGRhcmRAZ21haWwuY29tPgpEYXRlOiBXZWQsIDI0IFNlcCAyMDA4IDEwOjU5
OjM3IC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gQ2FsbCBoZGVzdHJveSgpIGFmdGVyIHVzaW5nIGhh
c2ggdGFibGUgY3JlYXRlZCBieSBoY3JlYXRlKCksIGZvciB0aGUgc2FrZSBvZiBjb21wbGV0ZW5l
c3MuCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD11
dGYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpTaWduZWQtb2ZmLWJ5OiBBbmRy
w6kgR29kZGFyZCBSb3NhIDxhbmRyZS5nb2RkYXJkQGdtYWlsLmNvbT4KLS0tCiBtYW4zL2hzZWFy
Y2guMyB8ICAgIDEgKwogMSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDAgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbWFuMy9oc2VhcmNoLjMgYi9tYW4zL2hzZWFyY2guMwppbmRl
eCAxNmUzYjZiLi5kNWFlMjFjIDEwMDY0NAotLS0gYS9tYW4zL2hzZWFyY2guMworKysgYi9tYW4z
L2hzZWFyY2guMwpAQCAtMzI1LDYgKzMyNSw3IEBAIG1haW4odm9pZCkKICAgICAgICAgcHJpbnRm
KCIlOS45cyBcLT4gJTkuOXM6JWRcXG4iLCBlLmtleSwKICAgICAgICAgICAgICAgIGVwID8gZXBc
LT5rZXkgOiAiTlVMTCIsIGVwID8gKGludCkoZXBcLT5kYXRhKSA6IDApOwogICAgIH0KKyAgICBo
ZGVzdHJveSgpOwogICAgIGV4aXQoRVhJVF9TVUNDRVNTKTsKIH0KIC5maQotLSAKMS42LjAuMi41
MDguZzI0NTkzCgoACg==

--Boundary-00=_zgk2It8UOhshWoC
Content-Type: text/x-patch;
  charset="utf-8";
  name="0001-Call-hdestroy-after-using-hash-table-created-by-hc.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-Call-hdestroy-after-using-hash-table-created-by-hc.patch"

=46rom dc0f26d3112519229671c621832f87a48e972642 Mon Sep 17 00:00:00 2001
=46rom: =3D?utf-8?q?Andr=3DC3=3DA9=3D20Goddard=3D20Rosa?=3D <andre.goddard@=
gmail.com>
Date: Wed, 24 Sep 2008 10:59:37 -0300
Subject: [PATCH] Call hdestroy() after using hash table created by hcreate(=
), for the sake of completeness.
MIME-Version: 1.0
Content-Type: text/plain; charset=3Dutf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andr=C3=A9 Goddard Rosa <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2D--
 man3/hsearch.3 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/man3/hsearch.3 b/man3/hsearch.3
index 16e3b6b..d5ae21c 100644
=2D-- a/man3/hsearch.3
+++ b/man3/hsearch.3
@@ -325,6 +325,7 @@ main(void)
         printf("%9.9s \-> %9.9s:%d\\n", e.key,
                ep ? ep\->key : "NULL", ep ? (int)(ep\->data) : 0);
     }
+    hdestroy();
     exit(EXIT_SUCCESS);
 }
 .fi
=2D-=20
1.6.0.2.508.g24593


--Boundary-00=_zgk2It8UOhshWoC--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
