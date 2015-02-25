From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] assert_perror.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 25 Feb 2015 16:00:46 +0800
Message-ID: <1424851246-20615-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/assert_perror.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/assert_perror.3 b/man3/assert_perror.3
index b687221..2ff3fef 100644
--- a/man3/assert_perror.3
+++ b/man3/assert_perror.3
@@ -56,6 +56,19 @@ line number of the macro call, and the output of
 .IR strerror(errnum) .
 .SH RETURN VALUE
 No value is returned.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR assert_perror ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 This is a GNU extension.
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
