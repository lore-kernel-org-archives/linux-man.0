From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] closedir.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 28 Jan 2015 14:10:02 +0800
Message-ID: <1422425402-20942-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function closedir() in glibc is thread safe.
It's marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/closedir.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/closedir.3 b/man3/closedir.3
index 37cb6a7..1779bbf 100644
--- a/man3/closedir.3
+++ b/man3/closedir.3
@@ -64,6 +64,18 @@ is set appropriately.
 .B EBADF
 Invalid directory stream descriptor
 .IR dirp .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR closedir ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4, POSIX.1-2001, 4.3BSD.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
