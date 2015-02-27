From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: ftrace.2: example - using a single futex
Date: Fri, 27 Feb 2015 23:06:12 +0100
Message-ID: <54F0EA54.7030902@gmx.de>
References: <54DA666D.6070606@gmx.de> <54DB04DE.9070806@gmail.com> <54DBA451.6030102@gmx.de> <CAKgNAkj2EMVGo5GRJxe3CCVVFqCCbK30AszEDEX5c6qX8j3yPA@mail.gmail.com> <54DD2D97.9020601@gmx.de> <54E0B93D.9000103@gmail.com> <54E0E7C7.9090604@gmx.de> <CAKgNAki1ZaqYQeTmrRvOmCC4Zd4eU6QDPuEFkxxUNSB32Uc1-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki1ZaqYQeTmrRvOmCC4Zd4eU6QDPuEFkxxUNSB32Uc1-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 21.02.2015 07:14, Michael Kerrisk (man-pages) wrote:
>> In the example code of futex.2 it remains unclear to me why two futexes
>> > are needed. Wouldn't it be sufficient to have one futex? If it has value
>> > A it is parent's turn, if the value is B it is childs's turn?
> I'm not so sure it's possible with one futex. Want to give it a shot?
> 

In the example below 10 processes collaborate using a single futex.

Best regards

Heinrich Schuchardt



#include <errno.h>
#include <limits.h>
#include <linux/futex.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/syscall.h>

#define NUMBER_OF_PROCESSES 10
#define NUMBER_OF_WORKPACKAGES 27
#define GRANTED 0

struct info_area {
    int futex;
    int counter;
};

static int
futex(int *uaddr, int futex_op, int val,
      const struct timespec *timeout, int *uaddr2, int val3)
{
    return syscall(SYS_futex, uaddr, futex_op, val,
                   timeout, uaddr, val3);
}

static void
fail(const char *msg, struct info_area *info)
{
    /*
     * Terminate all processes.
     */
    if (info != MAP_FAILED) {
        info->counter = 0;
        futex(&info->futex, FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
    }

    perror(msg);
    exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{
    int id;
    int ret;
    pid_t pid;
    struct info_area *info;

    /*
     * Create a shared mapped memory area for communication between
     * processes.
     */
    info = mmap(NULL, sizeof(info), PROT_READ | PROT_WRITE,
                MAP_ANONYMOUS | MAP_SHARED, -1, 0);
    if (info == MAP_FAILED)
        fail("mmap", info);

    /*
     * The main process will not wait for children.
     */
    if (signal(SIGCHLD, SIG_IGN) == SIG_ERR)
        fail("signal", info);

    /*
     * Process with id=1 shall be first.
     */
    info->futex = 1;

    /*
     * Set number of work packages
     */
    info->counter = NUMBER_OF_WORKPACKAGES;

    /*
     * Create child processes.
     */
    for (id = 1; id <  NUMBER_OF_PROCESSES; ++id) {
        pid = fork();
        if (pid == -1)
            fail("fork", info);
        if (pid == 0)
            break;
    }

    /*
     * All processes stay in this loop until the work is done.
     */
    for(;;) {
        /*
        * Leave if all work is done.
        */
        if (info->counter <= 0) {
            /*
             * Wake up all other processes.
             */
            futex(&info->futex, FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
            exit(EXIT_SUCCESS);
        }

        /*
         * If it is the turn of this process, acquire futex.
         * The function used is atomic and provides barriers.
         */
        ret = __sync_bool_compare_and_swap(&info->futex, id, GRANTED);
        if (ret) {
            /*
             * Output process id.
             */
            printf("%02d ", id);
            --(info->counter);
            if ((NUMBER_OF_WORKPACKAGES - info->counter)
                % NUMBER_OF_PROCESSES == 0 || info->counter == 0)
                printf("\n");
            fflush(stdout);

            /*
             * Grant access to next process.
             */
            __sync_bool_compare_and_swap(&info->futex,
                              GRANTED, id % NUMBER_OF_PROCESSES + 1);

            /*
             * Wake up all other processes.
             */
            futex(&info->futex, FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
            if (ret == -1)
                fail("FUTEX_WAKE", info);
        } else {
            /*
             * Sleep if futex is granted to another process.
             */
            ret = futex(&info->futex, FUTEX_WAIT,
                        GRANTED, NULL, NULL, 0);
            if (ret == -1 && errno != EAGAIN)
                fail("FUTEX_WAIT", info);
        }
    }
}

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
