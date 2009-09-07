From: =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] vfork.2: Add sentence explaining what is done to data space
	copy after exec(3)
Date: Mon, 7 Sep 2009 11:33:07 -0300
Message-ID: <b8bf37780909070733v79eb854ds6dbd25d39ff5c80e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0015175748daa599b10472fdbabd
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--0015175748daa599b10472fdbabd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>From d12bf2ad1cbf72c4b4bc6913e1ce8077333bade0 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Goddard=3D20Rosa?=3D <andre.goddard@gm=
ail.com>
Date: Mon, 7 Sep 2009 11:19:36 -0300
Subject: [PATCH] vfork.2: Add sentence explaining what is done to data
space copy after exec(3)
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Explain that in case exec() is done immediately after vfork(), the data
space copy has a very limited lifespan, being discarded afterwards.

Signed-off-by: Andr=E9 Goddard Rosa <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/man2/vfork.2 b/man2/vfork.2
index ef86812..6dc1c28 100644
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -110,7 +110,7 @@ and to create a unique task structure for the child.
 However, in the bad old days a
 .BR fork (2)
 would require making a complete copy of the caller's data space,
-often needlessly, since usually immediately afterwards an
+often needlessly, since usually it's discarded immediately afterwards an
 .BR exec (3)
 is done.
 Thus, for greater efficiency, BSD introduced the
--=20
1.6.4.2.268.g6ea71

--0015175748daa599b10472fdbabd
Content-Type: text/x-patch; charset=UTF-8;
	name="0001-vfork.2-Add-sentence-explaining-what-is-done-to-data.patch"
Content-Disposition: attachment;
	filename="0001-vfork.2-Add-sentence-explaining-what-is-done-to-data.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzbbabd00

RnJvbSBkMTJiZjJhZDFjYmY3MmM0YjRiYzY5MTNlMWNlODA3NzMzM2JhZGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMEdvZGRhcmQ9MjBSb3Nh
Pz0gPGFuZHJlLmdvZGRhcmRAZ21haWwuY29tPgpEYXRlOiBNb24sIDcgU2VwIDIwMDkgMTE6MTk6
MzYgLTAzMDAKU3ViamVjdDogW1BBVENIXSB2Zm9yay4yOiBBZGQgc2VudGVuY2UgZXhwbGFpbmlu
ZyB3aGF0IGlzIGRvbmUgdG8gZGF0YSBzcGFjZSBjb3B5IGFmdGVyIGV4ZWMoMykKTUlNRS1WZXJz
aW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQt
VHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCkV4cGxhaW4gdGhhdCBpbiBjYXNlIGV4ZWMoKSBpcyBk
b25lIGltbWVkaWF0ZWx5IGFmdGVyIHZmb3JrKCksIHRoZSBkYXRhCnNwYWNlIGNvcHkgaGFzIGEg
dmVyeSBsaW1pdGVkIGxpZmVzcGFuLCBiZWluZyBkaXNjYXJkZWQgYWZ0ZXJ3YXJkcy4KClNpZ25l
ZC1vZmYtYnk6IEFuZHLDqSBHb2RkYXJkIFJvc2EgPGFuZHJlLmdvZGRhcmRAZ21haWwuY29tPgoK
ZGlmZiAtLWdpdCBhL21hbjIvdmZvcmsuMiBiL21hbjIvdmZvcmsuMgppbmRleCBlZjg2ODEyLi42
ZGMxYzI4IDEwMDY0NAotLS0gYS9tYW4yL3Zmb3JrLjIKKysrIGIvbWFuMi92Zm9yay4yCkBAIC0x
MTAsNyArMTEwLDcgQEAgYW5kIHRvIGNyZWF0ZSBhIHVuaXF1ZSB0YXNrIHN0cnVjdHVyZSBmb3Ig
dGhlIGNoaWxkLgogSG93ZXZlciwgaW4gdGhlIGJhZCBvbGQgZGF5cyBhCiAuQlIgZm9yayAoMikK
IHdvdWxkIHJlcXVpcmUgbWFraW5nIGEgY29tcGxldGUgY29weSBvZiB0aGUgY2FsbGVyJ3MgZGF0
YSBzcGFjZSwKLW9mdGVuIG5lZWRsZXNzbHksIHNpbmNlIHVzdWFsbHkgaW1tZWRpYXRlbHkgYWZ0
ZXJ3YXJkcyBhbgorb2Z0ZW4gbmVlZGxlc3NseSwgc2luY2UgdXN1YWxseSBpdCdzIGRpc2NhcmRl
ZCBpbW1lZGlhdGVseSBhZnRlcndhcmRzIGFuCiAuQlIgZXhlYyAoMykKIGlzIGRvbmUuCiBUaHVz
LCBmb3IgZ3JlYXRlciBlZmZpY2llbmN5LCBCU0QgaW50cm9kdWNlZCB0aGUKLS0gCjEuNi40LjIu
MjY4Lmc2ZWE3MQoK
--0015175748daa599b10472fdbabd--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
