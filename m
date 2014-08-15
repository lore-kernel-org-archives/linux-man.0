From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] perf_event_open.2: document PERF_SAMPLE_BRANCH_COND
Date: Fri, 15 Aug 2014 21:02:58 +0200
Message-ID: <53EE5962.3050600@gmail.com>
References: <alpine.DEB.2.11.1408061359270.1325@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1408061359270.1325-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Anshuman Khandual <khandual-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/06/2014 08:00 PM, Vince Weaver wrote:
> 
> Linux 3.16 (more specifically, commit bac52139f0b7ab31330 )
> adds support for gathering PERF_SAMPLE_BRANCH_COND
> conditional branch values when doing PERF_SAMPLE_BRANCH_STACK 
> sampling.

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 8004b0e..e8449fd 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1107,6 +1107,9 @@ Any return branch.
>  .B PERF_SAMPLE_BRANCH_IND_CALL
>  Indirect calls.
>  .TP
> +.BR PERF_SAMPLE_BRANCH_COND " (since Linux 3.16)"
> +Conditional branches.
> +.TP
>  .BR PERF_SAMPLE_BRANCH_ABORT_TX " (since Linux 3.11)"
>  Transactional memory aborts.
>  .TP
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
