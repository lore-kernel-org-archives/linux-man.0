From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH v2] error.3: ATTRIBUTES: Note functions that are/aren't
 thread-safe
Date: Fri, 17 Jul 2015 11:15:19 +0800
Message-ID: <1437102919.31901.6.camel@G08FNSTD140232>
References: <1435138119-30051-1-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <1435138119-30051-2-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <55A82A97.9020702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A82A97.9020702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.
markings of functions in glibc are:
- error:         MT-Safe locale
- error_at_line: MT-Unsafe race:error_at_line/error_one_per_line locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/error.3 | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/man3/error.3 b/man3/error.3
index 7e1d47c..7a92a76 100644
--- a/man3/error.3
+++ b/man3/error.3
@@ -118,6 +118,37 @@ is assigned the address of a function
 instead of prefixing the message with the program name and colon.
 The function should print a suitable string to
 .IR stderr .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw37
+l l l.
+Interface	Attribute	Value
+T{
+.BR error ()
+T}	Thread safety	MT-Safe locale
+T{
+.BR error_at_line ()
+T}	Thread safety	T{
+MT-Unsafe race:error_at_line/error_one_per_line locale
+T}
+.TE
+
+The internal
+.I error_one_per_line
+variable is accessed (without any form of synchronization, but since
+it's an int used once, it should be safe enough) and, if
+.I error_one_per_line
+is set nonzero, the internal static variables(not exposed to users)
+used to hold the last printed file name and line number are accessed
+and modified without synchronization; the update is not atomic and it
+occurs before disabling cancellation, so it can be interrupted after
+only one of the two variables is modified. After that,
+.BR error_at_line (3)
+is very much like
+.BR error (3).
 .SH CONFORMING TO
 These functions and variables are GNU extensions, and should not be
 used in programs intended to be portable.
-- 
1.9.3



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
