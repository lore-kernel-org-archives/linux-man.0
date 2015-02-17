From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: Exclude_hv clarification
Date: Tue, 17 Feb 2015 06:32:34 +0100
Message-ID: <54E2D272.1080607@gmail.com>
References: <alpine.DEB.2.11.1502111402140.16882@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1502111402140.16882-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Paul Mackerass,

Would you be willing to review/comment on Vince's patch, please.

Cheers,

Michael

On 02/11/2015 08:04 PM, Vince Weaver wrote:
> 
> This manpage patch relates to the exclude_hv bit added to the kernel
> in the following commit:
> 
>     exclude_hv; Linux 2.6.31
>         commit 0475f9ea8e2cc030298908949e0d5da9f2fc2cfe
>         Author: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> 
>             perf_counters: allow users to count user, kernel and/or hypervisor events
> 
>             Signed-off-by: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> 
> The updated manpage text points out that the exclude_hv 
> "exclude hypervisor" bit only applies on hardware that 
> supports this  feature (such as PowerPC)
> and is silently ignored on other platforms such as x86.
> 
> This is a resend of the patch; the previous time I sent it
> (http://thread.gmane.org/gmane.linux.man/7500) it did not
> receive any comments.
> 
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 39c8d8c..665aa31 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -856,10 +856,9 @@ If this bit is set, the count excludes events that happen in kernel-space.
>  .IR "exclude_hv"
>  If this bit is set, the count excludes events that happen in the
>  hypervisor.
> -This is mainly for PMUs that have built-in support for handling this
> -(such as POWER).
> -Extra support is needed for handling hypervisor measurements on most
> -machines.
> +This is mainly for PMUs that have built-in hardware support
> +for this feature (such as POWER; this setting is silently
> +ignored on x86).
>  .TP
>  .IR "exclude_idle"
>  If set, don't count when the CPU is idle.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
