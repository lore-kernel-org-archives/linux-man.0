From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement in the setsid.2
Date: Mon, 24 May 2010 15:59:00 +0400
Message-ID: <20100524155900.002412ef@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man2/setsid.2 2010-03-26 17:46:41.000000000 +0300
+++ /tmp/setsid.2       2010-05-24 15:55:48.000000000 +0400
@@ -56,7 +56,7 @@
 is set to indicate the error.
 .SH ERRORS
 .TP
-.BR EPERM .
+.BR EPERM
 The process group ID of any process
 equals the PID of the calling process.
 Thus, in particular,


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
