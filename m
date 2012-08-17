From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 40852] select(2): document action of close()'ing a fd during a
 select()
Date: Fri, 17 Aug 2012 06:30:36 +0000 (UTC)
Message-ID: <20120817063036.DB76211FC6B@bugzilla.kernel.org>
References: <bug-40852-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-40852-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=40852





--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-08-17 06:30:36 ---
I added some text under NOTES in select(2).

--- a/man2/select.2
+++ b/man2/select.2
@@ -411,6 +411,22 @@ when
 .B _GNU_SOURCE
 is defined.
 Since glibc 2.2.2 the requirements are as shown in the SYNOPSIS.
+.SS Multithreaded applications
+If a file descriptor being monitored by
+.BR select ()
+is closed in another thread, the result is unspecified.
+On some UNIX systems,
+.BR select ()
+unblocks and returns, with an indication that the file descriptor is ready
+(a subsequent I/O operation will likely fail with an error,
+unless another the file descriptor reopened between the time
+.BR select ()
+returned and the I/O operations was performed).
+On Linux (and some other systems),
+closing the file descriptor in another thread has no effect on
+.BR select ().
+In summary, any application that relies on a particular behavior
+in this scenario must be considered buggy.
 .SS "Linux Notes"
 The
 .BR pselect ()

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
