From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Tue, 24 Mar 2015 11:51:30 +0000
Message-ID: <bug-95331-11311-aowNEF9cvW@https.bugzilla.kernel.org/>
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

Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #171961|0                           |1
        is obsolete|                            |

--- Comment #4 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 171971
  --> https://bugzilla.kernel.org/attachment.cgi?id=171971&action=edit
better version

Now, if you run:

  $ ./t_sigio_rdwr_gsf </tmp/f.in >/tmp/f.out &
  $ echo 'hello' >/tmp/f.in && read res </tmp/f.out && echo "RES: $res"
  RES: hello
  $ ps -ef | grep t_sigio 
    # ie. get the pid of the t_sigio_rdwr_gsf process in $TS_PID
  $ echo hel2o >/tmp/f.in
  $ kill -IO $TS_PID; read res </tmp/f.out && echo 'RES: '"$res"
  RES: hel2o

But if you do not do 'kill -IO $TS_PID;' and just do ' read res </tmp/f.out ',
after sending the second 'hel2o' line, the reader will hang, because the
t_sigio_rdwr process gets NO SIGNALs at all after the SIGPIPE attempting to 
write, until the reader disconnects.  I think this might be a kernel bug
in the way it is generating siginfo events for output pipes - or is it 
a documentation bug ? Because even the short one line description of SIGIO
states : 'I/O now possible' - yet for writable pipe FDs, linux is generating
SIGIO only when output becomes IMpossible on the FD - why is this ?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
