From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getenv.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 9 Jul 2014 10:47:25 +0800
Message-ID: <1404874045-12209-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions getenv() and secure_getenv() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getenv.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/getenv.3 b/man3/getenv.3
index 23d026f..f8e8cdc 100644
--- a/man3/getenv.3
+++ b/man3/getenv.3
@@ -93,6 +93,19 @@ environment, or NULL if there is no match.
 .SH VERSIONS
 .BR secure_getenv ()
 first appeared in glibc 2.17.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw25 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getenv (),
+.BR secure_getenv ()
+T}	Thread safety	MT-Safe env
+.TE
 .SH CONFORMING TO
 .BR getenv ():
 SVr4, POSIX.1-2001, 4.3BSD, C89, C99.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
