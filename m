From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mq_open.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 3 Jun 2014 13:24:51 +0800
Message-ID: <1401773091-24015-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function mq_open() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mq_open.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/mq_open.3 b/man3/mq_open.3
index 669530f..a380253 100644
--- a/man3/mq_open.3
+++ b/man3/mq_open.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH MQ_OPEN 3 2009-02-20 "Linux" "Linux Programmer's Manual"
+.TH MQ_OPEN 3 2014-06-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 mq_open \- open a message queue
 .SH SYNOPSIS
@@ -221,6 +221,11 @@ This probably occurred because the
 .I queues_max
 limit was encountered; see
 .BR mq_overview (7).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR mq_open ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
