From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Sat, 02 May 2015 20:19:49 +0000
Message-ID: <bug-95331-11311-Zefcy37LMP@https.bugzilla.kernel.org/>
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

--- Comment #8 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think linux should provide a way of by-passing this generation of error
events
for writable FDs with no writers - blocking should be possible for writable
pipe
FDs for which the "wait for readers on write"  fcntl or ioctl has been issued,
which would only return success for writable pipe FDs with no readers (readers
== 0) ; for such pipes, blocking reads would succeed once a SINGLE  SIGPIPE or 
write() == -1 with errno==EPIPE event occurred until a reader has connected,
upon which a SIGIO / SIGPOLL signal would be sent if the FD had such a handler
registered for it with the siginfo si_band and si_fd fields correctly filled
in;
such a signal would also be sent and write() would return -1 ONCE for such FDs
when the last reader disconnects, as currently happens .
This would essentially fix the problem of having to know the name of the 
pipe in order to re-open it and be able to wait for readers to connect ;
one could handle a write returning -1 with EPIPE or a SIGPIPE by simply
entering pause() with a SIGIO handler registered, which is NOT currently
the case.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
