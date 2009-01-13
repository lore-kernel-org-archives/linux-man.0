From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: waitid() return value strangeness when infop is NULL
Date: Wed, 14 Jan 2009 11:43:05 +1300
Message-ID: <cfd18e0f0901131443l3a3203c7le2cbbe9b45c0cc38@mail.gmail.com>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>
	 <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901131438n232ba114n27ea2d7964d071de-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Test program below.  Two test runs, of which the second shows the
behavior I'm reporting.

$ ./a.out
Created child with PID 7727
infop = 0xbfe608e0
waitid() returned 0
$ ./a.out n
Created child with PID 7729
infop = (nil)
waitid() returned 7729

===

#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>

int
main(int argc, char *argv[])
{
    siginfo_t info, *infop;
    int options, idtype;
    long s;
    pid_t child;

    child = fork();
    if (child == 0)
        exit(0);
    printf("Created child with PID %ld\n", (long) child);

    idtype = P_PID;
    options = WEXITED;
    infop = (argc > 1 && strchr(argv[1], 'n') != NULL) ? NULL : &info;

    printf("infop = %p\n", infop);

    s = syscall(SYS_waitid, idtype, child, infop, options, NULL);
    if (s == -1) {
        perror("waitid");
        exit(EXIT_FAILURE);
    }

    printf("waitid() returned %ld\n", s);

    exit(EXIT_SUCCESS);
}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
