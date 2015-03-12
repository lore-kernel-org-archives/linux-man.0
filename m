From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getline.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 12 Mar 2015 11:35:21 +0800
Message-ID: <1426131321-1942-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/getline.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/getline.3 b/man3/getline.3
index 9ba07e5..ca94dd0 100644
--- a/man3/getline.3
+++ b/man3/getline.3
@@ -134,6 +134,20 @@ or
 is NULL, or
 .I stream
 is not valid).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw21 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getline (),
+.BR getdelim ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 Both
 .BR getline ()
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
