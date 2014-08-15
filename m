From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] perf_event_open.2: document new comm_exec flag
Date: Fri, 15 Aug 2014 21:20:36 +0200
Message-ID: <53EE5D84.5050809@gmail.com>
References: <alpine.DEB.2.11.1408061401400.1325@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1408061401400.1325-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/06/2014 08:02 PM, Vince Weaver wrote:
> 
> 
> Linux 3.16 (more specifically, commit 82b897782d10fcc4 )
> added support for differentiating between process renames
> caused by exec versus those caused by other methods.

Thanks, Vince. I've applied this. One question below.

> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index d558379..cb15428 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -226,7 +226,8 @@ struct perf_event_attr {
>            exclude_callchain_user   : 1,
>                                  /* exclude user callchains */
>            mmap2          :  1,  /* include mmap with inode data */
> -          __reserved_1   : 40;
> +          comm_exec      :  1,  /* flag comm events that are due to exec */
> +          __reserved_1   : 39;
>  
>      union {
>          __u32 wakeup_events;    /* wakeup every n events */
> @@ -861,9 +862,16 @@ bit enables tracking of process command name as modified by the
>  .BR exec (2)
>  and
>  .BR prctl (PR_SET_NAME)
> -system calls.
> -Unfortunately for tools,
> -there is no way to distinguish one system call versus the other.
> +system calls as well as writing to
> +.IR /proc/self/comm .
> +If the additional
> +.I comm_exec
> +flag can be set (starting with Linux 3.16)

Would that last line be better as:

    flag is set (possible since Linux 3.16)

?

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
