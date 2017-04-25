From: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Subject: [PATCH 2/2] statx.2: tfix
Date: Tue, 25 Apr 2017 13:18:15 +0100
Message-ID: <1493122695-8001-3-git-send-email-andrew@digital-domain.net>
References: <1493122695-8001-1-git-send-email-andrew@digital-domain.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493122695-8001-1-git-send-email-andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
---
 man2/statx.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/statx.2 b/man2/statx.2
index 12e0846..b2ff1ed 100644
--- a/man2/statx.2
+++ b/man2/statx.2
@@ -44,7 +44,7 @@ statx \- get file status (extended)
 
 .IR Note :
 There is no glibc wrapper for
-.BR renameat2 ();
+.BR statx ();
 see NOTES.
 .SH DESCRIPTION
 .PP
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
