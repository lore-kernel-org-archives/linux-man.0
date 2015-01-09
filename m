From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 clarify the PERF_FLAG_FD_* flags
Date: Fri, 09 Jan 2015 14:15:20 +0100
Message-ID: <54AFD468.2020609@gmail.com>
References: <alpine.DEB.2.11.1501081201020.25399@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1501081201020.25399-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xmtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Vince,

On 01/08/2015 06:04 PM, Vince Weaver wrote:
> 
> This change clarifies the behavior of the PERF_FLAG_FD_OUTPUT and
> PERF_FLAG_FD_NO_GROUP flags to perf_event_open(), and removes
> the related FIXME comments.

Patch applied. Thank you!

> While writing tests to validate the behavior of these flags I
> discovered that PERF_FLAG_FD_OUTPUT has been broken since the
> 2.6.35 kernel release.

Sigh!

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 8bde791..7181c29 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -149,14 +149,17 @@ then
>  .BR execve (2).
>  .TP
>  .BR PERF_FLAG_FD_NO_GROUP
> -.\" FIXME . The following sentence is unclear
> -This flag allows creating an event as part of an event group but
> -having no group leader.
> -It is unclear why this is useful.
> -.\" FIXME . So, why is it useful?
> -.TP
> -.BR PERF_FLAG_FD_OUTPUT
> -This flag reroutes the output from an event to the group leader.
> +This flag tells the event to ignore the
> +.IR group_fd
> +parameter except for the purpose of setting up output redirection
> +using the
> +.B PERF_FLAG_FD_OUTPUT
> +flag.
> +.TP
> +.BR PERF_FLAG_FD_OUTPUT " (broken since Linux 2.6.35)."
> +This flag re-routes the event's sampled output to instead
> +be included in the mmap buffer of the event specified by
> +.IR group_fd .
>  .TP
>  .BR PERF_FLAG_PID_CGROUP " (since Linux 2.6.39)."
>  This flag activates per-container system-wide monitoring.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
