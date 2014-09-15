From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getcontext.3: tfix
Date: Mon, 15 Sep 2014 11:51:47 +0800
Message-ID: <1410753107-20175-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getcontext.3 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man3/getcontext.3 b/man3/getcontext.3
index d592a83..8e35238 100644
--- a/man3/getcontext.3
+++ b/man3/getcontext.3
@@ -151,7 +151,6 @@ appropriately.
 .SH ERRORS
 None defined.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
 For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
