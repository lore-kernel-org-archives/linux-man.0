From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for ddp.7
Date: Sun, 7 Oct 2012 11:39:57 +0400
Message-ID: <20121007113957.6c52aed1@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man7/ddp.7    2012-04-29 11:15:54.997831519 +0400
+++ /tmp/ddp.7  2012-10-07 11:38:42.653267088 +0400
@@ -206,7 +206,7 @@
 .B EPERM
 User doesn't have permission to set high priority,
 make a configuration change,
-or send signals to the requested process or group,
+or send signals to the requested process or group.
 .TP
 .B EPIPE
 The connection was unexpectedly closed or shut down by the other end.

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
