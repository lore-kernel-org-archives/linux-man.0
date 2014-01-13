From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tcgetpgrp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 13 Jan 2014 09:58:26 +0800
Message-ID: <1389578306-7050-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions tcgetpgrp() and tcsetpgrp() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tcgetpgrp.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/tcgetpgrp.3 b/man3/tcgetpgrp.3
index 2bea0cf..da039e2 100644
--- a/man3/tcgetpgrp.3
+++ b/man3/tcgetpgrp.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH TCGETPGRP 3 2003-01-28 "GNU" "Linux Programmer's Manual"
+.TH TCGETPGRP 3 2014-01-13 "GNU" "Linux Programmer's Manual"
 .SH NAME
 tcgetpgrp, tcsetpgrp \- get and set terminal foreground process group
 .SH SYNOPSIS
@@ -106,6 +106,13 @@ of the calling process.
 .I pgrp
 has a supported value, but is not the process group ID of a
 process in the same session as the calling process.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR tcgetpgrp ()
+and
+.BR tcsetpgrp ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
