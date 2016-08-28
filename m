From: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Subject: [PATCH] epoll_ctl(2) fix typo
Date: Sun, 28 Aug 2016 14:56:24 +0200
Message-ID: <20160828125624.13625-1-ruben@rubenkerkhof.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/epoll_ctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/epoll_ctl.2 b/man2/epoll_ctl.2
index 3203ba5..995c47a 100644
--- a/man2/epoll_ctl.2
+++ b/man2/epoll_ctl.2
@@ -205,7 +205,7 @@ is thus useful for avoiding thundering herd problems in certain scenarios.
 If the same file descriptor is in multiple epoll instances,
 some with the
 .BR EPOLLEXCLUSIVE
-flag, and others without, then events will provided to all epoll
+flag, and others without, then events will be provided to all epoll
 instances that did not specify
 .BR EPOLLEXCLUSIVE ,
 and at least one of the epoll instances that did specify
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
