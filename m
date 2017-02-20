From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): clarify /proc/pid/environ behavior
Date: Mon, 20 Feb 2017 15:16:08 +0100
Message-ID: <a6982b2f-7cd6-ad1d-d375-0a41ab539084@gmail.com>
References: <20170215221654.10293-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215221654.10293-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 02/15/2017 11:16 PM, Mike Frysinger wrote:
> From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Make sure people don't try to rely on this when there are no guarantees
> the target process respects it.
> 
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/proc.5 | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 0a3503f99360..89a7c09ad5af 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -477,7 +477,7 @@ check; see
>  .BR ptrace (2).
>  .TP
>  .I /proc/[pid]/environ
> -This file contains the environment for the process.
> +This file contains the initial environment for the process.
>  The entries are separated by null bytes (\(aq\\0\(aq),
>  and there may be a null byte at the end.
>  Thus, to print out the environment of process 1, you would do:
> @@ -488,6 +488,19 @@ Thus, to print out the environment of process 1, you would do:
>  .fi
>  .in
>  
> +Once a process starts modifying its environment
> +(e.g. by calling functions such as
> +.BR putenv (3)
> +or modifying the
> +.BR environ (7)
> +variable directly),
> +this file will not be kept up to date.
> +
> +Further, a process may change the memory this points to by calling
> +.BR prctl (2)
> +and using operations such as
> +.BR PR_SET_MM_ENV_START .
> +
>  Permission to access this file is governed by a ptrace access mode
>  .B PTRACE_MODE_READ_FSCREDS
>  check; see

Thanks! Patch applied. I tweaked somewhat, in particular to further clarify
the file content is set at execve(2) time. Does the following look okay
to you?

       /proc/[pid]/environ
              This  file  contains  the  initial environment that was set
              when  the  currently  executing  program  was  started  via
              execve(2).  The entries are separated by null bytes ('\0'),
              and there may be a null byte at the end.   Thus,  to  print
              out the environment of process 1, you would do:

                  $ strings /proc/1/environ

              If,  after  an execve(2), the process modifies its environ‐
              ment (e.g., by calling functions such as putenv(3) or modi‐
              fying the environ(7) variable directly), this file will not
              reflect those changes.

              Furthermore, a process may change the memory location  that
              this   file   refers   via   prctl(2)  operations  such  as
              PR_SET_MM_ENV_START.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
