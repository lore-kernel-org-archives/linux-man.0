From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 73301] Documentation misses case of link, linkat, symlink,
 symlinkat giving ENOENT for a directory with a reference only held by a
 process
Date: Fri, 02 May 2014 13:11:30 +0000
Message-ID: <bug-73301-11311-jhQb1VYGd3@https.bugzilla.kernel.org/>
References: <bug-73301-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-73301-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73301

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Steven,

(In reply to Steven Stewart-Gallus from comment #0)
> The errors printed out by the following code on symlink and symlinkat are
> missed by the documentation.
> 
> #include <fcntl.h>
> #include <stdio.h>
> #include <sys/stat.h>
> #include <sys/types.h>
> #include <unistd.h>
> 
> int main() {
>     if (-1 == mkdir("/tmp/temporary", S_IRWXU)) {
>         perror("mkdir");
>     }
> 
>     int dir = open("/tmp/temporary", O_RDONLY | O_CLOEXEC);
>     if (-1 == dir) {
>         perror("open");
>     }
> 
>     if (-1 == rmdir("/tmp/temporary")) {
>         perror("rmdir");
>     }
> 
>     if (-1 == symlinkat("/", dir, "root")) {
>         perror("symlinkat");
>     }

So far, so good.

>     char template_text[] = "/proc/self/fd/XXXXXXXXXXX/root";
>     sprintf(template_text, "/proc/self/fd/%i/root", dir);
>     if (-1 == symlink("/", template_text)) {
>         perror("symlink");
>     }

I'm a little puzzled, why would one want to make a symlink somewhere under
/proc?

> 
>     return 0;
> }
> 
> The calls to symlink and symlinkat in this case give ENOENT errors. 

For symlinkat(), I can see the logic. You're trying to create a link relative
to a directory that does not exist. Could the call reasonably do anything other
than fail?

> This
> might also be a small oversight which is probably impossible to change now.
> I wonder if the code thinks this is a dangling symbolic link (a case which
> is mentioned by the documentation)?
> 
> The POSIX standard issue 7 also seems to miss this corner case (although it
> might simply be an omission of mentioning a system dependant case rather
> than a bug for the POSIX standard).

The specs in POSIX were driven from the Linux implementation effort, so I don;t
think that your hypothesis there would fit.

> I'm not sure how exactly one would explain this corner case in the
> documentation.

I'd be willing to give it a shot, but, first,I'm not sure what if anything to
say about the symlink() case. Do you have a more realistic example of that
case?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
