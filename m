From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: For review: timer_create.2
Date: Tue, 10 Feb 2009 14:53:13 +1300
Message-ID: <4990DE09.7020801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

I've recently written pages that document the POSIX timers API 
(timer_create(), timer_settime(), timer_gettime(),
timer_getoverrun(), timer_delete()), and these pages could do
with review before I release them.  Any takers?  Formatted output,
and groff source versions below (and the same for the pages in the
following messages).

Cheers,

Michael


NAME
       timer_create - create a POSIX per-process timer

SYNOPSIS
       #include <signal.h>
       #include <time.h>

       int timer_create(clockid_t clockid, struct sigevent *evp,
                        timer_t *timerid);

       Link with -lrt.

   Feature    Test    Macro   Requirements   for   glibc   (see   fea-
   ture_test_macros(7)):

       timer_create(): _POSIX_C_SOURCE >= 199309

DESCRIPTION
       timer_create() creates a new per-process interval  timer.   The
       ID  of  the  new  timer is returned in the buffer pointed to by
       timerid, which must be a non-NULL pointer.  This ID  is  unique
       within  the process, until the timer is deleted.  The new timer
       is initially disarmed.

       The clockid argument specifies the clock  that  the  new  timer
       uses  to  measure time.  It can be specified as one of the fol-
       lowing values:

       CLOCK_REALTIME
              A settable system-wide real-time clock.

       CLOCK_MONOTONIC
              A non-settable monotonically increasing clock that  mea-
              sures  time from some unspecified point in the past that
              does not change after system startup.

       CLOCK_PROCESS_CPUTIME_ID (since Linux 2.6.12)
              A clock that measures (user and system)  CPU  time  con-
              sumed by (all of the threads in) the calling process.

       CLOCK_THREAD_CPUTIME_ID (since Linux 2.6.12)
              A  clock  that  measures (user and system) CPU time con-
              sumed by the calling thread.

       As well as the above values, clockid can be  specified  as  the
       clockid   returned  by  a  call  to  clock_getcpuclockid(3)  or
       pthread_getcpuclockid(3).

       The evp argument points to a sigevent structure that  specifies
       how the caller should be notified when the timer expires.  This
       structure is defined something like the following:

           union sigval {
               int   sival_int;
               void *sival_ptr;
           };

           struct sigevent {
               int          sigev_notify;    /* Notification method */
               int          sigev_signo;     /* Timer expiration signal */
               union sigval sigev_value;     /* Value accompanying signal or
                                                passed to thread function */
               void       (*sigev_notify_function) (union sigval);
                              /* Function used for thread
                                 notifications (SIGEV_THREAD) */
               void        *sigev_notify_attributes;
                              /* Attributes for notification thread
                                 (SIGEV_THREAD) */
               pid_t        sigev_notify_thread_id;
                              /* ID of thread to signal (SIGEV_THREAD_ID) */
           };

       Some of these fields may be defined as part of a union: a  pro-
       gram  should  only  employ  those  fields relevant to the value
       specified in sigev_notify.  This field can have  the  following
       values:

       SIGEV_NONE
              Don't  asynchronously  notify  when  the  timer expires.
              Progress of the timer can be monitored using  timer_get-
              time(2).

       SIGEV_SIGNAL
              Upon  timer  expiration, generate the signal sigev_signo
              for the process.  If sigev_signo is a real-time  signal,
              then  it  will  be  accompanied by the data specified in
              sigev_value  (like  the  signal-accompanying  data   for
              sigqueue(2)).   At any point in time, at most one signal
              is  queued  to  the  process  for  a  given  timer;  see
              timer_getoverrun(2) for more details.

       SIGEV_THREAD
              Upon  timer  expiration, invoke sigev_notify_function as
              if it were the start function of a new  thread.   (Among
              the  implementation  possibilities  here  are  that each
              timer notification could result in the creation of a new
              thread,  or  that  a single thread is created to receive
              all  notifications.)   The  function  is  invoked   with
              sigev_value     as     its     sole     argument.     If
              sigev_notify_attributes is not NULL, it should point  to
              a  pthread_attr_t  structure that defines attributes for
              the new thread (see pthread_attr_init(3).

       SIGEV_THREAD_ID (Linux-specific)
              As for SIGEV_SIGNAL, but the signal is targeted  at  the
              thread  whose  ID  is  given  in sigev_notify_thread_id,
              which must be a  thread  in  the  same  process  as  the
              caller.   The  sigev_notify_thread_id  field specifies a
              kernel  thread  ID,  that  is,  the  value  returned  by
              clone(2)  or  gettid(2).  This flag is only intended for
              use by threading libraries.

       Specifying evp as NULL is equivalent to specifying a pointer to
       a  sigevent  structure  in  which sigev_notify is SIGEV_SIGNAL,
       sigev_signo is SIGALRM, and sigev_value.sival_int is the  timer
       ID.

RETURN VALUE
       On  success,  timer_create()  returns  0, and the ID of the new
       timer is placed in *timerid.  On failure, -1 is  returned,  and
       errno is set to indicate the error.

ERRORS
       EAGAIN Temporary error during kernel allocation of timer struc-
              tures.

       EINVAL Clock       ID,        sigev_notify,        sigev_signo,
              sigev_notify_thread_id is invalid.

       ENOMEM Could not allocate memory.

VERSIONS
       This system call is available since Linux 2.6.

CONFORMING TO
       POSIX.1-2001

NOTES
       A  program may create multiple interval timers using timer_cre-
       ate().

       Timers are not inherited by the child of  a  fork(2),  and  are
       disarmed and deleted during an execve(2).

       The  kernel  preallocates  a "queued real-time signal" for each
       timer created using timer_create().  Consequently,  the  number
       of  timers  is  limited by the RLIMIT_SIGPENDING resource limit
       (see setrlimit(2)).

       The timers created by  timer_create()  are  commonly  known  as
       "POSIX  (interval)  timers".   The POSIX timers API consists of
       the following interfaces:

       *  timer_create(): Create a timer.

       *  timer_settime(2): Arm (start) or disarm (stop) a timer.

       *  timer_gettime(2): Fetch the time remaining  until  the  next
          expiration  of  a  timer, along with the interval setting of
          the timer.

       *  timer_getoverrun(2): Return the overrun count for  the  last
          timer expiration.

       *  timer_delete(2): Disarm and delete a timer.

       Part  of the implementation of the POSIX timers API is provided
       by glibc.  In particular:

       *  The functionality for  SIGEV_THREAD  is  implemented  within
          glibc, rather than the kernel.

       *  The  timer  IDs  presented  at  user level are maintained by
          glibc, which maps these IDs to the timer IDs employed by the
          kernel.

       The  POSIX  timers  system  calls  first appeared in Linux 2.6.
       Prior to this, glibc provided an incomplete userspace implemen-
       tation  (CLOCK_REALTIME  timers  only) using POSIX threads, and
       current glibc falls back to this implementation on systems run-
       ning pre-2.6 Linux kernels.

EXAMPLE
       The  program  below takes two arguments: a sleep period in sec-
       onds, and a timer frequency in nanoseconds.  The program estab-
       lishes  a  handler for the signal it uses for the timer, blocks
       that signal, creates and arms a timer  that  expires  with  the
       given  frequency,  sleeps  for the specified number of seconds,
       and then unblocks the timer signal.  Assuming  that  the  timer
       expired  at least once while the program slept, the signal han-
       dler will be invoked, and the handler displays some information
       about the timer notification.  The program terminates after one
       invocation of the signal handler.

       In the following example run, the program sleeps for 1  second,
       after creating a timer that has a frequency of 100 nanoseconds.
       By the time the signal is unblocked and delivered,  there  have
       been around ten million overruns.

           $ ./a.out 1 10
           Establishing handler for signal 34
           Blocking signal 34
           timer ID is 0x804c008
           Sleeping for 1 seconds
           Unblocking signal 34
           Caught signal 34
               sival_ptr = 0xbfb174f4;     *sival_ptr = 0x804c008
               overrun count = 10004886

   Program Source

       #include <stdlib.h>
       #include <unistd.h>
       #include <stdio.h>
       #include <signal.h>
       #include <time.h>

       #define CLOCKID CLOCK_REALTIME
       #define SIG (SIGRTMIN)

       #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                               } while (0)

       static void
       print_siginfo(siginfo_t *si)
       {
           timer_t *tidp;
           int or;

           tidp = si->si_value.sival_ptr;

           printf("    sival_ptr = %p; ", si->si_value.sival_ptr);
           printf("    *sival_ptr = 0x%lx\n", (long) *tidp);

           or = timer_getoverrun(*tidp);
           if (or == -1)
               errExit("timer_getoverrun");
           else
               printf("    overrun count = %d\n", or);
       }

       static void
       handler(int sig, siginfo_t *si, void *uc)
       {
           /* Note: calling printf() from a signal handler is not
              strictly correct, since printf() is not async-signal-safe;
              see signal(7) */

           printf("Caught signal %d\n", sig);
           print_siginfo(si);
           signal(SIG, SIG_IGN);
       }

       int
       main(int argc, char *argv[])
       {
           timer_t timerid;
           struct sigevent sev;
           struct itimerspec its;
           long long freq_nanosecs;
           sigset_t mask;
           struct sigaction sa;

           if (argc != 3) {
               fprintf(stderr, "Usage: %s <sleep-secs> <freq-nanosecs>\n",
                       argv[0]);
               exit(EXIT_FAILURE);
           }

           /* Establish handler for timer signal */

           printf("Establishing handler for signal %d\n", SIG);
           sa.sa_flags = SA_SIGINFO;
           sa.sa_sigaction = handler;
           sigemptyset(&sa.sa_mask);
           if (sigaction(SIG, &sa, NULL) == -1)
               errExit("sigaction");

           /* Block timer signal temporarily */

           printf("Blocking signal %d\n", SIG);
           sigemptyset(&mask);
           sigaddset(&mask, SIG);
           if (sigprocmask(SIG_SETMASK, &mask, NULL) == -1)
               errExit("sigprocmask");

           /* Create the timer */

           sev.sigev_notify = SIGEV_SIGNAL;
           sev.sigev_signo = SIG;
           sev.sigev_value.sival_ptr = &timerid;
           if (timer_create(CLOCKID, &sev, &timerid) == -1)
               errExit("timer_create");

           printf("timer ID is 0x%lx\n", (long) timerid);

           /* Start the timer */

           freq_nanosecs = atoll(argv[2]);
           its.it_value.tv_sec = freq_nanosecs / 1000000000;
           its.it_value.tv_nsec = freq_nanosecs % 1000000000;
           its.it_interval.tv_sec = its.it_value.tv_sec;
           its.it_interval.tv_nsec = its.it_value.tv_nsec;

           if (timer_settime(timerid, 0, &its, NULL) == -1)
                errExit("timer_settime");

           /* Sleep for a while; meanwhile, the timer may expire
              multiple times */

           printf("Sleeping for %d seconds\n", atoi(argv[1]));
           sleep(atoi(argv[1]));

           /* Unlock the timer signal, so that timer notification
              can be delivered */

           printf("Unblocking signal %d\n", SIG);
           if (sigprocmask(SIG_UNBLOCK, &mask, NULL) == -1)
               errExit("sigprocmask");

           exit(EXIT_SUCCESS);
       }

SEE ALSO
       clock_gettime(2),   setitimer(2),  timer_delete(2),  timer_set-
       time(2),        timer_getoverrun(2),         timerfd_create(2),
       clock_getcpuclockid(3),  pthread_getcpuclockid(3), pthreads(7),
       signal(7), time(7)



Linux                         2009-02-16               TIMER_CREATE(2)




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
.TH TIMER_CREATE 2 2009-02-16 Linux "Linux Programmer's Manual"
.SH NAME
timer_create \- create a POSIX per-process timer
.SH SYNOPSIS
.nf
.B  #include <signal.h>
.B  #include <time.h>

.BI "int timer_create(clockid_t " clockid ", struct sigevent *" evp ,
.BI "                 timer_t *" timerid );
.fi

Link with
.IR \-lrt .
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.BR timer_create ():
_POSIX_C_SOURCE >= 199309
.SH DESCRIPTION
.BR timer_create ()
creates a new per-process interval timer.
The ID of the new timer is returned in the buffer pointed to by
.IR timerid ,
which must be a non-NULL pointer.
This ID is unique within the process, until the timer is deleted.
The new timer is initially disarmed.

The
.I clockid
argument specifies the clock that the new timer uses to measure time.
It can be specified as one of the following values:
.TP
.B CLOCK_REALTIME
A settable system-wide real-time clock.
.TP
.B CLOCK_MONOTONIC
A non-settable monotonically increasing clock that measures time
from some unspecified point in the past that does not change
after system startup.
.\" Note: the CLOCK_MONOTONIC_RAW clock added for clock_gettime()
.\" in 2.6.28 is not supported for POSIX timers -- mtk, Feb 2009
.TP
.BR CLOCK_PROCESS_CPUTIME_ID " (since Linux 2.6.12)"
A clock that measures (user and system) CPU time consumed by
(all of the threads in) the calling process.
.TP
.BR CLOCK_THREAD_CPUTIME_ID " (since Linux 2.6.12)"
A clock that measures (user and system) CPU time consumed by
the calling thread.
.\" The CLOCK_MONOTONIC_RAW that was added in 2.6.28 can't be used
.\" to create a timer -- mtk, Feb 2009
.PP
As well as the above values,
.I clockid
can be specified as the
.I clockid
returned by a call to
.BR clock_getcpuclockid (3)
or
.BR pthread_getcpuclockid (3).

The
.I evp
argument points to a
.I sigevent
structure that specifies how the caller
should be notified when the timer expires.
This structure is defined something like the following:

.in +4n
.nf
union sigval {
    int   sival_int;
    void *sival_ptr;
};

struct sigevent {
    int          sigev_notify;    /* Notification method */
    int          sigev_signo;     /* Timer expiration signal */
    union sigval sigev_value;     /* Value accompanying signal or
                                     passed to thread function */
    void       (*sigev_notify_function) (union sigval);
                   /* Function used for thread
                      notifications (SIGEV_THREAD) */
    void        *sigev_notify_attributes;
                   /* Attributes for notification thread
                      (SIGEV_THREAD) */
    pid_t        sigev_notify_thread_id;
                   /* ID of thread to signal (SIGEV_THREAD_ID) */
};
.fi
.in

Some of these fields may be defined as part of a union:
a program should only employ those fields relevant
to the value specified in
.IR sigev_notify .
This field can have the following values:
.TP
.BR SIGEV_NONE
Don't asynchronously notify when the timer expires.
Progress of the timer can be monitored using
.BR timer_gettime (2).
.TP
.BR SIGEV_SIGNAL
Upon timer expiration, generate the signal
.I sigev_signo
for the process.
If
.I sigev_signo
is a real-time signal,
then it will be accompanied by the data specified in
.IR sigev_value
(like the signal-accompanying data for
.BR sigqueue (2)).
At any point in time,
at most one signal is queued to the process for a given timer; see
.BR timer_getoverrun (2)
for more details.
.TP
.BR SIGEV_THREAD
Upon timer expiration, invoke
.I sigev_notify_function
as if it were the start function of a new thread.
(Among the implementation possibilities here are that
each timer notification could result in the creation of a new thread,
or that a single thread is created to receive all notifications.)
The function is invoked with
.I sigev_value
as its sole argument.
If
.I sigev_notify_attributes
is not NULL, it should point to a
.I pthread_attr_t
structure that defines attributes for the new thread (see
.BR pthread_attr_init (3).
.TP
.BR SIGEV_THREAD_ID " (Linux-specific)"
As for
.BR SIGEV_SIGNAL ,
but the signal is targeted at the thread whose ID is given in
.IR sigev_notify_thread_id ,
which must be a thread in the same process as the caller.
The
.IR sigev_notify_thread_id
field specifies a kernel thread ID, that is, the value returned by
.BR clone (2)
or
.BR gettid (2).
This flag is only intended for use by threading libraries.
.PP
Specifying
.I evp
as NULL is equivalent to specifying a pointer to a
.I sigevent
structure in which
.I sigev_notify
is
.BR SIGEV_SIGNAL ,
.I sigev_signo
is
.BR SIGALRM ,
and
.I sigev_value.sival_int
is the timer ID.
.SH RETURN VALUE
On success,
.BR timer_create ()
returns 0, and the ID of the new timer is placed in
.IR *timerid .
On failure, \-1 is returned, and
.I errno
is set to indicate the error.
.SH ERRORS
.TP
.B EAGAIN
Temporary error during kernel allocation of timer structures.
.TP
.B EINVAL
Clock ID,
.IR sigev_notify ,
.IR sigev_signo ,
.IR sigev_notify_thread_id
is invalid.
.TP
.B ENOMEM
.\" glibc layer: malloc()
Could not allocate memory.
.SH VERSIONS
This system call is available since Linux 2.6.
.SH CONFORMING TO
POSIX.1-2001
.SH NOTES
A program may create multiple interval timers using
.BR timer_create ().

Timers are not inherited by the child of a
.BR fork (2),
and are disarmed and deleted during an
.BR execve (2).

The kernel preallocates a "queued real-time signal"
for each timer created using
.BR timer_create ().
Consequently, the number of timers is limited by the
.BR RLIMIT_SIGPENDING
resource limit (see
.BR setrlimit (2)).

The timers created by
.BR timer_create ()
are commonly known as "POSIX (interval) timers".
The POSIX timers API consists of the following interfaces:
.IP * 3
.BR timer_create ():
Create a timer.
.IP *
.BR timer_settime (2):
Arm (start) or disarm (stop) a timer.
.IP *
.BR timer_gettime (2):
Fetch the time remaining until the next expiration of a timer,
along with the interval setting of the timer.
.IP *
.BR timer_getoverrun (2):
Return the overrun count for the last timer expiration.
.IP *
.BR timer_delete (2):
Disarm and delete a timer.
.PP
Part of the implementation of the POSIX timers API is provided by glibc.
In particular:
.IP * 3
The functionality for
.BR SIGEV_THREAD
is implemented within glibc, rather than the kernel.
.IP *
The timer IDs presented at user level are maintained by glibc,
which maps these IDs to the timer IDs employed by the kernel.
.\" See the glibc source file kernel-posix-timers.h for the structure
.\" that glibc uses to map userspace timer IDs to kernel timer IDs
.\" The kernel-level timer ID is exposed via siginfo.si_tid.
.PP
The POSIX timers system calls first appeared in Linux 2.6.
Prior to this,
glibc provided an incomplete userspace implementation
.RB ( CLOCK_REALTIME
timers only) using POSIX threads,
and current glibc falls back to this implementation on systems
running pre-2.6 Linux kernels.
.SH EXAMPLE
The program below takes two arguments: a sleep period in seconds,
and a timer frequency in nanoseconds.
The program establishes a handler for the signal it uses for the timer,
blocks that signal,
creates and arms a timer that expires with the given frequency,
sleeps for the specified number of seconds,
and then unblocks the timer signal.
Assuming that the timer expired at least once while the program slept,
the signal handler will be invoked,
and the handler displays some information about the timer notification.
The program terminates after one invocation of the signal handler.

In the following example run, the program sleeps for 1 second,
after creating a timer that has a frequency of 100 nanoseconds.
By the time the signal is unblocked and delivered,
there have been around ten million overruns.
.in +4n
.nf

$ \fB./a.out 1 10\fP
Establishing handler for signal 34
Blocking signal 34
timer ID is 0x804c008
Sleeping for 1 seconds
Unblocking signal 34
Caught signal 34
    sival_ptr = 0xbfb174f4;     *sival_ptr = 0x804c008
    overrun count = 10004886
.fi
.in
.SS Program Source
\&
.nf
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <time.h>

#define CLOCKID CLOCK_REALTIME
#define SIG (SIGRTMIN)

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
                        } while (0)

static void
print_siginfo(siginfo_t *si)
{
    timer_t *tidp;
    int or;

    tidp = si\->si_value.sival_ptr;

    printf("    sival_ptr = %p; ", si\->si_value.sival_ptr);
    printf("    *sival_ptr = 0x%lx\\n", (long) *tidp);

    or = timer_getoverrun(*tidp);
    if (or == \-1)
        errExit("timer_getoverrun");
    else
        printf("    overrun count = %d\\n", or);
}

static void
handler(int sig, siginfo_t *si, void *uc)
{
    /* Note: calling printf() from a signal handler is not
       strictly correct, since printf() is not async\-signal\-safe;
       see signal(7) */

    printf("Caught signal %d\\n", sig);
    print_siginfo(si);
    signal(SIG, SIG_IGN);
}

int
main(int argc, char *argv[])
{
    timer_t timerid;
    struct sigevent sev;
    struct itimerspec its;
    long long freq_nanosecs;
    sigset_t mask;
    struct sigaction sa;

    if (argc != 3) {
        fprintf(stderr, "Usage: %s <sleep\-secs> <freq\-nanosecs>\\n",
                argv[0]);
        exit(EXIT_FAILURE);
    }

    /* Establish handler for timer signal */

    printf("Establishing handler for signal %d\\n", SIG);
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = handler;
    sigemptyset(&sa.sa_mask);
    if (sigaction(SIG, &sa, NULL) == \-1)
        errExit("sigaction");

    /* Block timer signal temporarily */

    printf("Blocking signal %d\\n", SIG);
    sigemptyset(&mask);
    sigaddset(&mask, SIG);
    if (sigprocmask(SIG_SETMASK, &mask, NULL) == \-1)
        errExit("sigprocmask");

    /* Create the timer */

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIG;
    sev.sigev_value.sival_ptr = &timerid;
    if (timer_create(CLOCKID, &sev, &timerid) == \-1)
        errExit("timer_create");

    printf("timer ID is 0x%lx\\n", (long) timerid);

    /* Start the timer */

    freq_nanosecs = atoll(argv[2]);
    its.it_value.tv_sec = freq_nanosecs / 1000000000;
    its.it_value.tv_nsec = freq_nanosecs % 1000000000;
    its.it_interval.tv_sec = its.it_value.tv_sec;
    its.it_interval.tv_nsec = its.it_value.tv_nsec;

    if (timer_settime(timerid, 0, &its, NULL) == \-1)
         errExit("timer_settime");

    /* Sleep for a while; meanwhile, the timer may expire
       multiple times */

    printf("Sleeping for %d seconds\\n", atoi(argv[1]));
    sleep(atoi(argv[1]));

    /* Unlock the timer signal, so that timer notification
       can be delivered */

    printf("Unblocking signal %d\\n", SIG);
    if (sigprocmask(SIG_UNBLOCK, &mask, NULL) == \-1)
        errExit("sigprocmask");

    exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.BR clock_gettime (2),
.BR setitimer (2),
.BR timer_delete (2),
.BR timer_settime (2),
.BR timer_getoverrun (2),
.BR timerfd_create (2),
.BR clock_getcpuclockid (3),
.BR pthread_getcpuclockid (3),
.BR pthreads (7),
.BR signal (7),
.BR time (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
