From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fflush.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 15 Jul 2013 16:24:07 +0800
Message-ID: <1373876647-16610-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function fflush() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fflush.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/fflush.3 b/man3/fflush.3
index 1622650..99b3482 100644
--- a/man3/fflush.3
+++ b/man3/fflush.3
@@ -42,7 +42,7 @@
 .\" Modified 2000-07-22 by Nicol=E1s Lichtmaier <nick-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
 .\" Modified 2001-10-16 by John Levon <moz-SweaCY6AgrKi2/woJv4GR1pr/1R2p/CL@public.gmane.org>
 .\"
-.TH FFLUSH 3  2009-09-06 "GNU" "Linux Programmer's Manual"
+.TH FFLUSH 3  2013-07-15 "GNU" "Linux Programmer's Manual"
 .SH NAME
 fflush \- flush a stream
 .SH SYNOPSIS
@@ -90,6 +90,11 @@ may also fail and set
 .I errno
 for any of the errors specified for
 .BR write (2).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR fflush ()
+function is thread-safe.
 .SH CONFORMING TO
 C89, C99, POSIX.1-2001, POSIX.1-2008.
=20
--=20
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
