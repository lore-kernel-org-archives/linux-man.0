From: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] clone.2: remove forward reference to 2.6.28
Date: Fri, 15 Oct 2010 04:25:55 +0300
Message-ID: <1287105955-32499-2-git-send-email-lucian.grijincu@gmail.com>
References: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1287105955-32499-1-git-send-email-lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/clone.2 |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/man2/clone.2 b/man2/clone.2
index a126a05..17572d2 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -288,8 +288,6 @@ This flag can't be specified in conjunction with
 .BR CLONE_SYSVSEM .
 .TP
 .BR CLONE_NEWNET " (since Linux 2.6.24)"
-(The implementation of this flag is not yet complete,
-but probably will be mostly complete by about Linux 2.6.28.)
 
 If
 .B CLONE_NEWNET
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
