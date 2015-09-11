From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 99911] ioperm is kept on fork
Date: Fri, 11 Sep 2015 03:13:21 +0000
Message-ID: <bug-99911-11311-eKy0tKkdTZ@https.bugzilla.kernel.org/>
References: <bug-99911-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-99911-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99911

--- Comment #2 from Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I used QEMU to test Slackware 8.0,[1] which included both Linux 2.2.19 and
Linux 2.4.5. On 2.2.19, ioperm is lost on fork, but on 2.4.5, ioperm is kept on
fork. My guess is that the behavior changed in 2.4.0.

[1]
http://slackware.cs.utah.edu/pub/slackware/slackware-8.0-iso/slackware-8.0-livefs-d2.iso

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
