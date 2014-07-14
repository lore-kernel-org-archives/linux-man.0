From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tmpnam.3: Reformat thread-safety information
Date: Mon, 14 Jul 2014 16:36:51 +0800
Message-ID: <1405327011-10439-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tmpnam.3 | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/man3/tmpnam.3 b/man3/tmpnam.3
index 869ca3c..0371d79 100644
--- a/man3/tmpnam.3
+++ b/man3/tmpnam.3
@@ -84,15 +84,20 @@ filename, or NULL if a unique name cannot be generated.
 .SH ERRORS
 No errors are defined.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR tmpnam ()
-function is thread-safe with exceptions.
-It is not thread-safe if called with a NULL parameter.
-.LP
-The
+T}	Thread safety	MT-Safe /!s
+T{
 .BR tmpnam_r ()
-function is thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
 POSIX.1-2008 marks
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
