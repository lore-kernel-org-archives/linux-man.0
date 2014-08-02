From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: ffix timer_stats output
Date: Sat,  2 Aug 2014 23:39:03 +0200
Message-ID: <1407015543-32164-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 942156b..d721a3b 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4042,13 +4042,19 @@ sampled information.
 
 timer_stats collects information about the timer events which are fired in a
 Linux system over a sample period:
-
-- the pid of the task(process) which initialized the timer
-- the name of the process which initialized the timer
-- the function where the timer was initialized
-- the callback function which is associated to the timer
-- the number of events (callbacks)
