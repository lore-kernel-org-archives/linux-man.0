From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95191] document behavior of open(2) when path names a  fifo
 with no readers
Date: Sat, 21 Mar 2015 20:18:43 +0000
Message-ID: <bug-95191-11311-1OlpZj44QC@https.bugzilla.kernel.org/>
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

--- Comment #1 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think the fcntl documentation is also particularly misleading when it
suggests
that output file descriptors can be enabled to have SIGIO sent for them when 
only O_ASYNC and not O_NONBLOCK bits are set in the FD flags .
I cannot get the attached program to work if I do not open() the fifo file -
it will not do to simply fcntl(fd,F_SETFL,previous_flags|O_ASYNC) and 
fcntl(fd,F_SETOWN_EX,{ .type = F_OWNER_TID, .pid  = gettid() }) and
 sigio_sa = (struct sigaction)
      { .sa_sigaction = sigio_handler,
        .sa_flags = SA_NODEFER | SA_SIGINFO 
      };  
  if( sigaction(SIGIO, &sigio_sa, &sigio_prev_sa)
and then expect the process /  thread to receive SIGIO
where si->si_fd == 1 for stdout - the process never gets a SIGIO signal.
Is this a kernel bug ? if not why is this not documented ?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
