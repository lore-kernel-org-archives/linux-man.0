From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Sat, 02 May 2015 19:44:54 +0000
Message-ID: <bug-95331-11311-ovD6j0POwN@https.bugzilla.kernel.org/>
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

--- Comment #6 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Should have said in previous comment:

Of course, one CAN use poll() or select() , but then the whole point
of signal driven I/O is rather negated, IMHO - if one can wait for the
number of writers to the input end of a pipe to increase before reading,
and then receive a signal with siginfo si_band and si_fd fields filled in, 
as evidently happens for input pipe file descriptors (FDs),  why can't the 
same be made to happen when the number of readers of an output pipe FD 
increases ? Particularly as  it seems both numbers are maintained in the 
pipe filesystem structure for each pipe FD:

struct pipe_inode_info {
    struct mutex mutex;
    wait_queue_head_t wait;
    unsigned int nrbufs, curbuf, buffers;
    unsigned int readers;
    unsigned int writers;
    unsigned int files;
    unsigned int waiting_writers;
    unsigned int r_counter;
    unsigned int w_counter;
    struct page *tmp_page;
    struct fasync_struct *fasync_readers;
    struct fasync_struct *fasync_writers;
    struct pipe_buffer *bufs;
};

I suppose this is because a signal might be sent whenever the
output buffer has space available for writable FDs , unlike for readable
FDs, which generate si_band events when input is available ? 

Yet, as the test case shows, this does NOT occur for writable 
FIFO fds - a signal with si_band and si_fd siginfo is only received 
(sent by kernel) when a reader disconnects from a writable FIFO fd .

But a special FCNTL or IOCTL could be provided to say, "For this writable 
FIFO FD, send the IO signal only when a the "readers" counter is incremented 
or decremented (or perhaps only when it reaches 0 and when it transitions 
from 0 to 1) . 

I'm going to investigate producing a version of linux that does 
support such an fcntl / ioctl and send such si_band events for output
file descriptors, as it seems there is no way to make current versions 
of linux do this .

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
