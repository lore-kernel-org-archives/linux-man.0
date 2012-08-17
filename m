From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 40852] select(2): document action of close()'ing a fd during a
 select()
Date: Fri, 17 Aug 2012 05:45:03 +0000 (UTC)
Message-ID: <20120817054503.B76CB11FC6B@bugzilla.kernel.org>
References: <bug-40852-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-40852-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=40852


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-08-17 05:45:03 ---
Confirmed, with the program below.

#include <sys/time.h>
#include <pthread.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

#define errExit(msg)     do { perror(msg); exit(EXIT_FAILURE); \
            } while (0)

#define errExitEN(en, msg) \
                do { errno = en; perror(msg); \
                     exit(EXIT_FAILURE); } while (0)

static void *
threadFunc(void *arg)
{
    sleep(2);

    printf("Closing file descriptor\n");
    close(STDIN_FILENO);

    return NULL;
} /* threadFunc */

int
main(int argc, char *argv[])
{
    pthread_t t1;
    fd_set readfds;
    int ready, s;

    FD_ZERO(&readfds);
    FD_SET(STDIN_FILENO, &readfds);

    s = pthread_create(&t1, NULL, threadFunc, (void *) 1);
    if (s != 0)
    errExitEN(s, "pthread_create");

    printf("Main thread about to call select()\n");

    ready = select(STDIN_FILENO + 1, &readfds, NULL, NULL, NULL);
    if (ready == -1)
    errExit("select");

    s = pthread_join(t1, NULL);
    if (s != 0)
    errExitEN(s, "pthread_join");

    printf("Main thread exiting\n");

    exit(EXIT_SUCCESS);
}

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
