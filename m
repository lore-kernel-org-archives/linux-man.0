From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] perf_event_open.2: update time_shift sample code
Date: Fri, 21 Oct 2016 08:45:22 +0200
Message-ID: <98ab0d01-901a-49ef-7402-20613d30bf98@gmail.com>
References: <alpine.DEB.2.20.1610210036000.3240@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610210036000.3240@macbook-air>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-man@vger.kernel.org

On 10/21/2016 06:38 AM, Vince Weaver wrote:
> 
> Linux 4.3 (b20112edeadf0b8a1416de061caa4beb11539902) improved
> the accuracy of the clock/ns conversion routines.  As a result
> the shift factor can now be 32.  This value is directly
> exported in the perf_event_open() mmap page, and this
> potentially breaks the sample code that shifts 1 left by
> the shift value.
> 
> Add a cast in the sample code so that a proper 64-bit value
> results from the shift.  This is the same change that was
> made to the sample code in include/uapi/linux/perf_event.h
> in Linux 4.4 (b9511cd761faafca7a1acc059e792c1399f9d7c6).

Thanks, Vince.

Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index ae15cc6..fade28c 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1619,7 +1619,7 @@ delta since
>      u64 quot, rem;
>      u64 delta;
>      quot = (cyc >> time_shift);
> -    rem = cyc & ((1 << time_shift) \- 1);
> +    rem = cyc & (((u64)1 << time_shift) \- 1);
>      delta = time_offset + quot * time_mult +
>              ((rem * time_mult) >> time_shift);
>  .fi
> @@ -1664,7 +1664,7 @@ And vice versa:
>  
>  .nf
>      quot = cyc >> time_shift;
> -    rem  = cyc & ((1 << time_shift) - 1);
> +    rem  = cyc & (((u64)1 << time_shift) - 1);
>      timestamp = time_zero + quot * time_mult +
>          ((rem * time_mult) >> time_shift);
>  .fi
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
