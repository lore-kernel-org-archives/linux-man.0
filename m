From: Andreas Wiese <aw-lkml-Y2ul+VlnGkTSryWq8ScI/qxOck334EZe@public.gmane.org>
Subject: [Bug] str(n)dup(3) typo in feature test macros
Date: Tue, 03 Sep 2013 09:31:59 +0200
Message-ID: <d8384bdbedc49ebaba2362b2dd559d5e@imap.meterriblecrew.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hey, folks.

I just stumbled upon a typo in strdup(3)-family manual page.  Took me a=
n
hour and much cursing on flex, that strndup wasn't defined when buildin=
g
with -std=3Dc99 since it's spelled _POSIX_C_SOURCE, not POSIX_C_SOURCE.=
  I
should've known myself, indeed=E2=80=A6 :/

--- /usr/share/man/man3/strdup.3	2013-09-02 15:04:48.736602203 +0200
+++ strdup.3	2013-09-03 09:26:50.210203381 +0200
@@ -63,7 +63,7 @@
  .RS 4
  .TP 4
  Since glibc 2.10:
-POSIX_C_SOURCE\ >=3D\ 200809L || _XOPEN_SOURCE\ >=3D\ 700
+_POSIX_C_SOURCE\ >=3D\ 200809L || _XOPEN_SOURCE\ >=3D\ 700
  .TP
  Before glibc 2.10:
  _GNU_SOURCE


Best regards, a.
--=20
This signature is intentionally left blank.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
