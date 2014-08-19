From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] siginterrupt.3: Reformat thread-safety information
Date: Tue, 19 Aug 2014 11:22:20 +0800
Message-ID: <1408418540-854-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/siginterrupt.3 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man3/siginterrupt.3 b/man3/siginterrupt.3
index 5e409d2..adcdf76 100644
--- a/man3/siginterrupt.3
+++ b/man3/siginterrupt.3
@@ -85,11 +85,17 @@ set to indicate the cause of the error.
 .B EINVAL
 The specified signal number is invalid.
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
 .BR siginterrupt ()
-function uses a global variable that is not protected,
-so it is not thread-safe.
+T}	Thread safety	MT-Unsafe
+.TE
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 POSIX.1-2008 marks
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
