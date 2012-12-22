From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 51871] getxattr() man page wrongly refers to ENOATTR
Date: Sat, 22 Dec 2012 08:19:28 +0000 (UTC)
Message-ID: <20121222081928.C6D8211FBAA@bugzilla.kernel.org>
References: <bug-51871-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-51871-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=51871





--- Comment #2 from Anonymous Emailer <anonymous-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org>  2012-12-22 08:19:28 ---
Reply-To: hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org

On Thu, Dec 20, 2012 at 06:13:54PM +0000, bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
wrote:
> --- Comment #1 from Andrew Perepechko <andrew_perepechko-qCPWdT176rRBDgjK7y7TUQ@public.gmane.org>  2012-12-20 18:13:53 ---
> Hm, actually ENODATA is an alias of ENOATTR defined in libattr header.

But that's:

 a) not how normal Posix errno values are supposed to work.  I
 b) limited to using xattr, whichle getxattr is also exposed by glibc
 directly.

This really needs an explanation in the NOTES section, I'll see if I can
come up with someting useful.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
