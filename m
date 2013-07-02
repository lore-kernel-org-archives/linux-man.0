From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open() -- update to match 3.10 release
Date: Tue, 02 Jul 2013 06:14:34 +0200
Message-ID: <51D253AA.1030307@gmail.com>
References: <alpine.DEB.2.10.1307011353500.5315@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1307011353500.5315-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/01/13 19:56, Vince Weaver wrote:
> 
> This patch updates the perf_event_open() documentation to include
> new interfaces added in the 3.10 kernel.
> 
> It also documents a few [To be documented] instances left over
> from the 3.7 kernel.
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

Hello, Vince. 

Patch applied.

I very much appreciate your continued attention to this page! Thanks.

Cheers,

Michael


> --- man2/perf_event_open.2.orig	2013-07-01 12:31:46.602701124 -0400
> +++ man2/perf_event_open.2	2013-07-01 13:53:03.410449052 -0400
> @@ -139,7 +139,7 @@
>  .IR group_fd " = \-1"
>  and is considered to be a group with only 1 member.)
>  An event group is scheduled onto the CPU as a unit: it will
> -be put onto the CPU ionly if all of the events in the group can be put onto
> +be put onto the CPU only if all of the events in the group can be put onto
>  the CPU.
>  This means that the values of the member events can be
>  meaningfully compared, added, divided (to get ratios), etc., with each
> @@ -658,10 +658,23 @@
>  See branch_sample_type.
>  .TP
>  .BR PERF_SAMPLE_REGS_USER " (Since Linux 3.7)"
> -Records the current register state.
> +Records the current user-level CPU register state
> +(the values in the process before the kernel was called).
>  .TP
>  .BR PERF_SAMPLE_STACK_USER " (Since Linux 3.7)"
> -[To be documented]
> +Records the user level stack, allowing stack unwinding.
> +.TP
> +.BR PERF_SAMPLE_WEIGHT " (Since Linux 3.10)"
> +Records a hardware provided weight value that expresses how
> +costly the sampled event was.  
> +This allows the hardware to highlight expensive events in
> +a profile.
> +.TP
> +.BR PERF_SAMPLE_DATA_SRC " (Since Linux 3.10)"
> +Records the data source: where in the memory hierarchy
> +the data associated with the sampled instruction came from.
> +This is only available if the underlying hardware
> +supports this feature.
>  .RE
>  .TP
>  .IR "read_format"
> @@ -977,13 +990,15 @@
>  .RE
>  .TP
>  .IR "sample_regs_user" " (Since Linux 3.7)"
> -This defines the set of user registers to dump on samples.
> -See
> -.\" FIXME: The following reference seems to be not quite right:
> -.IR asm/perf_regs.h .
> +This bitmask defines the set of user CPU registers to dump on samples.
> +The layout of the register mask is architecture specific and
> +described in the kernel header
> +.IR arch/ARCH/include/uapi/asm/perf_regs.h .
>  .TP
>  .IR "sample_stack_user" " (Since Linux 3.7)"
> -This defines the size of the user stack to dump on samples.
> +This defines the size of the user stack to dump if
> +.B PERF_SAMPLE_STACK_USER
> +is specified.
>  .SS Reading results
>  Once a
>  .BR perf_event_open ()
> @@ -1428,6 +1443,8 @@
>      u64   size;       /* if PERF_SAMPLE_STACK_USER */
>      char  data[size]; /* if PERF_SAMPLE_STACK_USER */
>      u64   dyn_size;   /* if PERF_SAMPLE_STACK_USER */
> +    u64   weight;     /* if PERF_SAMPLE_WEIGHT */
> +    u64   data_src;   /* if PERF_SAMPLE_DATA_SRC */
>  };
>  .fi
>  .RS
> @@ -1535,20 +1552,135 @@
>  .IR abi ", " regs[weight(mask)]
>  If
>  .B PERF_SAMPLE_REGS_USER
> -is enabled, then
> -[to be documented].
> +is enabled, then the user CPU registers are recorded.
>  
>  The
>  .I abi
>  field is one of
>  .BR PERF_SAMPLE_REGS_ABI_NONE ", " PERF_SAMPLE_REGS_ABI_32 " or "
>  .BR PERF_SAMPLE_REGS_ABI_64 .
> +
> +The
> +.I regs
> +field is an array of the CPU registers that were specified by
> +the
> +.I sample_regs_user
> +attr field.
> +The number of values is the number of bits set in the
> +.I sample_regs_user 
> +bitmask.
>  .TP
>  .IR size ", " data[size] ", " dyn_size
>  If
>  .B PERF_SAMPLE_STACK_USER
> -is enabled, then
> -[to be documented].
> +is enabled, then record the user stack to enable backtracing.
> +.I size
> +is the size requested by the user in
> +.I stack_user_size
> +or else the maximum record size.
> +.I data
> +is the stack data.
> +.I dyn_size
> +is the amount of data actually dumped (can be less than
> +.I size
> +).
> +.TP
> +.I weight 
> +If
> +.B PERF_SAMPLE_WEIGHT
> +is enabled, then a 64 bit value provided by the hardwre
> +is recorded that indicates how costly the event was.
> +This allows expensive events to stand out more clearly
> +in profiles.
> +.TP
> +.I data_src
> +If 
> +.B PERF_SAMPLE_DATA_SRC
> +is enabled, then a 64 bit value is recorded that is made up of
> +the following fields:
> +.RS
> +.TP
> +.I mem_op
> +type of opcode, a bitwise combination of
> +.B PERF_MEM_OP_NA
> +(not available),
> +.B PERF_MEM_OP_LOAD
> +(load instruction),
> +.B PERF_MEM_OP_STORE
> +(store instruction),
> +.B PERF_MEM_OP_PFETCH
> +(prefetch), and
> +.B PERF_MEM_OP_EXEC
> +(executable code).
> +.TP
> +.I mem_lvl
> +memory hierarchy level hit or miss, a bitwise combination of
> +.B PERF_MEM_LVL_NA
> +(not available),
> +.B PERF_MEM_LVL_HIT
> +(hit),
> +.B PERF_MEM_LVL_MISS
> +(miss),
> +.B PERF_MEM_LVL_L1
> +(level 1 cache),
> +.B PERF_MEM_LVL_LFB
> +(line fill buffer),
> +.B PERF_MEM_LVL_L2
> +(level 2 cache),
> +.B PERF_MEM_LVL_L3
> +(level 3 cache),
> +.B PERF_MEM_LVL_LOC_RAM
> +(local DRAM),
> +.B PERF_MEM_LVL_REM_RAM1
> +(remote DRAM 1 hop),
> +.B PERF_MEM_LVL_REM_RAM2
> +(remote DRAM 2 hops),
> +.B PERF_MEM_LVL_REM_CCE1
> +(remote cache 1 hop),
> +.B PERF_MEM_LVL_REM_CCE2
> +(remote Cache 2 hops),
> +.B PERF_MEM_LVL_IO
> +(I/O memory), and
> +.B PERF_MEM_LVL_UNC
> +(uncached memory).
> +.TP
> +.I mem_snoop
> +snoop mode, a bitwise combination of
> +.B PERF_MEM_SNOOP_NA
> +(not available),
> +.B PERF_MEM_SNOOP_NONE
> +(no snoop),
> +.B PERF_MEM_SNOOP_HIT
> +(snoop hit),
> +.B PERF_MEM_SNOOP_MISS
> +(snoop miss), and
> +.B PERF_MEM_SNOOP_HITM
> +(snoop hit modified).
> +.TP
> +.I mem_lock
> +lock instruction, a bitwise combination of
> +.B PERF_MEM_LOCK_NA
> +(not available) and
> +.B PERF_MEM_LOCK_LOCKED
> +(locked transaction).
> +.TP
> +.I mem_dtlb
> +tlb access hit or miss, a bitwise combination of
> +.B PERF_MEM_TLB_NA
> +(not available),
> +.B PERF_MEM_TLB_HIT
> +(hit),
> +.B PERF_MEM_TLB_MISS
> +(miss),
> +.B PERF_MEM_TLB_L1
> +(level 1 TLB),
> +.B PERF_MEM_TLB_L2
> +(level 2 TLB),
> +.B PERF_MEM_TLB_WK
> +(hardware walker), and
> +.B PERF_MEM_TLB_OS
> +(OS fault handler).
> +.RE
>  .RE
>  .RE
>  .TP
> @@ -1585,6 +1717,10 @@
>  In addition, one of the following bits can be set:
>  .RS
>  .TP
> +.B PERF_RECORD_MISC_MMAP_DATA
> +This is set when the mapping is not executable;
> +otherwise the mapping is executable.
> +.TP
>  .B PERF_RECORD_MISC_EXACT_IP
>  This indicates that the content of
>  .B PERF_SAMPLE_IP
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
