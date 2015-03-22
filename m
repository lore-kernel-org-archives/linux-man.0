From: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: nptl(7) man page
Date: Sun, 22 Mar 2015 16:51:14 +0100
Message-ID: <CAKPyHN2VTcP3eOPA-er+iOs0VCRd4ALzuqPY4HJOVOmDH7Arug@mail.gmail.com>
References: <550ED3F4.1080403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550ED3F4.1080403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Mar 22, 2015 at 3:38 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello all,
>
> I wrote a short man page documented some of the details of
> NPTL that might affect application developers. Review comments
> would be most welcome.
>
> Thanks,
>
> Michael
>
> ===
> .\" Copyright (c) 2015 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\"
> .\" %%%LICENSE_START(VERBATIM)
> .\" Permission is granted to make and distribute verbatim copies of this
> .\" manual provided the copyright notice and this permission notice are
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of this
> .\" manual under the conditions for verbatim copying, provided that the
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, this
> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
> .\" responsibility for errors or omissions, or for damages resulting from
> .\" the use of the information contained herein.  The author(s) may not
> .\" have taken the same level of care in the production of this manual,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied by
> .\" the source, must acknowledge the copyright and authors of this work.
> .\" %%%LICENSE_END
> .\"
> .\"
> .TH NPTL 7 2015-03-21 "Linux" "Linux Programmer's Manual"
> .SH NAME
> nptl \- Native POSIX Threads Library
> .SH DESCRIPTION
> NPTL (Native POSIX Threads Library)
> is the GNU C library POSIX threads implementation that is used on modern
> Linux systems.
> .\"
> .SS NPTL and signals
> NPTL makes internal use of the first two real-time signals
> (signal numbers 32 and 33).
> One of these signals is used to support thread cancellation and POSIX timers;
> the other is used as part of a mechanism that ensures all threads in
> a process always have the same UIDs and GIDs, as required by POSIX.
> These signals cannot be used in applications.
>
> To prevent accidental use of these signals in applications,
> which might interfere with the operation of the NPTL implementation,
> various glibc library functions and system call wrapper functions
> attempt to hide these signals from applications,
> as follows:
> .IP * 3
> .B SIGRTMIN
> is defined with the value 34 (rather than 32).
> .IP *
> The
> .BR sigwaitinfo (2),
> .BR sigtimedwait (2),
> and
> .BR sigwait (3)
> interfaces silently ignore requests to wait for these two signals
> if they are specified in the signal set argument of these calls.
> .IP *
> The
> .BR sigprocmask (2)
> and
> .BR pthread_sigmask (3)
> interfaces silently ignore attempts to block these two signals.
> .IP *
> The
> .BR sigaction (2),
> .BR pthread_kill (3),
> and
> .BR pthread_sigqueue (3)
> interfaces fail with the error
> .B EINVAL
> (indicating an invalid signal number) if these signals are specified.
> .IP *
> .BR sigfillset (3)
> does not include these two signals when it creates a full signal set.
> .\"
> .SS NPTL and process credential changes
> At the Linux kernel level,
> credentials (user and group IDs) are a per-thread attribute.
> However, POSIX requires that all of the POSIX threads in a process
> have the same credentials.
> To accommodate this requirement,
> the NPTL implementation wraps all of the system calls that
> change process credentials with functions that,
> in addition to invoking the underlying system call,
> arrange for all other threads in the process to also change their credentials.
>
> The implementation of each of these system calls involves the use of
> a real-time signal that is sent (using
> .BR tgkill (2))
> to each of the other threads that must change change its credentials.

s/change change/change/

Bert

> Before sending these signals, the thread that is changing credentials
> saves the new credential(s) and records the system call being employed
> in a global buffer.
> A signal handler in the receiving thread(s) fetches this information and
> then uses the same system call to change its credentials.
>
> Wrapper functions employing this technique are provided for
> .BR setgid (2),
> .BR setuid (2),
> .BR setegid (2),
> .BR seteuid (2),
> .BR setregid (2),
> .BR setreuid (2),
> .BR setresgid (2),
> .BR setresuid (2),
> and
> .BR setgroups (2).
> .SH CONFORMING TO
> For details of the conformance of NPTL to the POSIX standard, see
> .BR pthreads (7).
> .SH SEE ALSO
> .BR credentials (7),
> .BR pthreads (7),
> .BR signal (7),
> .BR standards (7)
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
