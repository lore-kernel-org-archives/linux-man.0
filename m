From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: getrandom.2: treatment of interrupts
Date: Sat, 22 Nov 2014 12:28:18 +0100
Message-ID: <54707352.8050208@gmx.de>
References: <CAKgNAkj_Bs7d=YV_CFLNHuJacbp_+Kk_Jux_FdiBSuUAsObA=Q@mail.gmail.com> <1415722798-4894-1-git-send-email-xypron.glpk@gmx.de> <CAKgNAkgVUeekKZjyTsjWgkXfv_u72T_ms7qofSJ_omqhfExfCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgVUeekKZjyTsjWgkXfv_u72T_ms7qofSJ_omqhfExfCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Theodore,

I created the test program below.

While running it I issued
kill -SIGUSR1 <pid>
and
kill -SIGUSR2 <pid>

What I found was rather strange.

No matter whether specifying GRND_NONBLOCK or not, signals do not 
interrupt the execution of getrandom() while reading from the 
/dev/urandom pool.

Only after getrandom has finished signals are handled.

I would have expected getrandom() to react to interrupts immediately and 
to return whatever number of random bytes have been collected before the 
interrupt.

A system call not reacting to interrupts for several seconds looks like 
a bug to me.

Tested on Linux 3.18.0-rc4 mips64.

Best regards

Heinrich Schuchardt



#define _GNU_SOURCE
#include <errno.h>
#include <linux/unistd.h>
#include <linux/random.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/syscall.h>
#include <sys/types.h>

#if _MIPS_SIM == _MIPS_SIM_ABI32
#define __NR_getrandom                  (__NR_Linux + 353)
#endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */

#if _MIPS_SIM == _MIPS_SIM_ABI64
#define __NR_getrandom                  (__NR_Linux + 313)
#endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */

#if _MIPS_SIM == _MIPS_SIM_NABI32
#define __NR_getrandom                  (__NR_Linux + 317)
#endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */

#ifdef __i386__
#define __NR_getrandom                  (355)
#endif /* __i386__ */

#ifdef __x86_64__
#define __NR_getrandom                  (318)
#endif /* __x86_64__ */

#define SYS_getrandom __NR_getrandom

#define GRND_NONBLOCK   0x0001
#define GRND_RANDOM     0x0002

#define BUFLEN 0x12345678

int getrandom(void *buf, size_t buflen, unsigned int flags)
{
         return syscall(SYS_getrandom, buf, buflen, flags);
}

/**
  * Handles signal.
  *
  * @param sig signal
  */


int do_print = 0;

static void hdl(int sig)
{
         if (sig == SIGUSR1) {
                 fprintf(stderr, "Main received SIGUSR1\n");
                 do_print = 1;
         }
}

int
main(int argc, char *argv[])
{

         char *buf;
         size_t buflen = BUFLEN;
         int ret;
         pid_t pid;
         // action to take when signal occurs
         struct sigaction act;
         // signal mask
         sigset_t blockset;


         pid = getpid();

         printf("PID = %u\n", pid);

         printf("__NR_getrandom = %u\n", __NR_getrandom);

         // Set handler for SIGUSR1
         act.sa_handler = hdl;
         sigemptyset(&act.sa_mask);
         act.sa_flags = 0;
         if (sigaction(SIGUSR1, &act, NULL)) {
                 perror("sigaction");
                 exit(EXIT_FAILURE);
         }

         buf = (char *) malloc(buflen);
         if (buf == NULL) {
                 perror("malloc");
                 exit(EXIT_FAILURE);
         }

         buf = (char *) malloc(buflen);

         for (;;) {
                 ret = getrandom(buf, buflen, GRND_NONBLOCK);
                 if (ret == -1) {
                         fprintf(stderr, "errno = %d\n", errno);
                         perror("getrandom");
                         exit(EXIT_FAILURE);
                 }
                 if (do_print) {
                         do_print = 0;
                         printf("ret = %d\n", ret);
                 }

         }
         printf("ret = %d\n", ret);

         free(buf);

         return EXIT_SUCCESS;
}

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
