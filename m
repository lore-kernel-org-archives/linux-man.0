From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [patch] small improvement for poll.2
Date: Thu, 16 Dec 2010 18:57:19 +0300
Message-ID: <20101216185719.142f4d72@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man2/poll.2   2010-11-02 13:41:53.000000000 +0300
+++ /tmp/poll.2 2010-12-16 18:55:52.000000000 +0300
@@ -191,7 +191,8 @@
 becomes ready or until a signal is caught.
 .PP
 Other than the difference in the precision of the
-timeout argument, the following
+.I timeout
+argument, the following
 .BR ppoll ()
 call:
 .nf


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
