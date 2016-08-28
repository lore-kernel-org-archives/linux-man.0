From: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Subject: [PATCH] epoll_ctl(2): fix another typo
Date: Sun, 28 Aug 2016 15:00:48 +0200
Message-ID: <20160828130048.13759-1-ruben@rubenkerkhof.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/epoll_ctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/epoll_ctl.2 b/man2/epoll_ctl.2
index 995c47a..41de995 100644
--- a/man2/epoll_ctl.2
+++ b/man2/epoll_ctl.2
@@ -236,7 +236,7 @@ operation; attempts to employ it with
 yield an error.
 If
 .B EPOLLEXCLUSIVE
-has set using
+has been set using
 .BR epoll_ctl (),
 then a subsequent
 .B EPOLL_CTL_MOD
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
