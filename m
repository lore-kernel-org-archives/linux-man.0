From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15952] man page cmsg(3) inconsistency
Date: Tue, 05 May 2015 16:02:31 +0000
Message-ID: <bug-15952-11311-3wSaNgrgva@https.bugzilla.kernel.org/>
References: <bug-15952-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-15952-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15952

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #4 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It seems to me that at the time this report was made, there were at least *two*
problems with this code snippet:

           msg.msg_control = buf;
[1]        msg.msg_controllen = sizeof buf;
           cmsg = CMSG_FIRSTHDR(&msg);
           cmsg->cmsg_level = SOL_SOCKET;
           cmsg->cmsg_type = SCM_RIGHTS;
           cmsg->cmsg_len = CMSG_LEN(sizeof(int) * NUM_FD);
           /* Initialize the payload: */
           fdptr = (int *) CMSG_DATA(cmsg);
           memcpy(fdptr, myfds, NUM_FD * sizeof(int));
           /* Sum of the length of all control messages in the buffer: */
[2]        msg.msg_controllen = cmsg->cmsg_len;

One of these is the problem referred to in this bug, at the line marked [2].
But the other is that there's a general confusion in the code where
msg.msg_controllen is being initialized twice.

Since the time of the report, the code has changed a little because on some
other reports, but the problem line [2] still exists. The solution is I believe
to remove line [2] and modify line [1] (which was already done as a result of
the other changes), as shown in this revised code snippet:

           struct msghdr msg = {0};
           struct cmsghdr *cmsg;
           int myfds[NUM_FD]; /* Contains the file descriptors to pass. */
           union {
               /* ancillary data buffer, wrapped in a union in order to ensure
                  it is suitably aligned */
               char buf[CMSG_SPACE(sizeof myfds)];
               struct cmsghdr align;
           } u;
           int *fdptr;

           msg.msg_control = u.buf;
           msg.msg_controllen = sizeof u.buf;
           cmsg = CMSG_FIRSTHDR(&msg);
           cmsg->cmsg_level = SOL_SOCKET;
           cmsg->cmsg_type = SCM_RIGHTS;
           cmsg->cmsg_len = CMSG_LEN(sizeof(int) * NUM_FD);
           /* Initialize the payload: */
           fdptr = (int *) CMSG_DATA(cmsg);
           memcpy(fdptr, myfds, NUM_FD * sizeof(int));

I've made this change, which I believe addresses the problem, so I'm closing
this bug. Please reopen, if you believe there is still a problem.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
