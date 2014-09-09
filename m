From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ilogb.3: tfix
Date: Tue, 9 Sep 2014 13:55:33 +0800
Message-ID: <1410242133-9514-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ilogb.3 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man3/ilogb.3 b/man3/ilogb.3
index e8b16ad..caad9fa 100644
--- a/man3/ilogb.3
+++ b/man3/ilogb.3
@@ -144,7 +144,6 @@ or raise an exception for this case.
 .\" log(), log2(), log10() do set errno
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6794
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
