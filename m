From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Sun, 03 May 2015 00:34:18 +0000
Message-ID: <bug-95331-11311-LOjhEX6BwB@https.bugzilla.kernel.org/>
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

--- Comment #18 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
static ssize_t
pipe_write(struct kiocb *iocb, struct iov_iter *from)
{

    if (!pipe->readers) {
           if( (!(filp->f_flags & O_NONBLOCK)) &&
               ((!pipe->sigio_on_write_enabled) || !pipe->sigpipe_sent )
             )
           {    pipe->sigpipe_sent = 1;
                 send_sig(SIGPIPE, current, 0);
        ret = -EPIPE;
        goto out;
           }else
           if(pipe->sigio_on_write_enabled && pipe->sigpipe_sent)
              if ((!(filp->f_flags & O_NONBLOCK)) && wait_for_partner(pipe,
&pipe->r_counter))
        goto err_wr;
           }
        }else
        { 
           pipe->sigpipe_sent = 0;
         ...
        } ...
 }

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
