From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] toupper.3: Reformat thread-safety information
Date: Mon, 14 Jul 2014 16:05:49 +0800
Message-ID: <1405325149-8424-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/toupper.3 | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/man3/toupper.3 b/man3/toupper.3
index 6e835b2..08f4169 100644
--- a/man3/toupper.3
+++ b/man3/toupper.3
@@ -113,17 +113,22 @@ The value returned is that of the converted letter, or
 .I c
 if the conversion was not possible.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR toupper ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR toupper (),
 .BR tolower ()
-functions are thread-safe with exceptions.
-These functions can be safely used in multithreaded applications,
-as long as
-.BR setlocale (3)
-is not called to change the locale during their execution.
-.\" FIXME Add toupper_l() and tolower_l()
+T}	Thread safety	MT-Safe locale
+T{
+.BR toupper_l (),
+.BR tolower_l ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 .BR toupper (),
 .BR tolower ():
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
