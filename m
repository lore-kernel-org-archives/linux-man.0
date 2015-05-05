From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97721] signal(7) is unclear on EINTR behavior against disks
Date: Tue, 05 May 2015 21:35:13 +0000
Message-ID: <bug-97721-11311-RQo9QmFirj@https.bugzilla.kernel.org/>
References: <bug-97721-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-97721-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=97721

--- Comment #2 from Steinar H. Gunderson <sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org> ---
Thanks! This makes it much clearer.

In a sense, it's sad that FUSE is the way it is, but I think that's maybe more
of a FUSE bug than a documentation bug.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
