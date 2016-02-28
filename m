From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 3/3] prctl.2: tfix
Date: Sun, 28 Feb 2016 01:32:41 +0100
Message-ID: <1456619561-613-3-git-send-email-jwilk@jwilk.net>
References: <1456619561-613-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456619561-613-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/prctl.2 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 5cea3bb..1417a15 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -311,9 +311,9 @@ in the location pointed to by
 .TP
 .BR PR_SET_KEEPCAPS " (since Linux 2.2.18)"
 Set the state of the thread's "keep capabilities" flag,
-which determines whether the threads's permitted
-capability set is cleared when a change is made to the threads's user IDs
-such that the threads's real UID, effective UID, and saved set-user-ID
+which determines whether the thread's permitted
+capability set is cleared when a change is made to the thread's user IDs
+such that the thread's real UID, effective UID, and saved set-user-ID
 all become nonzero when at least one of them previously had the value 0.
 By default, the permitted capability set is cleared when such a change is made;
 setting the "keep capabilities" flag prevents it from being cleared.
@@ -328,7 +328,7 @@ The "keep capabilities" value will be reset to 0 on subsequent calls to
 .BR execve (2).
 .TP
 .BR PR_GET_KEEPCAPS " (since Linux 2.2.18)"
-Return (as the function result) the current state of the calling threads's
+Return (as the function result) the current state of the calling thread's
 "keep capabilities" flag.
 .TP
 .BR PR_MCE_KILL " (since Linux 2.6.32)"
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
