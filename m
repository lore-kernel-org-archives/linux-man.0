From: Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: FASYNC + dup + close gives the wrong fd in SIGIO
Date: Tue, 3 Feb 2009 23:46:40 +0100
Message-ID: <19f34abd0902031446r617fd29cmf60e9409564fa58b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

There seems to be a small deficiency in the O_ASYNC/FASYNC
implementation. When the flag is set for a file descriptor, it does
not "follow" the fd across dup()+close(), so the SIGIO handler will
get the ->si_fd for the fd at the time when O_ASYNC was set. For
example:

pipe([3, 4])                            = 0
getpid()                                = 23982
fcntl(3, F_SETOWN, 23982)               = 0
fcntl(3, F_SETSIG, 0x1d)                = 0
fcntl(3, F_SETFL, O_RDONLY|O_ASYNC)     = 0
dup(3)                                  = 5
close(3)                                = 0
write(4, "\0"..., 1)                    = 1
--- SIGIO (I/O possible) @ 0 (0) ---
[...]
SIGIO for fd 3

It seems a bit obscure, I agree, but I thought I'd mention it. Maybe
the fcntl() man page could carry this extra information?

Here's my test case:

#define _GNU_SOURCE

#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static int done = 0;

static void handle_sigio(int signo, siginfo_t *info, void *unused)
{
        printf("SIGIO for fd %d\n", info->si_fd);
        done = 1;
}

int main(void)
{
        struct sigaction act;
        int pipe_fd[2];

        memset(&act, 0, sizeof(act));
        act.sa_sigaction = &handle_sigio;
        act.sa_flags = SA_SIGINFO;
        sigaction(SIGIO, &act, NULL);

        pipe(pipe_fd);
        fcntl(pipe_fd[0], F_SETOWN, getpid());
        fcntl(pipe_fd[0], F_SETSIG, SIGIO);
        fcntl(pipe_fd[0], F_SETFL, O_ASYNC);
        dup(pipe_fd[0]);
        close(pipe_fd[0]);

        write(pipe_fd[1], "", 1);

        while (!done)
                sleep(1);

        return 0;
}



Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
