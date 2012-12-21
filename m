From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15446] sysctl(2) can return EACCES without sufficient
 permissions
Date: Fri, 21 Dec 2012 18:23:21 +0000 (UTC)
Message-ID: <20121221182321.8909211FBAA@bugzilla.kernel.org>
References: <bug-15446-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-15446-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15446


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |CODE_FIX




--- Comment #4 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-12-21 18:23:21 ---
Garrett, I've applied a different patch from what you suggest, essentially just
making EACCES a synonym of EPERM.

index bb2d9a5..b1772d5 100644
--- a/man2/sysctl.2
+++ b/man2/sysctl.2
@@ -78,6 +78,7 @@ Otherwise, a value of \-1 is returned and
 is set to indicate the error.
 .SH ERRORS
 .TP
+.TP
 .B EFAULT
 The invocation asked for the previous value by setting
 .I oldval
@@ -88,7 +89,7 @@ non-NULL, but allowed zero room in
 .I name
 was not found.
 .TP
-.B EPERM
+.BR EACCES ", " EPERM
 No search permission for one of the encountered "directories",
 or no read permission where
 .I oldval
lines 1-21/21 (END)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
