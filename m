From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 73301] New: Documentation misses case of symlink, symlinkat
 giving ENOENT for a directory with a reference only held by a process
Date: Mon, 31 Mar 2014 19:09:23 +0000
Message-ID: <bug-73301-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73301

            Bug ID: 73301
           Summary: Documentation misses case of symlink, symlinkat giving
                    ENOENT for a directory with a reference only held by a
                    process
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org
        Regression: No

The errors printed out by the following code on symlink and symlinkat are
missed by the documentation.

#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    if (-1 == mkdir("/tmp/temporary", S_IRWXU)) {
        perror("mkdir");
    }

    int dir = open("/tmp/temporary", O_RDONLY | O_CLOEXEC);
    if (-1 == dir) {
        perror("open");
    }

    if (-1 == rmdir("/tmp/temporary")) {
        perror("rmdir");
    }

    if (-1 == symlinkat("/", dir, "root")) {
        perror("symlinkat");
    }

    char template_text[] = "/proc/self/fd/XXXXXXXXXXX/root";
    sprintf(template_text, "/proc/self/fd/%i/root", dir);
    if (-1 == symlink("/", template_text)) {
        perror("symlink");
    }

    return 0;
}

The calls to symlink and symlinkat in this case give ENOENT errors. This might
also be a small oversight which is probably impossible to change now. I wonder
if the code thinks this is a dangling symbolic link (a case which is mentioned
by the documentation)?

The POSIX standard issue 7 also seems to miss this corner case (although it
might simply be an omission of mentioning a system dependant case rather than a
bug for the POSIX standard).

I'm not sure how exactly one would explain this corner case in the
documentation.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
