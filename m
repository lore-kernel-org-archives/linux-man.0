From: Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Tue, 15 Dec 2015 14:41:19 -0800
Message-ID: <20151215224119.GA28877@linux-uzut.site>
References: <56701916.4090203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56701916.4090203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier@g>
List-Id: linux-man@vger.kernel.org

On Tue, 15 Dec 2015, Michael Kerrisk (man-pages) wrote:

>       When executing a futex operation that requests to block a thread,
>       the kernel will block only if the futex word has the  value  that
>       the  calling  thread  supplied  (as  one  of the arguments of the
>       futex() call) as the expected value of the futex word.  The load???
>       ing  of the futex word's value, the comparison of that value with
>       the expected value, and the actual blocking  will  happen  atomi???
>
>FIXME: for next line, it would be good to have an explanation of
>"totally ordered" somewhere around here.
>
>       cally  and totally ordered with respect to concurrently executing
>       futex operations on the same futex word.

So there are two things here regarding ordering. One is the most obvious
which is ordered due to the taking/dropping the hb spinlock. Secondly, its
the cases which Peter brought up a while ago that involves atomic futex ops
futex_atomic_*(), which	do not have clearly defined semantics, and you get
inconsistencies with certain archs (tile being the worst iirc).

But anyway, the important thing users need to know about is that the atomic
futex operation must be totally ordered wrt any other user tasks that are trying
to access that address. This is not necessarily the case for kernel ops. Peter
illustrates this nicely with lock stealing example; 
(see https://lkml.org/lkml/2015/8/26/596).

Internally, I believe we decided that making it fully ordered (as opposed to
making use of implicit barriers for ACQUIRE/RELEASE), so you'd endup having
an MB ll/sc MB kind of setup.

[...]

>       #include <stdio.h>
>       #include <errno.h>
>       #include <stdlib.h>
>       #include <unistd.h>
>       #include <sys/wait.h>
>       #include <sys/mman.h>
>       #include <sys/syscall.h>
>       #include <linux/futex.h>
>       #include <sys/time.h>
>
>       #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
>                               } while (0)

Nit, but for this we have err(3).

>
>       static int *futex1, *futex2, *iaddr;
>
>       static int
>       futex(int *uaddr, int futex_op, int val,
>             const struct timespec *timeout, int *uaddr2, int val3)
>       {
>           return syscall(SYS_futex, uaddr, futex_op, val,
>                          timeout, uaddr, val3);
>       }
>
>       /* Acquire the futex pointed to by 'futexp': wait for its value to
>          become 1, and then set the value to 0. */
>
>       static void
>       fwait(int *futexp)
>       {
>           int s;
>
>           /* __sync_bool_compare_and_swap(ptr, oldval, newval) is a gcc
>              built-in function.  It atomically performs the equivalent of:
>
>                  if (*ptr == oldval)
>                      *ptr = newval;
>
>              It returns true if the test yielded true and *ptr was updated.
>              The alternative here would be to employ the equivalent atomic
>              machine-language instructions.  For further information, see
>              the GCC Manual. */
>
>           while (1) {
>
>               /* Is the futex available? */
>
>               if (__sync_bool_compare_and_swap(futexp, 1, 0))
>                   break;      /* Yes */
>
>               /* Futex is not available; wait */
>
>               s = futex(futexp, FUTEX_WAIT, 0, NULL, NULL, 0);
>               if (s == -1 && errno != EAGAIN)
>                   errExit("futex-FUTEX_WAIT");
>           }
>       }
>
>       /* Release the futex pointed to by 'futexp': if the futex currently
>          has the value 0, set its value to 1 and the wake any futex waiters,
>          so that if the peer is blocked in fpost(), it can proceed. */
>
>       static void
>       fpost(int *futexp)
>       {
>           int s;
>
>           /* __sync_bool_compare_and_swap() was described in comments above */
>
>           if (__sync_bool_compare_and_swap(futexp, 0, 1)) {
>
>               s = futex(futexp, FUTEX_WAKE, 1, NULL, NULL, 0);
>               if (s  == -1)
>                   errExit("futex-FUTEX_WAKE");
>           }
>       }
>
>       int
>       main(int argc, char *argv[])
>       {
>           pid_t childPid;
>           int j, nloops;
>
>           setbuf(stdout, NULL);
>
>           nloops = (argc > 1) ? atoi(argv[1]) : 5;
>
>           /* Create a shared anonymous mapping that will hold the futexes.
>              Since the futexes are being shared between processes, we
>              subsequently use the "shared" futex operations (i.e., not the
>              ones suffixed "_PRIVATE") */
>
>           iaddr = mmap(NULL, sizeof(int) * 2, PROT_READ | PROT_WRITE,
>                       MAP_ANONYMOUS | MAP_SHARED, -1, 0);
>           if (iaddr == MAP_FAILED)
>               errExit("mmap");
>
>           futex1 = &iaddr[0];
>           futex2 = &iaddr[1];
>
>           *futex1 = 0;        /* State: unavailable */
>           *futex2 = 1;        /* State: available */
>
>           /* Create a child process that inherits the shared anonymous
>              mapping */
>
>           childPid = fork();
>           if (childPid == -1)
>               errExit("fork");
>
>           if (childPid == 0) {        /* Child */
>               for (j = 0; j < nloops; j++) {
>                   fwait(futex1);
>                   printf("Child  (%ld) %d\n", (long) getpid(), j);
>                   fpost(futex2);
>               }
>
>               exit(EXIT_SUCCESS);
>           }
>
>           /* Parent falls through to here */
>
>           for (j = 0; j < nloops; j++) {
>               fwait(futex2);
>               printf("Parent (%ld) %d\n", (long) getpid(), j);
>               fpost(futex1);
>           }
>
>           wait(NULL);
>
>           exit(EXIT_SUCCESS);
>       }
>
>   SEE ALSO
>       get_robust_list(2), restart_syscall(2), pthread_mutexattr_getpro???
>       tocol(3), futex(7), sched(7)
>
>       The following kernel source files:
>
>       * Documentation/pi-futex.txt
>
>       * Documentation/futex-requeue-pi.txt
>
>       * Documentation/locking/rt-mutex.txt
>
>       * Documentation/locking/rt-mutex-design.txt
>
>       * Documentation/robust-futex-ABI.txt

Not related, but it looks like we should have a Documentation/futex/ folder here.

>
>       Franke, H., Russell, R., and Kirwood, M., 2002.  Fuss, Futexes
>       and Furwocks: Fast Userlevel Locking in Linux (from proceedings
>       of the Ottawa Linux Symposium 2002),
>       ???http://kernel.org/doc/ols/2002/ols2002-pages-479-495.pdf???
>
>       Hart, D., 2009. A futex overview and update,
>       ???http://lwn.net/Articles/360699/???
>
>       Hart, D. and Guniguntala, D., 2009.  Requeue-PI: Making Glibc
>       Condvars PI-Aware (from proceedings of the 2009 Real-Time Linux
>       Workshop),
>       ???http://lwn.net/images/conf/rtlws11/papers/proc/p10.pdf???
>
>       Drepper, U., 2011. Futexes Are Tricky,
>       ???http://www.akkadia.org/drepper/futex.pdf???
>
>       Futex example library, futex-*.tar.bz2 at
>       ???ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/???

Thanks,
Davidlohr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
