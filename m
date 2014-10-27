From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] makecontext.3: Reformat thread-safety information
Date: Mon, 27 Oct 2014 14:25:25 +0800
Message-ID: <1414391125-30978-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/makecontext.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/makecontext.3 b/man3/makecontext.3
index 5c801d4..2c83f0e 100644
--- a/man3/makecontext.3
+++ b/man3/makecontext.3
@@ -103,12 +103,18 @@ and
 .BR swapcontext ()
 are provided in glibc since version 2.1.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR makecontext ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR makecontext (),
 .BR swapcontext ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SUSv2, POSIX.1-2001.
 POSIX.1-2008 removes the specifications of
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
