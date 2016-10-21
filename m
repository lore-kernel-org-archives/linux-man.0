From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 1/2] perf_event_open.2: Document
 PERF_EVENT_IOC_PAUSE_OUTPUT
Date: Fri, 21 Oct 2016 17:16:22 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610211710440.16183@macbook-air>
References: <1477049893-143199-1-git-send-email-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477049893-143199-1-git-send-email-wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pi3orama-9Onoh4P/yGk@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 21 Oct 2016, Wang Nan wrote:


> -.SS Using prctl(2)
> +.SS Using prctl

why this change?

> +.BR PERF_EVENT_IOC_PAUSE_OUTPUT " (since Linux 4.7)"
> +.\" commit 86e7972f690c1017fd086cdfe53d8524e68c661c
> +This allows pausing and resuming the event's ring-buffer. A
> +paused ring-buffer does not prevent samples generation, but simply
> +discards them. The discarded samples are considered lost, causes
> +.BR PERF_RECORD_LOST
> +to be generated when possible.

I don't know if it's worth mentioning that the reason to add this is to 
allow reading the ring-buffer without having to worry about data being
overwritten.

There are a few odd wording choices (mostly plural nouns) but otherwise 
looks fine to me.

Reviewed-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
