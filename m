From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] inotify_rm_watch(2) unspecified behavior
Date: Thu, 29 May 2014 17:05:01 +0000
Message-ID: <bug-76851-11311-jCVc8bBTfu@https.bugzilla.kernel.org/>
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

--- Comment #6 from Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> ---
Watch descriptor IDs are returned by inotify_add_watch.
When calling inotify_rm_watch an IN_IGNORE is placed on the inotify queue
pointing to the ID of the removed watch.

inotify_add_watch should not return a watch descriptor ID for which events are
still on the queue but should return an unused ID.

Unfortunately the existing Kernel code does not provide such a guarantee.

Actually in rare cases watch descriptor IDs are returned by inotify_add_watch
for which events are still on the inotify queue.

I verified the problem exists with the appended test program (test_wd_reuse.c).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
