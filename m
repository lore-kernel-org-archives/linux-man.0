From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getcwd.3: behavior for unreachable cwd
Date: Mon, 06 Apr 2015 16:22:50 +0200
Message-ID: <552296BA.9020609@gmail.com>
References: <20150405154448.GA18678@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150405154448.GA18678-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jann,

On 04/05/2015 05:44 PM, Jann Horn wrote:
> For the code that does this, see fs/dcache.c, search for
> "prepend_unreachable".

Thanks! Great patch! And thanks also for including the test code.

I added one detail: this behavior was added in 2.6.36. Generally,
it's useful to include the version where a behavior appeared.
Also, I added the commit hash into the page source as a comment (that's
often handy for future reference when editing the pages). See my commit 
2b1f1a35b5 [1].

Cheers,

Michael

[1] http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=2b1f1a35b5f2d21fd6653b4cd4cb93f095e4b398

> repro testcase:
> 
> $ cat getcwd.c
> #define _GNU_SOURCE
> #include <sched.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <limits.h>
> #include <stdlib.h>
> 
> int main(void) {
>   unshare(CLONE_NEWUSER | CLONE_NEWNS);
>   chdir("/usr");
>   chroot("bin");
> 
>   printf("current directory: \"%s\"\n", get_current_dir_name());
> 
>   char *real = realpath(".", NULL);
>   printf("realpath of .: \"%s\"\n", real ? real : "{none}");
>   real = realpath("../home/jann/.ssh", NULL);
>   printf("realpath of path: \"%s\"\n", real ? real : "{none}");
> 
>   return 0;
> }
> $ cat getcwd_test.c
> #define _GNU_SOURCE
> #include <sched.h>
> #include <unistd.h>
> #include <stdio.h>
> 
> int main(void) {
>   unshare(CLONE_NEWUSER | CLONE_NEWNS);
>   chdir("/usr");
>   chroot("bin");
>   printf("current directory: \"%s\"\n", get_current_dir_name());
>   return 0;
> }
> $ gcc -o getcwd_test getcwd_test.c -Wall
> $ ./getcwd_test
> current directory: "(unreachable)/usr"
> 
> realpath.3 doesn't currently seem to handle this
> case in a sane way, so I'm not going to document
> its behavior yet. I'll report that as a bug instead.
> ---
>  man3/getcwd.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/getcwd.3 b/man3/getcwd.3
> index a1f7e2a..6a98b82 100644
> --- a/man3/getcwd.3
> +++ b/man3/getcwd.3
> @@ -80,6 +80,19 @@ The pathname is returned as the function result and via the argument
>  .IR buf ,
>  if present.
>  
> +If the current directory is not below the root directory of the current
> +process (e.g. because the process set a new filesystem root
> +using
> +.BR chroot (2)
> +without changing its current directory into the new root), the returned
> +path will be prefixed with the string "(unreachable)". Such behavior can
> +also be caused by an unprivileged user by changing the current directory
> +into another mount namespace.
> +When dealing with paths from untrusted sources, callers of these
> +functions should consider checking whether the returned path starts
> +with '/' or '(' to avoid misinterpreting an unreachable path
> +as a relative path.
> +
>  The
>  .BR getcwd ()
>  function copies an absolute pathname of the current working directory
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
