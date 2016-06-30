From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/3] dir_colors.5: tfix
Date: Thu, 30 Jun 2016 13:25:17 +0200
Message-ID: <1467285918-6408-2-git-send-email-jwilk@jwilk.net>
References: <1467285918-6408-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467285918-6408-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/dir_colors.5 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man5/dir_colors.5 b/man5/dir_colors.5
index 07ea7bf..f3668b1 100644
--- a/man5/dir_colors.5
+++ b/man5/dir_colors.5
@@ -181,13 +181,13 @@ Synonym:
 Specifies the color used for a directory with the sticky attribute set.
 .TP
 .B STICKY_OTHER_WRITABLE \fIcolor-sequence\fR
-Specifies the color used for a other-writable directory with the executable attribute set.
+Specifies the color used for an other-writable directory with the executable attribute set.
 
 Synonym:
 .BR OWT .
 .TP
 .B OTHER_WRITABLE \fIcolor-sequence\fR
-Specifies the color used for a other-writable directory without the executable attribute set.
+Specifies the color used for an other-writable directory without the executable attribute set.
 
 Synonym:
 .BR OWR .
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
