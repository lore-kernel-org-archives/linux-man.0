From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] reboot.2: add return value description for behavior inside PID namespace
Date: Tue, 22 Nov 2016 16:39:17 +0800
Message-ID: <1479803957-1962-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, std.liu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 man2/reboot.2 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man2/reboot.2 b/man2/reboot.2
index db0806c..2dfaeb7 100644
--- a/man2/reboot.2
+++ b/man2/reboot.2
@@ -185,6 +185,12 @@ and
 cause a
 .B SIGINT
 signal to be sent.
+For the other
+.I cmd
+values, \-1 is returned and
+.I errno
+is set to
+.BR EINVAL .
 .SH RETURN VALUE
 For the values of
 .I cmd
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
