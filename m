From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 74481] It should be documented that using fexecve on a file
 opened in O_CLOEXEC that is a script cannot possibly work.
Date: Sun, 20 Apr 2014 05:55:25 +0000
Message-ID: <bug-74481-11311-xPL9d25XLg@https.bugzilla.kernel.org/>
References: <bug-74481-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-74481-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=74481

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
On 04/20/2014 04:36 AM, bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=74481
> 
>             Bug ID: 74481
>            Summary: It should be documented that using fexecve on a file
>                     opened in O_CLOEXEC that is a script cannot possibly
>                     work.
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: man-pages
>           Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
>           Reporter: sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org
>         Regression: No
> 
> Consider the following program:
> 
> #include <errno.h>
> #include <fcntl.h>
> #include <unistd.h>
> 
> int main()
> {
>     int test = open("./test.sh", O_RDONLY | O_CLOEXEC);
>     if (-1 == test) {
>         perror("open");
>     }
> 
>     char * const argv[] = {
>         (char *) "./test.sh",
>         NULL
>     };
>     char * const env[] = { NULL };
>     fexecve(test, argv, env);
>     perror("fexecve");
> 
>     return 0;
> }
> 
> and the following script:
> 
> #! /usr/bin/env dash
> 
> echo 'hello world!'
> 
> When the C program is run, it cannot work because by the time the interpreter
> has the passed in file name "/proc/self/fd/${FD}" it has already been closed.
> This is a strange corner case that should be documented.

Agreed. I added the text below, under NOTES.

Thanks for the report, Steven.

Cheers,

Michael

If
.I fd
is a file descriptor that refers to an interpreter script
and has been marked as close-on-exec (see the discussion of the
.BR FD_CLOEXEC
in
.BR fcntl (2)),
.BR fexecve ()
will fail to execute the script, since,
by the time the script interpreter tries to access the script file,
.I fd
has already been closed.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
