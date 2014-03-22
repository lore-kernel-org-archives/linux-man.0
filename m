From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [patch] fopen.3: tfix
Date: Sat, 22 Mar 2014 11:26:27 +0400
Message-ID: <20140322112627.40281645@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

diff --git a/man3/fopen.3 b/man3/fopen.3
index c01d8e9..d979df9 100644
--- a/man3/fopen.3
+++ b/man3/fopen.3
@@ -137,7 +137,7 @@ or
 operation between write and read operations on such a stream.
 This operation may be an apparent no-op
 (as in \fIfseek(..., 0L, SEEK_CUR)\fP
-called for its synchronizing side effect.
+called for its synchronizing side effect).
 .PP
 Opening a file in append mode (\fBa\fP as the first character of
 .IR mode )

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
