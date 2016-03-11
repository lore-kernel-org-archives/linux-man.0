From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 104601] Description of getname-related syscalls wrong
Date: Fri, 11 Mar 2016 20:28:42 +0000
Message-ID: <bug-104601-11311-3GYA5jKRJO@https.bugzilla.kernel.org/>
References: <bug-104601-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-104601-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=104601

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
In my tests, getsockname *does* do truncation if the length argument is smaller
than the address size.

Please post a *minimal* working example that demonstrates otherwise.

My example is below. Here are two sample runs:

$ ./a.out 
returned len = 16
 0: <0x2>
 1: <0x0>
 2: <0x15>
 3: <0xb3>
 4: <0x0>
 5: <0x0>
 6: <0x0>
 7: <0x0>
 8: <0x0>
 9: <0x0>
10: <0x0>
11: <0x0>
12: <0x0>
13: <0x0>
14: <0x0>
15: <0x0>
16: <0xff>
17: <0xff>
18: <0xff>
19: <0xff>
$ ./a.out 8
returned len = 16
 0: <0x2>
 1: <0x0>
 2: <0x15>
 3: <0xb3>
 4: <0x0>
 5: <0x0>
 6: <0x0>
 7: <0x0>
 8: <0xff>
 9: <0xff>
10: <0xff>
11: <0xff>
12: <0xff>
13: <0xff>
14: <0xff>
15: <0xff>
16: <0xff>
17: <0xff>
18: <0xff>
19: <0xff>

One can see that truncation has occurred in the second run, were a short length
argument was supplied to getsockname().



#define _GNU_SOURCE
#include <netdb.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                        } while (0)

#define fatal(msg)      do { fprintf(stderr, "%s\n", msg); \
                             exit(EXIT_FAILURE); } while (0)

#define usageErr(msg, progName) \
                        do { fprintf(stderr, "Usage: "); \
                             fprintf(stderr, msg, progName); \
                             exit(EXIT_FAILURE); } while (0)

int
main(int argc, char *argv[])
{
    int lfd, optval;
    struct addrinfo hints;
    struct addrinfo *result, *rp;

    /* Call getaddrinfo() to obtain a list of addresses that
       we can try binding to */

    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_canonname = NULL;
    hints.ai_addr = NULL;
    hints.ai_next = NULL;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_family = AF_UNSPEC;        /* Allows IPv4 or IPv6 */
    hints.ai_flags = AI_PASSIVE | AI_NUMERICSERV;
                        /* Wildcard IP address; service name is numeric */

    if (getaddrinfo(NULL, "5555", &hints, &result) != 0)
        errExit("getaddrinfo");

    /* Walk through returned list until we find an address structure
       that can be used to successfully create and bind a socket */

    optval = 1;
    for (rp = result; rp != NULL; rp = rp->ai_next) {
        lfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
        if (lfd == -1)
            continue;                   /* On error, try next address */

        if (setsockopt(lfd, SOL_SOCKET, SO_REUSEADDR, &optval, sizeof(optval))
                == -1)
             errExit("setsockopt");

        if (bind(lfd, rp->ai_addr, rp->ai_addrlen) == 0)
            break;                      /* Success */

        /* bind() failed: close this socket and try next address */

        close(lfd);
    }

    if (rp == NULL)
        fatal("Could not bind socket to any address");

    freeaddrinfo(result);

    struct sockaddr_storage saddr;
    socklen_t len;

    /* Preinitialize address structure with visually distinctive bytes */

    memset(&saddr, 0xff, sizeof(saddr));

    /* By default, we'll use the size of 'struct sockaddr' as the length
       argument for getsockname(). The user can override this by
       specifying a lengh value on the command line */

    len = sizeof(saddr);
    if (argc > 1)
        len = atoi(argv[1]);

    if (getsockname(lfd, (struct sockaddr *) &saddr, &len) == -1)
        errExit("getsockname");

    printf("returned len = %ld\n", (long) len);
    int j;
    unsigned char c;

    /* Inspect bytes in returned structure */

    for (j = 0; j < 20; j++) {
        c = (((char *) &saddr) [j]);
        printf("%2d: <0x%x>\n", j, c);
    }

}

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
