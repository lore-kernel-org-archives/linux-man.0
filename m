From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] error.3: ATTRIBUTES: Note functions that are/aren't thread-safe
Date: Wed, 24 Jun 2015 17:28:37 +0800
Message-ID: <1435138119-30051-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1435138119-30051-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435138119-30051-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.
markings of functions in glibc are:
- error:         MT-Safe locale
- error_at_line: MT-Unsafe race:error_at_line/error_one_per_line locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/error.3 | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/man3/error.3 b/man3/error.3
index 7e1d47c..f040a26 100644
--- a/man3/error.3
+++ b/man3/error.3
@@ -118,6 +118,35 @@ is assigned the address of a function
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
+variable is accessed (without any form of
+synchronization, but since it's an int used once, it should be safe
+enough) and, if this mode is enabled, static variables used to hold
+the last printed file name and line number are accessed and modified
+without synchronization; the update is not atomic and it occurs
+before disabling cancellation, so it can be interrupted after only
+one of the two variables is modified.  After that, it's very much
+like
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
