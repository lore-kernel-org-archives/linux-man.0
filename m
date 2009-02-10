From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: For review: timer_getoverrun.2
Date: Tue, 10 Feb 2009 14:54:38 +1300
Message-ID: <4990DE5E.2070506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

Again, looking for reviewers for this page for timer_getoverrun(2).
Formatted output, and groff source below.

Cheers,

Michael



NAME
       timer_getoverrun  -  get  overrun count for a POSIX per-process
       timer

SYNOPSIS
       #include <time.h>

       int timer_getoverrun(timer_t timerid);

       Link with -lrt.

   Feature   Test   Macro   Requirements   for   glibc    (see    fea-
   ture_test_macros(7)):

       timer_getoverrun(): _POSIX_C_SOURCE >= 199309

DESCRIPTION
       timer_getoverrun()  returns  the  "overrun count" for the timer
       referred to by timerid.  An application  can  use  the  overrun
       count  to  accurately calculate the number of timer expirations
       that would have occurred over a  given  time  interval.   Timer
       overruns can occur both when receiving expiration notifications
       via signals (SIGEV_SIGNAL), and via threads (SIGEV_THREAD).

       When expiration notifications are delivered via a signal, over-
       runs  can  occur  as  follows.   Regardless of whether or not a
       real-time signal is used for timer  notifications,  the  system
       queues  at  most  one  signal per timer.  (This is the behavior
       specified by POSIX.1-2001.  The alternative, queuing one signal
       for  each  timer expiration, could easily result in overflowing
       the allowed limits for queued signals on the system.)   Because
       of  system scheduling delays, or because the signal may be tem-
       porarily blocked, there can be a delay between  the  time  when
       the  notification  signal  is generated and the time when it is
       delivered (e.g., caught by a signal handler) or accepted (e.g.,
       using sigwaitinfo(2)).  In this interval, further timer expira-
       tions may occur.  The timer overrun  count  is  the  number  of
       additional  timer  expirations  that  occurred between the time
       when the signal was generated and  when  it  was  delivered  or
       accepted.

       Timer overruns can also occur when expiration notifications are
       delivered via invocation of a thread, since  there  may  be  an
       arbitrary  delay  between  an  expiration  of the timer and the
       invocation of the notification thread, and in that delay inter-
       val, additional timer expirations may occur

RETURN VALUE
       On success, timer_getoverrun() returns the overrun count of the
       specified timer; this count  may  be  0  if  no  overruns  have
       occurred.   On  failure,  -1  is  returned, and errno is set to
       indicate the error.

ERRORS
       EINVAL timerid is not a valid timer ID.

VERSIONS
       This system call is available since Linux 2.6.

CONFORMING TO
       POSIX.1-2001

NOTES
       When timer notifications are delivered via signals  (SIGEV_SIG-
       NAL),  on Linux it is also possible to obtain the overrun count
       via the si_overrun field of the siginfo_t structure (see sigac-
       tion(2)).   This allows an application to avoid the overhead of
       making a system call to obtain the overrun count, but is a non-
       portable extension POSIX.1-2001.

       POSIX.1-2001  only  discusses  timer overruns in the context of
       timer notifications using signals.

BUGS
       POSIX.1-2001 specifies that if the timer overrun count is equal
       to  or  greater  than an implementation-defined maximum, DELAY-
       TIMER_MAX,  then  timer_getoverrun()   should   return   DELAY-
       TIMER_MAX.   However,  Linux  does  not implement this feature:
       instead, if the timer overrun value exceeds the maximum  repre-
       sentable  integer,  the counter cycles, starting once more from
       low values.

SEE ALSO
       clock_gettime(2),  sigaction(2),  signalfd(2),  sigwaitinfo(2),
       timer_create(2),  timer_delete(2), timer_settime(2), signal(7),
       time(7)



.\" Copyright (c) 2009 Linux Foundation, written by Michael Kerrisk
.\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.TH TIMER_GETOVERRUN 2 2009-02-16 Linux "Linux Programmer's Manual"
.SH NAME
timer_getoverrun \- get overrun count for a POSIX per-process timer
.SH SYNOPSIS
.nf
.B  #include <time.h>

.BI "int timer_getoverrun(timer_t " timerid );
.fi

Link with
.IR \-lrt .
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.BR timer_getoverrun ():
_POSIX_C_SOURCE >= 199309
.SH DESCRIPTION
.BR timer_getoverrun ()
returns the "overrun count" for the timer referred to by
.IR timerid .
An application can use the overrun count to accurately calculate the number
of timer expirations that would have occurred over a given time interval.
Timer overruns can occur both when receiving expiration notifications
via signals
.RB ( SIGEV_SIGNAL ),
and via threads
.RB ( SIGEV_THREAD ).

When expiration notifications are delivered via a signal,
overruns can occur as follows.
Regardless of whether or not a real-time signal is used for
timer notifications,
the system queues at most one signal per timer.
(This is the behavior specified by POSIX.1-2001.
The alternative, queuing one signal for each timer expiration,
could easily result in overflowing the allowed limits for
queued signals on the system.)
Because of system scheduling delays,
or because the signal may be temporarily blocked,
there can be a delay between the time when the notification
signal is generated and the time when it
is delivered (e.g., caught by a signal handler) or accepted (e.g., using
.BR sigwaitinfo (2)).
In this interval, further timer expirations may occur.
The timer overrun count is the number of additional
timer expirations that occurred between the time when the signal
was generated and when it was delivered or accepted.

Timer overruns can also occur when expiration notifications
are delivered via invocation of a thread,
since there may be an arbitrary delay between an expiration of the timer
and the invocation of the notification thread,
and in that delay interval, additional timer expirations may occur
.SH RETURN VALUE
On success,
.BR timer_getoverrun ()
returns the overrun count of the specified timer;
this count may be 0 if no overruns have occurred.
On failure, \-1 is returned, and
.I errno
is set to indicate the error.
.SH ERRORS
.TP
.B EINVAL
.I timerid
is not a valid timer ID.
.SH VERSIONS
This system call is available since Linux 2.6.
.SH CONFORMING TO
POSIX.1-2001
.SH NOTES
When timer notifications are delivered via signals
.RB ( SIGEV_SIGNAL ),
on Linux it is also possible to obtain the overrun count via the
.I si_overrun
field of the
.I siginfo_t
structure (see
.BR sigaction (2)).
This allows an application to avoid the overhead of making
a system call to obtain the overrun count,
but is a non-portable extension POSIX.1-2001.

POSIX.1-2001 only discusses timer overruns in the context of
timer notifications using signals.
.\" FIXME . Austin bug filed, 11 Feb 09
.SH BUGS
POSIX.1-2001 specifies that if the timer overrun count
is equal to or greater than an implementation-defined maximum,
.BR DELAYTIMER_MAX ,
then
.BR timer_getoverrun ()
should return
.BR DELAYTIMER_MAX .
However, Linux does not implement this feature: instead,
if the timer overrun value exceeds the maximum representable integer,
the counter cycles, starting once more from low values.
.\" Bug filed: http://bugzilla.kernel.org/show_bug.cgi?id=12665
.\" http://thread.gmane.org/gmane.linux.kernel/113276/
.SH SEE ALSO
.BR clock_gettime (2),
.BR sigaction (2),
.BR signalfd (2),
.BR sigwaitinfo (2),
.BR timer_create (2),
.BR timer_delete (2),
.BR timer_settime (2),
.BR signal (7),
.BR time (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
