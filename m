From: Simon Nagl <simonnagl-CZK690njTpI@public.gmane.org>
Subject: [patch] proc.5: Correct polling of mounts via select()
Date: Sun, 8 May 2016 19:04:09 +0200
Message-ID: <ffc3f500-cd85-0895-6ff5-6efce2254998@aim.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello mkt,

I tried to poll for changes of /proc/mounts via select().

This does not work as expected. I found more inforamtion on stackoverflow.

http://stackoverflow.com/questions/5070801/monitoring-mount-point-changes-via-proc-mounts



>From 41d047b5df0dc759be621d0af1e45e5b6fba0028 Mon Sep 17 00:00:00 2001
From: Simon Nagl <simonnagl-CZK690njTpI@public.gmane.org>
Date: Sun, 8 May 2016 18:49:36 +0200
Subject: [PATCH] proc.5: Correct polling of mounts via select()

Change of mounts can be polled with select via exceptfds, not readfds.
---
 man5/proc.5 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index cb85b9b..a377d06 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -47,6 +47,7 @@
 .\"     and /proc/[pid]/fdinfo/*.
 .\" 2008-06-19, mtk, Documented /proc/[pid]/status.
 .\" 2008-07-15, mtk, added /proc/config.gz
+.\" 2016-05-08, Simon Nagl (simonnagl-CZK690njTpI@public.gmane.org), corrected
/proc/[pid]/mounts
 .\"
 .\" FIXME . cross check against Documentation/filesystems/proc.txt
 .\" to see what information could be imported from that file
@@ -1186,7 +1187,7 @@ Since kernel version 2.6.15, this file is pollable:
 after opening the file for reading, a change in this file
 (i.e., a filesystem mount or unmount) causes
 .BR select (2)
-to mark the file descriptor as readable, and
+to mark the file descriptor as an exception, and
 .BR poll (2)
 and
 .BR epoll_wait (2)
-- 
2.8.2


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
