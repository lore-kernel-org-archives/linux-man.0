From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.2: simplify example
Date: Sat, 28 Feb 2015 02:25:47 +0100
Message-ID: <1425086747-4548-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Do not duplicate coding.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/futex.2 | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 6c02da7..2d56a20 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -1509,24 +1509,15 @@ fwait(int *futexp)
        machine\-language instructions.  For further information, see
        the GCC Manual. */
 
-    /* Maybe the futex is already available: */
-
-    if (__sync_bool_compare_and_swap(futexp, 1, 0))
-        return;
-
-    /* No; we must wait for the futex value to be changed */
-
     while (1) {
-        s = futex(futexp, FUTEX_WAIT, 0, NULL, NULL, 0);
-        if (s == \-1 && errno != EAGAIN)
-            errExit("futex\-FUTEX_WAIT");
-
-        /* Is the futex now available? */
