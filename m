From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 13569] New: Examples in some pages make invalid use of the
 assert macro
Date: Thu, 18 Jun 2009 15:10:26 GMT
Message-ID: <bug-13569-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13569

           Summary: Examples in some pages make invalid use of the assert
                    macro
           Product: Documentation
           Version: unspecified
    Kernel Version: n/a
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: andrey.vihrov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


The purpose of the assert macro, defined in <assert.h>, is to provide a tool to
check for programming mistakes or program logic errors. However, the assert
macro must never be used to perform checks for run time errors, since, with the
NDEBUG macro defined, expressions within the assert macro invocations are not
evaluated/checked for, resulting in behavior that was not originally intended.

Currently (man-pages 3.20, Gentoo Linux), some pages contain example programs
that use assert to check for run time errors, specifically, like this:

#include <assert.h>

int main (int argc, char *argv[])
{
    assert(argc == 2); /* Check for argc value was intended */
}

The proper way to do this is without assert, for example, like this:

#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "invalid parameter count\n");
        exit(EXIT_FAILURE);       
    }
}

The pages affected in the core package are

execve(2)
pipe(2)
tee(2)
fmemopen(3)
mq_notify(3)
qsort(3)

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
