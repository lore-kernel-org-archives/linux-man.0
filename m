From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: timer_settime.2
Date: Thu, 12 Feb 2009 08:17:11 +1300
Message-ID: <49932437.3030005@gmail.com>
References: <4990DE50.7090503@gmail.com> <1234446864.10603.6.camel@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1234446864.10603.6.camel@laptop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Peter,

Peter Zijlstra wrote:
> On Tue, 2009-02-10 at 14:54 +1300, Michael Kerrisk wrote:
>>        If the value of the CLOCK_REALTIME clock is adjusted  while  an
>>        absolute  timer  based on that clock is armed, then the expira-
>>        tion of the timer will be appropriately adjusted.   Adjustments
>>        to  the  CLOCK_REALTIME clock have no effect on relative timers
>>        based on that clock.
> 
> I cannot find this to be true.
> 
>>From what I can make of the code, clock_settime() ends up calling
> do_sys_settimeofday() for CLOCK_REALTIME (and the other clocks).
> 
> It is, however, not treating relative/abs timers any differently.
> 
> Both get converted to an absolute expiration time when set.
> 
> If POSIX mandates that we keep relative timers unchanged when we change
> the underlying clock, we'd have to iterate all pending timers and reset
> them.

The rules do indeed come from POSIX.

And indeed the rules do seem to be followed on Linux.  Since I found
parts of the code to be hard to track, I also checked things with an
example program.  (Ahhh! the pitfalls of reading code to find the
truth!)

Pull out your watch and time what happens with these two runs of my
test program below:

$ sudo ./ptmr_demo r - 10 5
$ sudo ./ptmr_demo r a 10 5

Cheers,

Michael

/*#* ptmr_demo.c

   Compile on Linux with -lrt
*/
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <errno.h>
#include <time.h>
#include <pthread.h>

#define SIG SIGUSR1

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
    printf("Caught signal %d\n", sig);
    print_siginfo(si);

    exit(EXIT_SUCCESS);
}

static void *
thread_func(void *arg)
{
    printf("Thread burning CPU\n");
    for (;;)
        ;
}

int
main(int argc, char *argv[])
{
    timer_t timer_id;
    struct sigevent sev;
    struct itimerspec its;
    struct sigaction sa;
    clockid_t clock_id;
    int flags;
    struct timespec ts;

    if (argc < 4) {
        fprintf(stderr, "Usage: %s <clockid> <flags> <num-secs> "
                "[<clock-adj-secs>]\n", argv[0]);
#define fpe(str) fprintf(stderr, str);
        fpe("<clockid> is one of:\n");
        fpe("\tm  CLOCK_MONOTONIC\n");
        fpe("\tr  CLOCK_REALTIME\n");
        fpe("\tp  CLOCK_PROCESS_CPUTIME_ID\n");
        fpe("\tt  CLOCK_THREAD_CPUTIME_ID\n");
        fpe("\tC  clock of a child process that burns CPU time\n");
        fpe("\tT  clock of a sub-thread that burns CPU time\n");
        fpe("<flags> is one of:\n");
        fpe("\ta  absolute timer (<num-secs> is added to current\n");
        fpe("\t   clock value)\n")
        fpe("\t-  relative timer\n")
        fpe("<num-secs> is the initial expiration time for the timer\n");
        fpe("<clock-adj-secs> is number of seconds by which clock\n");
        fpe("\tshould be adjusted (clock_settime()) after timer\n");
        fpe("\thas started\n")
        exit(EXIT_FAILURE);
    }

    printf("Establishing handler for signal %d\n", SIG);
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = handler;
    sigemptyset(&sa.sa_mask);
    if (sigaction(SIG, &sa, NULL) == -1)
        errExit("sigaction");

    if (argv[1][0] == 'C') {
        pid_t cpid;

        cpid = fork();
        if (cpid == -1)
            errExit("fork");
        if (cpid == 0) {
            usleep(10000);
            printf("Child process burning CPU time\n");
            alarm(100); /* Ensure child eventually dies */
            for (;;)
                ;
        } else {        /* Parent gets CPU clock ID of child and
                           falls through */
            if (clock_getcpuclockid(cpid, &clock_id) == -1)
                errExit("clock_getcpuclockid");
        }

    } else if (argv[1][0] == 'T') {
        pthread_t t;

        errno = pthread_create(&t, NULL, thread_func, NULL);
        if (errno != 0)
            errExit("pthread_create");
        errno = pthread_getcpuclockid(t, &clock_id);
        if (errno != 0)
            errExit("pthread_getcpuclockid");

    } else {
        clock_id = (argv[1][0] == 'm') ? CLOCK_MONOTONIC :
                   (argv[1][0] == 'p') ? CLOCK_PROCESS_CPUTIME_ID :
                   (argv[1][0] == 't') ? CLOCK_THREAD_CPUTIME_ID :
                   (argv[1][0] == 'r') ? CLOCK_REALTIME :
                   -999999;     /* Unlikely to be a valid clock ID */
    }

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIG;
    sev.sigev_value.sival_ptr = &timer_id;
    if (timer_create(clock_id, &sev, &timer_id) == -1)
        errExit("timer_create");

    printf("clock ID is 0x%lx\n", (long) clock_id);
    printf("timer ID is 0x%lx\n", (long) timer_id);

    flags = (argv[2][0] == 'a') ? TIMER_ABSTIME : 0;

    if (flags & TIMER_ABSTIME) {
        printf("Absolute timer\n");
        if (clock_gettime(clock_id, &ts) == -1)
            errExit("clock_gettime");
        printf("Current clock value = %ld\n", (long) ts.tv_sec);
        its.it_value.tv_sec = ts.tv_sec + atoi(argv[3]);
        its.it_value.tv_nsec = ts.tv_nsec;
    } else {
        its.it_value.tv_sec = atoi(argv[3]);
        its.it_value.tv_nsec = 0;
    }

    its.it_interval.tv_sec = 1;
    its.it_interval.tv_nsec = 0;

    printf("its.it_value.tv_sec = %ld\n",
            (long) its.it_value.tv_sec);

    if (timer_settime(timer_id, flags, &its, NULL) == -1)
         errExit("timer_settime");

    if (argc > 4) {
        if (clock_gettime(clock_id, &ts) == -1)
            errExit("clock_gettime");
        ts.tv_sec += atoi(argv[4]);
        printf("About to adjust clock to %ld\n", (long) ts.tv_sec);
        if (clock_settime(clock_id, &ts) == -1)
            errExit("clock_settime");
    }

    if (clock_id == CLOCK_PROCESS_CPUTIME_ID ||
            clock_id == CLOCK_THREAD_CPUTIME_ID) {
        printf("main() burning CPU\n");
        printf("About to enter infinite loop\n");
        for (;;)
            getppid();
    } else {
        printf("main() pausing\n");
        pause();
    }
}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
