From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 59281] unshare(2) applies to threads, not processes
Date: Mon, 31 Mar 2014 20:07:19 +0000
Message-ID: <bug-59281-11311-n3boWq5EXZ@https.bugzilla.kernel.org/>
References: <bug-59281-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-59281-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59281

Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sstewartgallus00@mylangara.
                   |                            |bc.ca

--- Comment #1 from Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org> ---
Well processes and threads are basically the same under Linux. That's basically
the point of the unshare call. It should really say processes and threads
though. Why not submit a patch correcting processes to "processes (or
threads)"?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
