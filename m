From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 57181] man pages for C structs
Date: Mon, 17 Mar 2014 07:39:56 +0000
Message-ID: <bug-57181-11311-0XC8PeUr6J@https.bugzilla.kernel.org/>
References: <bug-57181-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-57181-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=57181

--- Comment #5 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So, here's an idea...

A man page, called (say) structures.7, with suitable .so links to it, that
lists the structures, optionally explains them, and has links to the APIs that
use the structures. Doesn't need to be done for all structures to start with,
but could be implemented incrementally over time. Do you want to start writing
such a page, Serge? As a proof-of-concept, I'd suggest starting with just one
or two structures on the page.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
