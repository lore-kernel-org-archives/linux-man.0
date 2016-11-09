From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH v3][manpages 2/2] perf_event_open.2: Document
 write_backward
Date: Wed, 9 Nov 2016 14:30:48 +0100
Message-ID: <fde66a04-3d11-35d4-8233-7efc82cb9e8f@gmail.com>
References: <20161024065256.160703-1-wangnan0@huawei.com>
 <20161024065256.160703-3-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024065256.160703-3-wangnan0@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wang Nan <wangnan0@huawei.com>, vincent.weaver@maine.edu
Cc: mtk.manpages@gmail.com, pi3orama@163.com, linux-kernel@vger.kernel.org, lizefan@huawei.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Wang Nan,

On 10/24/2016 08:52 AM, Wang Nan wrote:
> Linux 4.7 (9ecda41acb971ebd07c8fb35faf24005c0baea12) introduces write_backward
> attribute to perf_event_attr. Document this feature.
> 
> Signed-off-by: Wang Nan <wangnan0@huawei.com>
> Reviewed-by: Vince Weaver <vincent.weaver@maine.edu>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> ---
>  man2/perf_event_open.2 | 57 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 561331c..fccde79 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -245,7 +245,8 @@ struct perf_event_attr {
>            use_clockid    :  1,  /* use clockid for time fields */
>            context_switch :  1,  /* context switch data */
>  
> -          __reserved_1   : 37;
> +          write_backward :  1,  /* Write ring buffer from end to beginning */
> +          __reserved_1   : 36;
>  
>      union {
>          __u32 wakeup_events;    /* wakeup every n events */
> @@ -1127,6 +1128,31 @@ The advantage of this method is that it will give full
>  information even with strict
>  .I perf_event_paranoid
>  settings.
> +.IR "write_backward" " (since Linux 4.7)"
> +.\" commit 9ecda41acb971ebd07c8fb35faf24005c0baea12
> +This makes the resuling event use a backward ring-buffer, which

s/reuling/resulting/

s/This/Setting this bit/ ?

> +writes samples from the end of the ring-buffer to the beginning.
> +
> +It is not allowed to connect events with backward and forward
> +ring-buffer settings together using
> +.B PERF_EVENT_IOC_SET_OUTPUT.
> +
> +Backward ring-buffer is useful for ring-buffers created by readonly
> +.BR mmap (2).
> +In this case,
> +.IR data_tail
> +is useless (because user space programs are not allowed to write to it).
> +.IR data_head
> +points to the head of the most recent sample. In a backward
> +ring-buffer, it is easy to iterate over the whole ring-buffer by reading
> +samples one by one from
> +.IR data_head
> +because size of a sample can be found from decoding its header.
> +
> +For a forward read only ring-buffer in contract,

What does "in contract" here mean? This needs to be clarified.

> +.IR data_head
> +points to the end of the most recent sample, but the size of a sample
> +can't be determined from the end of it.
>  .TP
>  .IR "wakeup_events" ", " "wakeup_watermark"
>  This union sets how many samples
> @@ -1671,7 +1697,9 @@ And vice versa:
>  .TP
>  .I data_head
>  This points to the head of the data section.
> -The value continuously increases, it does not wrap.
> +The value continuously increases (or decrease if
> +.IR write_backward
> +is set), it does not wrap.
>  The value needs to be manually wrapped by the size of the mmap buffer
>  before accessing the samples.
>  
> @@ -2736,6 +2764,24 @@ Starting with Linux 3.18,
>  .B POLL_HUP
>  is indicated if the event being monitored is attached to a different
>  process and that process exits.
> +.SS Reading from overwritable ring-buffer
> +Reader is unable to update
> +.IR data_tail
> +if the mapping is not
> +.BR PROT_WRITE .
> +In this case, kernel will overwrite data without considering whether
> +they are read or not, so ring-buffer is overwritable and
> +behaves like a flight recorder. To read from an overwritable
> +ring-buffer, setting
> +.IR write_backward
> +is suggested, or it would be hard to find a proper position to start
> +decoding. In addition, ring-buffer should be paused before reading
> +through
> +.BR ioctl (2)
> +with
> +.B PERF_EVENT_IOC_PAUSE_OUTPUT
> +to avoid racing between kernel and reader. Ring-buffer should be resumed
> +after finish reading.
>  .SS rdpmc instruction
>  Starting with Linux 3.4 on x86, you can use the
>  .\" commit c7206205d00ab375839bd6c7ddb247d600693c09
> @@ -2848,6 +2894,13 @@ The file descriptors must all be on the same CPU.
>  
>  The argument specifies the desired file descriptor, or \-1 if
>  output should be ignored.
> +
> +Two events with different
> +.IR write_backward
> +settings are not allowed to be connected together using
> +.B PERF_EVENT_IOC_SET_OUTPUT.
> +.B EINVAL
> +is returned in this case.
>  .TP
>  .BR PERF_EVENT_IOC_SET_FILTER " (since Linux 2.6.33)"
>  .\" commit 6fb2915df7f0747d9044da9dbff5b46dc2e20830

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
