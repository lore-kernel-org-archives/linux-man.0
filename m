From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fexecve.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 27 May 2015 18:12:55 +0800
Message-ID: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think fexecve() is thread-safe. But, there
is not marking of fexecve() in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fexecve.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/fexecve.3 b/man3/fexecve.3
index 77c1a98..ddfc07f 100644
--- a/man3/fexecve.3
+++ b/man3/fexecve.3
@@ -91,6 +91,19 @@ filesystem could not be accessed.
 .SH VERSIONS
 .BR fexecve ()
 is implemented since glibc 2.3.2.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fexecve ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2008.
 This function is not specified in POSIX.1-2001,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
