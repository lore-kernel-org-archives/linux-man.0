From: =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] vfork.2: Improve text legibility and fix verbs tense
Date: Sun, 18 Oct 2009 09:51:33 -0300
Message-ID: <b8bf37780910180551g23f00ff2x1f2fca413a4b4842@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e6469a56c7538d047635160e
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--0016e6469a56c7538d047635160e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>From 33671da01189ff40533708c1d81e6d78bfa5e312 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Goddard=3D20Rosa?=3D <andre.goddard@gm=
ail.com>
Date: Sat, 17 Oct 2009 09:44:17 -0300
Subject: [PATCH] [PATCH] vfork.2: Improve text legibility and fix verbs ten=
se
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andr=E9 Goddard Rosa <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/man2/vfork.2 b/man2/vfork.2
index ef86812..4f73f80 100644
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -74,7 +74,7 @@ is a special case of
 It is used to create new processes without copying the page tables of
 the parent process.
 It may be useful in performance-sensitive applications
-where a child will be created which then immediately issues an
+where a child will be created which then will immediately issue an
 .BR execve (2).
 .PP
 .BR vfork ()
@@ -110,7 +110,9 @@ and to create a unique task structure for the child.
 However, in the bad old days a
 .BR fork (2)
 would require making a complete copy of the caller's data space,
-often needlessly, since usually immediately afterwards an
+often needlessly, since usually immediately afterwards a
+.BR vfork ()
+an
 .BR exec (3)
 is done.
 Thus, for greater efficiency, BSD introduced the
@@ -125,7 +127,7 @@ child was using its resources.
 The use of
 .BR vfork ()
 was tricky: for example, not modifying data
-in the parent process depended on knowing which variables are
+in the parent process depended on knowing which variables were
 held in a register.
 .SH "CONFORMING TO"
 4.3BSD, POSIX.1-2001.
--=20
1.6.5.1.31.gad12b

--0016e6469a56c7538d047635160e
Content-Type: text/x-patch; charset=UTF-8;
	name="0001-PATCH-vfork.2-Improve-text-legibility-and-fix-verbs-.patch"
Content-Disposition: attachment;
	filename="0001-PATCH-vfork.2-Improve-text-legibility-and-fix-verbs-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g0wd9dqc0

RnJvbSAzMzY3MWRhMDExODlmZjQwNTMzNzA4YzFkODFlNmQ3OGJmYTVlMzEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMEdvZGRhcmQ9MjBSb3Nh
Pz0gPGFuZHJlLmdvZGRhcmRAZ21haWwuY29tPgpEYXRlOiBTYXQsIDE3IE9jdCAyMDA5IDA5OjQ0
OjE3IC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gW1BBVENIXSB2Zm9yay4yOiBJbXByb3ZlIHRleHQg
bGVnaWJpbGl0eSBhbmQgZml4IHZlcmJzIHRlbnNlCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5n
OiA4Yml0CgpTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgR29kZGFyZCBSb3NhIDxhbmRyZS5nb2RkYXJk
QGdtYWlsLmNvbT4KCmRpZmYgLS1naXQgYS9tYW4yL3Zmb3JrLjIgYi9tYW4yL3Zmb3JrLjIKaW5k
ZXggZWY4NjgxMi4uNGY3M2Y4MCAxMDA2NDQKLS0tIGEvbWFuMi92Zm9yay4yCisrKyBiL21hbjIv
dmZvcmsuMgpAQCAtNzQsNyArNzQsNyBAQCBpcyBhIHNwZWNpYWwgY2FzZSBvZgogSXQgaXMgdXNl
ZCB0byBjcmVhdGUgbmV3IHByb2Nlc3NlcyB3aXRob3V0IGNvcHlpbmcgdGhlIHBhZ2UgdGFibGVz
IG9mCiB0aGUgcGFyZW50IHByb2Nlc3MuCiBJdCBtYXkgYmUgdXNlZnVsIGluIHBlcmZvcm1hbmNl
LXNlbnNpdGl2ZSBhcHBsaWNhdGlvbnMKLXdoZXJlIGEgY2hpbGQgd2lsbCBiZSBjcmVhdGVkIHdo
aWNoIHRoZW4gaW1tZWRpYXRlbHkgaXNzdWVzIGFuCit3aGVyZSBhIGNoaWxkIHdpbGwgYmUgY3Jl
YXRlZCB3aGljaCB0aGVuIHdpbGwgaW1tZWRpYXRlbHkgaXNzdWUgYW4KIC5CUiBleGVjdmUgKDIp
LgogLlBQCiAuQlIgdmZvcmsgKCkKQEAgLTExMCw3ICsxMTAsOSBAQCBhbmQgdG8gY3JlYXRlIGEg
dW5pcXVlIHRhc2sgc3RydWN0dXJlIGZvciB0aGUgY2hpbGQuCiBIb3dldmVyLCBpbiB0aGUgYmFk
IG9sZCBkYXlzIGEKIC5CUiBmb3JrICgyKQogd291bGQgcmVxdWlyZSBtYWtpbmcgYSBjb21wbGV0
ZSBjb3B5IG9mIHRoZSBjYWxsZXIncyBkYXRhIHNwYWNlLAotb2Z0ZW4gbmVlZGxlc3NseSwgc2lu
Y2UgdXN1YWxseSBpbW1lZGlhdGVseSBhZnRlcndhcmRzIGFuCitvZnRlbiBuZWVkbGVzc2x5LCBz
aW5jZSB1c3VhbGx5IGltbWVkaWF0ZWx5IGFmdGVyd2FyZHMgYQorLkJSIHZmb3JrICgpCithbgog
LkJSIGV4ZWMgKDMpCiBpcyBkb25lLgogVGh1cywgZm9yIGdyZWF0ZXIgZWZmaWNpZW5jeSwgQlNE
IGludHJvZHVjZWQgdGhlCkBAIC0xMjUsNyArMTI3LDcgQEAgY2hpbGQgd2FzIHVzaW5nIGl0cyBy
ZXNvdXJjZXMuCiBUaGUgdXNlIG9mCiAuQlIgdmZvcmsgKCkKIHdhcyB0cmlja3k6IGZvciBleGFt
cGxlLCBub3QgbW9kaWZ5aW5nIGRhdGEKLWluIHRoZSBwYXJlbnQgcHJvY2VzcyBkZXBlbmRlZCBv
biBrbm93aW5nIHdoaWNoIHZhcmlhYmxlcyBhcmUKK2luIHRoZSBwYXJlbnQgcHJvY2VzcyBkZXBl
bmRlZCBvbiBrbm93aW5nIHdoaWNoIHZhcmlhYmxlcyB3ZXJlCiBoZWxkIGluIGEgcmVnaXN0ZXIu
CiAuU0ggIkNPTkZPUk1JTkcgVE8iCiA0LjNCU0QsIFBPU0lYLjEtMjAwMS4KLS0gCjEuNi41LjEu
MzEuZ2FkMTJiCgo=
--0016e6469a56c7538d047635160e--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
