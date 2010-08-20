From: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 1/2] eventfd.2: fix a typo
Date: Fri, 20 Aug 2010 15:30:42 +0300
Message-ID: <1282307443-28511-1-git-send-email-virtuoso@slind.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
---
 man2/eventfd.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/eventfd.2 b/man2/eventfd.2
index 88ca50d..2071e48 100644
--- a/man2/eventfd.2
+++ b/man2/eventfd.2
@@ -44,7 +44,7 @@ to change the behaviour of
 .B EFD_NONBLOCK
 Set the
 .BR O_NONBLOCK
-file status flag on the new open file description.
+file status flag on the new open file descriptor.
 Using this flag saves extra calls to
 .BR fcntl (2)
 to achieve the same result.
-- 
1.7.2.1.45.gb66c2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
