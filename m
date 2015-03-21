From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95191] New: document behavior of open(2) when path names a
 fifo with no readers
Date: Sat, 21 Mar 2015 15:16:27 +0000
Message-ID: <bug-95191-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=95191

            Bug ID: 95191
           Summary: document behavior of open(2) when path names a  fifo
                    with no readers
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

linux 3.13 open() , if the path refers to a fifo, and O_WRONLY is set in
its flags , but not O_NONBLOCK, then it does not return until a reader has
connected to the output end of the pipe.

This fact is not documented anywhere in the open(2) manual page - in fact,
it only mentions :

    ENXIO  O_NONBLOCK | O_WRONLY is set, the named file is a FIFO and no
process 
           has the file open for reading.  Or, the file is a device special
file 
           and no corresponding device exists.

You can easily verify this behaviour with bash :

  $ mkfifo /tmp/a.fifo
  $ strace -f bash -c 'echo 1 >/tmp/a.fifo' &
  ...
  open("/tmp/a.fifo", O_WRONLY|O_CREAT|O_TRUNC, 0666
  $ read res </tmp/a.fifo
) = 3
fcntl(1, F_GETFD)                       = 0
fcntl(1, F_DUPFD, 10)                   = 10
fcntl(1, F_GETFD)                       = 0
fcntl(10, F_SETFD, FD_CLOEXEC)          = 0
dup2(3, 1)                              = 1
close(3)                                = 0
write(1, "1\n", 2)                      = 2
dup2(10, 1)                             = 1
fcntl(10, F_GETFD)                      = 0x1 (flags FD_CLOEXEC)
close(10)                               = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
exit_group(0)                           = ?
+++ exited with 0 +++

Please add words to the effect :

  "If the path refers to a named pipe (FIFO), and O_NONBLOCK is not set,
   open() will block until a reader is connected to the write end of the pipe.
  "
to the open(2) manual page.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
