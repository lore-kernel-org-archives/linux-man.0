From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43300] ::prctl(PR_SET_PDEATHSIG, SIGKILL) uses parent thread
 death to signal instead of parent process death.
Date: Tue, 05 May 2015 10:15:30 +0000
Message-ID: <bug-43300-11311-VLOFJF8eQJ@https.bugzilla.kernel.org/>
References: <bug-43300-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-43300-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43300

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |DOCUMENTED

--- Comment #25 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've added the following text to prctl(2) under the description of
PR_SET_PDEATHSIG:

              Warning:  the  "parent" in this case is considered to be
              the thread that created this process.  In  other  words,
              the  signal  will  be  sent  when that thread terminates
              (via, for example, pthread_exit(3)), rather  than  after
              all of the threads in the parent process terminate.

This suffices, I believe. If not, please reopen the bug.

Thanks,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
