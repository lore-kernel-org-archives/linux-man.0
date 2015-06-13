From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82531] Nondumpable processes that are sandboxed with
 CLONE_NEWUSER can be ptraced from outside.
Date: Sat, 13 Jun 2015 21:02:52 +0000
Message-ID: <bug-82531-11311-mRKHQjD1rV@https.bugzilla.kernel.org/>
References: <bug-82531-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-82531-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=82531

--- Comment #8 from Jann Horn <jann+kernelbugzilla-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org> ---
Right, that would require root privileges. Might be nice to have some new
clone() flag to disable that or so - but that's not a man-pages bug.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
