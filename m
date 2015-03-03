From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strcoll.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 3 Mar 2015 17:23:59 +0800
Message-ID: <1425374639-21027-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strcoll.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/strcoll.3 b/man3/strcoll.3
index fc66fe2..aca8745 100644
--- a/man3/strcoll.3
+++ b/man3/strcoll.3
@@ -66,6 +66,19 @@ than, to match, or be greater than
 .IR s2 ,
 when both are interpreted
 as appropriate for the current locale.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR strcoll ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH NOTES
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
