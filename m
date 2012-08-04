From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] prctl.2: document PR_GET_TIMESLACK and PR_SET_TIMESLACK
Date: Sat,  4 Aug 2012 13:46:43 -0700
Message-ID: <1344113204-4294-2-git-send-email-shawnlandden@gmail.com>
References: <1344113204-4294-1-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344113204-4294-1-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 |   22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 8fb7f58..f4db191 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -44,9 +44,7 @@
 .\" 2012-08-03 Shawn Landden, Document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS,
 .\"       SECCOMP_MODE_STRICT, SECCOMP_MODE_FILTER
 .\"       (thx Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> 259e5e6c)
-.\"
-.\" FIXME: Document PR_SET_TIMERSLACK and PR_GET_TIMERSLACK (new in 2.6.28)
-.\"		commit 6976675d94042fbd446231d1bd8b7de71a980ada
+.\"       PR_SET_TIMERSLACK, PR_GET_TIMESLACK
 .\"
 .TH PRCTL 2 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -417,6 +415,24 @@ for information on versions and architectures)
 Return unaligned access control bits, in the location pointed to by
 .IR "(int\ *) arg2" .
 .TP
+.BR PR_SET_TIMERSLACK " (since Linux 2.6.27)"
+.\" see commit 6976675d94042fbd446231d1bd8b7de71a980ada
+Controls the "rounding" that is used by
+.BR select (2)
+and
+.BR poll (2)
+and friends.
+If
+.I arg2
+is a positive integer, set timer slack to
+.IR arg2 .
+Otherwise reset to timer stack to its value when the process was created.
+(default 50 usec) This setting inherits on
+.BR fork (2) .
+.TP
+.BR PR_GET_TIMESLACK " (since Linux 2.6.27)"
+Returns the current timer slack.
+.TP
 .BR PR_MCE_KILL " (since Linux 2.6.32)"
 Set the machine check memory corruption kill policy for the current thread.
 If
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
