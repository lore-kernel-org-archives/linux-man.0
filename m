From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95191] document behavior of open(2) when path names a  fifo
 with no readers
Date: Sun, 22 Mar 2015 15:15:08 +0000
Message-ID: <bug-95191-11311-4EQX55cIDI@https.bugzilla.kernel.org/>
References: <bug-95191-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-95191-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=95191

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #9 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Jason Vas Dias from comment #1)
> I think the fcntl documentation is also particularly misleading when it
> suggests
> that output file descriptors can be enabled to have SIGIO sent for them when 
> only O_ASYNC and not O_NONBLOCK bits are set in the FD flags .

Hello Jason,

I don't understand what you mean here. But, also, I would really prefer a
separate bug report, since this seems to be a separate issue.

I'm going to close this bug. Could you raise the above as a separate topics,
and repost example programs. But please: make the example programs as simple as
possible. I see extraneous stuff in the code you posted already, which just
makes it harder for me to work out what's going on.

Thanks,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
