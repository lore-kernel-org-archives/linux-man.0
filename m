From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] assert.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 25 Feb 2015 15:53:16 +0800
Message-ID: <1424850796-20472-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/assert.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/assert.3 b/man3/assert.3
index d126901..3351cb5 100644
--- a/man3/assert.3
+++ b/man3/assert.3
@@ -56,6 +56,19 @@ The message "assertion failed in file foo.c, function
 do_bar(), line 1287" is of no help at all to a user.
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
+.BR assert ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001, C89, C99.
 In C89,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
