From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] rtime.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 6 May 2014 21:03:53 +0800
Message-ID: <1399381433-16490-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function rtime() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/rtime.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/rtime.3 b/man3/rtime.3
index ce093af..8070ee3 100644
--- a/man3/rtime.3
+++ b/man3/rtime.3
@@ -9,7 +9,7 @@
 .\"
 .\" Slightly polished, aeb, 2003-04-06
 .\"
-.TH RTIME 3 2014-01-05 "GNU" "Linux Programmer's Manual"
+.TH RTIME 3 2014-05-06 "GNU" "Linux Programmer's Manual"
 .SH NAME
 rtime \- get time from a remote machine
 .SH SYNOPSIS
@@ -54,6 +54,11 @@ The number of returned bytes is not 4.
 .TP
 .B ETIMEDOUT
 The waiting time as defined in timeout has expired.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR rtime ()
+function is thread-safe.
 .SH NOTES
 Only IPv4 is supported.
 .LP
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
