From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ceil.3, round.3: ATTRIBUTES: tfix
Date: Fri, 14 Jun 2013 17:00:04 +0800
Message-ID: <1371200404-28180-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ceil.3  | 2 +-
 man3/round.3 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/ceil.3 b/man3/ceil.3
index edea688..4127a78 100644
--- a/man3/ceil.3
+++ b/man3/ceil.3
@@ -79,7 +79,7 @@ POSIX.1-2001 documents a range error for overflows, but see NOTES.
 .SS Multithreading (see pthreads(7))
 The
 .BR ceil (),
-.BR ceilf ()
+.BR ceilf (),
 and
 .BR ceill ()
 functions are thread-safe.
diff --git a/man3/round.3 b/man3/round.3
index 9bea807..82faa43 100644
--- a/man3/round.3
+++ b/man3/round.3
@@ -84,7 +84,7 @@ These functions first appeared in glibc in version 2.1.
 .SS Multithreading (see pthreads(7))
 The
 .BR round (),
-.BR roundf ()
+.BR roundf (),
 and
 .BR roundl ()
 functions are thread-safe.
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
