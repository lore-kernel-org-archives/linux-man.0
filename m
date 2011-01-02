From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 26022] New: futimesat and utimensat handle NULL filenames
Date: Sun, 2 Jan 2011 02:44:27 GMT
Message-ID: <bug-26022-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=26022

           Summary: futimesat and utimensat handle NULL filenames
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
        Regression: No


if you pass futimesat or utimensat a NULL path, the functions will operate on
the fd as given.  in which case it can be either a fd for a directory or a
file.

for example, the two calls to futimesat() below will do the same thing:
#include <fcntl.h>
#include <stdio.h>
int main() {
    int fd = open("f", O_CREAT|O_RDWR, 0777);
    printf("futimesat = %i\n", futimesat(fd, NULL, NULL));
    printf("futimesat = %i\n", futimesat(AT_FDCWD, "f", NULL));
    return 0;
}

same behavior can be observed with utimensat(), but it seems only at the Linux
syscall level.  the POSIX/C library level will reject a NULL filename with
errno==EINVAL, but the Linux kernel will treat the dirfd as an fd.  funny
enough, while glibc rejects pathname==NULL at its ABI, it relies on the Linux
ABI to accept pathname==NULL while implementing other functions.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
