From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcstombs.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 4 Mar 2015 13:26:46 +0800
Message-ID: <1425446806-15836-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/wcstombs.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/wcstombs.3 b/man3/wcstombs.3
index 60efef1..ff37eaf 100644
--- a/man3/wcstombs.3
+++ b/man3/wcstombs.3
@@ -86,6 +86,19 @@ If a wide character was encountered which could not be
 converted,
 .I (size_t)\ \-1
 is returned.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR wcstombs ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
