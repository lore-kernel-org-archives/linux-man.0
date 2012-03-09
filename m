From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42892] Man page bug for mmap2(2)
Date: Fri, 9 Mar 2012 15:14:06 GMT
Message-ID: <201203091514.q29FE6pH019669@bugzilla.kernel.org>
References: <bug-42892-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-42892-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42892





--- Comment #1 from Kevin <kevinogorman4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-03-09 15:14:06 ---
It occurs to me that perhaps glue code is intentionally missing, and this
system call is to be used internally for library authors.  If this is the case,
then it seems to me the man page should look more like getdents(2) and a few
others, with the description beginning "This  is  not  the  function  you  are
interested in."

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
