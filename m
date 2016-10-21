From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH][manpages 1/2] perf_event_open.2: Document
 PERF_EVENT_IOC_PAUSE_OUTPUT
Date: Fri, 21 Oct 2016 10:56:52 +0200
Message-ID: <d969b424-f69a-a96b-d676-5d0b8d9a3d8e@gmail.com>
References: <1459147292-239310-2-git-send-email-wangnan0@huawei.com>
 <1459160147-240738-1-git-send-email-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459160147-240738-1-git-send-email-wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vince-yfjdyHUqu3OsTnJN9+BGXg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pi3orama-9Onoh4P/yGk@public.gmane.org, lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks for this patch, Wangnan.

Vince, do you have any comments?

Cheers,

Michael


On 03/28/2016 12:15 PM, Wang Nan wrote:
> Signed-off-by: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  man2/perf_event_open.2 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index c90fc51..b232cba 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2719,6 +2719,17 @@ The argument is a BPF program file descriptor that was created by
>  a previous
>  .BR bpf (2)
>  system call.
> +.TP
> +.BR PERF_EVENT_IOC_PAUSE_OUTPUT " (since Linux 4.6)"
> +.\" commit ? (http://lkml.kernel.org/g/1459147292-239310-2-git-send-email-wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org)
> +This allows pausing and resuming the event's ring-buffer. A
> +paused ring-buffer does not prevent samples generation, but simply
> +discards them. The discarded samples are considered lost, causes
> +.BR PERF_RECORD_LOST
> +to be generated when possible.
> +
> +The argument is an integer. Nonzero value pauses the ring-buffer,
> +zero value resumes the ring-buffer.
>  .SS Using prctl
>  A process can enable or disable all the event groups that are
>  attached to it using the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
