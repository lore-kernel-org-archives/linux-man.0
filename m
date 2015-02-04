From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] canonicalize_file_name.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 4 Feb 2015 13:03:41 +0800
Message-ID: <1423026221-10877-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions canonicalize_file_name() in glibc is thread safe.
It's marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/canonicalize_file_name.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/canonicalize_file_name.3 b/man3/canonicalize_file_name.3
index b126e26..a0a3541 100644
--- a/man3/canonicalize_file_name.3
+++ b/man3/canonicalize_file_name.3
@@ -70,6 +70,18 @@ to indicate the error.
 .SH ERRORS
 See
 .BR realpath (3).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see 
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR canonicalize_file_name ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 This function is a GNU extension.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
