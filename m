From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95331] New: fcntl.2 + sigaction.2 + signal.7 need further
 information about use of a SA_SIGINFO signal handler that uses si->si_fd
Date: Mon, 23 Mar 2015 19:22:34 +0000
Message-ID: <bug-95331-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D95331

            Bug ID: 95331
           Summary: fcntl.2 + sigaction.2 + signal.7 need further
                    information about use of a SA_SIGINFO signal handle=
r
                    that uses si->si_fd
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

Created attachment 171831
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D171831&action=3De=
dit
=46ile that demonstrates the problem

Despite extensive reading of latest versions of the $subject manual pag=
es=20
over the last few days while trying to debug a program that needs to=20
read and write pipe file descriptors, I am still none the wiser about
the precise circumstances that the $signum signal, used in a :
  fcntl(fd, F_SETSIG, $signum ) =20
call, will be sent for an OUTPUT file descriptor.=20
The test program, which I will attach, which is run as :
  $ mkfifo -m 0600 /tmp/f.in /tmp/f.out
  $ ./t_sigio_rdwr </tmp/f.in >/tmp/f.out &
  $ echo 'hello' >/tmp/f.in
  ../
  $ read </tmp/f.out
  ^C
only gets a SIGIO+SIGRTMIN signal for the output file descriptor (FD 1)=
 when a
reader DISCONNECTS from its output pipe, by pressing <CTRL+C> - which i=
s pretty
useless, IMHO - the program is expecting to receive a SIGIO+RTMIN signa=
l when a
reader CONNECTs (opens) its output fifo. so that it can send the respon=
se.
All the documentation states is in the sigaction manual page:

   * SIGIO/SIGPOLL (the two names are synonyms on Linux) fills in si_ba=
nd=20
         and si_fd.  The si_band event is  a bit  mask  containing  the=
  same
         values as are filled in the revents field by poll(2).  The si_=
fd field
         indicates the file descriptor for which the I/O event occurred=
=2E
 ...
  si_code:
 ..
 SI_SIGIO
                  Queued  SIGIO  (only  in  kernels up to Linux 2.2; fr=
om Linux=20
                                 2.4 onward SIGIO/SIGPOLL fills in
                  si_code as described below).
  The following values can be placed in si_code for a SIGIO/SIGPOLL sig=
nal:

           POLL_IN
                  Data input available.

           POLL_OUT
                  Output buffers available.

And in fcntl.2 :
        F_SETSIG (int)
              Set the signal sent when input or output becomes possible=
 to the
value given in
              arg.  A value of zero means to send the default SIGIO sig=
nal.=20
Any other  value
              (including  SIGIO)  is  the signal to send instead, and i=
n this
case additional
              info is available to the signal handler if installed with
SA_SIGINFO.

              By using F_SETSIG with a nonzero value, and setting SA_SI=
GINFO
for  the  signal
              handler (see sigaction(2)), extra information about I/O e=
vents is
passed to the
              handler in a siginfo_t structure.  If the si_code field i=
ndicates
the source is
              SI_SIGIO,  the si_fd field gives the file descriptor asso=
ciated
with the event.
              Otherwise, there is no indication which file descriptors =
are
pending,  and  you
              should  use  the  usual mechanisms (select(2), poll(2), r=
ead(2)
with O_NONBLOCK
              set etc.) to determine which file descriptors are availab=
le for
I/O.

              By selecting a real time signal (value >=3D SIGRTMIN), mu=
ltiple I/O
events may be
              queued  using the same signal numbers.  (Queuing is depen=
dent on
available mem=E2=80=90
              ory).  Extra information is available if SA_SIGINFO is se=
t for
the signal  han=E2=80=90
              dler, as above.



Nowhere does it say WHEN or on what conditions the SIGIO will be genera=
ted,
or is it discussed what happens when SIGIO for multiple FDs are queued.=
=20

The following strace output of the program demonstrates the problem:

[pid 11215] rt_sigprocmask(SIG_BLOCK, [PIPE RT_31], [], 8) =3D 0
[pid 11215] fcntl(1, F_GETFL)           =3D 0x8001 (flags O_WRONLY|O_LA=
RGEFILE)
[pid 11215] fcntl(1, F_SETFL, O_WRONLY|O_ASYNC|O_LARGEFILE) =3D 0
[pid 11215] fcntl(1, 0xf /* F_??? */, 0x7fff1c940090) =3D 0
[pid 11215] fcntl(1, F_SETSIG, 0x3f)    =3D 0
[pid 11215] fcntl(0, F_GETFL)           =3D 0x8000 (flags O_RDONLY|O_LA=
RGEFILE)
[pid 11215] fcntl(0, F_SETFL, O_WRONLY|O_ASYNC|O_LARGEFILE) =3D 0
[pid 11215] fcntl(0, 0xf /* F_??? */, 0x7fff1c940090) =3D 0
[pid 11215] fcntl(0, F_SETSIG, 0x3f)    =3D 0
[pid 11215] rt_sigaction(SIGRT_31, {0x400b4d, [],
SA_RESTORER|SA_STACK|SA_NODEFER|SA_SIGINFO, 0x7fc6c47f0340}, {SIG_DFL, =
[], 0},
8) =3D 0
[pid 11215] rt_sigaction(SIGPIPE, {0x400e49, [],
SA_RESTORER|SA_STACK|SA_NODEFER|SA_SIGINFO, 0x7fc6c47f0340}, {SIG_DFL, =
[], 0},
8) =3D 0
[pid 11215] fcntl(1, F_SETFL, O_WRONLY|O_LARGEFILE) =3D 0
[pid 11215] write(2, "reading\n", 8reading
)    =3D 8
[pid 11215] read(0, "hello\n", 8192)    =3D 6
[pid 11215] write(2, "read 6 bytes\n", 13read 6 bytes
) =3D 13
[pid 11215] write(2, "writing: 6 bytes\n", 17writing: 6 bytes
) =3D 17
[pid 11215] write(1, "hello\n", 6)      =3D 6
[pid 11215] write(2, "wrote : 6\n", 10wrote : 6
) =3D 10
[pid 11215] rt_sigprocmask(SIG_BLOCK, [PIPE RT_31], [PIPE RT_31], 8) =3D=
 0
[pid 11215] fcntl(0, F_GETFL)           =3D 0xa000 (flags
O_RDONLY|O_ASYNC|O_LARGEFILE)
[pid 11215] fcntl(0, F_SETFL, O_RDONLY|O_ASYNC|O_LARGEFILE) =3D 0
[pid 11215] fcntl(0, 0xf /* F_??? */, 0x7fff1c940090) =3D 0
[pid 11215] fcntl(0, F_SETSIG, 0x3f)    =3D 0
[pid 11215] fcntl(0, F_GETFL)           =3D 0xa000 (flags
O_RDONLY|O_ASYNC|O_LARGEFILE)
[pid 11215] fcntl(0, F_SETFL, O_RDONLY|O_ASYNC|O_LARGEFILE) =3D 0
[pid 11215] fcntl(0, 0xf /* F_??? */, 0x7fff1c940090) =3D 0
[pid 11215] fcntl(0, F_SETSIG, 0x3f)    =3D 0
[pid 11215] rt_sigaction(SIGRT_31, {0x400b4d, [],
SA_RESTORER|SA_STACK|SA_NODEFER|SA_SIGINFO, 0x7fc6c47f0340}, {0x400b4d,=
 [],
SA_RESTORER|SA_STACK|SA_NODEFER|SA_SIGINFO, 0x7fc6c47f0340}, 8) =3D 0
[pid 11215] rt_sigaction(SIGPIPE, {0x400e49, [],
SA_RESTORER|SA_STACK|SA_NODEFER|SA_SIGINFO, 0x7fc6c47f0340}, {0x400e49,=
 [],
SA_RESTORER|SA_STACK|SA_NODEFER|SA_SIGINFO, 0x7fc6c47f0340}, 8) =3D 0
[pid 11215] fcntl(1, F_SETFL, O_RDONLY|O_LARGEFILE) =3D 0
[pid 11215] write(2, "reading\n", 8reading
)    =3D 8
[pid 11215] read(0, "", 8192)           =3D 0
[pid 11215] write(2, "read returned 0 - waiting for SI"..., 36read retu=
rned 0 -
waiting for SIGIO
) =3D 36
[pid 11215] fcntl(0, F_SETFL, O_RDONLY|O_ASYNC|O_LARGEFILE) =3D 0
[pid 11215] rt_sigprocmask(SIG_UNBLOCK, [PIPE RT_31], [PIPE RT_31], 8) =
=3D 0
[pid 11215] pause()                     =3D ? ERESTARTNOHAND (To be res=
tarted if
no handler)
[pid 11215] --- SIGRT_31 {si_signo=3DSIGRT_31, si_code=3D0x1, si_pid=3D=
65, si_uid=3D0}
---
[pid 11215] --- SIGRT_31 {si_signo=3DSIGRT_31, si_code=3D0x1, si_pid=3D=
65, si_uid=3D0}
---
[pid 11215] write(2, "IO: SI_FD: 0\n", 13IO: SI_FD: 0
) =3D 13
[pid 11215] rt_sigreturn()              =3D 0
[pid 11215] write(2, "IO: SI_FD: 0\n", 13IO: SI_FD: 0
) =3D 13
[pid 11215] rt_sigreturn()              =3D -1 EINTR (Interrupted syste=
m call)
[pid 11215] rt_sigprocmask(SIG_BLOCK, [PIPE RT_31], [], 8) =3D 0
[pid 11215] write(2, "after SIGIO - retrying read \n", 29after SIGIO - =
retrying
read=20
) =3D 29
[pid 11215] fcntl(0, F_SETFL, O_RDONLY|O_LARGEFILE) =3D 0
[pid 11215] write(2, "reading\n", 8reading
)    =3D 8
[pid 11215] read(0, "hello\n", 8192)    =3D 6
[pid 11215] write(2, "read 6 bytes\n", 13read 6 bytes
) =3D 13
[pid 11215] write(2, "writing: 6 bytes\n", 17writing: 6 bytes
) =3D 17
[pid 11215] write(1, "hello\n", 6)      =3D -1 EPIPE (Broken pipe)
[pid 11215] rt_sigprocmask(SIG_UNBLOCK, [PIPE RT_31], [PIPE RT_31], 8) =
=3D 0
[pid 11215] --- SIGPIPE {si_signo=3DSIGPIPE, si_code=3DSI_USER, si_pid=3D=
11215,
si_uid=3D1001} ---
[pid 11215] write(2, "PIPE: SI_FD: 0\n", 15PIPE: SI_FD: 0
) =3D 15
[pid 11215] rt_sigreturn()              =3D 0
[pid 11215] write(2, "PIPE - waiting for connection\n", 30PIPE - waitin=
g for
connection
) =3D 30
[pid 11215] fcntl(1, F_SETFL, O_RDONLY|O_ASYNC|O_LARGEFILE) =3D 0
[pid 11215] pause(

Now I have to press <CTRL+C>, and only AFTER the reader has disonnected=
 does
the
t_sigio_rdwr process get a SIGIO:


)                     =3D ? ERESTARTNOHAND (To be restarted if no handl=
er)
[pid 11215] --- SIGRT_31 {si_signo=3DSIGRT_31, si_code=3D0x2, si_pid=3D=
772, si_uid=3D0,
si_value=3D{int=3D1, ptr=3D0x1}} ---
[pid 11215] write(2, "IO: SI_FD: 1\n", 13IO: SI_FD: 1
) =3D 13
[pid 11215] rt_sigreturn()              =3D -1 EINTR (Interrupted syste=
m call)
[pid 11215] fcntl(1, F_SETFL, O_RDONLY|O_LARGEFILE) =3D 0
[pid 11215] rt_sigprocmask(SIG_BLOCK, [PIPE RT_31], [], 8) =3D 0
[pid 11215] write(2, "AFTER SIGIO : 1\n", 16AFTER SIGIO : 1
) =3D 16
[pid 11215] write(2, "writing: 6 bytes\n", 17writing: 6 bytes
) =3D 17
[pid 11215] write(1, "hello\n", 6)      =3D -1 EPIPE (Broken pipe)
[pid 11215] rt_sigprocmask(SIG_UNBLOCK, [PIPE RT_31], [PIPE RT_31], 8) =
=3D 0
[pid 11215] --- SIGPIPE {si_signo=3DSIGPIPE, si_code=3DSI_USER, si_pid=3D=
11215,
si_uid=3D1001} ---
[pid 11215] write(2, "PIPE: SI_FD: 1\n", 15PIPE: SI_FD: 1
) =3D 15
[pid 11215] rt_sigreturn()              =3D 0
[pid 11215] write(2, "PIPE - waiting for connection\n", 30PIPE - waitin=
g for
connection
) =3D 30
[pid 11215] fcntl(1, F_SETFL, O_RDONLY|O_ASYNC|O_LARGEFILE) =3D 0
[pid 11215] pause(

But since the reader had to disconnect, it gets SIGPIPE trying to write=
,
so never leaves the state of trying to write back the second input line=
=2E

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
