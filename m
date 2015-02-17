From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fork.2: child is created single threaded
Date: Tue, 17 Feb 2015 06:15:21 +0100
Message-ID: <54E2CE69.2020603@gmail.com>
References: <1424083364-6259-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424083364-6259-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

On 02/16/2015 11:42 AM, Heinrich Schuchardt wrote:
> This important information should not be hidden in a note.
> Instead it should be moved to the start of the man-page.

I'm not really convinced about this change:
* I think the info on threads is moderately prominent. fork()
  is complex in its details, and one does need to read the page
  in its entirety to grasp the (many) important pieces of info.
* Splitting that bullet-point about threads into two pieces leaves 
  the second piece a bit orphaned, I find.
* Introducing mention of gettid(2) clouds the issue. That's a
  different kind of thread (ID) than the one that is being discussed
  when referring to "threads" in this page.

Not applied.

Thanks,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fork.2 | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/fork.2 b/man2/fork.2
> index dce9bff..3329227 100644
> --- a/man2/fork.2
> +++ b/man2/fork.2
> @@ -53,6 +53,10 @@ The calling process is referred to as the
>  .I parent
>  process.
>  
> +The child process is created with a single thread,
> +which is a copy of the one that called
> +.BR fork ().
> +
>  The child process and the parent process run in separate memory spaces.
>  At the time of
>  .BR fork ()
> @@ -70,6 +74,9 @@ The child has its own unique process ID,
>  and this PID does not match the ID of any existing process group
>  .RB ( setpgid (2)).
>  .IP *
> +The child thread has its own unique thread ID
> +.RB ( gettid (2)).
> +.IP *
>  The child's parent process ID is the same as the parent's process ID.
>  .IP *
>  The child does not inherit its parent's memory locks
> @@ -152,9 +159,6 @@ the child must turn on any bits that it requires using
>  .PP
>  Note the following further points:
>  .IP * 3
> -The child process is created with a single thread\(emthe
> -one that called
> -.BR fork ().
>  The entire virtual address space of the parent is replicated in the child,
>  including the states of mutexes, condition variables,
>  and other pthreads objects; the use of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
