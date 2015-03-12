From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fpathconf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 12 Mar 2015 13:25:16 +0800
Message-ID: <1426137916-3650-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fpathconf.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/fpathconf.3 b/man3/fpathconf.3
index 9e41a1d..251b373 100644
--- a/man3/fpathconf.3
+++ b/man3/fpathconf.3
@@ -166,6 +166,20 @@ is unchanged.
 If there is an error, \-1 is returned, and
 .I errno
 is set to reflect the nature of the error.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw23 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fpathconf (),
+.BR pathconf ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
