From: Vince Weaver <vweaver1-qKp7vQ+Mknf2fBVCVOL8/A@public.gmane.org>
Subject: Re: perf_event_open() manpage
Date: Tue, 21 Aug 2012 17:22:33 -0400
Message-ID: <alpine.DEB.2.00.1208211718180.28775@cl320.icl.utk.edu>
References: <alpine.DEB.2.00.1207101702490.15511@cl320.icl.utk.edu> <alpine.DEB.2.00.1207261416540.22647@cl320.icl.utk.edu> <CAKgNAki69O4zEb67qKiKX1K90EybG-SXo90j4ymrhcf6D9Y7dQ@mail.gmail.com> <alpine.DEB.2.00.1208061617400.25549@cl320.icl.utk.edu>
 <alpine.DEB.2.00.1208091507240.2137@cl320.icl.utk.edu> <CAKgNAkgcq2NrynX65RJUyNupi5=OQBEF4D_U=KpE0W8YryCrMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgcq2NrynX65RJUyNupi5=OQBEF4D_U=KpE0W8YryCrMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephane Eranian <eranian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, 18 Aug 2012, Michael Kerrisk (man-pages) wrote:

> Thanks for improving the page. Here's another review pass with more 
> comments.

Below is my updated version.  Hopefully I've addressed most of your 
comments.

I really have no preference about documentation license.  I picked
GPL2 since some of the document is heavily based on code and 
comments cut/pasted from various parts of the kernel tree.

Thanks

Vince




.\" Hey Emacs! This file is -*- nroff -*- source.
.\"
.\" Copyright (c) 2012, Vincent Weaver
.\"
.\" This is free documentation; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public License as
.\" published by the Free Software Foundation; either version 2 of
.\" the License, or (at your option) any later version.
.\"
.\" The GNU General Public License's references to "object code"
.\" and "executables" are to be interpreted as the output of any
.\" document formatting or typesetting system, including
.\" intermediate and printed output.
.\"
.\" This manual is distributed in the hope that it will be useful,
.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
.\" GNU General Public License for more details.
.\"
.\" You should have received a copy of the GNU General Public
.\" License along with this manual; if not, see
.\" <http://www.gnu.org/licenses/>.
.\"
.\" This document is based on the perf_event.h header file, the 
.\" tools/perf/design.txt file, and a lot of bitter experience.
.\"
.TH PERF_EVENT_OPEN 2 2012-08-21 "Linux" "Linux Programmer's Manual"
.SH NAME
perf_event_open \- setup performance monitoring
.SH SYNOPSIS
.nf
.B #include <linux/perf_event.h>
.B #include <linux/hw_breakpoint.h>
.sp
.BI "int perf_event_open(struct perf_event_attr *" hw_event ", pid_t " pid ", int " cpu ", int " group_fd ", unsigned long " flags  );
.fi
.SH DESCRIPTION
Given a list of parameters
.BR perf_event_open ()
returns a file descriptor, a small, nonnegative integer
for use in subsequent system calls
.RB ( read "(2), " mmap "(2), " prctl "(2), " fcntl "(2), etc.)."
.PP
A call to
.BR perf_event_open ()
creates a file descriptor that allows measuring performance
information.  
Each file descriptor corresponds to one
event that is measured; these can be grouped together
to measure multiple events simultaneously.
.PP
Events can be enabled and disabled in two ways: via 
.BR ioctl (2)
and via 
.BR prctl (2) . 
When an eventset is disabled it does not count or generate events but does 
continue to exist and maintain its count value.
Events come in two flavors: counting and sampled. 
A 
.I counting 
event is one that is used for counting the aggregate number of events 
that occur.  
In general counting event results are gathered with a 
.BR read (2)
call.
A
.I sampling
event periodically writes measurements to a buffer that can then
be accessed via
.BR  mmap (2) .
.SS Arguments
.P
The argument
.I pid
allows events to be attached to processes in various ways.
If
.I pid
is 0
measurements happen on the current task, if
.I pid
is greater than 0 
the process indicated by 
.I pid 
is measured, and if
.I pid
is less than 0
all processes are counted.

The 
.I cpu
argument allows measurements to be specific to a CPU.
If
.I cpu
is greater than or equal to 0 measurements are restricted to 
the specified CPU;
if
.I cpu
is \-1 the events are measured on all CPUs.
.P
Note that the combination of 
.IR pid " == \-1"
and 
.IR cpu " == \-1"
is not valid.
.P
A 
.IR pid " > 0" 
and 
.IR cpu " == \-1"
setting measures per-process and follows that process to whatever CPU the 
process gets scheduled to. Per-process events can be created by any user.
.P
A 
.IR pid " == \-1"
and 
.IR cpu " >= 0"
setting is per-CPU and measures all processes on  the specified CPU. 
Per-CPU events need 
.B CAP_SYS_ADMIN 
privileges. 
.P
The 
.I group_fd 
argument allows counter groups to be set up. 
A counter group has one counter which is the group leader. 
The leader is created first, with 
.IR group_fd " = \-1"
in the 
.BR perf_event_open ()
call that creates it. 
The rest of the group members are created subsequently, with 
.IR group_fd 
giving the fd of the group leader. 
(A single counter on its own is created with 
.IR group_fd " = \-1"
and is considered to be a group with only 1 member).
.P
A counter group is scheduled onto the CPU as a unit: it will only 
be put onto the CPU if all of the counters in the group can be put onto 
the CPU. 
This means that the values of the member counters can be 
meaningfully compared, added, divided (to get ratios), etc., with each 
other, since they have counted events for the same set of executed 
instructions. 
.P
The 
.I flags 
argument takes one of the following values:
.RS
.TP
.BR PERF_FLAG_FD_NO_GROUP
This flag allows creating an event as part of an event group but
having no group leader.  It is unclear why this is useful.
.TP
.BR PERF_FLAG_FD_OUTPUT
This flag re-routes the output from an event to the group leader.
.TP
.BR PERF_FLAG_PID_CGROUP " (added in 2.6.39)."
This flag activates per-container system-wide monitoring. A container
is an abstraction that isolates a set of resources for finer grain
control (cpus, memory, etc...). In this mode, the event is measured
only if the thread running on the monitored CPU belongs to the designated
container (cgroup). The cgroup is identified by passing a file descriptor
opened on its directory in the cgroupfs filesystem. For instance, if the
cgroup to monitor is called 
.IR test , 
then a file descriptor opened on
.I /dev/cgroup/test 
(assuming cgroupfs is mounted on 
.IR /dev/cgroup )  
must be passed as the 
.I pid 
parameter. cgroup monitoring is only available
for system-wide events and may therefore require extra permissions.
.RE

.P
The 
.I perf_event_attr 
structure is what is passed into the 
.BR perf_event_open ()
syscall. 
It is large and has a complicated set of dependent fields.

.nf
struct perf_event_attr {
    __u32    type;      /* Type of event */
    __u32    size;      /* Size of attribute structure */
    __u64    config;    /* Type-specific configuration */

    union {
        __u64    sample_period;    /* Period of sampling */
        __u64    sample_freq;      /* Frequency of sampling */
    };

    __u64    sample_type;    /* Specifies values included in sample */
    __u64    read_format;    /* Specifies values returned in read */

        __u64    disabled       : 1, /* off by default         */
                 inherit        : 1, /* children inherit it    */
                 pinned         : 1, /* must always be on PMU  */
                 exclusive      : 1, /* only group on PMU      */
                 exclude_user   : 1, /* don't count user       */
                 exclude_kernel : 1, /* don't count kernel     */
                 exclude_hv     : 1, /* don't count hypervisor */
                 exclude_idle   : 1, /* don't count when idle  */
                 mmap           : 1, /* include mmap data      */
                 comm           : 1, /* include comm data      */
                 freq           : 1, /* use freq, not period   */
                 inherit_stat   : 1, /* per task counts        */
                 enable_on_exec : 1, /* next exec enables      */
                 task           : 1, /* trace fork/exit        */
                 watermark      : 1, /* wakeup_watermark       */
                 precise_ip     : 2, /* skid constraint        */
                 mmap_data      : 1, /* non-exec mmap data     */
                 sample_id_all  : 1, /* sample_type all events */
                 exclude_host   : 1, /* don't count in host    */
                 exclude_guest  : 1, /* don't count in guest   */
                 __reserved_1   : 43;

        union {
            __u32    wakeup_events;    /* wakeup every n events */
            __u32    wakeup_watermark; /* bytes before wakeup   */
        };

        __u32    bp_type;     /* breakpoint type */

        union {
            __u64    bp_addr; /* breakpoint address */
            __u64    config1; /* extension of config */
        };

        union {
            __u64    bp_len;  /* breakpoint length */
            __u64    config2; /* extension of config1 */
        };
        __u64   branch_sample_type; /* enum branch_sample_type */
    };
.fi

The fields of the attr structure are described in more detail below:

.TP
.I type
This field specifies the overall event type. It has one of
the following values:
.RS
.TP
.B PERF_TYPE_HARDWARE
This indicates one of the "generalized" hardware events provided 
by the kernel.  See the 
.I config 
field definition for more details.
.TP
.B PERF_TYPE_SOFTWARE
This indicates one of the software-defined events provided by the kernel 
(even if no HW support available).
.TP
.B PERF_TYPE_TRACEPOINT
This indicates a tracepoint
provided by the kernel tracepoint infrastructure.
.TP
.B PERF_TYPE_HW_CACHE 
This indicates a hardware cache event.  This has
a special encoding, described in the
.I config
field definition.
.TP
.B PERF_TYPE_RAW
This indicates a "raw" implementation-specific event in the 
.IR config " field."
.TP
.BR PERF_TYPE_BREAKPOINT " (Added in 2.6.33)"
This indicates a hardware breakpoint as provided by the CPU.
Breakpoints can be read/write accesses to an address as well as 
execution of an instruction address.
.TP
.RB "dynamic PMU"
As of 2.6.39 perf_event can support multiple PMUs. Each PMU is
uniquely identified by its type fields. The value for this field
is exported by the kernel in the sysfs filesystem. There is a
subdir per PMU instance under 
.IR /sys/devices . 
In each subdir, there is a 
.I type 
file. The content of this file is the type value for the PMU. 
For instance, 
.I /sys/devices/cpu/type
contains the value for the core CPU PMU which is usually 4.
.RE

.TP
.I "size"
The size of the 
.I perf_event_attr 
structure for forward/backward compatibility. 
Set this using sizeof(struct perf_event_attr) to allow the kernel to see 
the struct size at the time of compilation.

The related define 
.B PERF_ATTR_SIZE_VER0 
is set to 64; this was the size of the first published struct.
.B PERF_ATTR_SIZE_VER1
is 72, corresponding to the addition of breakpoints in 2.6.33.
.B PERF_ATTR_SIZE_VER2
is 80 corresponding to the addition of branch sampling in 3.4.

.TP
.I "config"

This specifies which event you want, in conjunction with 
the 
.I type 
field.  The 
.IR config1 " and " config2
fields are also taken into account in cases where 64 bits is not 
enough to fully specify the event.
The encoding of these fields are event dependent.

The most significant bit (bit 63) of 
.I config 
signifies cpu specific (raw) counter configuration data;
if the most significant bit is unset, the next 7 bits are an event 
type and the rest of the bits are the event identifier.

There are various ways to set the 
.I config
field that are dependent on the value of the previously 
described
.I type
field.  What follows are various possible settings for
.I config
separated out by 
.IR type .

.RS
.RI "If " type " is"
.B PERF_TYPE_HARDWARE
we are measuring one of the generalized hardware CPU events.
Not all of these are available on all platforms.
Set
.I config
to one of the following:
.RS
.TP
.B PERF_COUNT_HW_CPU_CYCLES 
Total cycles. Be wary of what happens during cpu frequency scaling
.TP
.B PERF_COUNT_HW_INSTRUCTIONS
Retired instructions. Be careful, these can be affected by various 
issues, most notably hardware interrupt counts
.TP
.B PERF_COUNT_HW_CACHE_REFERENCES
Usually Last Level Cache. Unclear if this includes 
prefetches and coherency messages.
.TP
.B PERF_COUNT_HW_CACHE_MISSES
Usually Last Level Cache. Unclear if this includes
prefetches and coherency messages.
.TP
.B PERF_COUNT_HW_BRANCH_INSTRUCTIONS
Retired branch instructions.  Prior to 2.6.34 this used
the wrong event on AMD processors.
.TP
.B PERF_COUNT_HW_BRANCH_MISSES
Mispredicted branch instructions.
.TP
.B PERF_COUNT_HW_BUS_CYCLES
Bus cycles, which can be different than total cycles.
.TP
.BR PERF_COUNT_HW_STALLED_CYCLES_FRONTEND " (Added in 3.0)"
Stalled cycles during issue.
.TP
.BR PERF_COUNT_HW_STALLED_CYCLES_BACKEND  " (Added in 3.0)"
Stalled cycles during retirement.
.TP
.BR PERF_COUNT_HW_REF_CPU_CYCLES  " (Added in 3.3)"
Total cycles; not affected by CPU frequency scaling.
.RE
.RE

.RS
.RI "If " type " is"
.B PERF_TYPE_SOFTWARE
we are measuring software events provided by the kernel.
Set
.I config
to one of the following:
.RS
.TP
.B PERF_COUNT_SW_CPU_CLOCK
This reports the CPU clock, a high-resolution per-cpu timer.
.TP
.B PERF_COUNT_SW_TASK_CLOCK
This reports a clock count specific to the task that is running.
.TP
.B PERF_COUNT_SW_PAGE_FAULTS
This reports the number of page faults.
.TP
.B PERF_COUNT_SW_CONTEXT_SWITCHES
This counts context switches.  
Until 2.6.34 these were all reported as user-space
events, after that they are reported as happening in the kernel.
.TP
.B PERF_COUNT_SW_CPU_MIGRATIONS
This reports the number of times the process
has migrated to a new CPU.
.TP
.B PERF_COUNT_SW_PAGE_FAULTS_MIN
This counts the number of minor page faults.
These did not require disk I/O to handle.
.TP
.B PERF_COUNT_SW_PAGE_FAULTS_MAJ
This counts the number of major page faults.
These required disk I/O to handle.
.TP
.BR PERF_COUNT_SW_ALIGNMENT_FAULTS " (Added in 2.6.33)"
This counts the number of alignment faults.
These happen when unaligned memory accesses happen; the kernel
can handle these but it reduces performance.  This
only happens on some architectures (never on x86).
.TP
.BR PERF_COUNT_SW_EMULATION_FAULTS " (Added in 2.6.33)"
This counts the number of emulation faults.
The kernel sometimes traps on unimplemented instructions
and emulates them for userspace.  This can
negatively impact performance.
.RE
.RE


.RS
.RI "If " type " is"
.B PERF_TYPE_TRACEPOINT
then we are measuring kernel tracepoints.  The value to use in 
.I config
can be obtained from under debugfs
.I tracing/events/*/*/id
if ftrace is enabled in the kernel.

.RE

.RS
.RI "If " type " is"
.B PERF_TYPE_HW_CACHE
then we are measuring a hardware CPU cache event.
To calculate the appropriate
.I config 
value use the following equation:
.RS 
(perf_hw_cache_id) | (perf_hw_cache_op_id << 8) | 
(perf_hw_cache_op_result_id << 16)
.P
where 
.I perf_hw_cache_id
is one of:
.RS
.TP
.B PERF_COUNT_HW_CACHE_L1D
for measuring Level 1 Data Cache
.TP
.B PERF_COUNT_HW_CACHE_L1I
for measuring Level 1 Instruction Cache
.TP
.B PERF_COUNT_HW_CACHE_LL
for measuring Last-Level Cache
.TP
.B PERF_COUNT_HW_CACHE_DTLB
for measuring the Data TLB
.TP
.B PERF_COUNT_HW_CACHE_ITLB
for measuring the Instruction TLB
.TP
.B PERF_COUNT_HW_CACHE_BPU 
for measuring the branch prediction unit
.TP
.BR PERF_COUNT_HW_CACHE_NODE " (Added in 3.0)"
for measuring local memory accesses
.RE

.P 
and
.I perf_hw_cache_op_id
is one of
.RS
.TP
.B PERF_COUNT_HW_CACHE_OP_READ
for read accesses
.TP
.B PERF_COUNT_HW_CACHE_OP_WRITE
for write accesses
.TP
.B PERF_COUNT_HW_CACHE_OP_PREFETCH 
for prefetch accesses
.RE

.P
and
.I perf_hw_cache_op_result_id
is one of
.RS
.TP
.B PERF_COUNT_HW_CACHE_RESULT_ACCESS
to measure accesses
.TP            
.B PERF_COUNT_HW_CACHE_RESULT_MISS 
to measure misses
.RE
.RE
.RE


.RS
.RI "If " type " is"
.B PERF_TYPE_RAW
then a custom "raw" 
.I config
value is needed.
Most CPUs support events that are not covered by the "generalized" events. 
These are implementation defined; see your CPU manual (for example
the Intel Volume 3B documentation or the AMD BIOS and Kernel Developer
Guide). 
The libpfm4 library can be used to translate from the name in the 
architectural manuals to the raw hex value perf_event
expects in this field.
.RE

.RS
.RI "If " type " is"
.B PERF_TYPE_BREAKPOINT
then leave 
.I config 
set to zero.  Its parameters are set in other places.
.RE

.TP
.IR sample_period ", " sample_freq
A "sampling" counter is one that generates an interrupt 
every N events, where N is given by 
.IR sample_period . 
A sampling counter has 
.IR sample_period " > 0." 
The 
.I sample_type 
field controls what data is recorded on each interrupt.

.I sample_freq
can be used if you wish to use frequency rather than period.
In this case you set the
.I freq
flag. The kernel will adjust the sampling period
to try and achieve the desired rate. The rate of adjustment is a
timer tick.


.TP
.I "sample_type"
The various bits in this field specify which values to include
in the overflow packets.  They will be recorded in a ring-buffer, 
which is available to user-space using 
.BR mmap (2). 
The order in which the values are saved in the
overflow packets as documented in the MMAP Layout subsection below;
it is not the enum perf_event_sample_format order.
.RS
.TP
.B PERF_SAMPLE_IP
instruction pointer
.TP
.B PERF_SAMPLE_TID
thread id
.TP
.B PERF_SAMPLE_TIME
time
.TP
.B PERF_SAMPLE_ADDR
address
.TP
.B PERF_SAMPLE_READ
[To be documented]
.TP
.B PERF_SAMPLE_CALLCHAIN
[To be documented]
.TP
.B PERF_SAMPLE_ID
[To be documented]
.TP
.B PERF_SAMPLE_CPU
[To be documented]
.TP
.B PERF_SAMPLE_PERIOD
[To be documented]
.TP
.B PERF_SAMPLE_STREAM_ID
[To be documented]
.TP
.B PERF_SAMPLE_RAW 
[To be documented]
.TP
.BR PERF_SAMPLE_BRANCH_STACK " (Added in 3.4)"
[To be documented]
.RE

.TP
.IR "read_format"
This field specifies the format of the data returned by 
.BR read (2) 
on a perf_event file descriptor.
.RS
.TP
.B PERF_FORMAT_TOTAL_TIME_ENABLED
Adds the 64-bit "time_enabled" field. 
This can be used to calculate estimated totals if 
the PMU is overcommitted and multiplexing is happening.
.TP
.B PERF_FORMAT_TOTAL_TIME_RUNNING
Adds the 64-bit "time_running" field. 
This can be used to calculate estimated totals if 
the PMU is overcommitted and  multiplexing is happening.
.TP
.B PERF_FORMAT_ID
Adds a 64-bit unique value that corresponds to the event-group.
.TP
.B PERF_FORMAT_GROUP
Allows all counter values in an event-group to be read with one read. 
.RE

.TP
.IR "disabled"
The 
.I disabled
bit specifies whether the counter starts out disabled or enabled.
If disabled, the event can later be enabled by 
.BR ioctl (2),
.BR prctl (2),
or 
.IR enable_on_exec .

.TP
.IR "inherit"
The 
.I inherit 
bit specifies that this counter should count events of child
tasks as well as the task specified. 
This only applies to new children, not to any existing children at 
the time the counter is created (nor to any new children of
existing children).

Inherit does not work for some combinations of 
.IR read_format s,
such as 
.BR PERF_FORMAT_GROUP .

.TP
.IR "pinned"
The 
.I pinned 
bit specifies that the counter should always be on the CPU if at all 
possible. 
It only applies to hardware counters and only to group leaders. 
If a pinned counter cannot be put onto the CPU (e.g. because there are 
not enough hardware counters or because of a conflict with some other 
event), then the counter goes into an 'error' state, where reads 
return end-of-file (i.e. 
.BR read (2) 
returns 0) until the counter is subsequently enabled or disabled.

.TP
.IR "exclusive"
The 
.I exclusive 
bit specifies that when this counter's group is on the CPU, 
it should be the only group using the CPU's counters. 
In the future this may allow monitoring programs to 
support PMU features that need to run alone so that they do not
disrupt other hardware counters.

.TP
.IR "exclude_user"
If this bit is set the count excludes events that happen in user-space.

.TP
.IR "exclude_kernel"
If this bit is set the count excludes events that happen in kernel-space.

.TP
.IR "exclude_hv"
If this bit is set the count excludes events that happen in the 
hypervisor. 
This is mainly for PMUs that have built-in support for handling this 
(such as POWER). 
Extra support is needed for handling hypervisor measurements on most 
machines.

.TP
.IR "exclude_idle"
If set don't count when the CPU is idle.

.TP
.IR "mmap"
The 
.I mmap
bit enables recording of extra information to a
mmap'd ring-buffer.  This is
described below in subsection MMAP Layout.

.TP
.IR "comm"
The 
.I comm 
bit enables tracking of process command name as modified by the
.IR exec (2) 
and
.IR prctl (PR_SET_NAME) 
system calls. Unfortunately for tools,
there is no way to distinguish one system call vs. the other.

.TP
.IR "freq"
If this bit is set then 
.I sample_frequency
not
.I sample_period
is used when setting up the sampling interval.

.TP
.IR "inherit_stat"
This bit enables Per task counts?  
It is unclear how this is different from the 
.I inherit
field.

.TP
.IR "enable_on_exec"
If this bit is set a counter is automatically
enabled after a call to 
.BR exec (2).

.TP
.IR "task"
If this bit is set then 
fork/exit notifications are included in the ring buffer.

.TP
.IR "watermark"
If set, have a sampling interrupt happen when we cross the 
wakeup_watermark boundary.

.TP
.IR "precise_ip" " (Added in 2.6.35)"
This controls the amount of skid.  Skid is how many instructions
execute between an event of interest happening and the kernel
being able to stop and record the event.  Smaller skid is
better and allows more accurate reporting of which events
correspond to which instructions, but hardware is often limited 
with how small this can be.

The values of this are the following:
.RS
.TP
0 - 
.B SAMPLE_IP 
can have arbitrary skid
.TP
1 - 
.B SAMPLE_IP 
must have constant skid
.TP
2 - 
.B SAMPLE_IP 
requested to have 0 skid
.TP
3 - 
.B SAMPLE_IP 
must have 0 skid.
See also 
.BR PERF_RECORD_MISC_EXACT_IP .
.RE

.TP
.IR "mmap_data" " (Added in 2.6.36)"
Include mmap events in the ring_buffer.

.TP
.IR "sample_id_all" " (Added in 2.6.38)"
If set then all sample ID info (TID, TIME, ID, CPU, STREAM_ID) 
will be provided.

.TP
.IR "exclude_host" " (Added in 3.2)"
Do not measure time spent in VM host

.TP
.IR "exclude_guest" " (Added in 3.2)"
Do not measure time spent in VM guest


.TP
.IR "wakeup_events" ", " "wakeup_watermark"
This union sets how many events 
.RI ( wakeup_events )
or bytes 
.RI ( wakeup_watermark )
happen before an overflow signal happens. 
Which one is used is selected by the 
.I watermark 
bitflag.

.TP
.IR "bp_type" " (Added in 2.6.33)"
This chooses the breakpoint type.  It is one of:
.RS
.TP
.BR HW_BREAKPOINT_EMPTY
no breakpoint
.TP
.BR HW_BREAKPOINT_R
count when we read the memory location
.TP
.BR HW_BREAKPOINT_W
count when we write the memory location
.TP
.BR HW_BREAKPOINT_RW
count when we read or write the memory location
.TP
.BR HW_BREAKPOINT_X
count when we execute code at the memory location
.TP
.BR HW_BREAKPOINT_INVALID
invalid breakpoint?
.RE

.TP
.IR "bp_addr" " (added in 2.6.33)"
.I bp_addr 
address of the breakpoint.

.TP
.IR "config1" " (added in 2.6.39)"
.I config1 
is used for setting events that need an extra register or otherwise 
do not fit in the regular config field. 
Raw OFFCORE_EVENTS on Nehalem/Westmere/SandyBridge use this field 
on 3.3 and later kernels.

.TP
.IR "bp_len" " (added in 2.6.33)"
.I bp_len
is the length of the breakpoint being measured if
.I type
is
.BR PERF_TYPE_BREAKPOINT .
Options are
.BR HW_BREAKPOINT_LEN_1 ,
.BR HW_BREAKPOINT_LEN_2 ,
.BR HW_BREAKPOINT_LEN_4 ,
.BR HW_BREAKPOINT_LEN_8 .
For an execution breakpoint set this to sizeof(long).

.TP
.IR "config2" " (added in 2.6.39)"

.I config2 
is a further extension of the 
.I config1
field.

.TP
.IR "branch_sample_type" " (added in 3.4)"
This is used with the CPUs hardware branch sampling, if available.
It can have one of the following values:
.RS
.TP
.B PERF_SAMPLE_BRANCH_USER     
Branch target is in user space
.TP
.B PERF_SAMPLE_BRANCH_KERNEL   
Branch target is in kernel space
.TP
.B PERF_SAMPLE_BRANCH_HV
Branch target is in hypervisor
.TP
.B PERF_SAMPLE_BRANCH_ANY      
Any branch type.
.TP
.B PERF_SAMPLE_BRANCH_ANY_CALL 
Any call branch
.TP
.B PERF_SAMPLE_BRANCH_ANY_RETURN   
Any return branch
.TP
.BR PERF_SAMPLE_BRANCH_IND_CALL
Indirect calls
.TP
.BR PERF_SAMPLE_BRANCH_PLM_ALL
User, kernel, and hv
.RE


.SS "MMAP Layout"

When using perf_event is sampled mode, asynchronous events
(like counter overflow or PROT_EXEC mmap tracking)
are logged into a ring-buffer. 
This ring-buffer is created and accessed through 
.BR mmap (2).

The mmap size should be 1+2^n pages, where the first page is a 
meta-data page (struct perf_event_mmap_page) that contains various 
bits of information such as where the ring-buffer head is.

There is a bug previous to 2.6.39 where you have to allocate a mmap 
ring buffer when sampling even if you do not plan to access it.

The structure of the first meta-data mmap page is as follows:
.nf

struct perf_event_mmap_page {
    __u32 version;          /* version number of this structure   */
    __u32 compat_version;   /* lowest version this is compat with */
    __u32 lock;             /* seqlock for synchronization        */
    __u32 index;            /* hardware counter identifier        */
    __s64 offset;           /* add to hardware counter value      */
    __u64 time_enabled;     /* time event active                  */
    __u64 time_running;     /* time event on CPU                  */
    union {
        __u64   capabilities; 
        __u64   cap_usr_time  : 1, 
                cap_usr_rdpmc : 1,
    };
    __u16   pmc_width;
    __u16   time_shift;
    __u32   time_mult;
    __u64   time_offset;
    __u64   __reserved[120];   /* Pad to 1k                */
    __u64   data_head;         /* head in the data section */
    __u64   data_tail;         /* user-space written tail  */
}
.fi



The following looks at the fields in the perf_event_mmap_page
structure in more detail.

.RS

.TP
.I version
Version number of this structure.

.TP
.I compat_version
The lowest version this is compatible with.

.TP
.I lock
A seqlock for synchronization.

.TP
.I index;            
A unique hardware counter identifier.

.TP
.I offset
Add this to hardware counter value??

.TP
.I time_enabled
Time the event was active.

.TP
.I time_running
Time the event was running.

.TP
.I cap_usr_time
User time capability

.TP
.I cap_usr_rdpmc
If the hardware supports user-space read of performance counters
without syscall (this is the "rdpmc" instruction on x86) then
the following code can be used to do a read.
.nf

u32 seq, time_mult, time_shift, idx, width;
u64 count, enabled, running;
u64 cyc, time_offset;
s64 pmc = 0;

do {
    seq = pc->lock;
    barrier();
    enabled = pc->time_enabled;
    running = pc->time_running;
    if (pc->cap_usr_time && enabled != running) {
        cyc = rdtsc();
        time_offset = pc->time_offset;
        time_mult   = pc->time_mult;
        time_shift  = pc->time_shift;
    }
    idx = pc->index;
    count = pc->offset;
    if (pc->cap_usr_rdpmc && idx) {
        width = pc->pmc_width;
        pmc = rdpmc(idx - 1);
    }
    barrier();
} while (pc->lock != seq);
.fi

 


.TP
.I pmc_width
If cap_usr_rdpmc this field provides the bit-width of the value
read using the rdpmc or equivalent instruction. This can be used
to sign extend the result like:
.nf

pmc <<= 64 - pmc_width;
pmc >>= 64 - pmc_width; // signed shift right
count += pmc;
.fi


.TP
.IR time_shift ", " time_mult ", " time_offset

If cap_usr_time these fields can be used to compute the time
delta since time_enabled (in ns) using rdtsc or similar.
.nf

    u64 quot, rem;
    u64 delta;
    quot = (cyc >> time_shift);
    rem = cyc & ((1 << time_shift) - 1);
    delta = time_offset + quot * time_mult +
            ((rem * time_mult) >> time_shift);
.fi

Where time_offset,time_mult,time_shift and cyc are read in the
seqcount loop described above. This delta can then be added to
enabled and possible running (if idx), improving the scaling:
.nf

    enabled += delta;
    if (idx)
        running += delta;
    quot = count / running; 
    rem  = count % running;
    count = quot * enabled + (rem * enabled) / running;
.fi

.TP
.I data_head
This points to the head of the data section.
On SMP capable platforms after reading the data_head value 
user-space should issue an rmb(). 

.TP
.I data_tail;         
When the mapping is PROT_WRITE the data_tail value should be written by 
userspace to reflect the last read data. 
In this case the kernel will not over-write unread data.

.RE


The following 2^n ring-buffer pages have the layout described below.

If perf_event_attr.sample_id_all is set then all event types will 
have the sample_type selected fields related to where/when (identity) 
an event took place (TID, TIME, ID, CPU, STREAM_ID) described in 
PERF_RECORD_SAMPLE below, it will be stashed just after the 
perf_event_header and the fields already present for the existing 
fields, i.e. at the end of the payload. 
That way a newer perf.data 
file will be supported by older perf tools, with these new optional 
fields being ignored.

The mmap values start with a header:

.nf
struct perf_event_header {
    __u32   type;
    __u16   misc;
    __u16   size;
};
.fi

Below we describe the perf_event_header fields in more detail.

.RS
.TP
.I type

The 
.I type 
value is one of the below.  The values
in the corresponding record (that follows the header)
depend on the
.I type
selected as shown.

.RS
.TP    
.B PERF_RECORD_MMAP
The MMAP events record the PROT_EXEC mappings so that we can correlate 
userspace IPs to code. They have the following structure:
.nf

struct {
    struct perf_event_header header;
    u32    pid, tid;
    u64    addr;
    u64    len;
    u64    pgoff;
    char   filename[]; 
};

.TP
.B PERF_RECORD_LOST
This record indicates when events are lost.
.nf

struct {
    struct perf_event_header header;
    u64 id;
    u64 lost; 
};
.fi

.TP
.B PERF_RECORD_COMM
This record indicates a change in the process name.
.nf

struct {
    struct perf_event_header header;
    u32 pid, tid;
    char comm[]; 
};
.fi

.TP
.B PERF_RECORD_EXIT
This record indicates a process exit event.
.nf

struct {
    struct perf_event_header header;
    u32 pid, ppid;
    u32 tid, ptid;
    u64 time; 
};
.fi

.TP
.BR PERF_RECORD_THROTTLE ", " PERF_RECORD_UNTHROTTLE
This record indicates a throttle/unthrottle event.
.nf

struct {
    struct perf_event_header header;
    u64 time;
    u64 id;
    u64 stream_id; 
};
.fi

.TP
.B PERF_RECORD_FORK
This record indicates a fork event.
.nf

struct {
    struct perf_event_header header;
    u32 pid, ppid;
    u32 tid, ptid;
    u64 time; 
};
.fi

.TP
.B PERF_RECORD_READ
This record indicates a read event.
.nf
        
struct {
    struct perf_event_header header;
    u32 pid, tid;
    struct read_format values; 
};
.fi

.TP
.B PERF_RECORD_SAMPLE
This record indicates a sample.
.nf

struct {
    struct perf_event_header header;
    u64   ip;          /* if PERF_SAMPLE_IP      */
    u32   pid, tid;    /* if PERF_SAMPLE_TID     */
    u64   time;        /* if PERF_SAMPLE_TIME    */
    u64   addr;        /* if PERF_SAMPLE_ADDR    */
    u64   id;          /* if PERF_SAMPLE_ID      */
    u64   stream_id; /* if PERF_SAMPLE_STREAM_ID */
    u32   cpu, res;    /* if PERF_SAMPLE_CPU     */
    u64   period;      /* if PERF_SAMPLE_PERIOD  */
    struct read_format v; /* if PERF_SAMPLE_READ */
    u64   nr;        /* if PERF_SAMPLE_CALLCHAIN */
    u64   ips[nr];   /* if PERF_SAMPLE_CALLCHAIN */
    u32   size;        /* if PERF_SAMPLE_RAW     */
    char  data[size];  /* if PERF_SAMPLE_RAW     */
    u64   from;   /* if PERF_SAMPLE_BRANCH_STACK */
    u64   to;     /* if PERF_SAMPLE_BRANCH_STACK */
    u64   flags;  /* if PERF_SAMPLE_BRANCH_STACK */
    u64   lbr[nr];/* if PERF_SAMPLE_BRANCH_STACK */
};
.fi

The RAW record data is opaque with respect to the ABI.
The ABI doesn't make any promises with respect to the stability 
of its content, it may vary depending 
on event, hardware, and kernel version.

.RE


.TP
.I misc
The
.I misc
field is one of the following:
.RS
.TP
.B PERF_RECORD_MISC_CPUMODE_MASK
[To be documented]
.TP
.B PERF_RECORD_MISC_CPUMODE_UNKNOWN
[To be documented]
.TP
.B PERF_RECORD_MISC_KERNEL
[To be documented]
.TP
.B PERF_RECORD_MISC_USER
[To be documented]
.TP
.B PERF_RECORD_MISC_HYPERVISOR
[To be documented]
.TP
.B PERF_RECORD_MISC_GUEST_KERNEL
[To be documented]
.TP
.B PERF_RECORD_MISC_GUEST_USER
[To be documented]
.TP
.B PERF_RECORD_MISC_EXACT_IP
This indicates that the content of PERF_SAMPLE_IP points 
to the actual instruction that triggered the event. 
See also 
.IR perf_event_attr.precise_ip "." 

.RE

.TP
.I size
This indicates the size of the record.

.RE


.SS "Signal Overflow"

Counters can be set to signal when a threshold is crossed.  This is set
up using traditional 
.BR poll (2),
.BR select (2),
.BR epoll (2) 
and 
.BR fcntl (2) 
syscalls.

Normally a notification is generated for every page filled, however 
one can additionally set 
.I perf_event_attr.wakeup_events 
to generate one every so many counter overflow events.

.SS "Reading Results"
Once a perf_event file descriptor  has been opened, the values 
of the events can be read from the file descriptor. 
The values that are there are specified by the 
.I read_format 
field in the attr structure at open time.

If you attempt to read into a buffer that is not big enough to hold the 
data,  an error is returned (ENOSPC).

Here is the layout of the data returned by a read.

If 
.B PERF_FORMAT_GROUP 
was specified to allow reading all events in a group at once:
.nf

struct {
    u64 nr;             /* The number of events */
    u64 time_enabled;   /* if PERF_FORMAT_TOTAL_TIME_ENABLED */
    u64 time_running;   /* if PERF_FORMAT_TOTAL_TIME_RUNNING */
    struct {
        u64 value;      /* The value of the event. */
        u64 id;         /* if PERF_FORMAT_ID */
    } values[nr];
};
.fi

If 
.B PERF_FORMAT_GROUP 
was 
.I not 
specified the the read values look as following:
.nf

struct {
    u64 value;         /* The value of the event. */
    u64 time_enabled;  /* if PERF_FORMAT_TOTAL_TIME_ENABLED */
    u64 time_running;  /* if PERF_FORMAT_TOTAL_TIME_RUNNING */
    u64 id;            /* if PERF_FORMAT_ID */
};
.fi

The values read are described in more detail below.
.RS
.TP
.I nr
The number of events in this file descriptor.  Only
available if PERF_FORMAT_GROUP was specified.

.TP
.IR time_enabled ", " time_running
Total time the event was enabled and running.
Normally these are the same.  If more events are started
than available counter slots on the PMU, then multiplexing
happens and events only run part of the time.  In that
case the 
.I time_enabled
and
.I time running
values can be used to scale an estimated value for the count.

.TP
.I value
An unsigned 64-bit value containing the counter result.

.TP
.I id
A globally unique value for this particular event, only there if 
PERF_FORMAT_ID was specified in read_format.

.RE




.RE

.SS "rdpmc instruction"
Starting with 3.4 on x86 you can use the 
.I rdpmc
instruction to get low-latency reads without having to enter the kernel.


.SS "perf_event ioctl calls"
.PP
Various ioctls act on perf_event file descriptors
.TP
.B PERF_EVENT_IOC_ENABLE
Enables an individual counter or counter group.

.TP
.B PERF_EVENT_IOC_DISABLE
Disables an individual counter or counter group.

Enabling or disabling the leader of a group enables or disables the 
entire group; that is, while the group leader is disabled, none of the 
counters in the group will count. 
Enabling or disabling a member of a group other than the leader only 
affects that counter - disabling a non-leader 
stops that counter from counting but doesn't affect any other counter.

.TP
.B PERF_EVENT_IOC_REFRESH
Non-inherited overflow counters can use this
to enable a counter for 'nr' events, after which it gets disabled again.
I think the goal of IOC_REFRESH is not to reload the period but simply to 
adjust the number of events before the next notifications.

.TP
.B PERF_EVENT_IOC_RESET
Reset the event count to zero.  
This only resets the counts; there is no way to reset the
multiplexing 
.I time_enabled
or
.I time_running
 values.
When sent to a group leader, only
the leader is reset (child events are not).

.TP
.B PERF_EVENT_IOC_PERIOD
IOC_PERIOD is the command to update the period; it
does not update the current period but instead defers until next.

.TP
.B PERF_EVENT_IOC_SET_OUTPUT
This tells the kernel to report event notifications to the specified
file descriptor rather than the default one.  
The file descriptors must all be on the same CPU.

.TP
.BR PERF_EVENT_IOC_SET_FILTER " (Added in 2.6.33)"
This adds a ftrace filter to this event.

.SS "Using prctl"
A process can enable or disable all the counter groups that are 
attached to it using prctl.
This applies to all counters on the current process, whether created by 
this process or by another, and does not affect any counters that this 
process has created on other processes. 
It only enables or disables 
the group leaders, not any other members in the groups. 

.TP
.I  prctl(PR_TASK_PERF_EVENTS_ENABLE)
.TP
.I  prctl(PR_TASK_PERF_EVENTS_DISABLE)



.SS /proc/sys/kernel/perf_event_paranoid 

The
.I /proc/sys/kernel/perf_event_paranoid 
file can be set to restrict access to the performance counters.
.B 2
means no measurements allowed,
.B 1
means normal counter access
.B 0 
means you can access CPU-specific data, and
.B \-1
means no restrictions.

The existence of the 
.I perf_event_paranoid
file is the official method for determining if a kernel
supports perf_event.

.SH "RETURN VALUE"
.BR perf_event_open ()
returns the new file descriptor, or \-1 if an error occurred
(in which case,
.I errno
is set appropriately).
.SH ERRORS
.TP
.B EINVAL
Returned if the specified event is not available.
.TP
.B ENOSPC
Prior to 3.3 if there was no counter room ENOSPC was returned.
Linus did not like this, and this was changed to EINVAL.
ENOSPC is still returned if you try to read results into 
too small of a buffer.

.SH VERSION

.BR perf_event_open () 
was introduced in 2.6.31 but was called
.BR perf_counter_open () .  
It was renamed in 2.6.32.

.SH CONFORMING TO

This call is specific to Linux
and should not be used in programs intended to be portable.

.SH NOTES

The official way of knowing if perf_event support is enabled is checking
for the existence of the file
.I /proc/sys/kernel/perf_event_paranoid 

.SH BUGS

The 
.B F_SETOWN_EX 
option to 
.IR fcntl (2)
is needed to properly get overflow
signals in threads.  This was introduced in 2.6.32.

Prior to 2.6.33 (at least for x86) the kernel did not check
if events could be scheduled together until read time.
The same happens on all known kernels if the NMI watchdog is enabled.
This means to see if a given eventset works you have to 
.BR perf_event_open (), 
start, then read before you know for sure you
can get value measurements.

Prior to 2.6.34 event constraints were not enforced by the kernel.
In that case, some events would silently return "0" if the kernel
scheduled them in an improper counter slot.

Prior to 2.6.34 there was a bug when multiplexing where the
wrong results could be returned.

Kernels from 2.6.35 to 2.6.39 can quickly crash the kernel if
"inherit" is enabled and many threads are started.

Prior to 2.6.35 PERF_FORMAT_GROUP did not work with attached
processes.

In older 2.6 versions refreshing an event group leader refreshed all siblings,
and refreshing with a parameter of 0 enabled infinite refresh. This behavior
is unsupported and should not be relied on.

There is a bug in the kernel code between 2.6.36 and 3.0 that ignores the 
"watermark" field and acts as if a wakeup_event was chosen if the union has a 
non-zero value in it.

Always double-check your results!  Various generalized events
have had wrong values.  For example, retired branches measured
the wrong thing on AMD machines until 2.6.35.

.SH EXAMPLE
The following is a short example that measures the total
instruction count of a call to printf().
.nf

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>

long perf_event_open( struct perf_event_attr *hw_event, pid_t pid, 
                      int cpu, int group_fd, unsigned long flags ) 
{
    int ret;

    ret = syscall( __NR_perf_event_open, hw_event, pid, cpu, 
                   group_fd, flags );
    return ret;
}


int 
main(int argc, char **argv) 
{

    struct perf_event_attr pe;
    long long count;
    int fd;

    memset(&pe, 0, sizeof(struct perf_event_attr));
    pe.type = PERF_TYPE_HARDWARE;
    pe.size = sizeof(struct perf_event_attr);
    pe.config = PERF_COUNT_HW_INSTRUCTIONS;
    pe.disabled = 1;
    pe.exclude_kernel = 1;
    pe.exclude_hv = 1;

    fd=perf_event_open(&pe, 0, -1, -1, 0);
    if (fd < 0) {
       fprintf(stderr, "Error opening leader %llx\\n", pe.config);
    }

    ioctl(fd, PERF_EVENT_IOC_RESET, 0);
    ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);

    printf("Measuring instruction count for this printf\\n");

    ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
    read(fd, &count, sizeof(long long));
   
    printf("Used %lld instructions\\n",count);

    close(fd);
}
.fi

.SH "SEE ALSO"
.BR fcntl (2),
.BR mmap (2),
.BR open (2),
.BR prctl (2),
.BR read (2)


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
