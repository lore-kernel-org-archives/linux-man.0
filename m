From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Sat, 02 May 2015 20:45:36 +0000
Message-ID: <bug-95331-11311-D0WH0Ru122@https.bugzilla.kernel.org/>
References: <bug-95331-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-95331-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=95331

--- Comment #12 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
One cannot handle the case for currently open pipe FDs, where no reader has yet
connected, as are inherited by shell re-directs, without using some
form of user-space polling and sleeping or busy-waiting.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
