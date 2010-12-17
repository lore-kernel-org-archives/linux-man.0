From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [patch] small improvement for poll.2 (+2)
Date: Fri, 17 Dec 2010 18:40:03 +0300
Message-ID: <20101217184003.51939de4@keeper.home.local>
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
+++ /tmp/poll.2 2010-12-17 18:39:02.000000000 +0300
@@ -287,7 +287,9 @@
 The
 .BR poll ()
 library call was introduced in libc 5.4.28
-(and provides emulation using select(2) if your kernel does not
+(and provides emulation using
+.BR select (2)
+if your kernel does not
 have a
 .BR poll ()
 system call).


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
