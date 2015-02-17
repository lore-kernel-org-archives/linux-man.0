From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Tue, 17 Feb 2015 06:33:27 +0100
Message-ID: <54E2D2A7.8050708@gmail.com>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1502120031150.17793-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, cebbert.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Stephane (and Jiri),

Would you be willing to review/comment on Vince's patch, please.

Cheers,

Michael


On 02/12/2015 06:33 AM, Vince Weaver wrote:
> 
> This manpage patch relates to the addition of PERF_SAMPLE_REGS_INTR
> support added in the following commit:
> 
>     perf_sample_regs_intr; Linux 3.19
> 	commit 60e2364e60e86e81bc6377f49779779e6120977f
> 	Author: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 
>             perf: Add ability to sample machine state on interrupt
> 
> 	Reviewed-by: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 	Signed-off-by: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> 	Cc: cebbert.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> 	Cc: Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 	Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> 	Cc: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 	Link: http://lkml.kernel.org/r/1411559322-16548-2-git-send-email-eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
> 	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
>>From what I can tell the primary difference between 
> PERF_SAMPLE_REGS_INTR and the existing PERF_SAMPLE_REGS_USER
> is that the new support will return kernel register values
> (I assume that's not some sort of info leak?).
> 
> In theory also when precise_ip is set high enough you should
> get the PEBS register state rather than the PMU interrupt
> register state, but I was unable to construct a test case
> on a Haswell system where I got different values with
> precise_ip=0, precise_ip=2, or by using PERF_SAMPLE_REGS_USER
> instead.  Am I missing something about how to use this new 
> interface?
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 39c8d8c..ca03928 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -256,7 +256,7 @@ struct perf_event_attr {
>      __u32 sample_stack_user;    /* size of stack to dump on
>                                     samples */
>      __u32 __reserved_2;         /* Align to u64 */
> -
> +    __u64 sample_regs_intr;     /* regs to dump on samples */
>  };
>  .fi
>  .in
> @@ -350,6 +350,11 @@ and
>  .I sample_stack_user
>  in Linux 3.7.
>  .\" commit 1659d129ed014b715b0b2120e6fd929bdd33ed03
> +.B PERF_ATTR_SIZE_VER4
> +is 104 corresponding to the addition of
> +.I sample_regs_intr
> +in Linux 3.19.
> +.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
>  .TP
>  .I "config"
>  This specifies which event you want, in conjunction with
> @@ -752,6 +757,23 @@ event must be measured or no values will be recorded.
>  Also note that some perf_event measurements, such as sampled
>  cycle counting, may cause extraneous aborts (by causing an
>  interrupt during a transaction).
> +.TP
> +.BR PERF_SAMPLE_REGS_INTR " (since Linux 3.19)"
> +.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
> +Records a subset of the current CPU register state
> +as specified by
> +.IR sample_regs_intr .
> +Unlike
> +.B PERF_SAMPLE_REGS_USER
> +the register values will return kernel register
> +state if the overflow happened while kernel
> +code is running.
> +If the CPU supports hardware sampling of
> +register state (as does PEBS on x86) and
> +.I precise_ip
> +is set higher than zero then the register
> +values returned are those captured by
> +hardware.
>  .RE
>  .TP
>  .IR "read_format"
> @@ -1855,6 +1877,9 @@ struct {
>      u64   weight;     /* if PERF_SAMPLE_WEIGHT */
>      u64   data_src;   /* if PERF_SAMPLE_DATA_SRC */
>      u64   transaction;/* if PERF_SAMPLE_TRANSACTION */
> +    u64   abi;        /* if PERF_SAMPLE_REGS_INTR */
> +    u64   regs[weight(mask)];
> +                      /* if PERF_SAMPLE_REGS_INTR */
>  };
>  .fi
>  .RS 4
> @@ -2242,6 +2267,27 @@ the high 32 bits of the field by shifting right by
>  .B PERF_TXN_ABORT_SHIFT
>  and masking with
>  .BR PERF_TXN_ABORT_MASK .
> +.TP
> +.IR abi ", " regs[weight(mask)]
> +If
> +.B PERF_SAMPLE_REGS_INTR
> +is enabled, then the user CPU registers are recorded.
> +
> +The
> +.I abi
> +field is one of
> +.BR PERF_SAMPLE_REGS_ABI_NONE ", " PERF_SAMPLE_REGS_ABI_32 " or "
> +.BR PERF_SAMPLE_REGS_ABI_64 .
> +
> +The
> +.I regs
> +field is an array of the CPU registers that were specified by
> +the
> +.I sample_regs_intr
> +attr field.
> +The number of values is the number of bits set in the
> +.I sample_regs_intr
> +bit mask.
>  .RE
>  .TP
>  .B PERF_RECORD_MMAP2
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
