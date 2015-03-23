From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Mon, 23 Mar 2015 20:25:55 +0000
Message-ID: <bug-95331-11311-mbTq7S775X@https.bugzilla.kernel.org/>
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

--- Comment #2 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Incidentally, nowhere do the man-pages state that unless you use 
an SA_ONSTACK handler, having used sigaltstack() to set the 
stack used to invoke the handler, then you get garbage pointed
to by the siginfo_t 'si' pointer 2nd parameter to the handler,
which is definitely the case.
Also, unless you actually call fcntl(fd, F_SETSIG, signum), then
no si->_sifields._sigpoll information is set at all - the 
manual pages definitely suggest that SIGIO / SIGPOLL is the
default, but do not mention that the default does not apply
to SA_SIGACTION signal handlers .

Oh well, I was hoping to avoid having to do so, but I guess there
is no alternative to making the program use poll / pselect .
But the documentation is definitely in need of clarification of
the above points.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
