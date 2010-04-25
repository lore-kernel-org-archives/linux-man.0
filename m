From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 2/3] getrusage.2: Add ru_maxrss
Date: Sun, 25 Apr 2010 21:42:32 +0100
Message-ID: <1272228153-11825-3-git-send-email-mark@pogo.org.uk>
References: <1272228153-11825-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1272228153-11825-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

See kernel commit 1f10206.

Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man2/getrusage.2 |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/man2/getrusage.2 b/man2/getrusage.2
index 6ffdce2..9fb38fb 100644
--- a/man2/getrusage.2
+++ b/man2/getrusage.2
@@ -100,7 +100,11 @@ the total amount of time spent executing in user mode.
 the total amount of time spent in the system executing on behalf
 of the process(es).
 .TP
-.IR ru_maxrss " (unmaintained)"
+.IR ru_maxrss " (since Linux 2.6.32)"
+the maximum resident set size used (in kilobytes). For
+.B RUSAGE_CHILDREN
+this is the resident set size of the largest child, not the maximum
+resident set size of the process tree.
 .TP
 .IR ru_ixrss " (unmaintained)"
 .TP
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
