From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fgetws.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 14:34:18 +0800
Message-ID: <1423636458-23958-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/fgetws.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/fgetws.3 b/man3/fgetws.3
index fe95dc4..6dc3c6d 100644
--- a/man3/fgetws.3
+++ b/man3/fgetws.3
@@ -49,6 +49,18 @@ The
 function, if successful, returns \fIws\fP.
 If end of stream
 was already reached or if an error occurred, it returns NULL.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fgetws ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
