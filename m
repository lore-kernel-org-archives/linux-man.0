From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ctime.3: ATTRIBUTES: Note functions thoes aren't thread-safe
Date: Wed, 1 Apr 2015 18:13:55 +0800
Message-ID: <1427883237-21242-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ctime.3 | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/man3/ctime.3 b/man3/ctime.3
index b127716..c5959d1 100644
--- a/man3/ctime.3
+++ b/man3/ctime.3
@@ -279,6 +279,39 @@ Each of these functions returns the value described, or NULL
 (\-1 in case of
 .BR mktime ())
 in case an error was detected.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw14 lb lbw31
+l l l.
+Interface	Attribute	Value
+T{
+.BR asctime ()
+T}	Thread safety	MT-Unsafe race:asctime locale
+T{
+.BR asctime_r ()
+T}	Thread safety	MT-Safe locale
+T{
+.BR ctime ()
+T}	Thread safety	T{
+MT-Unsafe race:tmbuf
+.br
+race:asctime env locale
+T}
+T{
+.BR ctime_r (),
+.BR gmtime_r (),
+.BR localtime_r (),
+.BR mktime ()
+T}	Thread safety	MT-Safe env locale
+T{
+.BR gmtime (),
+.BR localtime ()
+T}	Thread safety	MT-Unsafe race:tmbuf env locale
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 C89 and C99 specify
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
