From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] proc.5: /proc/sys: describe whitespace characters
Date: Tue, 25 Aug 2015 23:13:17 +0200
Message-ID: <1440537197-14327-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Suggested patch
https://lkml.org/lkml/2015/8/24/171
indicates missing documentation.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man5/proc.5 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index bb648d4..85e3b76 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -3303,6 +3303,16 @@ These variables can be read and sometimes modified using
 the \fI/proc\fP filesystem, and the (deprecated)
 .BR sysctl (2)
 system call.
+
+String values may be terminated by either of \'\\0\' or \'\\n\'.
+
+Integer and long values may be written either in decimal or in
+hexadecimal notation (e.g. 0x3FFF).
+When writing multiple integer or long values these may be separated
+by either of the following whitespace characters:
+\' \', \'\\t\', or \'\\n\'.
+Using other separators leads to an error
+.BR EINVAL .
 .TP
 .IR /proc/sys/abi " (since Linux 2.4.10)"
 This directory may contain files with application binary information.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
