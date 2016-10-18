From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] perf_event_open.2:
 PERF_RECORD_MISC_PROC_MAP_PARSE_TIMEOUT
Date: Tue, 18 Oct 2016 08:14:56 +0200
Message-ID: <0e5174be-17cd-83a5-3e1d-29d5ae720224@gmail.com>
References: <alpine.DEB.2.20.1610171048150.7683@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610171048150.7683@macbook-air>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Kan Liang <kan.liang@intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-man@vger.kernel.org

Hi Vince,

On 10/17/2016 04:50 PM, Vince Weaver wrote:
> 
> Linux 4.2 reserved a new bit from the misc field in the perf_event_open
> mmap sample buffer:
> PERF_RECORD_MISC_PROC_MAP_PARSE_TIMEOUT
> 
> Despite being reserved in the public include/uapi/linux/perf_event.h
> header file, this bit is never set by the kernel, rather it is used
> internally by the userspace "perf" utility to indicate that when
> attempting to parse all of the /proc/xxx/maps files for the sample
> it ended up taking too long so the scan was aborted.
> 
> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>

Thanks. Applied!

Cheers,

Michael


> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index fa8b1bd..59ad289 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1822,6 +1822,14 @@ See also
>  .BR PERF_RECORD_MISC_EXT_RESERVED " (since Linux 2.6.35)"
>  .\" commit 1676b8a077c352085d52578fb4f29350b58b6e74
>  This indicates there is extended data available (currently not used).
> +.TP
> +.B PERF_RECORD_MISC_PROC_MAP_PARSE_TIMEOUT
> +.\" commit 930e6fcd2bcce9bcd9d4aa7e755678d33f3fe6f4
> +This bit is not set by the kernel.
> +It is reserved for the userspace perf utility to indicate that
> +.I /proc/xxx/maps
> +parsing was taking too long and stopped and thus the mmap
> +records may be truncated.
>  .RE
>  .TP
>  .I type
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
