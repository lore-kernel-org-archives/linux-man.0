From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14411] pselect man page Linux notes appear to be out of date
Date: Tue, 31 Aug 2010 05:02:47 GMT
Message-ID: <201008310502.o7V52lMs002811@demeter1.kernel.org>
References: <bug-14411-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-14411-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=14411





--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-08-31 05:02:44 ---
Mike,

thanks for the report. I agree the text should be clearer. I applied the
following patch for man-pages-3.26.

Thanks,

Michael

--- a/man2/select.2
+++ b/man2/select.2
@@ -427,15 +427,19 @@ that did not take a
 .I sigmask
 argument.

-Since version 2.1, glibc has provided an emulation of
+Starting with version 2.1, glibc provided an emulation of
 .BR pselect ()
-that is implemented using
+that was implemented using
 .BR sigprocmask (2)
 and
 .BR select ().
-This implementation remains vulnerable to the very race condition that
+This implementation remained vulnerable to the very race condition that
 .BR pselect ()
 was designed to prevent.
+Modern versions of glibc use the (race-free)
+.BR pselect ()
+system call on kernels where it is provided.
+
 On systems that lack
 .BR pselect (),
 reliable (and more portable) signal trapping can be achieved

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
