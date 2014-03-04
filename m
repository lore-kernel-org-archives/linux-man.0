From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace.2: doubled reference to NOTES
Date: Wed,  5 Mar 2014 00:05:18 +0100
Message-ID: <1393974318-29105-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Keep only one reference.
---
 man2/ptrace.2 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 4fc2611..aca7d29 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -179,7 +179,6 @@ The word is returned as the result of the
 call.
 Typically, the offset must be word-aligned, though this might vary by
 architecture.
-See NOTES.
 .RI ( data
 is ignored; but see NOTES.)
 .TP
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
