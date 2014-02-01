From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for fallocate.2
Date: Sat, 1 Feb 2014 18:10:50 +0400
Message-ID: <20140201181050.1f23f443@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 2afd0e8..39e1fcd 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -56,7 +56,7 @@ is greater than the file size.
 Any subregion within the range specified by
 .I offset
 and
-.IR len .
+.IR len ,
 that did not contain data before the call will be initialized to zero.
 This default behavior closely resembles the behavior of the
 .BR posix_fallocate (3)

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
