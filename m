From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] isalpha.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 27 Jan 2014 11:52:17 +0800
Message-ID: <1390794737-18826-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions isalnum(), isalpha(), isascii(), isblank(),
iscntrl(), isdigit(), isgraph(), islower(), isprint(),
ispunct(), isspace(), isupper() and isxdigit() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/isalpha.3 | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/man3/isalpha.3 b/man3/isalpha.3
index ca441da..9fc5b6f 100644
--- a/man3/isalpha.3
+++ b/man3/isalpha.3
@@ -27,7 +27,7 @@
 .\" Modified Sat Sep  2 21:52:01 1995 by Jim Van Zandt <jrv-krxCGfS0CTlN0jTZmbxGZA@public.gmane.org>
 .\" Modified Mon May 27 22:55:26 1996 by Martin Schulze (joey-fxUVXftIFDk@public.gmane.org)
 .\"
-.TH ISALPHA 3 2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH ISALPHA 3 2014-01-27 "GNU" "Linux Programmer's Manual"
 .SH NAME
 isalnum, isalpha, isascii, isblank, iscntrl, isdigit, isgraph, islower,
 isprint, ispunct, isspace, isupper, isxdigit \- character
@@ -162,6 +162,24 @@ The values returned are nonzero if the character
 .I c
 falls into the tested class, and a zero value
 if not.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR isalnum (),
+.BR isalpha (),
+.BR isascii (),
+.BR isblank (),
+.BR iscntrl (),
+.BR isdigit (),
+.BR isgraph (),
+.BR islower (),
+.BR isprint (),
+.BR ispunct (),
+.BR isspace (),
+.BR isupper (),
+and
+.BR isxdigit ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, 4.3BSD.
 C89 specifies all of these functions except
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
