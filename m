From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tcgetpgrp.3: Reformat thread-safety information
Date: Mon, 21 Jul 2014 16:24:32 +0800
Message-ID: <1405931072-31131-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tcgetpgrp.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/tcgetpgrp.3 b/man3/tcgetpgrp.3
index da039e2..e50d796 100644
--- a/man3/tcgetpgrp.3
+++ b/man3/tcgetpgrp.3
@@ -107,12 +107,18 @@ of the calling process.
 has a supported value, but is not the process group ID of a
 process in the same session as the calling process.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR tcgetpgrp ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR tcgetpgrp (),
 .BR tcsetpgrp ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
