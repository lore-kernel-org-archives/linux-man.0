From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] inotify_rm_watch(2) unspecified behavior
Date: Thu, 29 May 2014 17:03:35 +0000
Message-ID: <bug-76851-11311-ZAGdNhOt8G@https.bugzilla.kernel.org/>
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

Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |xypron.glpk-Mmb7MZpHnFY@public.gmane.org

--- Comment #5 from Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> ---
Created attachment 137681
  --> https://bugzilla.kernel.org/attachment.cgi?id=137681&action=edit
test_wd_reuse.c - Test watch descriptor reuse

The test program demonstrates that inotify_add_watch may return a watch
descriptor ID for which events still exist on the inotify queue.

It creates one watch for file "0" to demonstrate the problem.
Afterwards it creates and removes watches again and again just to force
idr_alloc_cyclic to reach INT_MAX.
Then events are created for file "0" on the queue.
The watch for "0" is removed.
A watch for another file is created.

Example program output (after a few hours, on Linux 3.14.4 x86_64):

...
2147459044      2147467235      2147475426      2147483617      2147483647      
Preparation done
BINGO Collision detected
Watch descriptor 1 for /tmp/test/8192
Watch descriptor 1 for /tmp/test/0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
