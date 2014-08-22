From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82841] sendfile doesn't work with O_APPEND
Date: Fri, 22 Aug 2014 02:18:48 +0000
Message-ID: <bug-82841-11311-2L93ud9lfY@https.bugzilla.kernel.org/>
References: <bug-82841-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-82841-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=82841

--- Comment #2 from Jason Newton <nevion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Alan from comment #1)
> O_APPEND is not supported for sendfile().
> 
> It's documented in the splice() manual page but not for sendfile so I've
> moved this to a documentation bug

OK so this quirk was not out in the open in documentation - before I opened
this bug report I read a few years old discussion:
http://fixunix.com/kernel/543017-splice-vs-o_append.html

Most of what they're talking about is splice, not sendfile.  They might use the
same implementation but sendfile should be O_APPEND safe as there is no
specifiable offset in the output filedescriptor.  Is there a reason to not
support it?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
