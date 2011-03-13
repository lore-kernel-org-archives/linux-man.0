From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for recv.2
Date: Sun, 13 Mar 2011 09:20:29 +0300
Message-ID: <20110313092029.1e80cef8@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- recv.2      2010-12-26 12:01:43.851106424 +0300
+++ /tmp/recv.2 2011-03-13 09:18:14.432032807 +0300
@@ -360,7 +360,9 @@
 .PP
 The
 .I msg_flags
-field in the msghdr is set on return of
+field in the
+.IR msghdr
+is set on return of
 .BR recvmsg ().
 It can contain several flags:
 .TP


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
