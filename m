From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] rexec.3: Reformat thread-safety information
Date: Mon, 1 Sep 2014 10:26:53 +0800
Message-ID: <1409538413-24058-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/rexec.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/rexec.3 b/man3/rexec.3
index 3cab94a..267737b 100644
--- a/man3/rexec.3
+++ b/man3/rexec.3
@@ -140,12 +140,18 @@ The
 .BR rexec_af ()
 function was added to glibc in version 2.2.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR rexec ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR rexec (),
 .BR rexec_af ()
-functions are not thread-safe.
+T}	Thread safety	MT-Unsafe
+.TE
 .SH CONFORMING TO
 These functions are not in POSIX.1-2001.
 The
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
