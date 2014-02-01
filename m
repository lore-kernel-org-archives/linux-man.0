From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for proc.5
Date: Sat, 1 Feb 2014 21:26:36 +0400
Message-ID: <20140201212636.2866547c@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

diff --git a/man5/proc.5 b/man5/proc.5
index 3acf867..43b6925 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1496,7 +1496,7 @@ is set at kernel compilation time.
 .\" commit 5ed67f05f66c41e39880a6d61358438a25f9fee5
 .\" commit 48f6a7a511ef8823fdff39afee0320092d43a8a0
 A list of the POSIX timers for this process.
-Each timer is listed with a line that starets with the string "ID:".
+Each timer is listed with a line that started with the string "ID:".
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
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
