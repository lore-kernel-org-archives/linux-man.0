From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mkfifo.3: Reformat thread-safety information
Date: Fri, 26 Sep 2014 16:36:37 +0800
Message-ID: <1411720597-4838-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mkfifo.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/mkfifo.3 b/man3/mkfifo.3
index e1c0b84..e9f448a 100644
--- a/man3/mkfifo.3
+++ b/man3/mkfifo.3
@@ -182,12 +182,18 @@ It is implemented using
 .BR mknodat (2),
 available on Linux since kernel 2.6.16.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR mkfifo ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw20 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR mkfifo (),
 .BR mkfifoat ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 .BR mkfifo ():
 POSIX.1-2001, POSIX.1-2008.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
