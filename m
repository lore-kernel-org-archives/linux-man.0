From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97721] signal(7) is unclear on EINTR behavior against disks
Date: Tue, 05 May 2015 21:45:25 +0000
Message-ID: <bug-97721-11311-u3fKS63uCx@https.bugzilla.kernel.org/>
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

Michael Wright <mdwrigh2-e4nNhFGpWWo@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mdwrigh2-e4nNhFGpWWo@public.gmane.org

--- Comment #3 from Michael Wright <mdwrigh2-e4nNhFGpWWo@public.gmane.org> ---
Note that a btrfs formatted drive can also return EINTR during an ioctl
(https://github.com/torvalds/linux/blob/master/fs/btrfs/ioctl.c#L825) and FUSE
explicitly documents this behavior
(https://github.com/torvalds/linux/blob/master/Documentation/filesystems/fuse.txt#L169).
Is there documentation somewhere about this restriction?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
