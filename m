From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch 05/11] perf_event_open.2: aux_{head,tail,offset,size}
 support
Date: Wed, 14 Oct 2015 08:32:16 +0200
Message-ID: <561DF6F0.7030503@gmail.com>
References: <alpine.DEB.2.20.1507231311160.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1507231311160.3742@vincent-weaver-1.umelst.maine.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Stephane Eranian <eranian@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Kaixu Xia <kaixu.xia@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Galbraith <efault@gmx.de>, Robert Richter <rric@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, adrian.hunter@intel.com, kan.liang@intel.com, markus.t.metzger@intel.com, mathieu.poirier@linaro.org
List-Id: linux-man@vger.kernel.org

On 07/23/2015 07:12 PM, Vince Weaver wrote:
> 
> This manpage patch relates to the addition of the AUX mmap region
> as added in the following commit:


Thanks, Vince. Applied.

Cheers,

Michael



> 	commit 45bfb2e50471abbbfd83d40d28c986078b0d24ff
> 	Author: Peter Zijlstra <peterz@infradead.org>
> 
> 	perf: Add AUX area to ring buffer for raw data streams
> 
> 	Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 	Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> 	Cc: Borislav Petkov <bp@alien8.de>
> 	Cc: Frederic Weisbecker <fweisbec@gmail.com>
> 	Cc: H. Peter Anvin <hpa@zytor.com>
> 	Cc: Kaixu Xia <kaixu.xia@linaro.org>
> 	Cc: Linus Torvalds <torvalds@linux-foundation.org>
> 	Cc: Mike Galbraith <efault@gmx.de>
> 	Cc: Paul Mackerras <paulus@samba.org>
> 	Cc: Robert Richter <rric@kernel.org>
> 	Cc: Stephane Eranian <eranian@google.com>
> 	Cc: Thomas Gleixner <tglx@linutronix.de>
> 	Cc: acme@infradead.org
> 	Cc: adrian.hunter@intel.com
> 	Cc: kan.liang@intel.com
> 	Cc: markus.t.metzger@intel.com
> 	Cc: mathieu.poirier@linaro.org
> 	Link: http://lkml.kernel.org/r/1421237903-181015-3-git-send-email-alexander.shishkin@linux.intel.com
> 	Signed-off-by: Ingo Molnar <mingo@kernel.org>
> 
> 
> 
> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index a3bebaa..bd6c4c9 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1416,6 +1416,10 @@ struct perf_event_mmap_page {
>      __u64 data_tail;         /* user-space written tail */
>      __u64 data_offset;       /* where the buffer starts */
>      __u64 data_size;         /* data buffer size */
> +    __u64 aux_head;
> +    __u64 aux_tail;
> +    __u64 aux_offset;
> +    __u64 aux_size;
>  
>  }
>  .fi
> @@ -1643,6 +1647,34 @@ where perf sample data begins.
>  .\" commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
>  Contains the size of the perf sample region within
>  the mmap buffer.
> +.TP
> +.IR aux_head ", " aux_tail ", " aux_offset ", " aux_size " (since Linux 4.1)
> +.\" commit 45bfb2e50471abbbfd83d40d28c986078b0d24ff
> +The AUX region allows mmaping a separate sample buffer for high
> +bandwidth data streams (separate from the main perf sample buffer).
> +An example of a high bandwidth stream is instruction tracing support,
> +as is found in newer Intel processors.
> +
> +To set up an AUX area, first
> +.I aux_offset
> +needs to be set with an offset greater than
> +.IR data_offset + data_size
> +and
> +.I aux_size
> +needs to be set to the desired buffer size.
> +The desired offset and size must be page aligned, and the size
> +must be a power of two.
> +These values are then passed to mmap in order to map the AUX buffer.
> +Pages in the AUX buffer are included as part of the user mlock
> +rlimit as well as the
> +.I perf_event_mlock_kb
> +allowance.
> +
> +The
> +.IR aux_head " and " aux_tail
> +ring buffer pointers have the same behavior and ordering
> +rules as the previous described
> +.IR data_head " and " data_tail .
>  .PP
>  The following 2^n ring-buffer pages have the layout described below.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
