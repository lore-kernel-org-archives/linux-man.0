From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dir_colors.5: keywords SUID, SGID, STICKY, STICKY_OTHER_WRITABLE, OTHER_WRITABLE
Date: Tue,  6 Aug 2013 02:14:42 +0200
Message-ID: <1375748082-21280-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See http://bugs.debian.org/553477
See ls.c and dircolors.c in coreutils
---
 man5/dir_colors.5 |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man5/dir_colors.5 b/man5/dir_colors.5
index b81dc4f..162c739 100644
--- a/man5/dir_colors.5
+++ b/man5/dir_colors.5
@@ -149,6 +149,21 @@ Specifies the color used for a character device special file.
 .B EXEC \fIcolor-sequence\fR
 Specifies the color used for a file with the executable attribute set.
 .TP
+.B SUID \fIcolor-sequence\fR
+Specifies the color used for a file with the set-user-ID attribute set.
+.TP
+.B SGID \fIcolor-sequence\fR
+Specifies the color used for a file with the set-group-ID attribute set.
+.TP
+.B STICKY \fIcolor-sequence\fR
+Specifies the color used for a directory with the sticky attribute set.
+.TP
+.B STICKY_OTHER_WRITABLE \fIcolor-sequence\fR
+Specifies the color used for a other-writable directory with the executable attribute set.
+.TP
+.B OTHER_WRITABLE \fIcolor-sequence\fR
+Specifies the color used for a other-writable directory without the executable attribute set.
+.TP
 .B LEFTCODE \fIcolor-sequence\fR
 Specifies the
 .I "left code"
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
