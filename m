From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] gets.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 26 Feb 2015 10:10:54 +0800
Message-ID: <1424916654-8395-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

It's marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/gets.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/gets.3 b/man3/gets.3
index 1fc1ef2..8dab158 100644
--- a/man3/gets.3
+++ b/man3/gets.3
@@ -55,6 +55,19 @@ on success, and NULL
 on error or when end of file occurs while no characters have been read.
 However, given the lack of buffer overrun checking, there can be no
 guarantees that the function will even return.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR gets ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C89, C99, POSIX.1-2001.
 
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
