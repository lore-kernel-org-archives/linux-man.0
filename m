From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] clock_getres.2: ffix
Date: Wed, 8 Nov 2017 16:25:04 +0900
Message-ID: <55b5b761-3b19-6578-a83d-a2a9f7452459@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/clock_getres.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index e5349439e..48c259632 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -275,7 +275,7 @@ If the CPUs in an SMP system have different clock sources, then
 there is no way to maintain a correlation between the timer registers since
 each CPU will run at a slightly different frequency.
 If that is the case, then
-.I clock_getcpuclockid(0)
+.BR clock_getcpuclockid(3)
 will return
 .B ENOENT
 to signify this condition.
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
