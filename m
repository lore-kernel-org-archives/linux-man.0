From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] putenv.3:ATTRIBUTES: Note function that is thread-unsafe
Date: Wed, 31 Dec 2014 13:30:05 +0800
Message-ID: <1420003805-4924-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function putenv() is thread unsafe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/putenv.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/putenv.3 b/man3/putenv.3
index ff5614e..3511027 100644
--- a/man3/putenv.3
+++ b/man3/putenv.3
@@ -76,6 +76,18 @@ is set to indicate the cause.
 .TP
 .B ENOMEM
 Insufficient space to allocate new environment.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR putenv ()
+T}	Thread safety	MT-Unsafe const:env
+.TE
 .SH CONFORMING TO
 SVr4, POSIX.1-2001, 4.3BSD.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
