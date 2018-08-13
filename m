From: "Michael Kerrisk (man-opages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH v3][manpages 1/2] perf_event_open.2: Document
 PERF_EVENT_IOC_PAUSE_OUTPUT
Date: Mon, 13 Aug 2018 18:39:49 +0200
Message-ID: <7bb03d5d-fbfb-f4e4-d505-de012535f844@gmail.com>
References: <20161024065256.160703-1-wangnan0@huawei.com>
 <20161024065256.160703-2-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024065256.160703-2-wangnan0@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wang Nan <wangnan0@huawei.com>, vincent.weaver@maine.edu
Cc: mtk.manpages@gmail.com, pi3orama@163.com, linux-kernel@vger.kernel.org, lizefan@huawei.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Wangnan,

On 10/24/2016 08:52 AM, Wang Nan wrote:
> Linux 4.7 (86e7972f690c1017fd086cdfe53d8524e68c661c) introduces
> PERF_EVENT_IOC_PAUSE_OUTPUT feature. Document it.

Just to confirm, I presume this patch has been superseded by the one
from Vince that I just applied.

Cheers,

Michael

> Signed-off-by: Wang Nan <wangnan0@huawei.com>
> Reviewed-by: Vince Weaver <vincent.weaver@maine.edu>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> ---
>   man2/perf_event_open.2 | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index fade28c..561331c 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1687,6 +1687,15 @@ the
>   .I data_tail
>   value should be written by user space to reflect the last read data.
>   In this case, the kernel will not overwrite unread data.
> +
> +When the mapping is read only (without
> +.BR PROT_WRITE ),
> +setting .I data_tail is not allowed.
> +In this case, the kernel will overwrite data when sample coming, unless
> +the ring buffer is paused by a
> +.BR PERF_EVENT_IOC_PAUSE_OUTPUT
> +.BR ioctl (2)
> +system call before reading.
>   .TP
>   .IR data_offset " (since Linux 4.1)"
>   .\" commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
> @@ -2865,6 +2874,21 @@ The argument is a BPF program file descriptor that was created by
>   a previous
>   .BR bpf (2)
>   system call.
> +.TP
> +.BR PERF_EVENT_IOC_PAUSE_OUTPUT " (since Linux 4.7)"
> +.\" commit 86e7972f690c1017fd086cdfe53d8524e68c661c
> +This allows pausing and resuming the event's ring-buffer. A
> +paused ring-buffer does not prevent generation of samples, but simply
> +discards the samples. The discarded samples are considered lost,
> +causing
> +.BR PERF_RECORD_LOST
> +to be generated when possible.
> +
> +The argument is an integer. A nonzero value pauses the ring-buffer,
> +zero resumes the ring-buffer.
> +
> +Pausing a read only ring buffer before reading from it without having
> +to worry about data being overwritten.
>   .SS Using prctl(2)
>   A process can enable or disable all the event groups that are
>   attached to it using the
> 
