From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] perf_event_open.2: document new mmap2 record type
Date: Fri, 15 Aug 2014 21:13:48 +0200
Message-ID: <53EE5BEC.1060200@gmail.com>
References: <alpine.DEB.2.11.1408061400420.1325@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1408061400420.1325-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Don Zickus <dzickus-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jiri Olsa <jolsa-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/06/2014 08:01 PM, Vince Weaver wrote:
> 
> Linux 3.16 (more specifically, commit a5a5ba72843dd05f9 )
> enabled the enhanced mmap2 record support.
> The interface was added in Linux 3.12 but disabled until
> Linux 3.16.

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 8004b0e..d1ad5ca 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -225,7 +225,8 @@ struct perf_event_attr {
>                                  /* exclude kernel callchains */
>            exclude_callchain_user   : 1,
>                                  /* exclude user callchains */
> -          __reserved_1   : 41;
> +          mmap2          :  1,  /* include mmap with inode data */
> +          __reserved_1   : 40;
>  
>      union {
>          __u32 wakeup_events;    /* wakeup every n events */
> @@ -980,6 +981,13 @@ Do not include kernel callchains.
>  .IR "exclude_callchain_user" " (since Linux 3.7)"
>  Do not include user callchains.
>  .TP
> +.IR "mmap2" " (since Linux 3.16)"
> +Generate an extended executable mmap record that contains enough
> +additional information to uniquely identify shared mappings.
> +The
> +.I mmap
> +flag must also be set for this to work.
> +.TP
>  .IR "wakeup_events" ", " "wakeup_watermark"
>  This union sets how many samples
>  .RI ( wakeup_events )
> @@ -1584,6 +1592,23 @@ struct {
>  };
>  .fi
>  .in
> +.RS
> +.TP
> +.I pid
> +is the process id.
> +.TP
> +.I tid
> +is the thread id.
> +.TP
> +.I addr
> +is the address of the allocated memory.
> +.I len
> +is the length of the allocated memory.
> +.I pgoff
> +is the page offset of the allocated memory.
> +.I filename
> +is a string describing the backing of the allocated memory.
> +.RE
>  .TP
>  .B PERF_RECORD_LOST
>  This record indicates when events are lost.
> @@ -2099,6 +2124,70 @@ the high 32 bits of the field by shifting right by
>  and masking with
>  .BR PERF_TXN_ABORT_MASK .
>  .RE
> +.TP
> +.B PERF_RECORD_MMAP2
> +This record includes extended information on
> +.BR mmap (2)
> +calls returning executable mappings.
> +The format is similar to that of the
> +.B PERF_RECORD_MMAP
> +record but includes extra values that allow uniquely identifying
> +shared mappings.
> +.in +4n
> +.nf
> +struct {
> +    struct perf_event_header header;
> +    u32 pid, tid;
> +    u64 addr;
> +    u64 len;
> +    u64 pgoff;
> +    u32 maj;
> +    u32 min;
> +    u64 ino;
> +    u64 ino_generation;
> +    u32 prot, flags;
> +    char filename[];
> +    struct sample_id sample_id;
> +};
> +.fi
> +.RS
> +.TP
> +.I pid
> +is the process id.
> +.TP
> +.I tid
> +is the thread id.
> +.TP
> +.I addr
> +is the address of the allocated memory.
> +.TP
> +.I len
> +is the length of the allocated memory.
> +.TP
> +.I pgoff
> +is the page offset of the allocated memory.
> +.TP
> +.I maj
> +is the major number of the underlying device.
> +.TP
> +.I min
> +is the minor number of the underlying device.
> +.TP
> +.I ino
> +is the inode.
> +.TP
> +.I ino_generation
> +is the inode generation.
> +.TP
> +.I prot
> +is the protection information.
> +.TP
> +.I flags
> +is the flags information.
> +.TP
> +.I filename
> +is a string describing the backing of the allocated memory.
> +.RE
>  .RE
>  .SS Signal overflow
>  Events can be set to deliver a signal when a threshold is crossed.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
