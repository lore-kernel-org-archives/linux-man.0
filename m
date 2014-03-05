From: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Subject: [PATCH] getpriority.2: Adjust the process priority range
Date: Wed,  5 Mar 2014 04:07:40 +0000
Message-ID: <1393992460-29062-1-git-send-email-andrew@digital-domain.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The {get,set}priority man pages currently lists the process's priority
range as being from 40..1 however it should be 40..0 as 0 would be for
a nice of -20.

Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
---

Perhaps the 40 should be 39 as the kernel seems to limit the nice range
from -20 to 19 in kernel/sched/core.c::set_user_nice().

 man2/getpriority.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/getpriority.2 b/man2/getpriority.2
index b39bdcf..066cf75 100644
--- a/man2/getpriority.2
+++ b/man2/getpriority.2
@@ -197,7 +197,7 @@ The actual priority range varies between kernel versions.
 Linux before 1.3.36 had \-infinity..15.
 Since kernel 1.3.43, Linux has the range \-20..19.
 Within the kernel, nice values are actually represented
-using the corresponding range 40..1
+using the corresponding range 40..0
 (since negative numbers are error codes) and these are the values
 employed by the
 .BR setpriority ()
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
