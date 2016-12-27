From: Nicolas B <nicolas.biscos+man7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: typo in sched(7), vers. 4.09
Date: Tue, 27 Dec 2016 16:18:16 +0100
Message-ID: <CAPioPU_bj4zyciuKtuWmmyPV79KEq2kEpKT30Wj-G6xgDmd_ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In version 4.09, a small typo in man7/sched.7

diff --git a/man7/sched.7 b/man7/sched.7
index d8bc552..b918cb6 100644
--- a/man7/sched.7
+++ b/man7/sched.7
@@ -703,7 +703,7 @@ The default value in this file is 1, unless the
kernel was booted with the
 .IR noautogroup
 parameter.

-A new autogroup is created created when a new session is created via
+A new autogroup is created when a new session is created via
 .BR setsid (2);
 this happens, for example, when a new terminal window is started.
 A new process created by
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
