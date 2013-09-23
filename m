From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 61911] New: incorrect sentence in the description of struct
 pollfd's events field
Date: Mon, 23 Sep 2013 11:45:00 +0000
Message-ID: <bug-61911-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=61911

            Bug ID: 61911
           Summary: incorrect sentence in the description of struct
                    pollfd's events field
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: bonzini-mXXj517/zsQ@public.gmane.org
        Regression: No

The manual page says:

The field events is an input parameter, a bit mask specifying the events the
application is interested  in  for  the  file descriptor fd.  If this field is
specified as zero, then all events are ignored for fd and revents returns zero.


However, this is not what happens.  POLLHUP and POLLERR are always reported (as
one would expect, actually).

Test case 1:

#include <poll.h>
int main(void)
{
    struct pollfd pfd = { .fd = 0 };
    sleep(1);
    poll(&pfd, 1, 0);
}

$ echo x > fifo & strace -e poll ./a.out < fifo
poll([{fd=0, events=0}], 1, 0) = 1 ([{fd=0, revents=POLLHUP}])


Test case 2:

#include <poll.h>
int main(void)
{
    struct pollfd pfd = { .fd = 1 };
    sleep(1);
    poll(&pfd, 1, 0);
}


$ :< fifo & strace -e poll ./a.out > fifo
poll([{fd=1, events=0}], 1, 0) = 1 ([{fd=1, revents=POLLERR}])

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
