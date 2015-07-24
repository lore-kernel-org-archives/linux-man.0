From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: nptl(7) man page
Date: Fri, 24 Jul 2015 09:56:21 +0200
Message-ID: <55B1EFA5.9000304@gmail.com>
References: <550ED3F4.1080403@gmail.com> <20150322195632.GM16260@port70.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150322195632.GM16260-4P1ElwuDYu6sTnJN9+BGXg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Szabolcs Nagy <nsz-4P1ElwuDYu6sTnJN9+BGXg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/22/2015 08:56 PM, Szabolcs Nagy wrote:
> * Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [2015-03-22 15:38:44 +0100]:
>> .\"
>> .TH NPTL 7 2015-03-21 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> nptl \- Native POSIX Threads Library
>> .SH DESCRIPTION
>> NPTL (Native POSIX Threads Library)
>> is the GNU C library POSIX threads implementation that is used on modern
>> Linux systems.
>> .\"
>> .SS NPTL and signals
>> NPTL makes internal use of the first two real-time signals
>> (signal numbers 32 and 33).
>> One of these signals is used to support thread cancellation and POSIX timers;
>> the other is used as part of a mechanism that ensures all threads in
>> a process always have the same UIDs and GIDs, as required by POSIX.
>> These signals cannot be used in applications.
>>
>> To prevent accidental use of these signals in applications,
>> which might interfere with the operation of the NPTL implementation,
>> various glibc library functions and system call wrapper functions
>> attempt to hide these signals from applications,
>> as follows:
>> .IP * 3
>> .B SIGRTMIN
>> is defined with the value 34 (rather than 32).
>> .IP *
>> The
>> .BR sigwaitinfo (2),
>> .BR sigtimedwait (2),
>> and
>> .BR sigwait (3)
>> interfaces silently ignore requests to wait for these two signals
>> if they are specified in the signal set argument of these calls.
>> .IP *
>> The
>> .BR sigprocmask (2)
>> and
>> .BR pthread_sigmask (3)
>> interfaces silently ignore attempts to block these two signals.
>> .IP *
>> The
>> .BR sigaction (2),
>> .BR pthread_kill (3),
>> and
>> .BR pthread_sigqueue (3)
>> interfaces fail with the error
>> .B EINVAL
>> (indicating an invalid signal number) if these signals are specified.
>> .IP *
>> .BR sigfillset (3)
>> does not include these two signals when it creates a full signal set.
>> .\"
> 
> are these abi details expected to be stable?
> (i'm not against documenting the existing
> implementation just curious if this is supposed
> to hold for all new archs)

I'm not sure, sorry.

> in theory for an application it is enough to know
> that it can only use the signals it can name and
> there might be implementation internal signals
> that cannot be masked (which might need to be taken
> into account when calculating a thread stack size).
> 
>> .SS NPTL and process credential changes
>> At the Linux kernel level,
>> credentials (user and group IDs) are a per-thread attribute.
>> However, POSIX requires that all of the POSIX threads in a process
>> have the same credentials.
>> To accommodate this requirement,
>> the NPTL implementation wraps all of the system calls that
>> change process credentials with functions that,
>> in addition to invoking the underlying system call,
>> arrange for all other threads in the process to also change their credentials.
>>
>> The implementation of each of these system calls involves the use of 
>> a real-time signal that is sent (using
>> .BR tgkill (2))
>> to each of the other threads that must change change its credentials.
>> Before sending these signals, the thread that is changing credentials
>> saves the new credential(s) and records the system call being employed
>> in a global buffer.
>> A signal handler in the receiving thread(s) fetches this information and
>> then uses the same system call to change its credentials.
>>
> 
> i think the situation described in
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=14749
> 
> might be worth documenting
> 
> vfork is not serialized wrt setxid functions

Do you have any proposed text for this? (In the meantime, I added a FIXME.)

> (but it would be better if the kernel got fixed
> to have a new set of posix setxid syscalls that
> change credentials atomically for the process)

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
