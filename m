From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Sat,  1 Feb 2014 14:22:45 -0400
Message-ID: <1391278965-26411-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 4607a45..ca976c4 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1496,7 +1496,7 @@ is set at kernel compilation time.
 .\" commit 5ed67f05f66c41e39880a6d61358438a25f9fee5
 .\" commit 48f6a7a511ef8823fdff39afee0320092d43a8a0
 A list of the POSIX timers for this process.
-Each timer is listed with a line that starets with the string "ID:".
+Each timer is listed with a line that starts with the string "ID:".
 For example:
 
 .in +4n
@@ -1548,7 +1548,7 @@ a signal if the timer delivers notifications via a signal.
 This field identifies the clock that the timer uses for measuring time.
 For most clocks, this is a number that matches one of the user-space
 .BR CLOCK_*
-constants dexposed via
+constants exposed via
 .IR <time.h> .
 .B CLOCK_PROCESS_CPUTIME_ID
 timers display with a value of -6
-- 
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
