From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82531] Nondumpable processes that are sandboxed with
 CLONE_NEWUSER can be ptraced from outside.
Date: Sun, 14 Jun 2015 15:08:09 +0000
Message-ID: <bug-82531-11311-EnUy0TmyU5@https.bugzilla.kernel.org/>
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

--- Comment #9 from Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org> ---
Okay, so four things:

- An unprivileged process that sandboxes itself can't also protect against
ptrace.

- For some reason, commenters here seem to feel that they don't want to support
this use-case or feel that it isn't useful.

- This annoyance was not documented at the time I made this bug report.

- It appears to be documented now.

If kernel coders really feel that this use-case isn't useful then I guess they
should close this bug report then.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
