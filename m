From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sched_getcpu.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 6 May 2014 14:53:49 +0800
Message-ID: <1399359229-27874-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sched_getcpu() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sched_getcpu.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sched_getcpu.3 b/man3/sched_getcpu.3
index 54b2483..7e2d395 100644
--- a/man3/sched_getcpu.3
+++ b/man3/sched_getcpu.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SCHED_GETCPU 3 2014-04-28 "Linux" "Linux Programmer's Manual"
+.TH SCHED_GETCPU 3 2014-05-06 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sched_getcpu \- determine CPU on which the calling thread is running
 .SH SYNOPSIS
@@ -69,6 +69,11 @@ This kernel does not implement
 .BR getcpu (2).
 .SH VERSIONS
 This function is available since glibc 2.6.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sched_getcpu ()
+function is thread-safe.
 .SH CONFORMING TO
 .BR sched_getcpu ()
 is glibc-specific.
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
