From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fclose.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 28 Jan 2015 14:11:06 +0800
Message-ID: <1422425466-21133-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function fclose() is thread safe.
It's marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fclose.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/fclose.3 b/man3/fclose.3
index 3ba0f54..4b900d5 100644
--- a/man3/fclose.3
+++ b/man3/fclose.3
@@ -87,6 +87,18 @@ for any of the errors specified for the routines
 .BR write (2)
 or
 .BR fflush (3).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fclose ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C89, C99.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
