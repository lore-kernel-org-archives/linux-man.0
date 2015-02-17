From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] perf_event_open.2: Clarify PERF_EVENT_IOC_REFRESH behavior
Date: Tue, 17 Feb 2015 06:34:45 +0100
Message-ID: <54E2D2F5.2020100@gmail.com>
References: <alpine.DEB.2.11.1502121212360.18451@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1502121212360.18451@vincent-weaver-1.umelst.maine.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-man@vger.kernel.org

On 02/12/2015 06:14 PM, Vince Weaver wrote:
> 
> Currently the PERF_EVENT_IOC_REFRESH ioctl, when applied to a group
> leader, will refresh all children.  Also if a refresh value of 0
> is chosen then the refresh becomes infinite (never runs out).
> Back in 2011 PAPI was relying on these behaviors but I was told
> that both were unsupported and subject to being removed at any time.
>    (See https://lkml.org/lkml/2011/5/24/337 )
> However the behavior has not been changed.  

Thanks, Vince. Applied.

Cheers,

Michael


> This patch updates the manpage to still list the behavior as
> unsupported, but removes the innacurate description of it 
> only being a problem with 2.6 kernels.
> 
> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 39c8d8c..76136e2 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2353,6 +2353,12 @@ once the counter reaches 0
>  is indicated and
>  the underlying event is disabled.
>  
> +Refreshing an event group leader refreshes all siblings and
> +refreshing with a parameter of 0 currently enables infinite
> +refreshes;
> +these behaviors are unsupported and should not be relied on.
> +.\" See https://lkml.org/lkml/2011/5/24/337
> +
>  Starting with Linux 3.18,
>  .\" commit 179033b3e064d2cd3f5f9945e76b0a0f0fbf4883
>  .B POLL_HUP
> @@ -2805,11 +2811,6 @@ Prior to Linux 2.6.35,
>  .B PERF_FORMAT_GROUP
>  did not work with attached processes.
>  
> -In older Linux 2.6 versions,
> -refreshing an event group leader refreshed all siblings,
> -and refreshing with a parameter of 0 enabled infinite refresh.
> -This behavior is unsupported and should not be relied on.
> -
>  There is a bug in the kernel code between
>  Linux 2.6.36 and Linux 3.0 that ignores the
>  "watermark" field and acts as if a wakeup_event
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
