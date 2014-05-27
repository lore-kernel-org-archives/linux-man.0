From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] inotify_rm_watch(2) unspecified behavior
Date: Tue, 27 May 2014 16:25:24 +0000
Message-ID: <bug-76851-11311-1esItzmpmN@https.bugzilla.kernel.org/>
References: <bug-76851-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-76851-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=76851

--- Comment #4 from Jeff <junk.jsmith+kernel.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I should also add that my assumptions about watch descriptor reuse may very
well be overly cautious. If there is a guarantee that a wd will never be
returned by a inotify_add_watch() call until nothing with that wd remains in
the read queue, clients could handle deregistration semi-synchronously by
knowing to drop locally unmapped events.

This is something that I've not investigated recently, and I am completely
uncertain of any guarantees, but the kernel folks may have already done this
and just not passed the information along to users.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
