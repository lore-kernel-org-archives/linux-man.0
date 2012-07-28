From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open() manpage
Date: Sat, 28 Jul 2012 09:03:31 +0200
Message-ID: <CAKgNAki69O4zEb67qKiKX1K90EybG-SXo90j4ymrhcf6D9Y7dQ@mail.gmail.com>
References: <alpine.DEB.2.00.1207101702490.15511@cl320.icl.utk.edu> <alpine.DEB.2.00.1207261416540.22647@cl320.icl.utk.edu>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.00.1207261416540.22647-wtkwhKWa4PaiYXit+UzMnodd74u8MsAO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vweaver1-qKp7vQ+Mknf2fBVCVOL8/A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Vince,

On Thu, Jul 26, 2012 at 8:19 PM, Vince Weaver <vweaver1-qKp7vQ+Mknf2fBVCVOL8/A@public.gmane.org> wrote:
> Hello
>
> I haven't heard anything about my initial submission, but here's an
> updated version of the perf_event_open() manpage that's current
> to the 3.5 kernel and has been improved with a working test case
> as well as with updates to which kernel versions various
> functionality was added.

Thanks for taking the time to put this together. Could I ask you to
take a look at some first pass comments below. Many of these comments
should be taken generally -- i.e., thgere are similar instances to
improve across the page. One problem that I am finding at the moment
is that the formatting issues are making it difficult for me to get to
grips with the content. Some of the simple global formatting fixes
below would help a lot. By the way, atking a look at the pipe.2 and
fcntl.2 page sources will give you a lot of clues about *roff
formatting.

Later, we can go deeper, and perhaps also get Ingo Molnar and Thomas
Gleixner involved in reviewing.

> .\" Hey Emacs! This file is -*- nroff -*- source.
> .\"
> .\" This manpage is Copyright (C) 2012 Vince Weaver
>
> .TH PERF_EVENT_OPEN 2 2012-07-10 "Linux" "Linux Programmer's Manual"
> .SH NAME
> perf_event_open \- setup performance monitoring
> .SH SYNOPSIS
> .nf
> .B #include <linux/perf_event.h>
> .sp
> .BI "int perf_event_open(struct perf_event_attr *" hw_event ", pid_t " pid ", int " cpu ", int " group_fd ", unsigned long " flags  );
> .fi
> .SH DESCRIPTION
> Given a list of parameters
> .BR perf_event_open ()
> returns a file descriptor, a small, nonnegative integer
> for use in subsequent system calls
> .RB ( read "(2), " mmap "(2), " prctl "(2), " fcntl "(2), etc.)."
> The file descriptor returned by a successful call will be
> the lowest-numbered file descriptor not currently open for the process.
> .PP
> A call to
> .BR perf_event_open ()
> creates a file descriptor that allows measuring performance
> information.
> Each file descriptor corresponds to one
> event that is measured; these can be grouped together
> to measure multiple events simultaneously.
> .PP
> Events can be enabled and disabled in two ways: via
> .BR ioctl (2)
> and via
> .BR prctl (2) .
> When an eventset is disabled it does not count or generate events but does
> continue to exist and maintain its count value.
> Events come in two flavors: counting and sampled.
> A
> .I counting
> event is one that is used for counting the aggregate number of events
> that occur.
> In general counting event results are gathered with a
> .BR read (2)
> call.
> A
> .I sampling
> event periodically writes measurements to a buffer that can then
> be accessed via
> .BR  mmap (2) .
> .SS Arguments
> .P
> The argument
> .I pid
> allows events to be attached to processes in various ways.
> If
> .I pid
> is
> .B 0
> measurements happen on the current task, if
> .I pid
> is
> .B "greater than 0 "
> the process indicated by
> .I pid
> is measured, and if
> .I pid
> is
> .BR "less than 0"
> all processes are counted.
>
> The
> .I cpu
> argument allows measurements to be specific to a CPU.
> If
> .I cpu
> is
> .BR "grater than or equal to 0"
> measurements are restricted to the specified CPU;
> if
> .I cpu
> is
> .BR -1
> the events are measured on all CPUs.
> .P
> Note that the combination of
> .IR pid "==-1"
> and
> .IR cpu "==-1"
> is not valid.
> .P
> A
> .IR pid "> 0"
> and
> .IR cpu "== -1"
> setting measures per-process and follows that process to whatever CPU the
> process gets scheduled to. Per-process events can be created by any user.
> .P
> A
> .IR pid "== -1"
> and
> .IR cpu ">= 0"
> event is per-CPU and measures all processes on  the specified CPU.
> Per-CPU events need
> .B CAP_SYS_ADMIN
> privileges.
> .P
> The
> .I group_fd
> argument allows counter groups to be set up.
> A counter group has one counter which is the group leader.
> The leader is created first, with
> .IR group_fd "= -1"
> in the
> .BR perf_event_open ()
> call that creates it.
> The rest of the group members are created subsequently, with
> .IR group_fd
> giving the fd of the group leader.
> (A single counter on its own is created with
> .IR group_fd "= -1"
> and is considered to be a group with only 1 member.)
> .P
> A counter group is scheduled onto the CPU as a unit: it will only
> be put onto the CPU if all of the counters in the group can be put onto
> the CPU.
> This means that the values of the member counters can be
> meaningfully compared, added, divided (to get ratios), etc., with each
> other, since they have counted events for the same set of executed
> instructions.
> .P
> The
> .I flags
> argument is not well documented.  It can be passed the values
> .BR ERF_FLAG_FD_NO_GROUP ,
> .BR PERF_FLAG_FD_OUTPUT ", or"
> .BR PERF_FLAG_PID_CGROUP "(added in 2.6.39)."
> .P
> The
> .I perf_event_attr
> structure is what is passed into the
> .BR perf_event_open ()
> syscall.
> It is large and has a complicated set of dependent fields.
>
> .IR "__u32 type;"

I gather that all of the pieces below, through to PERF_TYPE_BREAKPOINT
are a subdiscussion of the "type" field in the previous line. Best
then to enclose this whole block inside .RE / .RE directives:

.RS
.TP
.B ...
...
.RE

Could you also do the same for each similar block below.


> .TP
> .B PERF_TYPE_HARDWARE
> chooses one of the "generalized" hardware events provided by the kernel.
> See the
> .I config
> field definition for more details.
> .TP
> .B PERF_TYPE_SOFTWARE
> chooses one of the software-defined events provided by the kernel
> (even if no HW support available).
> .TP
> .B PERF_TYPE_TRACEPOINT
> provided by the ftrace infrastructure?
> .TP
> .B PERF_TYPE_HW_CACHE
> these are hardware events but require a special encoding.
> .TP
> .B PERF_TYPE_RAW
> allows programming a "raw" implementation-specific event in the

Missing text?


> .IE config field.
> .TP
> .BR PERF_TYPE_BREAKPOINT "(Added in 2.6.33)"
> breakpoint events provided by the kernel?
> .TP
> .B CUSTOM PMU

Should there be an underscore in the previous name (i.e., CUSTOM_PMU)?

> It's not documented very well, but as of 2.6.39 perf_event can support
> multiple PMUs.
> Which one is chosen is handled by putting its PMU number in this field.
> A list of available PMUs can be found in a sysfs file somewhere.
>
> .TP
> .IR "__u32 size;"
> Place in here the size of
> .IR perf_event_attr structure

put "structure" on the next line (to avoid formatting problems). Could
I ask you to sweep through and fix other similar cases?

> for forward/backward compatibility.
> Set this using sizeof(struct perf_event_attr) to allow the kernel to see
> what size the struct was at compile time; this apparently help provide
> some sort of backward compatibility.
>
> The define
> .B PERF_ATTR_SIZE_VER0
> is set to 64; this was the sizeof the first published struct.
> .B PERF_ATTR_SIZE_VER1
> is 72, corresponding to the addition of breakpoints in 2.6.33.
> .B PERF_ATTR_SIZE_VER2
> is 80 corresponding to the addition of branch sampling in 3.4.
>
> .TP
> .IR "__u64 config;"
>
> This specifies exactly which event you want, in conjunction with
> the type field.
> The
> .IR config1 and config2
> fields are also taken into account in cases where 64 bits is not enough.
>
> If a CPU is not able to count the selected event, then the system
> call will return
> .BR EINVAL .
>
> The most significant bit (bit 63) of the config word signifies
> if the rest contains cpu specific (raw) counter configuration data;
> if unset, the next 7 bits are an event type and the rest of the bits
> are the event identifier. (is this still true?)


>
> .P
> for
> .B PERF_TYPE_HARDWARE

I can't parse the structure of the text here.

> .TP
> .B PERF_COUNT_HW_CPU_CYCLES
> total cycles? be wary of what happens during cpu frequency scaling
> .TP
> .B PERF_COUNT_HW_INSTRUCTIONS
> retired instructions. Be careful, these can be affected by various
> issues, most notably hardware interrupt counts
> .TP
> .B PERF_COUNT_HW_CACHE_REFERENCES
> in this case Last Level Cache. Unclear if this should count
> prefetches and coherency messages.
> .TP
> .B PERF_COUNT_HW_CACHE_MISSES
> in this case Last Level Cache. Unclear if this should count
> prefetches and coherency messages.
> .TP
> .B PERF_COUNT_HW_BRANCH_INSTRUCTIONS

I gather that in places like this, there are details to be filled in.
Please add a "TBC?" in eqach such place.

> .TP
> .B PERF_COUNT_HW_BRANCH_MISSES
> .TP
> .B PERF_COUNT_HW_BUS_CYCLES
> .TP
> .BR PERF_COUNT_HW_STALLED_CYCLES_FRONTEND "(Added in 3.0)"

Here, and in other places, add a space after the first double quote.

> .TP
> .BR PERF_COUNT_HW_STALLED_CYCLES_BACKEND  "(Added in 3.0)"
> .TP
> .BR PERF_COUNT_HW_REF_CPU_CYCLES  "(Added in 3.3)"
>
> .P
> for
> .B PERF_TYPE_SOFTWARE
> .TP
> .B PERF_COUNT_SW_CPU_CLOCK
> .TP
> .B PERF_COUNT_SW_TASK_CLOCK
> .TP
> .B PERF_COUNT_SW_PAGE_FAULTS
> .TP
> .B PERF_COUNT_SW_CONTEXT_SWITCHES
> .TP
> .B PERF_COUNT_SW_CPU_MIGRATIONS
> .TP
> .B PERF_COUNT_SW_PAGE_FAULTS_MIN
> .TP
> .B PERF_COUNT_SW_PAGE_FAULTS_MAJ
> .TP
> .BR PERF_COUNT_SW_ALIGNMENT_FAULTS "(Added in 2.6.33)"
> .TP
> .BR PERF_COUNT_SW_EMULATION_FAULTS "(Added in 2.6.33)"
>
> .P
> for
> .B PERF_TYPE_TRACEPOINT
> these are available when the ftrace event tracer is available,
> and
> .I config
> values can be obtained from
> .I /debug/tracing/events/*/*/id
>
> .P
> for
> .B PERF_TYPE_HW_CACHE
> To calculate the
> .I config
> value for these, take
> (perf_hw_cache_id) | (perf_hw_cache_op_id << 8) |
> (perf_hw_cache_op_result_id << 16)
> .P
> perf_hw_cache_id
> .TP
> .B PERF_COUNT_HW_CACHE_L1D
> .TP
> .B PERF_COUNT_HW_CACHE_L1I
> .TP
> .B PERF_COUNT_HW_CACHE_LL
> .TP
> .B PERF_COUNT_HW_CACHE_DTLB
> .TP
> .B PERF_COUNT_HW_CACHE_ITLB
> .TP
> .B PERF_COUNT_HW_CACHE_BPU
> .TP
> .BR PERF_COUNT_HW_CACHE_NODE "(Added in 3.0)"
> .P
> perf_hw_cache_op_id
> .TP
> .B PERF_COUNT_HW_CACHE_OP_READ
> .TP
> .B PERF_COUNT_HW_CACHE_OP_WRITE
> .TP
> .B PERF_COUNT_HW_CACHE_OP_PREFETCH
> .P
> perf_hw_cache_op_result_id
> .TP
> .B PERF_COUNT_HW_CACHE_RESULT_ACCESS
> .TP
> .B PERF_COUNT_HW_CACHE_RESULT_MISS
> .P
> for
> .B  PERF_TYPE_RAW
> Most CPUs support events that are not covered by the "generalized" events.
> These are implementation defined; see your CPU manual.
> The libpfm4 library can help you translate from the name in the
> architectural manuals to the raw hex value perf_events
> expects in this field.
>
> .P
> for
> .B PERF_TYPE_BREAKPOINT
>
> .TP
> .IR "union { __u64 sample_period; __u64 sample_freq; };"
> A "sampling" counter is one that is set up to generate an interrupt
> every N events, where N is given by
> .IR sample_period .
> A sampling counter has
> .IR sample_period "> 0."
> The
> .IR sample_type field
> controls what data is recorded on each interrupt.
>
> .TP
> .IR "__u64 sample_type;"
> Various bits can be set here to request info in the overflow packets.
> .TP
> .B PERF_SAMPLE_IP
> .TP
> .B PERF_SAMPLE_TID
> .TP
> .B PERF_SAMPLE_TIME
> .TP
> .B PERF_SAMPLE_ADDR
> .TP
> .B PERF_SAMPLE_READ
> .TP
> .B PERF_SAMPLE_CALLCHAIN
> .TP
> .B PERF_SAMPLE_ID
> .TP
> .B PERF_SAMPLE_CPU
> .TP
> .B PERF_SAMPLE_PERIOD
> .TP
> .B PERF_SAMPLE_STREAM_ID
> .TP
> .B PERF_SAMPLE_RAW
> .TP
> .BR PERF_SAMPLE_BRANCH_STACK "(Added in 3.4)"
> Such (and other) events will be recorded in a ring-buffer,
> which is available to user-space using
> .BR mmap (2)
>
> .TP
> .IR "__u64 read_format;"
> Specifies the format of the data returned by
> .BR read (2)
> on a perf event fd.
> .TP
> .B PERF_FORMAT_TOTAL_TIME_ENABLED
> Adds the 64-bit "time_enabled" field.
> Can be used to calculate estimated totals if multiplexing is happening
> and an event is being scheduled round-robin.
> .TP
> .B PERF_FORMAT_TOTAL_TIME_RUNNING
> Adds the 64-bit "time_running" field.
> Can be used to calculate estimated totals if multiplexing is happening
> and an event is being scheduled round-robin.
> .TP
> .B PERF_FORMAT_ID
> Adds a 64-bit unique value that corresponds to the event-group.
> .TP
> .B PERF_FORMAT_GROUP
> Allows all counter values in an event-group to be read with one read.
>
> .TP
> .IR "__u64 disabled; (bitfield)"
> The
> .I disabled
> bit specifies whether the counter starts out disabled or enabled
> (disabled is the default).
> If disabled, the event can later be enabled by
> .BR ioctl (2)
> or
> .BR prctl (2).
>
> .TP
> .IR "__u64 inherit; (bitfield)"
> The
> .I inherit
> bit specifies that this counter should count events of child
> tasks as well as the task specified.
> This only applies to new children, not to any existing children at
> the time the counter is created (nor to any new children of
> existing children).
>
> Inherit does not work for all combinations of read_formats, such as
> .BR PERF_FORMAT_GROUP .
>
> .TP
> .IR "__u64 pinned; (bitfield)"
> The
> .I pinned
> bit specifies that the counter should always be on the CPU if at all
> possible.
> It only applies to hardware counters and only to group leaders.
> If a pinned counter cannot be put onto the CPU (e.g. because there are
> not enough hardware counters or because of a conflict with some other
> event), then the counter goes into an 'error' state, where reads
> return end-of-file (i.e.
> .BR read (2)
> returns 0) until the counter is subsequently enabled or disabled.
>
> .TP
> .IR "__u64 exclusive; (bitfield)"
> The
> .I exclusive bit specifies that when this counter's group is on the CPU,
> it should be the only group using the CPU's counters.
> In the future this may allow monitoring programs to supply extra
> configuration information via 'extra_config_len' to exploit advanced
> features of the CPU's Performance Monitor Unit (PMU) that are not
> otherwise accessible and that might disrupt other hardware counters.
>
> .TP
> .IR "__u64 exclude_user; (bitfield)"
> If set the count excludes events that happen in user-space.
>
> .TP
> .IR "__u64 exclude_kernel; (bitfield)"
> If set the count excludes events that happen in kernel-space.
>
> .TP
> .IR "__u64 exclude_hv; (bitfield)"
> If set the count excludes events that happen in the hypervisor.
> This is mainly for PMUs that have built-in support for handling this
> (such as POWER).
> Extra support is needed for handling hypervisor measurements on most
> machines.
>
> .TP
> .IR "__u64 exclude_idle; (bitfield)"
> If set don't count when the CPU is idle.
>
> .TP
> .IR "__u64 mmap; (bitfield)"
> The
> .I mmap
> bit allow recording of things like userspace IP addresses to
> a ring-buffer (described below in subsection MMAP).
>
> .TP
> .IR "__u64 comm; (bitfield)"
> The
> .I comm bit allows tracking of process comm data on process creation.
> This is recorded in the ring-buffer.
>
> .TP
> .IR "__u64 freq; (bitfield)"
> Use frequency, not period, when sampling.
>
> .TP
> .IR "__u64 inherit_stat; (bitfield)"
> per task counts???
>
> .TP
> .IR "__u64 enable_on_exec; (bitfield)"
> next exec enables???
>
> .TP
> .IR "__u64 task; (bitfield)"
> trace fork/exit???
>
> .TP
> .IR "__u64 watermark; (bitfield)"
> If set, have a sampling interrupt happen when we cross the wakeup_watermark
> boundary.
>
> .TP
> .IR "__u64 precise_ip; (bitfield)" "(Added in 2.6.35)"
> The values of this are the following:
> .TP
> 0 - SAMPLE_IP can have arbitrary skid
> .TP
> 1 - SAMPLE_IP must have constant skid
> .TP
> 2 - SAMPLE_IP requested to have 0 skid
> .TP
> 3 - SAMPLE_IP must have 0 skid
> See also PERF_RECORD_MISC_EXACT_IP
>
> .TP
> .IR "__u64 mmap_data; (bitfield)" "(Added in 2.6.36)"
> non-exec mmap data???
>
> .TP
> .IR "__u64 sample_id_all; (bitfield)" "(Added in 2.6.38)"
> If set then all sample ID info (TID, TIME, ID, CPU, STREAM_ID)
> will be provided.
>
> .TP
> .IR "__u64 exclude_host; (bitfield)" "(Added in 3.2)"
> Do not measure time spent in VM host
>
> .TP
> .IR "__u64 exclude_guest; (bitfield)" "(Added in 3.2)"
> Do not measure time spent in VM guest
>
>
> .TP
> .IR "union { __u32 wakeup_events; __u32 wakeup_watermark; };"
> This union sets how many events (wakeup_events) or bytes
> (wakeup_watermark) happen before an overflow signal happens.
> Which one is used is selected by the
> .IR watermark bit.
>
> .TP
> .IR "__u32 bp_type;" "(Added in 2.6.33)"
> Breakpoint code???
>
> .TP
> .IR "union {__u64 bp_addr; __u64 config1;}" "(bp_addr added in 2.6.33, config1 added in 2.6.39)"
> .I bp_addr
> probably has to do with the breakpoint code.
>
> .I config1
> is used for setting events that need an extra register or otherwise
> do not fit in the regular config field.
> Raw OFFCORE_EVENTS on Nehalem/Westmere/SandyBridge uses this field
> on 3.3 and later kernels.
>
> .TP
> .IR "union { __u64 bp_len; __u64 config2; };" "(bp_len added in 2.6.33, config2 added in 2.6.39)"
> .I bp_len
> probably has to do with the breakpoint code.
>
> .I config2
> is a further extension of the config register.
>
> .TP
> .IR "__u64 branch_sample_type;" "(added in 3.4)"
> .TP
> .BR PERF_SAMPLE_BRANCH_USER     "user branches"
> .TP
> .BR PERF_SAMPLE_BRANCH_KERNEL   "kernel branches"
> .TP
> .BR PERF_SAMPLE_BRANCH_HV       "hypervisor branches"
> .TP
> .BR PERF_SAMPLE_BRANCH_ANY      "any branch types"
> .TP
> .BR PERF_SAMPLE_BRANCH_ANY_CALL "any call branch"
> .TP
> .BR PERF_SAMPLE_BRANCH_ANY_RETURN   "any return branch"
> .TP
> .BR PERF_SAMPLE_BRANCH_IND_CALL     "indirect calls"
> .TP
> .BR PERF_SAMPLE_BRANCH_PLM_ALL   "user kernel and hv"
>
>
>
> .SS "MMAP Layout"
>
> Asynchronous events, like counter overflow or PROT_EXEC mmap tracking
> are logged into a ring-buffer.
> This ring-buffer is created and accessed through
> .BR mmap (2).
>
> The mmap size should be 1+2^n pages, where the first page is a
> meta-data page (struct perf_event_mmap_page) that contains various
> bits of information such as where the ring-buffer head is.
>
> There is a bug previous to 2.6.39 where you have to allocate a mmap
> ring buffer when sampling even if you do not use it at all.
>
> Structure of the first meta-data mmap page

I'd format the folloing piece in a plain old C structure with
comments, I think (inside .nf/.fi)

>     struct perf_event_mmap_page {
> .TP
> .IR    "__u32 version;"         "version number of this structure"
> .TP
> .IR    "__u32 compat_version;"  "lowest version this is compat with"
> .TP
> .IR    "__u32 lock;"            "seqlock for synchronization"
> .TP
> .IR    "__u32 index;"           "hardware counter identifier"
> .TP
> .IR    "__s64 offset;"          "add to hardware counter value"
> .TP
> .IR    "__u64 time_enabled;"    "time event active"
> .TP
> .IR    "__u64 time_running;"    "time event on CPU"
>        .TP
> .IR    "union {__u64   capabilities; __u64   cap_usr_time  : 1, cap_usr_rdpmc : 1,"
> .TP
> .IR     "__u16   pmc_width;"
> If cap_usr_rdpmc this field provides the bit-width of the value
> read using the rdpmc() or equivalent instruction. This can be used
> to sign extend the result like:
> pmc <<= 64 - width;
> pmc >>= 64 - width; // signed shift right
> count += pmc;
> .TP
> .IR     "__u16   time_shift;"
> .TP
> .IR     "__u32   time_mult;"
> .TP
> .IR     "__u64   time_offset;"
> If cap_usr_time the previous fields can be used to compute the time
> delta since time_enabled (in ns) using rdtsc or similar.
>     u64 quot, rem;
>     u64 delta;
>     quot = (cyc >> time_shift);
>     rem = cyc & ((1 << time_shift) - 1);
>     delta = time_offset + quot * time_mult +
>             ((rem * time_mult) >> time_shift);
> Where time_offset,time_mult,time_shift and cyc are read in the
> seqcount loop described above. This delta can then be added to
> enabled and possible running (if idx), improving the scaling:
>     enabled += delta;
>     if (idx)
>         running += delta;
>     quot = count / running;
>     rem  = count % running;
>     count = quot * enabled + (rem * enabled) / running;
> .TP
> .IR     "__u64 __reserved[120];"  "Pad to 1k"
> .TP
> .IR     "__u64 data_head;"       "head in the data section"
>
> User-space reading the data_head value should issue an rmb(),
> on SMP capable platforms, after reading this value.
>
> When the mapping is PROT_WRITE the data_tail value should be written by
> userspace to reflect the last read data.
> In this case the kernel will not over-write unread data.
>
>        __u64 data_tail;       /* user-space written tail            */
>
> .\"         * Bits needed to read the hw counters in user-space.
> .\"         *
> .\"        *   Changed in 3.4
> .\"        *   u32 seq, time_mult, time_shift, idx, width;
> .\"        *   u64 count, enabled, running;
> .\"        *   u64 cyc, time_offset;
> .\"        *   s64 pmc = 0;
> .\"         *
> .\"         *   do {
> .\"         *     seq = pc->lock;
> .\"         *     barrier()
> .\"        *
> .\"        *     enabled = pc->time_enabled;
> .\"        *     running = pc->time_running;
> .\"        *
> .\"        *     if (pc->cap_usr_time && enabled != running) {
> .\"        *       cyc = rdtsc();
> .\"        *       time_offset = pc->time_offset;
> .\"        *       time_mult   = pc->time_mult;
> .\"        *       time_shift  = pc->time_shift;
> .\"        *     }
> .\"        *
> .\"        *     idx = pc->index;
> .\"        *     count = pc->offset;
> .\"        *     if (pc->cap_usr_rdpmc && idx) {
> .\"        *       width = pc->pmc_width;
> .\"        *       pmc = rdpmc(idx - 1);
> .\"        *     }
> .\"         *
> .\"         *     barrier();
> . \"         *   } while (pc->lock != seq);
>
> Structure of the following 2^n ring-buffer pages
>
> struct perf_event_header {
>
>     __u32 type;
>
> If perf_event_attr.sample_id_all is set then all event types will
> have the sample_type selected fields related to where/when (identity)
> an event took place (TID, TIME, ID, CPU, STREAM_ID) described in
> PERF_RECORD_SAMPLE below, it will be stashed just after the
> perf_event_header and the fields already present for the existing
> fields, i.e. at the end of the payload. That way a newer perf.data
> file will be supported by older perf tools, with these new optional
> fields being ignored.
>
> The MMAP events record the PROT_EXEC mappings so that we can correlate
> userspace IPs to code. They have the following structure:
>         PERF_RECORD_MMAP
>         struct {
>             struct perf_event_header header;
>             u32 pid, tid;
>             u64 addr;
>             u64 len;
>             u64 pgoff;
>             char filename[];
>         };
>
>         PERF_RECORD_LOST
>         struct {
>             struct perf_event_header header;
>             u64 id;
>             u64 lost;
>         };
>
>         PERF_RECORD_COMM
>         struct {
>             struct perf_event_header header;
>             u32 pid, tid;
>             char comm[];
>         };
>
>         PERF_RECORD_EXIT
>         struct {
>             struct perf_event_header header;
>             u32 pid, ppid;
>             u32 tid, ptid;
>             u64 time;
>         };
>
>         PERF_RECORD_THROTTLE, PERF_RECORD_UNTHROTTLE
>         struct {
>             struct perf_event_header header;
>             u64 time;
>             u64 id;
>             u64 stream_id;
>         };
>
>         PERF_RECORD_FORK
>         struct {
>             struct perf_event_header header;
>             u32 pid, ppid;
>             u32 tid, ptid;
>             u64 time;
>         };
>
>         PERF_RECORD_READ
>         struct {
>             struct perf_event_header header;
>             u32 pid, tid;
>             struct read_format values;
>         };
>
>         PERF_RECORD_SAMPLE
>         struct {
>             struct perf_event_header header;
>             u64 ip;
>             if PERF_SAMPLE_IP
>
>             u32 pid, tid;
>             if PERF_SAMPLE_TID
>
>             u64 time;
>             if PERF_SAMPLE_TIME
>
>             u64 addr;
>             if PERF_SAMPLE_ADDR
>
>             u64 id;
>             if PERF_SAMPLE_ID
>
>             u64 stream_id;
>             if PERF_SAMPLE_STREAM_ID
>
>             u32 cpu, res;
>             if PERF_SAMPLE_CPU
>
>             u64 period;
>             if PERF_SAMPLE_PERIOD
>
>             struct read_format values;
>             if PERF_SAMPLE_READ
>
>             u64 nr
>             u64 ips[nr]
>             if PERF_SAMPLE_CALLCHAIN
>
>             perf_callchain_context {
>                 PERF_CONTEXT_HV
>                 PERF_CONTEXT_KERNEL
>                 PERF_CONTEXT_USER
>                 PERF_CONTEXT_GUEST
>                 PERF_CONTEXT_GUEST_KERNEL
>                 PERF_CONTEXT_GUEST_USER}
>             ;
>
>             u32 size;
>             char data[size];
>             if PERF_SAMPLE_RAW
>
> The RAW record data is opaque wrt the ABI That is, the ABI doesn't make
> any promises wrt to the stability of its content, it may vary depending
> on event, hardware, kernel version and phase of the moon.
>
>             { u64 from, to, flags } lbr[nr];}
>             if PERF_SAMPLE_BRANCH_STACK
>
>
>         };
>     };
>     __u16 misc;
>         PERF_RECORD_MISC_CPUMODE_MASK
>         PERF_RECORD_MISC_CPUMODE_UNKNOWN
>         PERF_RECORD_MISC_KERNEL
>         PERF_RECORD_MISC_USER
>         PERF_RECORD_MISC_HYPERVISOR
>         PERF_RECORD_MISC_GUEST_KERNEL
>         PERF_RECORD_MISC_GUEST_USER
>         PERF_RECORD_MISC_EXACT_IP
>
> Indicates that the content of PERF_SAMPLE_IP points to the actual
> instruction that triggered the event. See also perf_event_attr::precise_ip.
>     __u16 size;
>
> };
>
> .SS "Signal Overflow"
>
> Counters can be set to signal when a threshold is crossed.  This is set
> up using traditional poll()/select()/epoll() and fcntl() syscalls.
>
> Normally a notification is generated for every page filled, however
> one can additionally set perf_event_attr.wakeup_events to generate one
> every so many counter overflow events.
>
> .SS "Reading Results"
> Once a perf_event fd has been opened, the values of the events can be
> read from the fd. The values that are there are specified by the
> read_format field in the attr structure at open time.
>
> If you attempt to read into a buffer that is not big enough to hold the
> data,  an error is returned (ENOSPC).
>
> Here is the layout of the data returned by a read.
>
> If PERF_FORMAT_GROUP was specified to allow reading all events in a group
> at once:

Please format as a C structre inside .nf/.f with comments.

>     u64 nr;
>     The number of events
>     u64 time_enabled;
>     Only if PERF_FORMAT_ENABLED was specified
>     u64 time_running;
>     Only if PERF_FORMAT_RUNNING was specified
>     { u64 value; u64 id;} cntr[nr];
> An array of "nr" entries containing the event counts and an
> optional unique ID for that counter if the PERF_FORMAT_ID value was
> specified.
>
> If PERF_FORMAT_GROUP was not specified:
>     u64 value;
>     The value of the event.
>     u64 time_enabled;
>     Only if PERF_FORMAT_ENABLED was set
>     u64 time_running;
>     Only if PERF_FORMAT_RUNNING was set
>     u64 id;
> A unique value for this particular event, only there if
> PERF_FORMAT_ID was set.
>
> .SS "rdpmc instruction"
> Starting with 3.4 on x86 you can use the
> .I rdpmc
> instruction to get low-latency reads without having to enter the kernel.
>
>
> .SS "perf_event ioctl calls"
> .PP
> Various ioctls act on perf_event fds
> .TP
> .B PERF_EVENT_IOC_ENABLE
> An individual counter or counter group can be enabled
>
> .TP
> .B PERF_EVENT_IOC_DISABLE
> An individual counter or counter group can be disabled
>
> Enabling or disabling the leader of a group enables or disables the
> whole group; that is, while the group leader is disabled, none of the
> counters in the group will count.
> Enabling or disabling a member of a group other than the leader only
> affects that counter - disabling an non-leader
> stops that counter from counting but doesn't affect any other counter.
>
> .TP
> .B PERF_EVENT_IOC_REFRESH
> Additionally, non-inherited overflow counters can use
> to enable a counter for 'nr' events, after which it gets disabled again.
> I think the goal of IOC_REFRESH is not to reload the period but simply to
> adjust the number of events before the next notifications.
>
> .TP
> .B PERF_EVENT_IOC_RESET
>
> .TP
> .B PERF_EVENT_IOC_PERIOD
> IOC_PERIOD is the command to update the period and that's the one that
> does not update the current period but instead defers until next.
>
> .TP
> .B PERF_EVENT_IOC_SET_OUTPUT
>
> .TP
> .BR PERF_EVENT_IOC_SET_FILTER "(Added in 2.6.33)"
>
> .SS "Using prctl"
> A process can enable or disable all the counter groups that are
> attached to it using prctl.
> .I  prctl(PR_TASK_PERF_EVENTS_ENABLE)
> .I  prctl(PR_TASK_PERF_EVENTS_DISABLE)
> This applies to all counters on the current process, whether created by
> this process or by another, and does not affect any counters that this
> process has created on other processes.
> It only enables or disables
> the group leaders, not any other members in the groups.
>
> .SS /proc/sys/kernel/perf_event_paranoid
>
> The
> .I /proc/sys/kernel/perf_event_paranoid
> file can be set to restrict access to the performance counters.
> .B 2
> means no measurements allowed,
> .B 1
> means normal counter access
> .B 0
> means you can access CPU-specific data, and
> .B -1
>  means no restrictions.
>
>
> .SH "RETURN VALUE"
> .BR perf_event_open ()
> returns the new file descriptor, or \-1 if an error occurred
> (in which case,
> .I errno
> is set appropriately).
> .SH ERRORS
> .TP
> .B EINVAL
> Returned if the specified event is not available.
> .TP
> .B ENOSPC
> Prior to 3.3 if there was no counter room ENOSPC was returned.
> Also if you try to read results into a too small buffer.
> Linus did not like this.  (verify this was actually fixed...)
>
> .SH NOTES
> .BR perf_event_open ()
> was introduced in 2.6.31 but was called
> .BR perf_counter_open () .
> It was renamed in 2.6.32.
>
> The official way of knowing if perf_event support is enabled is checking
> for the existence of the file
> .I /proc/sys/kernel/perf_event_paranoid
>
> .SH BUGS
>
> Prior to 2.6.34 event constraints were not enforced by the kernel.
> In that case, some events would silently return "0" if the kernel
> scheduled them in an improper counter slot.
>
> Kernels from 2.6.35 to 2.6.39 can quickly crash the kernel if
> "inherit" is enabled and many threads are started.
>
> Prior to 2.6.33 (at least for x86) the kernel did not check
> if events could be scheduled together until read time.
> The same happens on all known kernels if the NMI watchdog is enabled.
> This means to see if a given eventset works you have to
> .BR perf_event_open ()
> , start, then read before you know for sure you
> can get value measurements.
>
> Prior to 2.6.35 PERF_FORMAT_GROUP did not work with attached
> processes.
>
> The F_SETOWN_EX option to fcntl is needed to properly get overflow
> signals in threads.  This was introduced in 2.6.32.
>
> In older 2.6 versions refreshing an event group leader refreshed all siblings,
> and refreshing with a parameter of 0 enabled infinite refresh. This behavior
> is unsupported and should not be relied on.
>
> There is a bug in the kernel code between 2.6.36 and 3.0 that ignores the
> "watermark" field and acts as if a wakeup_event was chosen if the union has a
> non-zero value in it.
>
> Always double-check your results!  Various generalized events
> have had wrong values.  For example, retired branches measured
> the wrong thing on AMD machines until 2.6.35.
>
> .SH EXAMPLE
> The following is a short example that measures the total
> instruction count of the printf routine.
> .nf
>
> #include <stdlib.h>
> #include <stdio.h>
> #include <unistd.h>
> #include <string.h>
> #include <sys/ioctl.h>
> #include <linux/perf_event.h>
> #include <asm/unistd.h>
>
> long perf_event_open( struct perf_event_attr *hw_event, pid_t pid, int cpu,
>                       int group_fd, unsigned long flags ) {
>     int ret;
>
>     ret = syscall( __NR_perf_event_open, hw_event, pid, cpu,
>                    group_fd, flags );
>     return ret;
> }
>
>
> int
> main(int argc, char **argv) {
>
>     struct perf_event_attr pe;
>     long long count;
>     int fd;
>
>     memset(&pe,0,sizeof(struct perf_event_attr));
>     pe.type=PERF_TYPE_HARDWARE;
>     pe.size=sizeof(struct perf_event_attr);
>     pe.config=PERF_COUNT_HW_INSTRUCTIONS;
>     pe.disabled=1;
>     pe.exclude_kernel=1;
>     pe.exclude_hv=1;
>
>     fd=perf_event_open(&pe,0,-1,-1,0);
>     if (fd<0) fprintf(stderr,"Error opening leader %llx\\n",pe.config);
>
>     ioctl(fd, PERF_EVENT_IOC_RESET, 0);
>     ioctl(fd, PERF_EVENT_IOC_ENABLE,0);
>
>     printf("Measuring instruction count for this printf\\n");
>
>     ioctl(fd, PERF_EVENT_IOC_DISABLE,0);
>     read(fd,&count,sizeof(long long));
>
>     printf("Used %lld instructions\\n",count);
>
>     close(fd);
> }
> .fi
>
> .SH "SEE ALSO"
> .BR fcntl (2),
> .BR mmap (2),
> .BR open (2),
> .BR prctl (2)
> .BR read (2)

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
