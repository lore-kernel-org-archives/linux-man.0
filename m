From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fork.2: EAGAIN is not reported when task allocation fails
Date: Tue, 03 Feb 2015 17:48:40 +0100
Message-ID: <54D0FBE8.9040307@gmail.com>
References: <20150203154837.GC8907@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150203154837.GC8907-2MMpYkNvuYDjFM9bn6wA6Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/03/2015 04:48 PM, Michal Hocko wrote:
> Hi,
> I am not sure why we have:
> "
> EAGAIN fork() cannot allocate sufficient memory to copy the parent's
> page tables and allocate a task structure for the child.
> "
> but it doesn't seem to reflect the reality. The text seems to be there
> from the time when man-pages were moved to git so there is no history
> for it. Unless I am missing something we need the patch below.
> 
> Thanks!

Thanks, Michal. Applied.

Cheers,

Michael


> ---
>>From 9d56f4b46d604fc52aed6d87aac8fa5719ede058 Mon Sep 17 00:00:00 2001
> From: Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>
> Date: Tue, 3 Feb 2015 16:34:45 +0100
> Subject: [PATCH] fork.2: EAGAIN is not reported when task allocation fails
> 
> The man page currently claims:
> "
> EAGAIN fork() cannot allocate sufficient memory to copy the parent's
> page tables and allocate a task structure for the child.
> "
> 
> but the kernel reports both dup_task_struct and dup_mm failures as
> ENOMEM to the userspace. This seems to be the case from early 2.x times
> so let's simply remove this part.
> 
> Signed-off-by: Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/fork.2 | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/man2/fork.2 b/man2/fork.2
> index e6695ade6f76..6aa91a93e545 100644
> --- a/man2/fork.2
> +++ b/man2/fork.2
> @@ -185,11 +185,6 @@ is set appropriately.
>  .SH ERRORS
>  .TP
>  .B EAGAIN
> -.BR fork ()
> -cannot allocate sufficient memory to copy the parent's page tables and
> -allocate a task structure for the child.
> -.TP
> -.B EAGAIN
>  \" NOTE! The following should match the description in pthread_create(3)
>  A system-imposed limit on the number of threads was encountered.
>  There are a number of limits that may trigger this error: the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
