From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82531] Nondumpable processes that are sandboxed with
 CLONE_NEWUSER can be ptraced from outside.
Date: Sat, 13 Jun 2015 19:08:54 +0000
Message-ID: <bug-82531-11311-b1tGy07Cp9@https.bugzilla.kernel.org/>
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

--- Comment #7 from Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org> ---
Jann Horn doesn't that require root privileges or certain capabilities? My
whole scenario starts from a nonroot application that sandboxes itself. I
suppose one could argue that one should use a setuid shim or invoke a daemon
that has root privileges such as systemd for these kinds of purposes though.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
