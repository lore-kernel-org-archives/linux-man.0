From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] perf_event_open.2: Document
 PERF_EVENT_IOC_PAUSE_OUTPUT
Date: Sat, 22 Oct 2016 12:02:55 +0200
Message-ID: <f9a3ec96-faf8-8d97-7a14-23f2eb49354c@gmail.com>
References: <1477049893-143199-1-git-send-email-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477049893-143199-1-git-send-email-wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pi3orama-9Onoh4P/yGk@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Wang Nan

Thanks for this patch! A few comments below.

On 10/21/2016 01:38 PM, Wang Nan wrote:
> Linux 4.7 (86e7972f690c1017fd086cdfe53d8524e68c661c) introduces
> PERF_EVENT_IOC_PAUSE_OUTPUT feature. Document it.
> 
> Signed-off-by: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/perf_event_open.2 | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index fade28c..2d3acad 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2865,7 +2865,18 @@ The argument is a BPF program file descriptor that was created by
>  a previous
>  .BR bpf (2)
>  system call.
> -.SS Using prctl(2)
> +.TP
> +.BR PERF_EVENT_IOC_PAUSE_OUTPUT " (since Linux 4.7)"
> +.\" commit 86e7972f690c1017fd086cdfe53d8524e68c661c
> +This allows pausing and resuming the event's ring-buffer. A
> +paused ring-buffer does not prevent samples generation, but simply

s/samples generation/generation of samples/

> +discards them. The discarded samples are considered lost, causes

s/them/the samples/

s/causes/causing/

> +.BR PERF_RECORD_LOST
> +to be generated when possible.
> +
> +The argument is an integer. Nonzero value pauses the ring-buffer,

s/Nonzero/a nonzero/

> +zero value resumes the ring-buffer.

s/zero value/zero/

> +.SS Using prctl

As noted by Vince, the change to this SS line should not be part of this patch.

>  A process can enable or disable all the event groups that are
>  attached to it using the
>  .BR prctl (2)

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
