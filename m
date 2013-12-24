From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] toupper.3: ATTRIBUTES: Note functions that are thread safe with exceptions
Date: Tue, 24 Dec 2013 10:16:07 +0800
Message-ID: <1387851367-24147-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions toupper() and tolower() are thread safe with
exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/toupper.3 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man3/toupper.3 b/man3/toupper.3
index 7a9ba2c..f592495 100644
--- a/man3/toupper.3
+++ b/man3/toupper.3
@@ -24,7 +24,7 @@
 .\"
 .\" Modified Sat Jul 24 17:45:39 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2000-02-13 by Nicol=E1s Lichtmaier <nick-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
-.TH TOUPPER 3  1993-04-04 "GNU" "Linux Programmer's Manual"
+.TH TOUPPER 3  2013-12-24 "GNU" "Linux Programmer's Manual"
 .SH NAME
 toupper, tolower \- convert letter to upper or lower case
 .SH SYNOPSIS
@@ -58,6 +58,17 @@ is undefined.
 The value returned is that of the converted letter, or
 .I c
 if the conversion was not possible.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR toupper ()
+and
+.BR tolower ()
+functions are thread-safe with exceptions.
+These functions can be safely used in multithreaded applications,
+as long as
+.BR setlocale (3)
+is not called to change the locale.
 .SH CONFORMING TO
 C89, C99, 4.3BSD.
 .SH BUGS
--=20
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
