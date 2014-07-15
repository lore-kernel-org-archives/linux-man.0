From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 -- clarify PERF_SAMPLE_STACK_USER usage
Date: Tue, 15 Jul 2014 06:31:10 +0200
Message-ID: <53C4AE8E.2070604@gmail.com>
References: <alpine.DEB.2.11.1407132225330.15444@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1407132225330.15444-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/14/2014 04:29 AM, Vince Weaver wrote:
> 
> This clarifies the PERF_SAMPLE_STACK_USER section.  I found these issus
> while implementing some code that uses the option.  The important change
> is fixing the name of the sample_stack_user parameter, the rest is just
> some wording fixes and minor clarifications.

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 47e9984..4c54b6b 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1885,13 +1885,15 @@ bit mask.
>  .IR size ", " data[size] ", " dyn_size
>  If
>  .B PERF_SAMPLE_STACK_USER
> -is enabled, then record the user stack to enable backtracing.
> +is enabled, then the user stack is recorded.
> +This can be used to generate stack backtraces.
>  .I size
>  is the size requested by the user in
> -.I stack_user_size
> +.I sample_stack_user
>  or else the maximum record size.
>  .I data
> -is the stack data.
> +is the stack data (a raw dump of the memory pointed to by the
> +stack pointer at the time of sampling).
>  .I dyn_size
>  is the amount of data actually dumped (can be less than
>  .IR size ).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
