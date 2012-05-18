From: Jessica McKellar <jessica.mckellar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] ld.so.8: typo in LD_USE_LOAD_BIAS description
Date: Fri, 18 May 2012 18:23:44 -0400
Message-ID: <CAKDZRciw2UshU9WEas+wcveAXa5Je_p_U0PtjbjVJzyPzHJXaA@mail.gmail.com>
References: <CAKDZRcgE+6orQFDQm1mVakk4J6yesT5boEZ_-Mr9pT4ir++kyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=e89a8ff1c5e65ea24804c05701ef
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKDZRcgE+6orQFDQm1mVakk4J6yesT5boEZ_-Mr9pT4ir++kyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--e89a8ff1c5e65ea24804c05701ef
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

There is a small typo in the ld.so man page on master (which I found
on=A0http://www.kernel.org/doc/man-pages/online/pages/man8/ld.so.8.html).

The diff is attached as well as copied below.

(Michael, sorry for the resend; the original e-mail was bounced as
spam for containing HTML. If that's by design, it might help to say
you must send as plaintext only on
http://www.kernel.org/doc/man-pages/patches.html)

Best regards,
-Jessica

--
Jessica McKellar
http://jesstess.com


diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 70b6faf..8e059de 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -350,7 +350,7 @@ and (nonprelinked) position-independent executables (PI=
Es)
=A0and other shared objects will not honor them.
=A0If
=A0.B LD_USE_LOAD_BIAS
-is defined wit the value, both executables and PIEs
+is defined with the value 1, both executables and PIEs
=A0will honor the base addresses.
=A0If
=A0.B LD_USE_LOAD_BIAS

--e89a8ff1c5e65ea24804c05701ef
Content-Type: application/octet-stream; name="ld.so.8.diff"
Content-Disposition: attachment; filename="ld.so.8.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h2dsuqwt0

ZGlmZiAtLWdpdCBhL21hbjgvbGQuc28uOCBiL21hbjgvbGQuc28uOAppbmRleCA3MGI2ZmFmLi44
ZTA1OWRlIDEwMDY0NAotLS0gYS9tYW44L2xkLnNvLjgKKysrIGIvbWFuOC9sZC5zby44CkBAIC0z
NTAsNyArMzUwLDcgQEAgYW5kIChub25wcmVsaW5rZWQpIHBvc2l0aW9uLWluZGVwZW5kZW50IGV4
ZWN1dGFibGVzIChQSUVzKQogYW5kIG90aGVyIHNoYXJlZCBvYmplY3RzIHdpbGwgbm90IGhvbm9y
IHRoZW0uCiBJZgogLkIgTERfVVNFX0xPQURfQklBUwotaXMgZGVmaW5lZCB3aXQgdGhlIHZhbHVl
LCBib3RoIGV4ZWN1dGFibGVzIGFuZCBQSUVzCitpcyBkZWZpbmVkIHdpdGggdGhlIHZhbHVlIDEs
IGJvdGggZXhlY3V0YWJsZXMgYW5kIFBJRXMKIHdpbGwgaG9ub3IgdGhlIGJhc2UgYWRkcmVzc2Vz
LgogSWYKIC5CIExEX1VTRV9MT0FEX0JJQVMK
--e89a8ff1c5e65ea24804c05701ef--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
