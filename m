From: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Subject: [PATCH 1/2] stat.2: tfix
Date: Tue, 25 Apr 2017 13:18:14 +0100
Message-ID: <1493122695-8001-2-git-send-email-andrew@digital-domain.net>
References: <1493122695-8001-1-git-send-email-andrew@digital-domain.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493122695-8001-1-git-send-email-andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
---
 man2/stat.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/stat.2 b/man2/stat.2
index dec44e2..23fe7e5 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -179,7 +179,7 @@ if you need to know the details.
 .\" Background: inode attributes are modified with i_mutex held, but
 .\" read by stat() without taking the mutex.
 .IR Note :
-f performance and simplicity reasons, different fields in the
+for performance and simplicity reasons, different fields in the
 .I stat
 structure may contain state information from different moments
 during the execution of the system call.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
