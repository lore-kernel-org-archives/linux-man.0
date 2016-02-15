From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] queue.3: Remove double CONFORMING TO section
Date: Mon, 15 Feb 2016 14:40:13 +0100
Message-ID: <1455543613-29970-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/queue.3 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/man3/queue.3 b/man3/queue.3
index fdc17b2..5b0147f 100644
--- a/man3/queue.3
+++ b/man3/queue.3
@@ -1219,9 +1219,7 @@ while (head.cqh_first != (void *)&head)
     CIRCLEQ_REMOVE(&head, head.cqh_first, entries);
 .Ed
 .Sh CONFORMING TO
-Not in POSIX.1-2001 or POSIX.1-2008.
-.SH CONFORMING TO
-Not in POSIX.1.
+Not in POSIX.1, POSIX.1-2001 or POSIX.1-2008.
 Present on the BSDs.
 .Nm queue
 functions first appeared in
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
