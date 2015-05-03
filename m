From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Sun, 03 May 2015 00:16:44 +0000
Message-ID: <bug-95331-11311-0fywAoGYag@https.bugzilla.kernel.org/>
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

--- Comment #16 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Since currently ONLY open() already waits for readers to connect :

    case FMODE_WRITE:
    /*
     *  O_WRONLY
     *  POSIX.1 says that O_NONBLOCK means return -1 with
     *  errno=ENXIO when there is no process reading the FIFO.
     */
        ret = -ENXIO;
        if (!is_pipe && (filp->f_flags & O_NONBLOCK) && !pipe->readers)
            goto err;

        pipe->w_counter++;
        if (!pipe->writers++)
            wake_up_partner(pipe);

        if (!is_pipe && !pipe->readers) {
            if (wait_for_partner(pipe, &pipe->r_counter))
                goto err_wr;
        }
        break;


I think if O_ASYNC is set and O_NONBLOCK is NOT set , once ONE sigpipe
or EPIPE has been generated, then the next write should block  for  pipes
marked with sigio_on_write_enabled , and also readers should generate 
the SIGIO events BEFORE they are about to read. I guess such changes
might take a long time to become accepted ...
But which paragraphs of which standard are meant to apply to this 
situtation ? Where is it specified what SHOULD happen in these cases ?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
