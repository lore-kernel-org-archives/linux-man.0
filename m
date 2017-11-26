From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Why can GDB mask tracee's SIGKILL after attaching
Date: Sun, 26 Nov 2017 17:07:26 +0800
Message-ID: <CAJYFCiMdQ73QscVHbDBVMpU70enkPA=zNMxBwV39B2aWuOedRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: gdb-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

The signal(7) man page says that **SIGKILL** cannot be caught,
blocked, or ignored. But I just observed that after attaching to a
process with GDB, I can no longer send **SIGKILL** to that process
(similarly, other signal cannot be delivered either). But after I
detached and quit GDB, **SIGKILL** is delivered as usual (and the
process get killed, eventually).

It seems to me that GDB has blocked that signal (on behalf of the
tracee) when attaching, and unblocked it when detaching. However, the
ptrace(2) man page says:

    While being traced, the tracee will stop each time a signal is delivered,
    even if the signal is being ignored.  (An exception is **SIGKILL**, which
    has its usual effect.)

So why does it behave this way? Is there anything wrong with the man
page or is GDB using any kernel trick?

Here is an trivial example for demonstration:

    #include <pthread.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <unistd.h>
    #include <signal.h>
    #include <errno.h>
    #include <string.h>

    /* Simple error handling functions */

    #define handle_error_en(en, msg) \
        do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)

    struct sigaction act;

    void sighandler(int signum, siginfo_t *info, void *ptr) {
        printf("Received signal: %d\n", signum);
        printf("signal originate from pid[%d]\n", info->si_pid);
    }

    int
    main(int argc, char *argv[])
    {
        printf("Pid of the current process: %d\n", getpid());

        memset(&act, 0, sizeof(act));

        act.sa_sigaction = sighandler;
        act.sa_flags = SA_SIGINFO;

        sigaction(SIGQUIT, &act, NULL);

        while(1) {
            ;
        }

        return 0;
    }

If you try to kill this program using **SIGKILL** (i.e., using "kill
-KILL ${pid}"), it will die as expected. If you try to send it
**SIGQUIT** (i.e., using "kill -QUIT ${pid}"), those "printf"
statements get executed, as expected. However, if you have attached it
with GDB before sending it signal, nothing will happen:

    $ ##### in shell 1 #####
    $ gdb
    (gdb) attach ${pid}
    (gdb)

/* now that gdb has attached successfully, in another shell: */

    $ #### in shell 2 ####
    $ kill -QUIT ${pid}    # nothing happen
    $ kill -KILL ${pid}    # again, nothing happen!

/* now gdb detached */

    ##### in shell 1 ####
    (gdb) quit

/* the process will receive **SIGKILL** */

    ##### in shell 2 ####
    $ Killed    # the tracee receive **SIGKILL** eventually...

FYI, I am using a CentOS-6u3 and

     $ uname -r
     $ 2.6.32_1-16-0-0

My GDB version is:

    $ gdb --version
    $ GNU gdb (GDB) Red Hat Enterprise Linux (7.2-56.el6)
    .....

and my GCC version is:

      $ gcc --version
      $ gcc (GCC) 3.4.6 20060404 (Red Hat 3.4.6-19.el6)`.
      .....

Any idea will be appreciated ;-)

Yubin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
