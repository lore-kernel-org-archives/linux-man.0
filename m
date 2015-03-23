From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Mon, 23 Mar 2015 19:58:30 +0000
Message-ID: <bug-95331-11311-B2W2wTAQaJ@https.bugzilla.kernel.org/>
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

--- Comment #1 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
To test (under kernel 3.13, Linux x86_64 8-core)

   $ gcc -g -pthread -o t_sigio_rdwr  t_sigio_rdwr.c
   $ mkfifo -m 0600 /tmp/f.in /tmp/f.out
   $ strace -f bash -c './t_sigio_rdwr </tmp/f.in >/tmp/f.out' &
   ...
   $ echo 'hello' >/tmp/f.in && read res </tmp/f.out && echo "RES: $res"
   RES: hello
   ...
   $ echo 'hel2o' >/tmp/f.in 
   ...
   $ read res </tmp/f.out && echo "RES: $res"
   ^C
   ^- now you have to press <CTRL+C>, at which time the t_sigio_rdwr
      process does get a SIGIO with si->si_fd == 1, but it is now too late -
      the reader has disconnected.

Can anyone answer the question:
  For output (O_WRONLY|O_ASYNC) file descriptors, WHEN is the F_SETOWN signal 
  or SIGIO meant to be sent ? Is it upon connection of a new reader FD to the
  read end of the the pipe, or when a reader FD is closed, or both ? 
  IMHO, it must be possible to trigger the first case (sent on connection of
new 
  reader) but I can't see how to do it - the process only gets a SIGIO when a
  reader disconnects.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
