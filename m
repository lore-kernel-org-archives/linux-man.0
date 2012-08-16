From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 20762] epoll_wait(2): upper limit to timeout
Date: Thu, 16 Aug 2012 09:33:31 +0000 (UTC)
Message-ID: <20120816093331.7C78811FB3D@bugzilla.kernel.org>
References: <bug-20762-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-20762-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=20762


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|                            |CODE_FIX




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-08-16 09:33:31 ---
I aplied the following patch:

--- a/man2/epoll_wait.2
+++ b/man2/epoll_wait.2
@@ -198,6 +198,18 @@ If the new file descriptor becomes ready,
 it will cause the
 .BR epoll_wait ()
 call to unblock.
+.SH BUGS
+In kernels before 2.6.37, a
+.I timeout
+value larger than approximately
+.I LONG_MAX / HZ
+milliseconds is treated as \-1 (i.e., infinity).
+Thus, for example, on a system where the
+.I sizeof(long)
+is 4 and the kernel
+.I HZ
+value is 1000,
+this means that timeouts greater than 35.79 minutes are treated as infinity.
 .SH "SEE ALSO"
 .BR epoll_create (2),
 .BR epoll_ctl (2),

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
