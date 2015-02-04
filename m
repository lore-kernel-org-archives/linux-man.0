From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tmpfile.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 4 Feb 2015 15:12:41 +0800
Message-ID: <1423033961-12886-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

It's markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tmpfile.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/tmpfile.3 b/man3/tmpfile.3
index 9e39c4e..d0e4d80 100644
--- a/man3/tmpfile.3
+++ b/man3/tmpfile.3
@@ -75,6 +75,18 @@ There was no room in the directory to add the new filename.
 .TP
 .B EROFS
 Read-only filesystem.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR tmpfile ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99, SUSv2, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
