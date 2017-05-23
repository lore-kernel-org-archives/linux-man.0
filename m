From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Tue, 23 May 2017 12:35:41 +0200
Message-ID: <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <08467ae1-7187-3b2a-9a78-8af0c10bf816-cmBhpYW9OiY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Stas,

On 05/23/2017 01:36 AM, Stas Sergeev wrote:
> 22.05.2017 23:38, Michael Kerrisk (man-pages) пишет:
>> Stas,
>>
>> I have attempted to document the SS_AUTODISARM feature that you added
>> in Linux 4.7.
>>
>> Could you please take a look at the SS_AUTODISARM pieces in the
>> sigaltstack() man page below? There is also one FIXME that I would
>> like help with.
>>
>> It seems to me that the API has become rather odd now. It is no longer
>> possible to simply check whether code is executing on an alternative
>> stack by using
>>
>>      sigaltstack(NULL, &old_ss);
>>      if (old_ss.ss_flags & SS_ONSTACK)

> You mean, if SS_AUTODISARM was previously used, right?

Yes, that's what I meant.

> Because I don't think we broke the existing code, or did we?

Probably not, but it seems to me that there is some small
possibility that library code that makes use of sigaltstack()
to test whether a signal is being handled on an alternate signal 
stack, unaware that the main program employed SS_AUTODISARM,
could be confused/broken. I've no idea how likely this scenario 
is though. (I imagine it's rather unlikely.)

> I can vaguely recall that I was submitting the patches
> that were returning SS_ONSTACK even when SS_AUTODISARM
> was used, but they were considered too complex.
> This is possible to implement, but the agreement was
> that it is not a big deal.
> 
>>         ss.ss_flags
>>                This field contains either 0, or the following flag:
> Is this correct?
> AFAIK it can be SS_DISABLE too, 

It's correct in context. Just above in the man page its says:

       To  establish  a new alternate signal stack, the fields of this
       structure are set as follows:

The discussion of SS_DISABLE to disable the SS is lower in the page.

> and posix seems to allow any
> other value for enable, which can be (on linux) SS_ONSTACK,
> not only 0.

Yes, long ago someone got confused, as I've noted in a recently added
BUGS section in the page:

    BUGS
       In the lead up to the development  of  the  Linux  2.4  kernel,
       someone   got   confused  and  allowed  the  kernel  to  accept
       SS_ONSTACK in ss.ss_flags, which results behavior that  is  the
       same  as  when  ss_flags  is  0.  On other implementations, and
       according to POSIX.1, SS_ONSTACK appears  only  as  a  reported
       flag in old_ss.ss_flags.  There is no need ever to specify this
       flag in ss.ss_flags.

> And SS_AUTODISARM can be ORed with the value.
> 
>>                ┌─────────────────────────────────────────────────────┐
>>                │FIXME                                                │
>>                ├─────────────────────────────────────────────────────┤
>>                │Was it intended that one  can  set  up  a  different │
>>                │alternative signal stack in this scenario? (In pass‐ │
>>                │ing,  if  one  does  this,   the   sigaltstack(NULL, │
>>                │&old_ss)  now returns old_ss.ss_flags==SS_AUTODISARM │
>>                │rather  than  old_ss.ss_flags==SS_DISABLE.  The  API │
>>                │design here seems confusing...                       │
>>                └─────────────────────────────────────────────────────┘
> My memory may be wrong here, but I think setting
> up another alt stack was not supposed because the
> previous settings would be restored upon sighandler
> return. AFAIK I was trying to make up a proposal to
> get such attempts explicitly blocked rather than
> silently ignored, but again the simplicity was chosen.

So, I've done only limited experimentation here, but this is what 
I see in one experiment:

[[
* Set up two handlers for SIGX and SIGY, both using SA_ONSTACK.
* Establish alternate SS (1) using SS_AUTODISARM
  
  [SIGA is delivered]

* Handler for SIGA is called and handler is executed on alternate SS 1.
* The handler establishes a new alternate SS (2) with SS_AUTODISARM.

  [SIGB is delivered]

* Handler for SIGB is called and handler is executed on alternate SS 2.
* Handler for SIGB returns

  [SIGB is delivered]

* Handler for SIGB is called and handler is executed on alternate SS 2.
* Handler for SIGB returns
* Handler of SIGA returns

  [SIGA is delivered]

* Handler for SIGA is called and handler is executed on alternate SS 1.
]]

Summary: setting up another alternate signal stack seems to "work".
API history is littered with stories where users found out that
something unforeseen "worked", and so they used it. The question
is: what can go wrong if people do try using this "feature"?

>>         SS_AUTODISARM
>>                The  alternate  signal  stack  has  been  marked  to  be
>>                autodisarmed as described above.
> Initially this flag was supposed to be ORed with
> the old values. Your descrition is correct, but if
> more bit flags are added, this may became a
> problem, as you are always treating it as a separate
> value, not a bit flag.

Thanks for the confirmation.

At the end of this mail is a test program that I used to experiment
with this stuff. Here's a sample run that demonstrates the scenario
described above:

[[
$ ./t_sigaltstack_SS_AUTODISARM d 1
Autodisarm:                          YES
Try to establish new SS while on SS: YES
Initial SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]

Top of standard stack is near 0x7ffc2b16382c
Signal stack allocated at 0x69a000-0x6ae000
About to change SS: sp = 0x69a000; size = 81920; flags = [ SS_AUTODISARM ]
SS after change:    sp = 0x69a000; size = 81920; flags = [ SS_AUTODISARM ]

Send me a SIGQUIT (^\) or a SIGTSTP (^Z)
^\

Caught signal 3 (Quit)
Top of handler stack near       0x6adaa8
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]

Now try establishing a new signal stack while still executing on this one (1)
Signal stack allocated at 0x1baf000-0x1bc3000
Modifying SS to: sp = 0x1baf000; size = 81920; flags = [ SS_AUTODISARM ]
SS after update: sp = 0x1baf000; size = 81920; flags = [ SS_AUTODISARM ]

sleep(2) before displaying SS (send a signal now, if desired)
^Z

Caught signal 20 (Stopped)
Top of handler stack near      0x1bc2aa8
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]

sleep(2) before displaying SS (send a signal now, if desired)
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]
sleep(2) before return from handler (send a signal now, if desired)
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]
Returning from handler for signal 20
current SS: sp = 0x1baf000; size = 81920; flags = [ SS_AUTODISARM ]
sleep(2) before return from handler (send a signal now, if desired)
^Z

Caught signal 20 (Stopped)
Top of handler stack near      0x1bc2aa8
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]

sleep(2) before displaying SS (send a signal now, if desired)
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]
sleep(2) before return from handler (send a signal now, if desired)
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]
Returning from handler for signal 20
current SS: sp = 0x1baf000; size = 81920; flags = [ SS_AUTODISARM ]
Returning from handler for signal 3
===============================

Back in main
current SS: sp = 0x69a000; size = 81920; flags = [ SS_AUTODISARM ]
^\

Caught signal 3 (Quit)
Top of handler stack near       0x6adaa8
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]

sleep(2) before displaying SS (send a signal now, if desired)
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]
sleep(2) before return from handler (send a signal now, if desired)
current SS: sp = (nil); size = 0; flags = [ SS_DISABLE ]
Returning from handler for signal 3
===============================

Back in main
current SS: sp = 0x69a000; size = 81920; flags = [ SS_AUTODISARM ]
^C
]]
Cheers,

Michael

/*#* t_sigaltstack_SS_AUTODISARM.c

   COPYRIGHT-NOTICE
*/
#define _GNU_SOURCE
#include <string.h>
#include <signal.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

#define errExit(msg)    do { fprintf(stderr, "[FAILED] "); \
                             perror(msg); exit(EXIT_FAILURE); \
                        } while (0)

#define errExitEN(en, msg) \
                        do { errno = en; perror(msg); \
                        exit(EXIT_FAILURE); } while (0)

#define SS_AUTODISARM   (1U << 31)

static int tryNewStack = 0;

static void
showSS(char *prefix, stack_t * osp)
{
    printf("%ssp = %p; size = %ld; flags = ", prefix,
           osp->ss_sp, (long) osp->ss_size);
    if (osp->ss_flags != 0) {
        printf("[ ");
        if (osp->ss_flags & SS_ONSTACK)
            printf("SS_ONSTACK ");
        if (osp->ss_flags & SS_DISABLE)
            printf("SS_DISABLE ");
        if (osp->ss_flags & SS_AUTODISARM)
            printf("SS_AUTODISARM ");
        printf("]");
    }
    printf("\n");
}

static void
showCurrentSS(char *msg)
{
    stack_t os;

    if (sigaltstack(NULL, &os) == -1)
        errExit("sigaltstack");
    showSS((msg != NULL) ? msg : "current SS: ", &os);
}

static const size_t stackSize = 10 * SIGSTKSZ;

static void
allocateSS(void **ss_sp)
{
    int s;
    void *p;

    s = posix_memalign(ss_sp, 4096, stackSize);
    if (s != 0)
        errExitEN(s, "posix_memalign");
    printf("Signal stack allocated at %p-%p\n",
           *ss_sp, (char *) *ss_sp + stackSize);
    for (s = 0; s < 256; s++)
        posix_memalign(&p, 4096, stackSize);
}

static void
handler(int sig)
{
    int x;

    printf("\n\nCaught signal %d (%s)\n", sig, strsignal(sig));
    printf("Top of handler stack near     %10p\n", (void *) &x);
    fflush(NULL);

    showCurrentSS(NULL);

    if (tryNewStack > 0) {
        stack_t sigstack, os;
        int s;

        printf("\nNow try establishing a new signal stack "
               "while still executing on this one (%d)\n", tryNewStack);

        tryNewStack--;

        allocateSS(&sigstack.ss_sp);
        sigstack.ss_size = stackSize;
        sigstack.ss_flags = SS_AUTODISARM;
        showSS("Modifying SS to: ", &sigstack);

        s = sigaltstack(&sigstack, NULL);
        if (s == -1) {
            fprintf(stderr, "[FAILED] ");
            perror("sigaltstack");
        }
        if (sigaltstack(NULL, &os) == -1)
            errExit("sigaltstack");
        else
            showCurrentSS("SS after update: ");
    }
    printf("\nsleep(2) before displaying SS "
            "(send a signal now, if desired)\n");
    sleep(2);
    showCurrentSS(NULL);
    printf("sleep(2) before return from handler"
            "(send a signal now, if desired)\n");
    sleep(2);
    showCurrentSS(NULL);
    printf("Returning from handler for signal %d\n", sig);
}

int
main(int argc, char *argv[])
{
    stack_t sigstack;
    struct sigaction sa;
    int j;
    int autodisarm;

    autodisarm = 0;
    if (argc > 1) {
        if (strchr(argv[1], 'd') != NULL)
            autodisarm = 1;
    }

    tryNewStack = (argc > 2) ? atoi(argv[2]) : 0;

    printf("Autodisarm:                          %s\n",
           autodisarm ? "YES" : "NO");
    printf("Try to establish new SS while on SS: %s\n",
           tryNewStack ? "YES" : "NO");

    showCurrentSS("Initial SS: ");

    printf("\nTop of standard stack is near %10p\n", (void *) &j);

    /* Allocate alternate stack and inform kernel of its existence */

    allocateSS(&sigstack.ss_sp);
    sigstack.ss_size = stackSize;
    sigstack.ss_flags = autodisarm ? SS_AUTODISARM : 0;
    showSS("About to change SS: ", &sigstack);
    if (sigaltstack(&sigstack, NULL) == -1)
        errExit("sigaltstack");

    showCurrentSS("SS after change:    ");

    /* Establish handlers for SIGQUIT and SIGTSTP */

    sa.sa_handler = handler;    
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_ONSTACK | SA_NODEFER;
        /* SA_NODEFER to allow experiments with interrupted handlers */

    if (sigaction(SIGQUIT, &sa, NULL) == -1)
        errExit("sigaction");
    if (sigaction(SIGTSTP, &sa, NULL) == -1)
        errExit("sigaction");

    printf("\nSend me a SIGQUIT (^\\) or a SIGTSTP (^Z)\n");

    for (;;) {
        pause();
        printf("===============================\n");
        printf("\nBack in main\n");

        showCurrentSS(NULL);
    }
}



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
