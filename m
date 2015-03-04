From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 94271] New: fcntl.2 and pipe.7 need to say more about use of
 O_ASYNC
Date: Wed, 04 Mar 2015 16:06:22 +0000
Message-ID: <bug-94271-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=94271

            Bug ID: 94271
           Summary: fcntl.2 and pipe.7 need to say more about use of
                    O_ASYNC
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

Created attachment 169011
  --> https://bugzilla.kernel.org/attachment.cgi?id=169011&action=edit
program that demonstrates the problem.

This problem lost me a couple of hours debugging today, 
so I thought I should report it so that others do not waste time.
It is correct, but not entirely sufficient, to say in pipe.7 :
"
   Setting the O_ASYNC flag for the read end of a pipe causes a signal 
   (SIGIO by  default)  to  be  generated when  new  input becomes available 
   on the pipe (see fcntl(2) for details)
"
and in fcntl.2:
"  If you set the O_ASYNC status flag on a file descriptor by using the F_SETFL 
   command of fcntl(),  a SIGIO  signal  is sent whenever input or output
   becomes possible on that file descriptor.
" 
In fact, unless you have used :
  fnctl(fd, F_SETOWN, getpid());
for the fd that you have set the O_ASYNC flag for, no SIGIO signals are ever
sent.
Please could those lines be modified to say something like :
pipe.7 :
"
   Setting the O_ASYNC flag for the read end of a pipe causes a signal 
   (SIGIO by  default)  to  be  generated when  new  input becomes available 
   on the pipe (see fcntl(2) for details), and you have set the receiver of 
   the signal with fcntl(2)'s F_SETOWN command. No signal will be sent for
   an FD when new input becomes available unless both the O_ASYNC flag has
   been set and the receiver of the signal has been set with F_SETOWN.
"
fnctl.2:
'     F_SETOWN (int)
      ...
             If you set the O_ASYNC status flag on a file descriptor by using
             the F_SETFL command of fcntl(),  a  SIGIO signal  is sent 
             whenever input or output becomes possible on that file descriptor,
             if and only if the fnctl F_SETOWN command has also been issued 
             for that file descriptor.
'
There was nothing in the pipe.7 manual page or in the fcntl.2 manual page 
to say that without calling fcntl(fd, F_SETOWN, getpid()), no IO signals are
ever sent for that fd.  
I had expected that in the absence of a fcntl(fd, F_SETOWN, getpid()) call, the
default receiver of IO signals would be the process that issued the 
  fcntl(fd, F_SETFL, O_ASYNC)
or which did
  fd = open(... O_ASYNC ...) ;
This is illustrated by the attached test program .
Compiling the program with no -D flags allows it to wait for new input
to become available on its input pipe :
   $ gcc -o -std=gnu99 pio pio.c
   $ mkfifo /tmp/p.in /tmp/p.out
   $ ./pio </tmp/p.in >/tmp/p.out &
   [7] 10059
   $ echo 'line1' > /tmp/p.out ; read line </tmp/p.in; echo "$line";
   read nothing - waiting for SIGIO signal
   read: line1
   $ echo 'line2' >/tmp/p.in; read line < /tmp/p.out; echo "$line"
   read nothing - waiting for SIGIO signal
   read: line2
But if the program is compiled with -DNO_SETOWN flag, preventing it from
issuing the
   fcntl(0, F_SETOWN, getpid());
call:
   $ gcc -std=gnu99 -DNO_SETOWN -o pio pio.c
   $ ./pio </tmp/p.in >/tmp/p.out &
   [7] 10135
   $ echo 'line1' >/tmp/p.in; read line < /tmp/p.out; echo "$line"
   read nothing - waiting for SIGIO signal
   read: line1
   $ echo 'line2' >/tmp/p.in; read line < /tmp/p.out; echo "$line"
   ^C
Now it just hangs because it never gets a SIGIO signal.
It is very difficult to write a program to use named fifos for input and output
unless one appreciates that one must call fcntl(fd,F_SETOWN,getpid()) -
please document this fact.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
