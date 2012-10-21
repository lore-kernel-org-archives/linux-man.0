From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open() manpage
Date: Sun, 21 Oct 2012 14:55:37 +0200
Message-ID: <CAKgNAki56RBCxUup3j3bgRe6T+BzO0C-=mhHDz05=GgbZ4sRZQ@mail.gmail.com>
References: <alpine.DEB.2.00.1207101702490.15511@cl320.icl.utk.edu>
 <alpine.DEB.2.00.1207261416540.22647@cl320.icl.utk.edu> <CAKgNAki69O4zEb67qKiKX1K90EybG-SXo90j4ymrhcf6D9Y7dQ@mail.gmail.com>
 <alpine.DEB.2.00.1208061617400.25549@cl320.icl.utk.edu> <alpine.DEB.2.00.1208091507240.2137@cl320.icl.utk.edu>
 <CAKgNAkgcq2NrynX65RJUyNupi5=OQBEF4D_U=KpE0W8YryCrMg@mail.gmail.com> <alpine.DEB.2.00.1208211718180.28775@cl320.icl.utk.edu>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae93406d71de10104cc914201
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.00.1208211718180.28775-wtkwhKWa4PaiYXit+UzMnodd74u8MsAO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vweaver1-qKp7vQ+Mknf2fBVCVOL8/A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephane Eranian <eranian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--14dae93406d71de10104cc914201
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 21, 2012 at 11:22 PM, Vince Weaver <vweaver1-qKp7vQ+Mknf2fBVCVOL8/A@public.gmane.org> wrote:
> On Sat, 18 Aug 2012, Michael Kerrisk (man-pages) wrote:
>
>> Thanks for improving the page. Here's another review pass with more
>> comments.
>
> Below is my updated version.  Hopefully I've addressed most of your
> comments.
>
> I really have no preference about documentation license.  I picked
> GPL2 since some of the document is heavily based on code and
> comments cut/pasted from various parts of the kernel tree.

Vince

Sorry for the long delay. I've gone through this page and made some
cosmetic fixes, and added a few FIXMEs. You could take a look at the
FIXMEs, to see if there are any pieces you can fix (but I appreciate
that you probably done as much as you can for most of the text, so
maybe you have no further input on most of these points).

After you've done a (quick?) pass through, we can send any revised
version you have out for wider comment. Sound okay?

Thanks,

Michael

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
perf_event_open \- set up performance monitoring
.SH SYNOPSIS
.nf
.B #include <linux/perf_event.h>
.B #include <linux/hw_breakpoint.h>
.sp
.BI "int perf_event_open(struct perf_event_attr *" hw_event ,
.BI "                    pid_t " pid ", int " cpu ", int " group_fd ,
.BI "                    unsigned long " flags  );
.fi

.IR Note :
There is no glibc wrapper for this system call; see NOTES.
.SH DESCRIPTION
Given a list of parameters,
.BR perf_event_open ()
returns a file descriptor, for use in subsequent system calls
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
.\" FIXME eventset is not yet defined
When an eventset is disabled it does not count or generate events but does
continue to exist and maintain its count value.
Events come in two flavors: counting and sampled.
A
.I counting
event is one that is used for counting the aggregate number of events
that occur.
In general, counting event results are gathered with a
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
is 0, measurements happen on the current task, if
.I pid
is greater than 0, the process indicated by
.I pid
is measured, and if
.I pid
is less than 0, all processes are counted.

The
.I cpu
argument allows measurements to be specific to a CPU.
If
.I cpu
is greater than or equal to 0,
measurements are restricted to the specified CPU;
if
.I cpu
is \-1, the events are measured on all CPUs.
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
process gets scheduled to.
Per-process events can be created by any user.
.P
A
.IR pid " == \-1"
and
.IR cpu " >= 0"
setting is per-CPU and measures all processes on the specified CPU.
Per-CPU events need the
.B CAP_SYS_ADMIN
capability.
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
and is considered to be a group with only 1 member.)
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
.TP
.BR PERF_FLAG_FD_NO_GROUP
.\" FIXME The following sentence is unclear
This flag allows creating an event as part of an event group but
having no group leader.
It is unclear why this is useful.
.\" FIXME So, why is it useful?
.TP
.BR PERF_FLAG_FD_OUTPUT
This flag re-routes the output from an event to the group leader.
.TP
.BR PERF_FLAG_PID_CGROUP " (Since Linux 2.6.39)."
This flag activates per-container system-wide monitoring.
A container
is an abstraction that isolates a set of resources for finer grain
control (CPUs, memory, etc...).
In this mode, the event is measured
only if the thread running on the monitored CPU belongs to the designated
container (cgroup).
The cgroup is identified by passing a file descriptor
opened on its directory in the cgroupfs filesystem.
For instance, if the
cgroup to monitor is called
.IR test ,
then a file descriptor opened on
.I /dev/cgroup/test
(assuming cgroupfs is mounted on
.IR /dev/cgroup )
must be passed as the
.I pid
parameter.
cgroup monitoring is only available
for system-wide events and may therefore require extra permissions.
.P
The
.I perf_event_attr
structure is what is passed into the
.BR perf_event_open ()
syscall.
It is large and has a complicated set of dependent fields.

.in +4n
.nf
struct perf_event_attr {
    __u32     type;         /* Type of event */
    __u32     size;         /* Size of attribute structure */
    __u64     config;       /* Type-specific configuration */

    union {
        __u64 sample_period;    /* Period of sampling */
        __u64 sample_freq;      /* Frequency of sampling */
    };

    __u64     sample_type;  /* Specifies values included in sample */
    __u64     read_format;  /* Specifies values returned in read */

    __u64     disabled       : 1,   /* off by default         */
              inherit        : 1,   /* children inherit it    */
              pinned         : 1,   /* must always be on PMU  */
              exclusive      : 1,   /* only group on PMU      */
              exclude_user   : 1,   /* don't count user       */
              exclude_kernel : 1,   /* don't count kernel     */
              exclude_hv     : 1,   /* don't count hypervisor */
              exclude_idle   : 1,   /* don't count when idle  */
              mmap           : 1,   /* include mmap data      */
              comm           : 1,   /* include comm data      */
              freq           : 1,   /* use freq, not period   */
              inherit_stat   : 1,   /* per task counts        */
              enable_on_exec : 1,   /* next exec enables      */
              task           : 1,   /* trace fork/exit        */
              watermark      : 1,   /* wakeup_watermark       */
              precise_ip     : 2,   /* skid constraint        */
              mmap_data      : 1,   /* non-exec mmap data     */
              sample_id_all  : 1,   /* sample_type all events */
              exclude_host   : 1,   /* don't count in host    */
              exclude_guest  : 1,   /* don't count in guest   */
              __reserved_1   : 43;

    union {
        __u32 wakeup_events;    /* wakeup every n events */
        __u32 wakeup_watermark; /* bytes before wakeup   */
    };

    __u32     bp_type;          /* breakpoint type */

    union {
        __u64 bp_addr;          /* breakpoint address */
        __u64 config1;          /* extension of config */
    };

    union {
        __u64 bp_len;           /* breakpoint length */
        __u64 config2;          /* extension of config1 */
    };
    __u64     branch_sample_type;   /* enum branch_sample_type */
};
.fi
.in

The fields of the
.I perf_event_attr
structure are described in more detail below.

.TP
.I type
This field specifies the overall event type.
It has one of the following values:
.RS
.TP
.B PERF_TYPE_HARDWARE
This indicates one of the "generalized" hardware events provided
by the kernel.
See the
.I config
field definition for more details.
.TP
.B PERF_TYPE_SOFTWARE
This indicates one of the software-defined events provided by the kernel
(even if no hardware support is available).
.TP
.B PERF_TYPE_TRACEPOINT
This indicates a tracepoint
provided by the kernel tracepoint infrastructure.
.TP
.B PERF_TYPE_HW_CACHE
This indicates a hardware cache event.
This has a special encoding, described in the
.I config
field definition.
.TP
.B PERF_TYPE_RAW
This indicates a "raw" implementation-specific event in the
.IR config " field."
.TP
.BR PERF_TYPE_BREAKPOINT " (Since Linux 2.6.33)"
This indicates a hardware breakpoint as provided by the CPU.
Breakpoints can be read/write accesses to an address as well as
execution of an instruction address.
.TP
.\" FIXME is "dynamic PMU" a value for 'type'? It's not clear.
.RB "dynamic PMU"
Since Linux 2.6.39,
.BR perf_event_open()
can support multiple PMUs.
Each PMU is uniquely identified by its type fields.
The value for this field is exported by the kernel in the sysfs filesystem.
There is a subdirectory per PMU instance under
.IR /sys/devices .
In each subdir, there is a
.I type
file.
The content of this file is the type value for the PMU.
For instance,
.I /sys/devices/cpu/type
contains the value for the core CPU PMU, which is usually 4.
.RE

.TP
.I "size"
The size of the
.I perf_event_attr
structure for forward/backward compatibility.
Set this using
.I sizeof(struct perf_event_attr)
to allow the kernel to see
the struct size at the time of compilation.

The related define
.B PERF_ATTR_SIZE_VER0
is set to 64; this was the size of the first published struct.
.B PERF_ATTR_SIZE_VER1
is 72, corresponding to the addition of breakpoints in Linux 2.6.33.
.B PERF_ATTR_SIZE_VER2
is 80 corresponding to the addition of branch sampling in Linux 3.4.

.TP
.I "config"
This specifies which event you want, in conjunction with
the
.I type
field.
The
.IR config1 " and " config2
fields are also taken into account in cases where 64 bits is not
enough to fully specify the event.
The encoding of these fields are event dependent.

The most significant bit (bit 63) of
.I config
signifies CPU-specific (raw) counter configuration data;
if the most significant bit is unset, the next 7 bits are an event
type and the rest of the bits are the event identifier.

There are various ways to set the
.I config
field that are dependent on the value of the previously
described
.I type
field.
What follows are various possible settings for
.I config
separated out by
.IR type .

If
.I type
is
.BR PERF_TYPE_HARDWARE ,
we are measuring one of the generalized hardware CPU events.
Not all of these are available on all platforms.
Set
.I config
to one of the following:
.RS 12
.TP
.B PERF_COUNT_HW_CPU_CYCLES
Total cycles.
Be wary of what happens during CPU frequency scaling
.TP
.B PERF_COUNT_HW_INSTRUCTIONS
Retired instructions.
Be careful, these can be affected by various
issues, most notably hardware interrupt counts
.TP
.B PERF_COUNT_HW_CACHE_REFERENCES
.\" FIXME This field isn't actually explained. Is it "cache references"?
Usually Last Level Cache.
.\" FIXME needs clarification
Unclear if this includes
prefetches and coherency messages.
.TP
.B PERF_COUNT_HW_CACHE_MISSES
.\" FIXME This field isn't actually explained. Is it "cache misses"?
Usually Last Level Cache.
.\" FIXME needs clarification
Unclear if this includes
prefetches and coherency messages.
.TP
.B PERF_COUNT_HW_BRANCH_INSTRUCTIONS
Retired branch instructions.
Prior to 2.6.34, this used
the wrong event on AMD processors.
.TP
.B PERF_COUNT_HW_BRANCH_MISSES
Mispredicted branch instructions.
.TP
.B PERF_COUNT_HW_BUS_CYCLES
Bus cycles, which can be different from total cycles.
.TP
.BR PERF_COUNT_HW_STALLED_CYCLES_FRONTEND " (Since Linux 3.0)"
Stalled cycles during issue.
.TP
.BR PERF_COUNT_HW_STALLED_CYCLES_BACKEND  " (Since Linux 3.0)"
Stalled cycles during retirement.
.TP
.BR PERF_COUNT_HW_REF_CPU_CYCLES  " (Since Linux 3.3)"
Total cycles; not affected by CPU frequency scaling.
.RE
.IP
If
.I type
is
.BR PERF_TYPE_SOFTWARE ,
we are measuring software events provided by the kernel.
Set
.I config
to one of the following:
.RS 12
.TP
.B PERF_COUNT_SW_CPU_CLOCK
This reports the CPU clock, a high-resolution per-CPU timer.
.TP
.B PERF_COUNT_SW_TASK_CLOCK
This reports a clock count specific to the task that is running.
.TP
.B PERF_COUNT_SW_PAGE_FAULTS
This reports the number of page faults.
.TP
.B PERF_COUNT_SW_CONTEXT_SWITCHES
This counts context switches.
Until 2.6.34, these were all reported as user-space
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
.BR PERF_COUNT_SW_ALIGNMENT_FAULTS " (Since Linux 2.6.33)"
This counts the number of alignment faults.
These happen when unaligned memory accesses happen; the kernel
can handle these but it reduces performance.
This only happens on some architectures (never on x86).
.TP
.BR PERF_COUNT_SW_EMULATION_FAULTS " (Since Linux 2.6.33)"
This counts the number of emulation faults.
The kernel sometimes traps on unimplemented instructions
and emulates them for userspace.
This can negatively impact performance.
.RE
.RE


.RS
If
.I type
is
.BR PERF_TYPE_TRACEPOINT ,
then we are measuring kernel tracepoints.
The value to use in
.I config
can be obtained from under debugfs
.I tracing/events/*/*/id
if ftrace is enabled in the kernel.

.RE

.RS
If
.I type
is
.BR PERF_TYPE_HW_CACHE ,
then we are measuring a hardware CPU cache event.
To calculate the appropriate
.I config
value use the following equation:
.RS 4
.nf

    (perf_hw_cache_id) | (perf_hw_cache_op_id << 8) |
    (perf_hw_cache_op_result_id << 16)
.fi
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
.BR PERF_COUNT_HW_CACHE_NODE " (Since Linux 3.0)"
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

If
.I type
is
.BR PERF_TYPE_RAW ,
then a custom "raw"
.I config
value is needed.
Most CPUs support events that are not covered by the "generalized" events.
These are implementation defined; see your CPU manual (for example
the Intel Volume 3B documentation or the AMD BIOS and Kernel Developer
Guide).
The libpfm4 library can be used to translate from the name in the
architectural manuals to the raw hex value
.BR perf_event_open ()
expects in this field.

If
.I type
is
.BR PERF_TYPE_BREAKPOINT ,
then leave
.I config
set to zero.
Its parameters are set in other places.
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
flag.
The kernel will adjust the sampling period
to try and achieve the desired rate.
The rate of adjustment is a
timer tick.


.TP
.I "sample_type"
The various bits in this field specify which values to include
in the overflow packets.
They will be recorded in a ring-buffer,
which is available to user-space using
.BR mmap (2).
The order in which the values are saved in the
overflow packets as documented in the MMAP Layout subsection below;
it is not the
.I "enum perf_event_sample_format"
order.
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
.BR PERF_SAMPLE_BRANCH_STACK " (Since Linux 3.4)"
[To be documented]
.RE

.TP
.IR "read_format"
This field specifies the format of the data returned by
.BR read (2)
on a
.BR perf_event_open()
file descriptor.
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
If a pinned counter cannot be put onto the CPU (e.g., because there are
not enough hardware counters or because of a conflict with some other
event), then the counter goes into an 'error' state, where reads
return end-of-file (i.e.,
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
If this bit is set, the count excludes events that happen in user-space.

.TP
.IR "exclude_kernel"
If this bit is set, the count excludes events that happen in kernel-space.

.TP
.IR "exclude_hv"
If this bit is set, the count excludes events that happen in the
hypervisor.
This is mainly for PMUs that have built-in support for handling this
(such as POWER).
Extra support is needed for handling hypervisor measurements on most
machines.

.TP
.IR "exclude_idle"
If set, don't count when the CPU is idle.

.TP
.IR "mmap"
The
.I mmap
bit enables recording of extra information to a
mmap'd ring-buffer.
This is
described below in subsection MMAP Layout.

.TP
.IR "comm"
The
.I comm
bit enables tracking of process command name as modified by the
.IR exec (2)
and
.IR prctl (PR_SET_NAME)
system calls.
Unfortunately for tools,
there is no way to distinguish one system call versus the other.

.TP
.IR "freq"
If this bit is set, then
.I sample_frequency
not
.I sample_period
is used when setting up the sampling interval.

.TP
.IR "inherit_stat"
This bit enables Per task counts?
.\" FIXME needs clarification
It is unclear how this is different from the
.I inherit
field.

.TP
.IR "enable_on_exec"
If this bit is set, a counter is automatically
enabled after a call to
.BR exec (2).

.TP
.IR "task"
If this bit is set, then
fork/exit notifications are included in the ring buffer.

.TP
.IR "watermark"
If set, have a sampling interrupt happen when we cross the
wakeup_watermark boundary.

.TP
.IR "precise_ip" " (Since Linux 2.6.35)"
This controls the amount of skid.
Skid is how many instructions
execute between an event of interest happening and the kernel
being able to stop and record the event.
Smaller skid is
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
.IR "mmap_data" " (Since Linux 2.6.36)"
Include mmap events in the ring_buffer.

.TP
.IR "sample_id_all" " (Since Linux 2.6.38)"
If set, then all sample ID info (TID, TIME, ID, CPU, STREAM_ID)
will be provided.

.TP
.IR "exclude_host" " (Since Linux 3.2)"
Do not measure time spent in VM host

.TP
.IR "exclude_guest" " (Since Linux 3.2)"
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
.IR "bp_type" " (Since Linux 2.6.33)"
This chooses the breakpoint type.
It is one of:
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
.\" FIXME clarify
invalid breakpoint?
.RE

.TP
.IR "bp_addr" " (Since Linux 2.6.33)"
.\" FIXME following is unclear
.I bp_addr
address of the breakpoint.

.TP
.IR "config1" " (Since Linux 2.6.39)"
.I config1
is used for setting events that need an extra register or otherwise
do not fit in the regular config field.
Raw OFFCORE_EVENTS on Nehalem/Westmere/SandyBridge use this field
on 3.3 and later kernels.

.TP
.IR "bp_len" " (Since Linux 2.6.33)"
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
For an execution breakpoint, set this to
.IR sizeof(long) .

.TP
.IR "config2" " (Since Linux 2.6.39)"

.I config2
is a further extension of the
.I config1
field.

.TP
.IR "branch_sample_type" " (Since Linux 3.4)"
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

When using
.BR perf_event_open()
in sampled mode, asynchronous events
(like counter overflow or
.B PROT_EXEC
mmap tracking)
are logged into a ring-buffer.
This ring-buffer is created and accessed through
.BR mmap (2).

The mmap size should be 1+2^n pages, where the first page is a
metadata page
.IR ( "struct perf_event_mmap_page" )
that contains various
bits of information such as where the ring-buffer head is.

Before kernel 2.6.39, there is a bug that means you must allocate a mmap
ring buffer when sampling even if you do not plan to access it.

The structure of the first metadata mmap page is as follows:

.in +4n
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
.in



The following looks at the fields in the
.I perf_event_mmap_page
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
.\" FIXME clarify
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
without syscall (this is the "rdpmc" instruction on x86), then
the following code can be used to do a read:

.in +4n
.nf
u32 seq, time_mult, time_shift, idx, width;
u64 count, enabled, running;
u64 cyc, time_offset;
s64 pmc = 0;

do {
    seq = pc\->lock;
    barrier();
    enabled = pc\->time_enabled;
    running = pc\->time_running;

    if (pc\->cap_usr_time && enabled != running) {
        cyc = rdtsc();
        time_offset = pc\->time_offset;
        time_mult   = pc\->time_mult;
        time_shift  = pc\->time_shift;
    }

    idx = pc\->index;
    count = pc\->offset;

    if (pc\->cap_usr_rdpmc && idx) {
        width = pc\->pmc_width;
        pmc = rdpmc(idx \- 1);
    }

    barrier();
} while (pc\->lock != seq);
.fi
.in



.TP
.I pmc_width
If
.IR cap_usr_rdpmc ,
this field provides the bit-width of the value
read using the rdpmc or equivalent instruction.
This can be used to sign extend the result like:

.in +4n
.nf
pmc <<= 64 \- pmc_width;
pmc >>= 64 \- pmc_width; // signed shift right
count += pmc;
.fi
.in


.TP
.IR time_shift ", " time_mult ", " time_offset

If
.IR cap_usr_time ,
these fields can be used to compute the time
delta since time_enabled (in ns) using rdtsc or similar.
.nf

    u64 quot, rem;
    u64 delta;
    quot = (cyc >> time_shift);
    rem = cyc & ((1 << time_shift) \- 1);
    delta = time_offset + quot * time_mult +
            ((rem * time_mult) >> time_shift);
.fi

Where time_offset,time_mult,time_shift and cyc are read in the
seqcount loop described above.
This delta can then be added to
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
On SMP-capable platforms, after reading the data_head value,
user-space should issue an rmb().

.TP
.I data_tail;
When the mapping is
.BR PROT_WRITE ,
the data_tail value should be written by
userspace to reflect the last read data.
In this case the kernel will not over-write unread data.

.RE


The following 2^n ring-buffer pages have the layout described below.

If
.I perf_event_attr.sample_id_all
is set, then all event types will
have the sample_type selected fields related to where/when (identity)
an event took place (TID, TIME, ID, CPU, STREAM_ID) described in
.B PERF_RECORD_SAMPLE
below, it will be stashed just after the
perf_event_header and the fields already present for the existing
fields, i.e., at the end of the payload.
That way a newer perf.data
file will be supported by older perf tools, with these new optional
fields being ignored.

The mmap values start with a header:

.in +4n
.nf
struct perf_event_header {
    __u32   type;
    __u16   misc;
    __u16   size;
};
.fi
.in

Below, we describe the
.I perf_event_header
fields in more detail.

.TP
.I type
The
.I type
value is one of the below.
The values in the corresponding record (that follows the header)
depend on the
.I type
selected as shown.

.RS
.TP
.B PERF_RECORD_MMAP
The MMAP events record the
.B PROT_EXEC
mappings so that we can correlate
userspace IPs to code.
They have the following structure:

.in +4n
.nf
struct {
    struct perf_event_header header;
    u32    pid, tid;
    u64    addr;
    u64    len;
    u64    pgoff;
    char   filename[];
};
.in

.TP
.B PERF_RECORD_LOST
This record indicates when events are lost.

.in +4n
.nf
struct {
    struct perf_event_header header;
    u64 id;
    u64 lost;
};
.fi
.in

.TP
.B PERF_RECORD_COMM
This record indicates a change in the process name.

.in +4n
.nf
struct {
    struct perf_event_header header;
    u32 pid, tid;
    char comm[];
};
.fi
.in

.TP
.B PERF_RECORD_EXIT
This record indicates a process exit event.

.in +4n
.nf
struct {
    struct perf_event_header header;
    u32 pid, ppid;
    u32 tid, ptid;
    u64 time;
};
.fi
.in

.TP
.BR PERF_RECORD_THROTTLE ", " PERF_RECORD_UNTHROTTLE
This record indicates a throttle/unthrottle event.

.in +4n
.nf
struct {
    struct perf_event_header header;
    u64 time;
    u64 id;
    u64 stream_id;
};
.fi
.in

.TP
.B PERF_RECORD_FORK
This record indicates a fork event.

.in +4n
.nf
struct {
    struct perf_event_header header;
    u32 pid, ppid;
    u32 tid, ptid;
    u64 time;
};
.fi
.in

.TP
.B PERF_RECORD_READ
This record indicates a read event.

.in +4n
.nf
struct {
    struct perf_event_header header;
    u32 pid, tid;
    struct read_format values;
};
.fi
.in

.TP
.B PERF_RECORD_SAMPLE
This record indicates a sample.

.in +4n
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
.in

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
This indicates that the content of
.B PERF_SAMPLE_IP
points
to the actual instruction that triggered the event.
See also
.IR perf_event_attr.precise_ip .

.RE

.TP
.I size
This indicates the size of the record.


.SS "Signal Overflow"

Counters can be set to signal when a threshold is crossed.
This is set up using traditional the
.BR poll (2),
.BR select (2),
.BR epoll (2)
and
.BR fcntl (2),
system calls.

Normally, a notification is generated for every page filled, however
one can additionally set
.I perf_event_attr.wakeup_events
to generate one every so many counter overflow events.

.SS "Reading Results"
Once a
.BR perf_event_open()
file descriptor  has been opened, the values
of the events can be read from the file descriptor.
The values that are there are specified by the
.I read_format
field in the attr structure at open time.

If you attempt to read into a buffer that is not big enough to hold the
data, an error is returned
.IR ( ENOSPC ).

Here is the layout of the data returned by a read.

If
.B PERF_FORMAT_GROUP
was specified to allow reading all events in a group at once:

.in +4n
.nf
struct {
    u64 nr;             /* The number of events */
    u64 time_enabled;   /* if PERF_FORMAT_TOTAL_TIME_ENABLED */
    u64 time_running;   /* if PERF_FORMAT_TOTAL_TIME_RUNNING */
    struct {
        u64 value;      /* The value of the event */
        u64 id;         /* if PERF_FORMAT_ID */
    } values[nr];
};
.fi
.in

If
.B PERF_FORMAT_GROUP
was
.I not
specified, then the read values look as following:

.in +4n
.nf
struct {
    u64 value;         /* The value of the event */
    u64 time_enabled;  /* if PERF_FORMAT_TOTAL_TIME_ENABLED */
    u64 time_running;  /* if PERF_FORMAT_TOTAL_TIME_RUNNING */
    u64 id;            /* if PERF_FORMAT_ID */
};
.fi
.in

The values read are described in more detail below.
.RS
.TP
.I nr
The number of events in this file descriptor.
Only available if
.B PERF_FORMAT_GROUP
was specified.

.TP
.IR time_enabled ", " time_running
Total time the event was enabled and running.
Normally these are the same.
If more events are started
than available counter slots on the PMU, then multiplexing
happens and events only run part of the time.
In that case the
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
.B PERF_FORMAT_ID
was specified in read_format.

.RE




.RE

.SS "rdpmc instruction"
Starting with Linux 3.4 on x86, you can use the
.I rdpmc
instruction to get low-latency reads without having to enter the kernel.


.SS "perf_event ioctl calls"
.PP
Various ioctls act on
.BR perf_event_open()
file descriptors
.\" FIXME the arguments for these ioctl() operations need to be described
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
affects that counter; disabling a non-leader
stops that counter from counting but doesn't affect any other counter.

.TP
.B PERF_EVENT_IOC_REFRESH
Non-inherited overflow counters can use this
to enable a counter for 'nr' events, after which it gets disabled again.
.\" FIXME the following needs clarification/confirmation
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
.BR PERF_EVENT_IOC_SET_FILTER " (Since Linux 2.6.33)"
This adds an ftrace filter to this event.

.SS "Using prctl"
A process can enable or disable all the counter groups that are
attached to it using
.BR prctl (2).
This applies to all counters on the current process, whether created by
this process or by another, and does not affect any counters that this
process has created on other processes.
It only enables or disables
the group leaders, not any other members in the groups.

.TP
.\" FIXME the following need to be documented here, or in prctl(2).
.I  prctl(PR_TASK_PERF_EVENTS_ENABLE)
.TP
.I  prctl(PR_TASK_PERF_EVENTS_DISABLE)

.SS /proc/sys/kernel/perf_event_paranoid

The
.I /proc/sys/kernel/perf_event_paranoid
file can be set to restrict access to the performance counters.
2
means no measurements allowed,
1
means normal counter access,
0
means you can access CPU-specific data, and
\-1
means no restrictions.

The existence of the
.I perf_event_paranoid
file is the official method for determining if a kernel supports
.BR perf_event_open().

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
Prior to Linux 3.3, if there was no counter room,
.B ENOSPC
was returned.
Linus did not like this, and this was changed to
.BR EINVAL .
.B ENOSPC
is still returned if you try to read results into
too small a buffer.

.SH VERSION

.BR perf_event_open ()
was introduced in Linux 2.6.31 but was called
.BR perf_counter_open () .
It was renamed in Linux 2.6.32.

.SH CONFORMING TO

This call is specific to Linux
and should not be used in programs intended to be portable.

.SH NOTES
Glibc does not provide a wrapper for this system call; call it using
.BR syscall (2).

The official way of knowing if
.BR perf_event_open()
support is enabled is checking
for the existence of the file
.I /proc/sys/kernel/perf_event_paranoid

.SH BUGS

The
.B F_SETOWN_EX
option to
.IR fcntl (2)
is needed to properly get overflow signals in threads.
This was introduced in Linux 2.6.32.

Prior to Linux 2.6.33 (at least for x86) the kernel did not check
if events could be scheduled together until read time.
The same happens on all known kernels if the NMI watchdog is enabled.
This means to see if a given eventset works you have to
.BR perf_event_open (),
start, then read before you know for sure you
can get value measurements.

Prior to Linux 2.6.34 event constraints were not enforced by the kernel.
In that case, some events would silently return "0" if the kernel
scheduled them in an improper counter slot.

Prior to Linux 2.6.34 there was a bug when multiplexing where the
wrong results could be returned.

Kernels from Linux 2.6.35 to Linux 2.6.39 can quickly crash the kernel if
"inherit" is enabled and many threads are started.

Prior to Linux 2.6.35,
.B PERF_FORMAT_GROUP
did not work with attached processes.

In older Linux 2.6 versions,
refreshing an event group leader refreshed all siblings,
and refreshing with a parameter of 0 enabled infinite refresh.
This behavior is unsupported and should not be relied on.

There is a bug in the kernel code between
Linux 2.6.36 and Linux 3.0 that ignores the
"watermark" field and acts as if a wakeup_event
was chosen if the union has a
non-zero value in it.

Always double-check your results!  Various generalized events
have had wrong values.
For example, retired branches measured
the wrong thing on AMD machines until Linux 2.6.35.

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

    fd = perf_event_open(&pe, 0, \-1, \-1, 0);
    if (fd < 0) {
       fprintf(stderr, "Error opening leader %llx\\n", pe.config);
    }

    ioctl(fd, PERF_EVENT_IOC_RESET, 0);
    ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);

    printf("Measuring instruction count for this printf\\n");

    ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
    read(fd, &count, sizeof(long long));

    printf("Used %lld instructions\\n", count);

    close(fd);
}
.fi

.SH "SEE ALSO"
.BR fcntl (2),
.BR mmap (2),
.BR open (2),
.BR prctl (2),
.BR read (2)

--14dae93406d71de10104cc914201
Content-Type: application/octet-stream; name="perf_event_open.2"
Content-Disposition: attachment; filename="perf_event_open.2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h8k5s9k20

LlwiIEhleSBFbWFjcyEgVGhpcyBmaWxlIGlzIC0qLSBucm9mZiAtKi0gc291cmNlLgouXCIKLlwi
IENvcHlyaWdodCAoYykgMjAxMiwgVmluY2VudCBXZWF2ZXIKLlwiCi5cIiBUaGlzIGlzIGZyZWUg
ZG9jdW1lbnRhdGlvbjsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCi5cIiBtb2RpZnkg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwou
XCIgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJz
aW9uIDIgb2YKLlwiIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgouXCIKLlwiIFRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSdzIHJlZmVyZW5j
ZXMgdG8gIm9iamVjdCBjb2RlIgouXCIgYW5kICJleGVjdXRhYmxlcyIgYXJlIHRvIGJlIGludGVy
cHJldGVkIGFzIHRoZSBvdXRwdXQgb2YgYW55Ci5cIiBkb2N1bWVudCBmb3JtYXR0aW5nIG9yIHR5
cGVzZXR0aW5nIHN5c3RlbSwgaW5jbHVkaW5nCi5cIiBpbnRlcm1lZGlhdGUgYW5kIHByaW50ZWQg
b3V0cHV0LgouXCIKLlwiIFRoaXMgbWFudWFsIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCi5cIiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhv
dXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgouXCIgTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQouXCIgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLlwiCi5cIiBZb3Ugc2hvdWxkIGhhdmUg
cmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKLlwiIExpY2Vuc2UgYWxv
bmcgd2l0aCB0aGlzIG1hbnVhbDsgaWYgbm90LCBzZWUKLlwiIDxodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4KLlwiCi5cIiBUaGlzIGRvY3VtZW50IGlzIGJhc2VkIG9uIHRoZSBwZXJmX2V2
ZW50LmggaGVhZGVyIGZpbGUsIHRoZQouXCIgdG9vbHMvcGVyZi9kZXNpZ24udHh0IGZpbGUsIGFu
ZCBhIGxvdCBvZiBiaXR0ZXIgZXhwZXJpZW5jZS4KLlwiCi5USCBQRVJGX0VWRU5UX09QRU4gMiAy
MDEyLTA4LTIxICJMaW51eCIgIkxpbnV4IFByb2dyYW1tZXIncyBNYW51YWwiCi5TSCBOQU1FCnBl
cmZfZXZlbnRfb3BlbiBcLSBzZXQgdXAgcGVyZm9ybWFuY2UgbW9uaXRvcmluZwouU0ggU1lOT1BT
SVMKLm5mCi5CICNpbmNsdWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+Ci5CICNpbmNsdWRlIDxsaW51
eC9od19icmVha3BvaW50Lmg+Ci5zcAouQkkgImludCBwZXJmX2V2ZW50X29wZW4oc3RydWN0IHBl
cmZfZXZlbnRfYXR0ciAqIiBod19ldmVudCAsIAouQkkgIiAgICAgICAgICAgICAgICAgICAgcGlk
X3QgIiBwaWQgIiwgaW50ICIgY3B1ICIsIGludCAiIGdyb3VwX2ZkICwKLkJJICIgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgIiBmbGFncyAgKTsKLmZpCgouSVIgTm90ZSA6ClRoZXJl
IGlzIG5vIGdsaWJjIHdyYXBwZXIgZm9yIHRoaXMgc3lzdGVtIGNhbGw7IHNlZSBOT1RFUy4KLlNI
IERFU0NSSVBUSU9OCkdpdmVuIGEgbGlzdCBvZiBwYXJhbWV0ZXJzLAouQlIgcGVyZl9ldmVudF9v
cGVuICgpCnJldHVybnMgYSBmaWxlIGRlc2NyaXB0b3IsIGZvciB1c2UgaW4gc3Vic2VxdWVudCBz
eXN0ZW0gY2FsbHMKLlJCICggcmVhZCAiKDIpLCAiIG1tYXAgIigyKSwgIiBwcmN0bCAiKDIpLCAi
IGZjbnRsICIoMiksIGV0Yy4pLiIKLlBQCkEgY2FsbCB0bwouQlIgcGVyZl9ldmVudF9vcGVuICgp
CmNyZWF0ZXMgYSBmaWxlIGRlc2NyaXB0b3IgdGhhdCBhbGxvd3MgbWVhc3VyaW5nIHBlcmZvcm1h
bmNlCmluZm9ybWF0aW9uLgpFYWNoIGZpbGUgZGVzY3JpcHRvciBjb3JyZXNwb25kcyB0byBvbmUK
ZXZlbnQgdGhhdCBpcyBtZWFzdXJlZDsgdGhlc2UgY2FuIGJlIGdyb3VwZWQgdG9nZXRoZXIKdG8g
bWVhc3VyZSBtdWx0aXBsZSBldmVudHMgc2ltdWx0YW5lb3VzbHkuCi5QUApFdmVudHMgY2FuIGJl
IGVuYWJsZWQgYW5kIGRpc2FibGVkIGluIHR3byB3YXlzOiB2aWEKLkJSIGlvY3RsICgyKQphbmQg
dmlhCi5CUiBwcmN0bCAoMikgLgouXCIgRklYTUUgZXZlbnRzZXQgaXMgbm90IHlldCBkZWZpbmVk
CldoZW4gYW4gZXZlbnRzZXQgaXMgZGlzYWJsZWQgaXQgZG9lcyBub3QgY291bnQgb3IgZ2VuZXJh
dGUgZXZlbnRzIGJ1dCBkb2VzCmNvbnRpbnVlIHRvIGV4aXN0IGFuZCBtYWludGFpbiBpdHMgY291
bnQgdmFsdWUuCkV2ZW50cyBjb21lIGluIHR3byBmbGF2b3JzOiBjb3VudGluZyBhbmQgc2FtcGxl
ZC4KQQouSSBjb3VudGluZwpldmVudCBpcyBvbmUgdGhhdCBpcyB1c2VkIGZvciBjb3VudGluZyB0
aGUgYWdncmVnYXRlIG51bWJlciBvZiBldmVudHMKdGhhdCBvY2N1ci4KSW4gZ2VuZXJhbCwgY291
bnRpbmcgZXZlbnQgcmVzdWx0cyBhcmUgZ2F0aGVyZWQgd2l0aCBhCi5CUiByZWFkICgyKQpjYWxs
LgpBCi5JIHNhbXBsaW5nCmV2ZW50IHBlcmlvZGljYWxseSB3cml0ZXMgbWVhc3VyZW1lbnRzIHRv
IGEgYnVmZmVyIHRoYXQgY2FuIHRoZW4KYmUgYWNjZXNzZWQgdmlhCi5CUiAgbW1hcCAoMikgLgou
U1MgQXJndW1lbnRzCi5QClRoZSBhcmd1bWVudAouSSBwaWQKYWxsb3dzIGV2ZW50cyB0byBiZSBh
dHRhY2hlZCB0byBwcm9jZXNzZXMgaW4gdmFyaW91cyB3YXlzLgpJZgouSSBwaWQKaXMgMCwgbWVh
c3VyZW1lbnRzIGhhcHBlbiBvbiB0aGUgY3VycmVudCB0YXNrLCBpZgouSSBwaWQKaXMgZ3JlYXRl
ciB0aGFuIDAsIHRoZSBwcm9jZXNzIGluZGljYXRlZCBieQouSSBwaWQKaXMgbWVhc3VyZWQsIGFu
ZCBpZgouSSBwaWQKaXMgbGVzcyB0aGFuIDAsIGFsbCBwcm9jZXNzZXMgYXJlIGNvdW50ZWQuCgpU
aGUKLkkgY3B1CmFyZ3VtZW50IGFsbG93cyBtZWFzdXJlbWVudHMgdG8gYmUgc3BlY2lmaWMgdG8g
YSBDUFUuCklmCi5JIGNwdQppcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gMCwKbWVhc3VyZW1l
bnRzIGFyZSByZXN0cmljdGVkIHRvIHRoZSBzcGVjaWZpZWQgQ1BVOwppZgouSSBjcHUKaXMgXC0x
LCB0aGUgZXZlbnRzIGFyZSBtZWFzdXJlZCBvbiBhbGwgQ1BVcy4KLlAKTm90ZSB0aGF0IHRoZSBj
b21iaW5hdGlvbiBvZgouSVIgcGlkICIgPT0gXC0xIgphbmQKLklSIGNwdSAiID09IFwtMSIKaXMg
bm90IHZhbGlkLgouUApBCi5JUiBwaWQgIiA+IDAiCmFuZAouSVIgY3B1ICIgPT0gXC0xIgpzZXR0
aW5nIG1lYXN1cmVzIHBlci1wcm9jZXNzIGFuZCBmb2xsb3dzIHRoYXQgcHJvY2VzcyB0byB3aGF0
ZXZlciBDUFUgdGhlCnByb2Nlc3MgZ2V0cyBzY2hlZHVsZWQgdG8uClBlci1wcm9jZXNzIGV2ZW50
cyBjYW4gYmUgY3JlYXRlZCBieSBhbnkgdXNlci4KLlAKQQouSVIgcGlkICIgPT0gXC0xIgphbmQK
LklSIGNwdSAiID49IDAiCnNldHRpbmcgaXMgcGVyLUNQVSBhbmQgbWVhc3VyZXMgYWxsIHByb2Nl
c3NlcyBvbiB0aGUgc3BlY2lmaWVkIENQVS4KUGVyLUNQVSBldmVudHMgbmVlZCB0aGUKLkIgQ0FQ
X1NZU19BRE1JTgpjYXBhYmlsaXR5LgouUApUaGUKLkkgZ3JvdXBfZmQKYXJndW1lbnQgYWxsb3dz
IGNvdW50ZXIgZ3JvdXBzIHRvIGJlIHNldCB1cC4KQSBjb3VudGVyIGdyb3VwIGhhcyBvbmUgY291
bnRlciB3aGljaCBpcyB0aGUgZ3JvdXAgbGVhZGVyLgpUaGUgbGVhZGVyIGlzIGNyZWF0ZWQgZmly
c3QsIHdpdGgKLklSIGdyb3VwX2ZkICIgPSBcLTEiCmluIHRoZQouQlIgcGVyZl9ldmVudF9vcGVu
ICgpCmNhbGwgdGhhdCBjcmVhdGVzIGl0LgpUaGUgcmVzdCBvZiB0aGUgZ3JvdXAgbWVtYmVycyBh
cmUgY3JlYXRlZCBzdWJzZXF1ZW50bHksIHdpdGgKLklSIGdyb3VwX2ZkCmdpdmluZyB0aGUgZmQg
b2YgdGhlIGdyb3VwIGxlYWRlci4KKEEgc2luZ2xlIGNvdW50ZXIgb24gaXRzIG93biBpcyBjcmVh
dGVkIHdpdGgKLklSIGdyb3VwX2ZkICIgPSBcLTEiCmFuZCBpcyBjb25zaWRlcmVkIHRvIGJlIGEg
Z3JvdXAgd2l0aCBvbmx5IDEgbWVtYmVyLikKLlAKQSBjb3VudGVyIGdyb3VwIGlzIHNjaGVkdWxl
ZCBvbnRvIHRoZSBDUFUgYXMgYSB1bml0OiBpdCB3aWxsIG9ubHkKYmUgcHV0IG9udG8gdGhlIENQ
VSBpZiBhbGwgb2YgdGhlIGNvdW50ZXJzIGluIHRoZSBncm91cCBjYW4gYmUgcHV0IG9udG8KdGhl
IENQVS4KVGhpcyBtZWFucyB0aGF0IHRoZSB2YWx1ZXMgb2YgdGhlIG1lbWJlciBjb3VudGVycyBj
YW4gYmUKbWVhbmluZ2Z1bGx5IGNvbXBhcmVkLCBhZGRlZCwgZGl2aWRlZCAodG8gZ2V0IHJhdGlv
cyksIGV0Yy4sIHdpdGggZWFjaApvdGhlciwgc2luY2UgdGhleSBoYXZlIGNvdW50ZWQgZXZlbnRz
IGZvciB0aGUgc2FtZSBzZXQgb2YgZXhlY3V0ZWQKaW5zdHJ1Y3Rpb25zLgouUApUaGUKLkkgZmxh
Z3MKYXJndW1lbnQgdGFrZXMgb25lIG9mIHRoZSBmb2xsb3dpbmcgdmFsdWVzOgouVFAKLkJSIFBF
UkZfRkxBR19GRF9OT19HUk9VUAouXCIgRklYTUUgVGhlIGZvbGxvd2luZyBzZW50ZW5jZSBpcyB1
bmNsZWFyClRoaXMgZmxhZyBhbGxvd3MgY3JlYXRpbmcgYW4gZXZlbnQgYXMgcGFydCBvZiBhbiBl
dmVudCBncm91cCBidXQKaGF2aW5nIG5vIGdyb3VwIGxlYWRlci4KSXQgaXMgdW5jbGVhciB3aHkg
dGhpcyBpcyB1c2VmdWwuCi5cIiBGSVhNRSBTbywgd2h5IGlzIGl0IHVzZWZ1bD8KLlRQCi5CUiBQ
RVJGX0ZMQUdfRkRfT1VUUFVUClRoaXMgZmxhZyByZS1yb3V0ZXMgdGhlIG91dHB1dCBmcm9tIGFu
IGV2ZW50IHRvIHRoZSBncm91cCBsZWFkZXIuCi5UUAouQlIgUEVSRl9GTEFHX1BJRF9DR1JPVVAg
IiAoU2luY2UgTGludXggMi42LjM5KS4iClRoaXMgZmxhZyBhY3RpdmF0ZXMgcGVyLWNvbnRhaW5l
ciBzeXN0ZW0td2lkZSBtb25pdG9yaW5nLgpBIGNvbnRhaW5lcgppcyBhbiBhYnN0cmFjdGlvbiB0
aGF0IGlzb2xhdGVzIGEgc2V0IG9mIHJlc291cmNlcyBmb3IgZmluZXIgZ3JhaW4KY29udHJvbCAo
Q1BVcywgbWVtb3J5LCBldGMuLi4pLgpJbiB0aGlzIG1vZGUsIHRoZSBldmVudCBpcyBtZWFzdXJl
ZApvbmx5IGlmIHRoZSB0aHJlYWQgcnVubmluZyBvbiB0aGUgbW9uaXRvcmVkIENQVSBiZWxvbmdz
IHRvIHRoZSBkZXNpZ25hdGVkCmNvbnRhaW5lciAoY2dyb3VwKS4KVGhlIGNncm91cCBpcyBpZGVu
dGlmaWVkIGJ5IHBhc3NpbmcgYSBmaWxlIGRlc2NyaXB0b3IKb3BlbmVkIG9uIGl0cyBkaXJlY3Rv
cnkgaW4gdGhlIGNncm91cGZzIGZpbGVzeXN0ZW0uCkZvciBpbnN0YW5jZSwgaWYgdGhlCmNncm91
cCB0byBtb25pdG9yIGlzIGNhbGxlZAouSVIgdGVzdCAsCnRoZW4gYSBmaWxlIGRlc2NyaXB0b3Ig
b3BlbmVkIG9uCi5JIC9kZXYvY2dyb3VwL3Rlc3QKKGFzc3VtaW5nIGNncm91cGZzIGlzIG1vdW50
ZWQgb24KLklSIC9kZXYvY2dyb3VwICkKbXVzdCBiZSBwYXNzZWQgYXMgdGhlCi5JIHBpZApwYXJh
bWV0ZXIuCmNncm91cCBtb25pdG9yaW5nIGlzIG9ubHkgYXZhaWxhYmxlCmZvciBzeXN0ZW0td2lk
ZSBldmVudHMgYW5kIG1heSB0aGVyZWZvcmUgcmVxdWlyZSBleHRyYSBwZXJtaXNzaW9ucy4KLlAK
VGhlCi5JIHBlcmZfZXZlbnRfYXR0cgpzdHJ1Y3R1cmUgaXMgd2hhdCBpcyBwYXNzZWQgaW50byB0
aGUKLkJSIHBlcmZfZXZlbnRfb3BlbiAoKQpzeXNjYWxsLgpJdCBpcyBsYXJnZSBhbmQgaGFzIGEg
Y29tcGxpY2F0ZWQgc2V0IG9mIGRlcGVuZGVudCBmaWVsZHMuCgouaW4gKzRuCi5uZgpzdHJ1Y3Qg
cGVyZl9ldmVudF9hdHRyIHsKICAgIF9fdTMyICAgICB0eXBlOyAgICAgICAgIC8qIFR5cGUgb2Yg
ZXZlbnQgKi8KICAgIF9fdTMyICAgICBzaXplOyAgICAgICAgIC8qIFNpemUgb2YgYXR0cmlidXRl
IHN0cnVjdHVyZSAqLwogICAgX191NjQgICAgIGNvbmZpZzsgICAgICAgLyogVHlwZS1zcGVjaWZp
YyBjb25maWd1cmF0aW9uICovCgogICAgdW5pb24gewogICAgICAgIF9fdTY0IHNhbXBsZV9wZXJp
b2Q7ICAgIC8qIFBlcmlvZCBvZiBzYW1wbGluZyAqLwogICAgICAgIF9fdTY0IHNhbXBsZV9mcmVx
OyAgICAgIC8qIEZyZXF1ZW5jeSBvZiBzYW1wbGluZyAqLwogICAgfTsKCiAgICBfX3U2NCAgICAg
c2FtcGxlX3R5cGU7ICAvKiBTcGVjaWZpZXMgdmFsdWVzIGluY2x1ZGVkIGluIHNhbXBsZSAqLwog
ICAgX191NjQgICAgIHJlYWRfZm9ybWF0OyAgLyogU3BlY2lmaWVzIHZhbHVlcyByZXR1cm5lZCBp
biByZWFkICovCgogICAgX191NjQgICAgIGRpc2FibGVkICAgICAgIDogMSwgICAvKiBvZmYgYnkg
ZGVmYXVsdCAgICAgICAgICovCiAgICAgICAgICAgICAgaW5oZXJpdCAgICAgICAgOiAxLCAgIC8q
IGNoaWxkcmVuIGluaGVyaXQgaXQgICAgKi8KICAgICAgICAgICAgICBwaW5uZWQgICAgICAgICA6
IDEsICAgLyogbXVzdCBhbHdheXMgYmUgb24gUE1VICAqLwogICAgICAgICAgICAgIGV4Y2x1c2l2
ZSAgICAgIDogMSwgICAvKiBvbmx5IGdyb3VwIG9uIFBNVSAgICAgICovCiAgICAgICAgICAgICAg
ZXhjbHVkZV91c2VyICAgOiAxLCAgIC8qIGRvbid0IGNvdW50IHVzZXIgICAgICAgKi8KICAgICAg
ICAgICAgICBleGNsdWRlX2tlcm5lbCA6IDEsICAgLyogZG9uJ3QgY291bnQga2VybmVsICAgICAq
LwogICAgICAgICAgICAgIGV4Y2x1ZGVfaHYgICAgIDogMSwgICAvKiBkb24ndCBjb3VudCBoeXBl
cnZpc29yICovCiAgICAgICAgICAgICAgZXhjbHVkZV9pZGxlICAgOiAxLCAgIC8qIGRvbid0IGNv
dW50IHdoZW4gaWRsZSAgKi8KICAgICAgICAgICAgICBtbWFwICAgICAgICAgICA6IDEsICAgLyog
aW5jbHVkZSBtbWFwIGRhdGEgICAgICAqLwogICAgICAgICAgICAgIGNvbW0gICAgICAgICAgIDog
MSwgICAvKiBpbmNsdWRlIGNvbW0gZGF0YSAgICAgICovCiAgICAgICAgICAgICAgZnJlcSAgICAg
ICAgICAgOiAxLCAgIC8qIHVzZSBmcmVxLCBub3QgcGVyaW9kICAgKi8KICAgICAgICAgICAgICBp
bmhlcml0X3N0YXQgICA6IDEsICAgLyogcGVyIHRhc2sgY291bnRzICAgICAgICAqLwogICAgICAg
ICAgICAgIGVuYWJsZV9vbl9leGVjIDogMSwgICAvKiBuZXh0IGV4ZWMgZW5hYmxlcyAgICAgICov
CiAgICAgICAgICAgICAgdGFzayAgICAgICAgICAgOiAxLCAgIC8qIHRyYWNlIGZvcmsvZXhpdCAg
ICAgICAgKi8KICAgICAgICAgICAgICB3YXRlcm1hcmsgICAgICA6IDEsICAgLyogd2FrZXVwX3dh
dGVybWFyayAgICAgICAqLwogICAgICAgICAgICAgIHByZWNpc2VfaXAgICAgIDogMiwgICAvKiBz
a2lkIGNvbnN0cmFpbnQgICAgICAgICovCiAgICAgICAgICAgICAgbW1hcF9kYXRhICAgICAgOiAx
LCAgIC8qIG5vbi1leGVjIG1tYXAgZGF0YSAgICAgKi8KICAgICAgICAgICAgICBzYW1wbGVfaWRf
YWxsICA6IDEsICAgLyogc2FtcGxlX3R5cGUgYWxsIGV2ZW50cyAqLwogICAgICAgICAgICAgIGV4
Y2x1ZGVfaG9zdCAgIDogMSwgICAvKiBkb24ndCBjb3VudCBpbiBob3N0ICAgICovCiAgICAgICAg
ICAgICAgZXhjbHVkZV9ndWVzdCAgOiAxLCAgIC8qIGRvbid0IGNvdW50IGluIGd1ZXN0ICAgKi8K
ICAgICAgICAgICAgICBfX3Jlc2VydmVkXzEgICA6IDQzOwoKICAgIHVuaW9uIHsKICAgICAgICBf
X3UzMiB3YWtldXBfZXZlbnRzOyAgICAvKiB3YWtldXAgZXZlcnkgbiBldmVudHMgKi8KICAgICAg
ICBfX3UzMiB3YWtldXBfd2F0ZXJtYXJrOyAvKiBieXRlcyBiZWZvcmUgd2FrZXVwICAgKi8KICAg
IH07CgogICAgX191MzIgICAgIGJwX3R5cGU7ICAgICAgICAgIC8qIGJyZWFrcG9pbnQgdHlwZSAq
LwoKICAgIHVuaW9uIHsKICAgICAgICBfX3U2NCBicF9hZGRyOyAgICAgICAgICAvKiBicmVha3Bv
aW50IGFkZHJlc3MgKi8KICAgICAgICBfX3U2NCBjb25maWcxOyAgICAgICAgICAvKiBleHRlbnNp
b24gb2YgY29uZmlnICovCiAgICB9OwoKICAgIHVuaW9uIHsKICAgICAgICBfX3U2NCBicF9sZW47
ICAgICAgICAgICAvKiBicmVha3BvaW50IGxlbmd0aCAqLwogICAgICAgIF9fdTY0IGNvbmZpZzI7
ICAgICAgICAgIC8qIGV4dGVuc2lvbiBvZiBjb25maWcxICovCiAgICB9OwogICAgX191NjQgICAg
IGJyYW5jaF9zYW1wbGVfdHlwZTsgICAvKiBlbnVtIGJyYW5jaF9zYW1wbGVfdHlwZSAqLwp9Owou
ZmkKLmluCgpUaGUgZmllbGRzIG9mIHRoZQouSSBwZXJmX2V2ZW50X2F0dHIKc3RydWN0dXJlIGFy
ZSBkZXNjcmliZWQgaW4gbW9yZSBkZXRhaWwgYmVsb3cuCgouVFAKLkkgdHlwZQpUaGlzIGZpZWxk
IHNwZWNpZmllcyB0aGUgb3ZlcmFsbCBldmVudCB0eXBlLgpJdCBoYXMgb25lIG9mIHRoZSBmb2xs
b3dpbmcgdmFsdWVzOgouUlMKLlRQCi5CIFBFUkZfVFlQRV9IQVJEV0FSRQpUaGlzIGluZGljYXRl
cyBvbmUgb2YgdGhlICJnZW5lcmFsaXplZCIgaGFyZHdhcmUgZXZlbnRzIHByb3ZpZGVkCmJ5IHRo
ZSBrZXJuZWwuClNlZSB0aGUKLkkgY29uZmlnCmZpZWxkIGRlZmluaXRpb24gZm9yIG1vcmUgZGV0
YWlscy4KLlRQCi5CIFBFUkZfVFlQRV9TT0ZUV0FSRQpUaGlzIGluZGljYXRlcyBvbmUgb2YgdGhl
IHNvZnR3YXJlLWRlZmluZWQgZXZlbnRzIHByb3ZpZGVkIGJ5IHRoZSBrZXJuZWwKKGV2ZW4gaWYg
bm8gaGFyZHdhcmUgc3VwcG9ydCBpcyBhdmFpbGFibGUpLgouVFAKLkIgUEVSRl9UWVBFX1RSQUNF
UE9JTlQKVGhpcyBpbmRpY2F0ZXMgYSB0cmFjZXBvaW50CnByb3ZpZGVkIGJ5IHRoZSBrZXJuZWwg
dHJhY2Vwb2ludCBpbmZyYXN0cnVjdHVyZS4KLlRQCi5CIFBFUkZfVFlQRV9IV19DQUNIRQpUaGlz
IGluZGljYXRlcyBhIGhhcmR3YXJlIGNhY2hlIGV2ZW50LgpUaGlzIGhhcyBhIHNwZWNpYWwgZW5j
b2RpbmcsIGRlc2NyaWJlZCBpbiB0aGUKLkkgY29uZmlnCmZpZWxkIGRlZmluaXRpb24uCi5UUAou
QiBQRVJGX1RZUEVfUkFXClRoaXMgaW5kaWNhdGVzIGEgInJhdyIgaW1wbGVtZW50YXRpb24tc3Bl
Y2lmaWMgZXZlbnQgaW4gdGhlCi5JUiBjb25maWcgIiBmaWVsZC4iCi5UUAouQlIgUEVSRl9UWVBF
X0JSRUFLUE9JTlQgIiAoU2luY2UgTGludXggMi42LjMzKSIKVGhpcyBpbmRpY2F0ZXMgYSBoYXJk
d2FyZSBicmVha3BvaW50IGFzIHByb3ZpZGVkIGJ5IHRoZSBDUFUuCkJyZWFrcG9pbnRzIGNhbiBi
ZSByZWFkL3dyaXRlIGFjY2Vzc2VzIHRvIGFuIGFkZHJlc3MgYXMgd2VsbCBhcwpleGVjdXRpb24g
b2YgYW4gaW5zdHJ1Y3Rpb24gYWRkcmVzcy4KLlRQCi5cIiBGSVhNRSBpcyAiZHluYW1pYyBQTVUi
IGEgdmFsdWUgZm9yICd0eXBlJz8gSXQncyBub3QgY2xlYXIuCi5SQiAiZHluYW1pYyBQTVUiClNp
bmNlIExpbnV4IDIuNi4zOSwKLkJSIHBlcmZfZXZlbnRfb3BlbigpCmNhbiBzdXBwb3J0IG11bHRp
cGxlIFBNVXMuCkVhY2ggUE1VIGlzIHVuaXF1ZWx5IGlkZW50aWZpZWQgYnkgaXRzIHR5cGUgZmll
bGRzLgpUaGUgdmFsdWUgZm9yIHRoaXMgZmllbGQgaXMgZXhwb3J0ZWQgYnkgdGhlIGtlcm5lbCBp
biB0aGUgc3lzZnMgZmlsZXN5c3RlbS4KVGhlcmUgaXMgYSBzdWJkaXJlY3RvcnkgcGVyIFBNVSBp
bnN0YW5jZSB1bmRlcgouSVIgL3N5cy9kZXZpY2VzIC4KSW4gZWFjaCBzdWJkaXIsIHRoZXJlIGlz
IGEKLkkgdHlwZQpmaWxlLgpUaGUgY29udGVudCBvZiB0aGlzIGZpbGUgaXMgdGhlIHR5cGUgdmFs
dWUgZm9yIHRoZSBQTVUuCkZvciBpbnN0YW5jZSwKLkkgL3N5cy9kZXZpY2VzL2NwdS90eXBlCmNv
bnRhaW5zIHRoZSB2YWx1ZSBmb3IgdGhlIGNvcmUgQ1BVIFBNVSwgd2hpY2ggaXMgdXN1YWxseSA0
LgouUkUKCi5UUAouSSAic2l6ZSIKVGhlIHNpemUgb2YgdGhlCi5JIHBlcmZfZXZlbnRfYXR0cgpz
dHJ1Y3R1cmUgZm9yIGZvcndhcmQvYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KU2V0IHRoaXMgdXNp
bmcKLkkgc2l6ZW9mKHN0cnVjdCBwZXJmX2V2ZW50X2F0dHIpCnRvIGFsbG93IHRoZSBrZXJuZWwg
dG8gc2VlCnRoZSBzdHJ1Y3Qgc2l6ZSBhdCB0aGUgdGltZSBvZiBjb21waWxhdGlvbi4KClRoZSBy
ZWxhdGVkIGRlZmluZQouQiBQRVJGX0FUVFJfU0laRV9WRVIwCmlzIHNldCB0byA2NDsgdGhpcyB3
YXMgdGhlIHNpemUgb2YgdGhlIGZpcnN0IHB1Ymxpc2hlZCBzdHJ1Y3QuCi5CIFBFUkZfQVRUUl9T
SVpFX1ZFUjEKaXMgNzIsIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGFkZGl0aW9uIG9mIGJyZWFrcG9p
bnRzIGluIExpbnV4IDIuNi4zMy4KLkIgUEVSRl9BVFRSX1NJWkVfVkVSMgppcyA4MCBjb3JyZXNw
b25kaW5nIHRvIHRoZSBhZGRpdGlvbiBvZiBicmFuY2ggc2FtcGxpbmcgaW4gTGludXggMy40LgoK
LlRQCi5JICJjb25maWciClRoaXMgc3BlY2lmaWVzIHdoaWNoIGV2ZW50IHlvdSB3YW50LCBpbiBj
b25qdW5jdGlvbiB3aXRoCnRoZQouSSB0eXBlCmZpZWxkLgpUaGUKLklSIGNvbmZpZzEgIiBhbmQg
IiBjb25maWcyCmZpZWxkcyBhcmUgYWxzbyB0YWtlbiBpbnRvIGFjY291bnQgaW4gY2FzZXMgd2hl
cmUgNjQgYml0cyBpcyBub3QKZW5vdWdoIHRvIGZ1bGx5IHNwZWNpZnkgdGhlIGV2ZW50LgpUaGUg
ZW5jb2Rpbmcgb2YgdGhlc2UgZmllbGRzIGFyZSBldmVudCBkZXBlbmRlbnQuCgpUaGUgbW9zdCBz
aWduaWZpY2FudCBiaXQgKGJpdCA2Mykgb2YKLkkgY29uZmlnCnNpZ25pZmllcyBDUFUtc3BlY2lm
aWMgKHJhdykgY291bnRlciBjb25maWd1cmF0aW9uIGRhdGE7CmlmIHRoZSBtb3N0IHNpZ25pZmlj
YW50IGJpdCBpcyB1bnNldCwgdGhlIG5leHQgNyBiaXRzIGFyZSBhbiBldmVudAp0eXBlIGFuZCB0
aGUgcmVzdCBvZiB0aGUgYml0cyBhcmUgdGhlIGV2ZW50IGlkZW50aWZpZXIuCgpUaGVyZSBhcmUg
dmFyaW91cyB3YXlzIHRvIHNldCB0aGUKLkkgY29uZmlnCmZpZWxkIHRoYXQgYXJlIGRlcGVuZGVu
dCBvbiB0aGUgdmFsdWUgb2YgdGhlIHByZXZpb3VzbHkKZGVzY3JpYmVkCi5JIHR5cGUKZmllbGQu
CldoYXQgZm9sbG93cyBhcmUgdmFyaW91cyBwb3NzaWJsZSBzZXR0aW5ncyBmb3IKLkkgY29uZmln
CnNlcGFyYXRlZCBvdXQgYnkKLklSIHR5cGUgLgoKSWYKLkkgdHlwZQppcwouQlIgUEVSRl9UWVBF
X0hBUkRXQVJFICwKd2UgYXJlIG1lYXN1cmluZyBvbmUgb2YgdGhlIGdlbmVyYWxpemVkIGhhcmR3
YXJlIENQVSBldmVudHMuCk5vdCBhbGwgb2YgdGhlc2UgYXJlIGF2YWlsYWJsZSBvbiBhbGwgcGxh
dGZvcm1zLgpTZXQKLkkgY29uZmlnCnRvIG9uZSBvZiB0aGUgZm9sbG93aW5nOgouUlMgMTIKLlRQ
Ci5CIFBFUkZfQ09VTlRfSFdfQ1BVX0NZQ0xFUwpUb3RhbCBjeWNsZXMuCkJlIHdhcnkgb2Ygd2hh
dCBoYXBwZW5zIGR1cmluZyBDUFUgZnJlcXVlbmN5IHNjYWxpbmcKLlRQCi5CIFBFUkZfQ09VTlRf
SFdfSU5TVFJVQ1RJT05TClJldGlyZWQgaW5zdHJ1Y3Rpb25zLgpCZSBjYXJlZnVsLCB0aGVzZSBj
YW4gYmUgYWZmZWN0ZWQgYnkgdmFyaW91cwppc3N1ZXMsIG1vc3Qgbm90YWJseSBoYXJkd2FyZSBp
bnRlcnJ1cHQgY291bnRzCi5UUAouQiBQRVJGX0NPVU5UX0hXX0NBQ0hFX1JFRkVSRU5DRVMKLlwi
IEZJWE1FIFRoaXMgZmllbGQgaXNuJ3QgYWN0dWFsbHkgZXhwbGFpbmVkLiBJcyBpdCAiY2FjaGUg
cmVmZXJlbmNlcyI/ClVzdWFsbHkgTGFzdCBMZXZlbCBDYWNoZS4KLlwiIEZJWE1FIG5lZWRzIGNs
YXJpZmljYXRpb24KVW5jbGVhciBpZiB0aGlzIGluY2x1ZGVzCnByZWZldGNoZXMgYW5kIGNvaGVy
ZW5jeSBtZXNzYWdlcy4KLlRQCi5CIFBFUkZfQ09VTlRfSFdfQ0FDSEVfTUlTU0VTCi5cIiBGSVhN
RSBUaGlzIGZpZWxkIGlzbid0IGFjdHVhbGx5IGV4cGxhaW5lZC4gSXMgaXQgImNhY2hlIG1pc3Nl
cyI/ClVzdWFsbHkgTGFzdCBMZXZlbCBDYWNoZS4KLlwiIEZJWE1FIG5lZWRzIGNsYXJpZmljYXRp
b24KVW5jbGVhciBpZiB0aGlzIGluY2x1ZGVzCnByZWZldGNoZXMgYW5kIGNvaGVyZW5jeSBtZXNz
YWdlcy4KLlRQCi5CIFBFUkZfQ09VTlRfSFdfQlJBTkNIX0lOU1RSVUNUSU9OUwpSZXRpcmVkIGJy
YW5jaCBpbnN0cnVjdGlvbnMuClByaW9yIHRvIDIuNi4zNCwgdGhpcyB1c2VkCnRoZSB3cm9uZyBl
dmVudCBvbiBBTUQgcHJvY2Vzc29ycy4KLlRQCi5CIFBFUkZfQ09VTlRfSFdfQlJBTkNIX01JU1NF
UwpNaXNwcmVkaWN0ZWQgYnJhbmNoIGluc3RydWN0aW9ucy4KLlRQCi5CIFBFUkZfQ09VTlRfSFdf
QlVTX0NZQ0xFUwpCdXMgY3ljbGVzLCB3aGljaCBjYW4gYmUgZGlmZmVyZW50IGZyb20gdG90YWwg
Y3ljbGVzLgouVFAKLkJSIFBFUkZfQ09VTlRfSFdfU1RBTExFRF9DWUNMRVNfRlJPTlRFTkQgIiAo
U2luY2UgTGludXggMy4wKSIKU3RhbGxlZCBjeWNsZXMgZHVyaW5nIGlzc3VlLgouVFAKLkJSIFBF
UkZfQ09VTlRfSFdfU1RBTExFRF9DWUNMRVNfQkFDS0VORCAgIiAoU2luY2UgTGludXggMy4wKSIK
U3RhbGxlZCBjeWNsZXMgZHVyaW5nIHJldGlyZW1lbnQuCi5UUAouQlIgUEVSRl9DT1VOVF9IV19S
RUZfQ1BVX0NZQ0xFUyAgIiAoU2luY2UgTGludXggMy4zKSIKVG90YWwgY3ljbGVzOyBub3QgYWZm
ZWN0ZWQgYnkgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nLgouUkUKLklQCklmCi5JIHR5cGUKaXMKLkJS
IFBFUkZfVFlQRV9TT0ZUV0FSRSAsCndlIGFyZSBtZWFzdXJpbmcgc29mdHdhcmUgZXZlbnRzIHBy
b3ZpZGVkIGJ5IHRoZSBrZXJuZWwuClNldAouSSBjb25maWcKdG8gb25lIG9mIHRoZSBmb2xsb3dp
bmc6Ci5SUyAxMgouVFAKLkIgUEVSRl9DT1VOVF9TV19DUFVfQ0xPQ0sKVGhpcyByZXBvcnRzIHRo
ZSBDUFUgY2xvY2ssIGEgaGlnaC1yZXNvbHV0aW9uIHBlci1DUFUgdGltZXIuCi5UUAouQiBQRVJG
X0NPVU5UX1NXX1RBU0tfQ0xPQ0sKVGhpcyByZXBvcnRzIGEgY2xvY2sgY291bnQgc3BlY2lmaWMg
dG8gdGhlIHRhc2sgdGhhdCBpcyBydW5uaW5nLgouVFAKLkIgUEVSRl9DT1VOVF9TV19QQUdFX0ZB
VUxUUwpUaGlzIHJlcG9ydHMgdGhlIG51bWJlciBvZiBwYWdlIGZhdWx0cy4KLlRQCi5CIFBFUkZf
Q09VTlRfU1dfQ09OVEVYVF9TV0lUQ0hFUwpUaGlzIGNvdW50cyBjb250ZXh0IHN3aXRjaGVzLgpV
bnRpbCAyLjYuMzQsIHRoZXNlIHdlcmUgYWxsIHJlcG9ydGVkIGFzIHVzZXItc3BhY2UKZXZlbnRz
LCBhZnRlciB0aGF0IHRoZXkgYXJlIHJlcG9ydGVkIGFzIGhhcHBlbmluZyBpbiB0aGUga2VybmVs
LgouVFAKLkIgUEVSRl9DT1VOVF9TV19DUFVfTUlHUkFUSU9OUwpUaGlzIHJlcG9ydHMgdGhlIG51
bWJlciBvZiB0aW1lcyB0aGUgcHJvY2VzcwpoYXMgbWlncmF0ZWQgdG8gYSBuZXcgQ1BVLgouVFAK
LkIgUEVSRl9DT1VOVF9TV19QQUdFX0ZBVUxUU19NSU4KVGhpcyBjb3VudHMgdGhlIG51bWJlciBv
ZiBtaW5vciBwYWdlIGZhdWx0cy4KVGhlc2UgZGlkIG5vdCByZXF1aXJlIGRpc2sgSS9PIHRvIGhh
bmRsZS4KLlRQCi5CIFBFUkZfQ09VTlRfU1dfUEFHRV9GQVVMVFNfTUFKClRoaXMgY291bnRzIHRo
ZSBudW1iZXIgb2YgbWFqb3IgcGFnZSBmYXVsdHMuClRoZXNlIHJlcXVpcmVkIGRpc2sgSS9PIHRv
IGhhbmRsZS4KLlRQCi5CUiBQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMgIiAoU2luY2Ug
TGludXggMi42LjMzKSIKVGhpcyBjb3VudHMgdGhlIG51bWJlciBvZiBhbGlnbm1lbnQgZmF1bHRz
LgpUaGVzZSBoYXBwZW4gd2hlbiB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzIGhhcHBlbjsgdGhl
IGtlcm5lbApjYW4gaGFuZGxlIHRoZXNlIGJ1dCBpdCByZWR1Y2VzIHBlcmZvcm1hbmNlLgpUaGlz
IG9ubHkgaGFwcGVucyBvbiBzb21lIGFyY2hpdGVjdHVyZXMgKG5ldmVyIG9uIHg4NikuCi5UUAou
QlIgUEVSRl9DT1VOVF9TV19FTVVMQVRJT05fRkFVTFRTICIgKFNpbmNlIExpbnV4IDIuNi4zMyki
ClRoaXMgY291bnRzIHRoZSBudW1iZXIgb2YgZW11bGF0aW9uIGZhdWx0cy4KVGhlIGtlcm5lbCBz
b21ldGltZXMgdHJhcHMgb24gdW5pbXBsZW1lbnRlZCBpbnN0cnVjdGlvbnMKYW5kIGVtdWxhdGVz
IHRoZW0gZm9yIHVzZXJzcGFjZS4KVGhpcyBjYW4gbmVnYXRpdmVseSBpbXBhY3QgcGVyZm9ybWFu
Y2UuCi5SRQouUkUKCgouUlMKSWYKLkkgdHlwZQppcwouQlIgUEVSRl9UWVBFX1RSQUNFUE9JTlQg
LAp0aGVuIHdlIGFyZSBtZWFzdXJpbmcga2VybmVsIHRyYWNlcG9pbnRzLgpUaGUgdmFsdWUgdG8g
dXNlIGluCi5JIGNvbmZpZwpjYW4gYmUgb2J0YWluZWQgZnJvbSB1bmRlciBkZWJ1Z2ZzCi5JIHRy
YWNpbmcvZXZlbnRzLyovKi9pZAppZiBmdHJhY2UgaXMgZW5hYmxlZCBpbiB0aGUga2VybmVsLgoK
LlJFCgouUlMKSWYKLkkgdHlwZQppcwouQlIgUEVSRl9UWVBFX0hXX0NBQ0hFICwKdGhlbiB3ZSBh
cmUgbWVhc3VyaW5nIGEgaGFyZHdhcmUgQ1BVIGNhY2hlIGV2ZW50LgpUbyBjYWxjdWxhdGUgdGhl
IGFwcHJvcHJpYXRlCi5JIGNvbmZpZwp2YWx1ZSB1c2UgdGhlIGZvbGxvd2luZyBlcXVhdGlvbjoK
LlJTIDQKLm5mCgogICAgKHBlcmZfaHdfY2FjaGVfaWQpIHwgKHBlcmZfaHdfY2FjaGVfb3BfaWQg
PDwgOCkgfAogICAgKHBlcmZfaHdfY2FjaGVfb3BfcmVzdWx0X2lkIDw8IDE2KQouZmkKLlAKd2hl
cmUKLkkgcGVyZl9od19jYWNoZV9pZAppcyBvbmUgb2Y6Ci5SUwouVFAKLkIgUEVSRl9DT1VOVF9I
V19DQUNIRV9MMUQKZm9yIG1lYXN1cmluZyBMZXZlbCAxIERhdGEgQ2FjaGUKLlRQCi5CIFBFUkZf
Q09VTlRfSFdfQ0FDSEVfTDFJCmZvciBtZWFzdXJpbmcgTGV2ZWwgMSBJbnN0cnVjdGlvbiBDYWNo
ZQouVFAKLkIgUEVSRl9DT1VOVF9IV19DQUNIRV9MTApmb3IgbWVhc3VyaW5nIExhc3QtTGV2ZWwg
Q2FjaGUKLlRQCi5CIFBFUkZfQ09VTlRfSFdfQ0FDSEVfRFRMQgpmb3IgbWVhc3VyaW5nIHRoZSBE
YXRhIFRMQgouVFAKLkIgUEVSRl9DT1VOVF9IV19DQUNIRV9JVExCCmZvciBtZWFzdXJpbmcgdGhl
IEluc3RydWN0aW9uIFRMQgouVFAKLkIgUEVSRl9DT1VOVF9IV19DQUNIRV9CUFUKZm9yIG1lYXN1
cmluZyB0aGUgYnJhbmNoIHByZWRpY3Rpb24gdW5pdAouVFAKLkJSIFBFUkZfQ09VTlRfSFdfQ0FD
SEVfTk9ERSAiIChTaW5jZSBMaW51eCAzLjApIgpmb3IgbWVhc3VyaW5nIGxvY2FsIG1lbW9yeSBh
Y2Nlc3NlcwouUkUKCi5QCmFuZAouSSBwZXJmX2h3X2NhY2hlX29wX2lkCmlzIG9uZSBvZgouUlMK
LlRQCi5CIFBFUkZfQ09VTlRfSFdfQ0FDSEVfT1BfUkVBRApmb3IgcmVhZCBhY2Nlc3NlcwouVFAK
LkIgUEVSRl9DT1VOVF9IV19DQUNIRV9PUF9XUklURQpmb3Igd3JpdGUgYWNjZXNzZXMKLlRQCi5C
IFBFUkZfQ09VTlRfSFdfQ0FDSEVfT1BfUFJFRkVUQ0gKZm9yIHByZWZldGNoIGFjY2Vzc2VzCi5S
RQoKLlAKYW5kCi5JIHBlcmZfaHdfY2FjaGVfb3BfcmVzdWx0X2lkCmlzIG9uZSBvZgouUlMKLlRQ
Ci5CIFBFUkZfQ09VTlRfSFdfQ0FDSEVfUkVTVUxUX0FDQ0VTUwp0byBtZWFzdXJlIGFjY2Vzc2Vz
Ci5UUAouQiBQRVJGX0NPVU5UX0hXX0NBQ0hFX1JFU1VMVF9NSVNTCnRvIG1lYXN1cmUgbWlzc2Vz
Ci5SRQouUkUKCklmCi5JIHR5cGUKaXMKLkJSIFBFUkZfVFlQRV9SQVcgLAp0aGVuIGEgY3VzdG9t
ICJyYXciCi5JIGNvbmZpZwp2YWx1ZSBpcyBuZWVkZWQuCk1vc3QgQ1BVcyBzdXBwb3J0IGV2ZW50
cyB0aGF0IGFyZSBub3QgY292ZXJlZCBieSB0aGUgImdlbmVyYWxpemVkIiBldmVudHMuClRoZXNl
IGFyZSBpbXBsZW1lbnRhdGlvbiBkZWZpbmVkOyBzZWUgeW91ciBDUFUgbWFudWFsIChmb3IgZXhh
bXBsZQp0aGUgSW50ZWwgVm9sdW1lIDNCIGRvY3VtZW50YXRpb24gb3IgdGhlIEFNRCBCSU9TIGFu
ZCBLZXJuZWwgRGV2ZWxvcGVyCkd1aWRlKS4KVGhlIGxpYnBmbTQgbGlicmFyeSBjYW4gYmUgdXNl
ZCB0byB0cmFuc2xhdGUgZnJvbSB0aGUgbmFtZSBpbiB0aGUKYXJjaGl0ZWN0dXJhbCBtYW51YWxz
IHRvIHRoZSByYXcgaGV4IHZhbHVlCi5CUiBwZXJmX2V2ZW50X29wZW4gKCkKZXhwZWN0cyBpbiB0
aGlzIGZpZWxkLgoKSWYKLkkgdHlwZQppcwouQlIgUEVSRl9UWVBFX0JSRUFLUE9JTlQgLAp0aGVu
IGxlYXZlCi5JIGNvbmZpZwpzZXQgdG8gemVyby4KSXRzIHBhcmFtZXRlcnMgYXJlIHNldCBpbiBv
dGhlciBwbGFjZXMuCi5SRQouVFAKLklSIHNhbXBsZV9wZXJpb2QgIiwgIiBzYW1wbGVfZnJlcQpB
ICJzYW1wbGluZyIgY291bnRlciBpcyBvbmUgdGhhdCBnZW5lcmF0ZXMgYW4gaW50ZXJydXB0CmV2
ZXJ5IE4gZXZlbnRzLCB3aGVyZSBOIGlzIGdpdmVuIGJ5Ci5JUiBzYW1wbGVfcGVyaW9kIC4KQSBz
YW1wbGluZyBjb3VudGVyIGhhcwouSVIgc2FtcGxlX3BlcmlvZCAiID4gMC4iClRoZQouSSBzYW1w
bGVfdHlwZQpmaWVsZCBjb250cm9scyB3aGF0IGRhdGEgaXMgcmVjb3JkZWQgb24gZWFjaCBpbnRl
cnJ1cHQuCgouSSBzYW1wbGVfZnJlcQpjYW4gYmUgdXNlZCBpZiB5b3Ugd2lzaCB0byB1c2UgZnJl
cXVlbmN5IHJhdGhlciB0aGFuIHBlcmlvZC4KSW4gdGhpcyBjYXNlIHlvdSBzZXQgdGhlCi5JIGZy
ZXEKZmxhZy4KVGhlIGtlcm5lbCB3aWxsIGFkanVzdCB0aGUgc2FtcGxpbmcgcGVyaW9kCnRvIHRy
eSBhbmQgYWNoaWV2ZSB0aGUgZGVzaXJlZCByYXRlLgpUaGUgcmF0ZSBvZiBhZGp1c3RtZW50IGlz
IGEKdGltZXIgdGljay4KCgouVFAKLkkgInNhbXBsZV90eXBlIgpUaGUgdmFyaW91cyBiaXRzIGlu
IHRoaXMgZmllbGQgc3BlY2lmeSB3aGljaCB2YWx1ZXMgdG8gaW5jbHVkZQppbiB0aGUgb3ZlcmZs
b3cgcGFja2V0cy4KVGhleSB3aWxsIGJlIHJlY29yZGVkIGluIGEgcmluZy1idWZmZXIsCndoaWNo
IGlzIGF2YWlsYWJsZSB0byB1c2VyLXNwYWNlIHVzaW5nCi5CUiBtbWFwICgyKS4KVGhlIG9yZGVy
IGluIHdoaWNoIHRoZSB2YWx1ZXMgYXJlIHNhdmVkIGluIHRoZQpvdmVyZmxvdyBwYWNrZXRzIGFz
IGRvY3VtZW50ZWQgaW4gdGhlIE1NQVAgTGF5b3V0IHN1YnNlY3Rpb24gYmVsb3c7Cml0IGlzIG5v
dCB0aGUKLkkgImVudW0gcGVyZl9ldmVudF9zYW1wbGVfZm9ybWF0IgpvcmRlci4KLlJTCi5UUAou
QiBQRVJGX1NBTVBMRV9JUAppbnN0cnVjdGlvbiBwb2ludGVyCi5UUAouQiBQRVJGX1NBTVBMRV9U
SUQKdGhyZWFkIGlkCi5UUAouQiBQRVJGX1NBTVBMRV9USU1FCnRpbWUKLlRQCi5CIFBFUkZfU0FN
UExFX0FERFIKYWRkcmVzcwouVFAKLkIgUEVSRl9TQU1QTEVfUkVBRApbVG8gYmUgZG9jdW1lbnRl
ZF0KLlRQCi5CIFBFUkZfU0FNUExFX0NBTExDSEFJTgpbVG8gYmUgZG9jdW1lbnRlZF0KLlRQCi5C
IFBFUkZfU0FNUExFX0lECltUbyBiZSBkb2N1bWVudGVkXQouVFAKLkIgUEVSRl9TQU1QTEVfQ1BV
CltUbyBiZSBkb2N1bWVudGVkXQouVFAKLkIgUEVSRl9TQU1QTEVfUEVSSU9ECltUbyBiZSBkb2N1
bWVudGVkXQouVFAKLkIgUEVSRl9TQU1QTEVfU1RSRUFNX0lECltUbyBiZSBkb2N1bWVudGVkXQou
VFAKLkIgUEVSRl9TQU1QTEVfUkFXCltUbyBiZSBkb2N1bWVudGVkXQouVFAKLkJSIFBFUkZfU0FN
UExFX0JSQU5DSF9TVEFDSyAiIChTaW5jZSBMaW51eCAzLjQpIgpbVG8gYmUgZG9jdW1lbnRlZF0K
LlJFCgouVFAKLklSICJyZWFkX2Zvcm1hdCIKVGhpcyBmaWVsZCBzcGVjaWZpZXMgdGhlIGZvcm1h
dCBvZiB0aGUgZGF0YSByZXR1cm5lZCBieQouQlIgcmVhZCAoMikKb24gYQouQlIgcGVyZl9ldmVu
dF9vcGVuKCkKZmlsZSBkZXNjcmlwdG9yLgouUlMKLlRQCi5CIFBFUkZfRk9STUFUX1RPVEFMX1RJ
TUVfRU5BQkxFRApBZGRzIHRoZSA2NC1iaXQgInRpbWVfZW5hYmxlZCIgZmllbGQuClRoaXMgY2Fu
IGJlIHVzZWQgdG8gY2FsY3VsYXRlIGVzdGltYXRlZCB0b3RhbHMgaWYKdGhlIFBNVSBpcyBvdmVy
Y29tbWl0dGVkIGFuZCBtdWx0aXBsZXhpbmcgaXMgaGFwcGVuaW5nLgouVFAKLkIgUEVSRl9GT1JN
QVRfVE9UQUxfVElNRV9SVU5OSU5HCkFkZHMgdGhlIDY0LWJpdCAidGltZV9ydW5uaW5nIiBmaWVs
ZC4KVGhpcyBjYW4gYmUgdXNlZCB0byBjYWxjdWxhdGUgZXN0aW1hdGVkIHRvdGFscyBpZgp0aGUg
UE1VIGlzIG92ZXJjb21taXR0ZWQgYW5kICBtdWx0aXBsZXhpbmcgaXMgaGFwcGVuaW5nLgouVFAK
LkIgUEVSRl9GT1JNQVRfSUQKQWRkcyBhIDY0LWJpdCB1bmlxdWUgdmFsdWUgdGhhdCBjb3JyZXNw
b25kcyB0byB0aGUgZXZlbnQtZ3JvdXAuCi5UUAouQiBQRVJGX0ZPUk1BVF9HUk9VUApBbGxvd3Mg
YWxsIGNvdW50ZXIgdmFsdWVzIGluIGFuIGV2ZW50LWdyb3VwIHRvIGJlIHJlYWQgd2l0aCBvbmUg
cmVhZC4KLlJFCgouVFAKLklSICJkaXNhYmxlZCIKVGhlCi5JIGRpc2FibGVkCmJpdCBzcGVjaWZp
ZXMgd2hldGhlciB0aGUgY291bnRlciBzdGFydHMgb3V0IGRpc2FibGVkIG9yIGVuYWJsZWQuCklm
IGRpc2FibGVkLCB0aGUgZXZlbnQgY2FuIGxhdGVyIGJlIGVuYWJsZWQgYnkKLkJSIGlvY3RsICgy
KSwKLkJSIHByY3RsICgyKSwKb3IKLklSIGVuYWJsZV9vbl9leGVjIC4KCi5UUAouSVIgImluaGVy
aXQiClRoZQouSSBpbmhlcml0CmJpdCBzcGVjaWZpZXMgdGhhdCB0aGlzIGNvdW50ZXIgc2hvdWxk
IGNvdW50IGV2ZW50cyBvZiBjaGlsZAp0YXNrcyBhcyB3ZWxsIGFzIHRoZSB0YXNrIHNwZWNpZmll
ZC4KVGhpcyBvbmx5IGFwcGxpZXMgdG8gbmV3IGNoaWxkcmVuLCBub3QgdG8gYW55IGV4aXN0aW5n
IGNoaWxkcmVuIGF0CnRoZSB0aW1lIHRoZSBjb3VudGVyIGlzIGNyZWF0ZWQgKG5vciB0byBhbnkg
bmV3IGNoaWxkcmVuIG9mCmV4aXN0aW5nIGNoaWxkcmVuKS4KCkluaGVyaXQgZG9lcyBub3Qgd29y
ayBmb3Igc29tZSBjb21iaW5hdGlvbnMgb2YKLklSIHJlYWRfZm9ybWF0IHMsCnN1Y2ggYXMKLkJS
IFBFUkZfRk9STUFUX0dST1VQIC4KCi5UUAouSVIgInBpbm5lZCIKVGhlCi5JIHBpbm5lZApiaXQg
c3BlY2lmaWVzIHRoYXQgdGhlIGNvdW50ZXIgc2hvdWxkIGFsd2F5cyBiZSBvbiB0aGUgQ1BVIGlm
IGF0IGFsbApwb3NzaWJsZS4KSXQgb25seSBhcHBsaWVzIHRvIGhhcmR3YXJlIGNvdW50ZXJzIGFu
ZCBvbmx5IHRvIGdyb3VwIGxlYWRlcnMuCklmIGEgcGlubmVkIGNvdW50ZXIgY2Fubm90IGJlIHB1
dCBvbnRvIHRoZSBDUFUgKGUuZy4sIGJlY2F1c2UgdGhlcmUgYXJlCm5vdCBlbm91Z2ggaGFyZHdh
cmUgY291bnRlcnMgb3IgYmVjYXVzZSBvZiBhIGNvbmZsaWN0IHdpdGggc29tZSBvdGhlcgpldmVu
dCksIHRoZW4gdGhlIGNvdW50ZXIgZ29lcyBpbnRvIGFuICdlcnJvcicgc3RhdGUsIHdoZXJlIHJl
YWRzCnJldHVybiBlbmQtb2YtZmlsZSAoaS5lLiwKLkJSIHJlYWQgKDIpCnJldHVybnMgMCkgdW50
aWwgdGhlIGNvdW50ZXIgaXMgc3Vic2VxdWVudGx5IGVuYWJsZWQgb3IgZGlzYWJsZWQuCgouVFAK
LklSICJleGNsdXNpdmUiClRoZQouSSBleGNsdXNpdmUKYml0IHNwZWNpZmllcyB0aGF0IHdoZW4g
dGhpcyBjb3VudGVyJ3MgZ3JvdXAgaXMgb24gdGhlIENQVSwKaXQgc2hvdWxkIGJlIHRoZSBvbmx5
IGdyb3VwIHVzaW5nIHRoZSBDUFUncyBjb3VudGVycy4KSW4gdGhlIGZ1dHVyZSB0aGlzIG1heSBh
bGxvdyBtb25pdG9yaW5nIHByb2dyYW1zIHRvCnN1cHBvcnQgUE1VIGZlYXR1cmVzIHRoYXQgbmVl
ZCB0byBydW4gYWxvbmUgc28gdGhhdCB0aGV5IGRvIG5vdApkaXNydXB0IG90aGVyIGhhcmR3YXJl
IGNvdW50ZXJzLgoKLlRQCi5JUiAiZXhjbHVkZV91c2VyIgpJZiB0aGlzIGJpdCBpcyBzZXQsIHRo
ZSBjb3VudCBleGNsdWRlcyBldmVudHMgdGhhdCBoYXBwZW4gaW4gdXNlci1zcGFjZS4KCi5UUAou
SVIgImV4Y2x1ZGVfa2VybmVsIgpJZiB0aGlzIGJpdCBpcyBzZXQsIHRoZSBjb3VudCBleGNsdWRl
cyBldmVudHMgdGhhdCBoYXBwZW4gaW4ga2VybmVsLXNwYWNlLgoKLlRQCi5JUiAiZXhjbHVkZV9o
diIKSWYgdGhpcyBiaXQgaXMgc2V0LCB0aGUgY291bnQgZXhjbHVkZXMgZXZlbnRzIHRoYXQgaGFw
cGVuIGluIHRoZQpoeXBlcnZpc29yLgpUaGlzIGlzIG1haW5seSBmb3IgUE1VcyB0aGF0IGhhdmUg
YnVpbHQtaW4gc3VwcG9ydCBmb3IgaGFuZGxpbmcgdGhpcwooc3VjaCBhcyBQT1dFUikuCkV4dHJh
IHN1cHBvcnQgaXMgbmVlZGVkIGZvciBoYW5kbGluZyBoeXBlcnZpc29yIG1lYXN1cmVtZW50cyBv
biBtb3N0Cm1hY2hpbmVzLgoKLlRQCi5JUiAiZXhjbHVkZV9pZGxlIgpJZiBzZXQsIGRvbid0IGNv
dW50IHdoZW4gdGhlIENQVSBpcyBpZGxlLgoKLlRQCi5JUiAibW1hcCIKVGhlCi5JIG1tYXAKYml0
IGVuYWJsZXMgcmVjb3JkaW5nIG9mIGV4dHJhIGluZm9ybWF0aW9uIHRvIGEKbW1hcCdkIHJpbmct
YnVmZmVyLgpUaGlzIGlzCmRlc2NyaWJlZCBiZWxvdyBpbiBzdWJzZWN0aW9uIE1NQVAgTGF5b3V0
LgoKLlRQCi5JUiAiY29tbSIKVGhlCi5JIGNvbW0KYml0IGVuYWJsZXMgdHJhY2tpbmcgb2YgcHJv
Y2VzcyBjb21tYW5kIG5hbWUgYXMgbW9kaWZpZWQgYnkgdGhlCi5JUiBleGVjICgyKQphbmQKLklS
IHByY3RsIChQUl9TRVRfTkFNRSkKc3lzdGVtIGNhbGxzLgpVbmZvcnR1bmF0ZWx5IGZvciB0b29s
cywKdGhlcmUgaXMgbm8gd2F5IHRvIGRpc3Rpbmd1aXNoIG9uZSBzeXN0ZW0gY2FsbCB2ZXJzdXMg
dGhlIG90aGVyLgoKLlRQCi5JUiAiZnJlcSIKSWYgdGhpcyBiaXQgaXMgc2V0LCB0aGVuCi5JIHNh
bXBsZV9mcmVxdWVuY3kKbm90Ci5JIHNhbXBsZV9wZXJpb2QKaXMgdXNlZCB3aGVuIHNldHRpbmcg
dXAgdGhlIHNhbXBsaW5nIGludGVydmFsLgoKLlRQCi5JUiAiaW5oZXJpdF9zdGF0IgpUaGlzIGJp
dCBlbmFibGVzIFBlciB0YXNrIGNvdW50cz8KLlwiIEZJWE1FIG5lZWRzIGNsYXJpZmljYXRpb24K
SXQgaXMgdW5jbGVhciBob3cgdGhpcyBpcyBkaWZmZXJlbnQgZnJvbSB0aGUKLkkgaW5oZXJpdApm
aWVsZC4KCi5UUAouSVIgImVuYWJsZV9vbl9leGVjIgpJZiB0aGlzIGJpdCBpcyBzZXQsIGEgY291
bnRlciBpcyBhdXRvbWF0aWNhbGx5CmVuYWJsZWQgYWZ0ZXIgYSBjYWxsIHRvCi5CUiBleGVjICgy
KS4KCi5UUAouSVIgInRhc2siCklmIHRoaXMgYml0IGlzIHNldCwgdGhlbgpmb3JrL2V4aXQgbm90
aWZpY2F0aW9ucyBhcmUgaW5jbHVkZWQgaW4gdGhlIHJpbmcgYnVmZmVyLgoKLlRQCi5JUiAid2F0
ZXJtYXJrIgpJZiBzZXQsIGhhdmUgYSBzYW1wbGluZyBpbnRlcnJ1cHQgaGFwcGVuIHdoZW4gd2Ug
Y3Jvc3MgdGhlCndha2V1cF93YXRlcm1hcmsgYm91bmRhcnkuCgouVFAKLklSICJwcmVjaXNlX2lw
IiAiIChTaW5jZSBMaW51eCAyLjYuMzUpIgpUaGlzIGNvbnRyb2xzIHRoZSBhbW91bnQgb2Ygc2tp
ZC4KU2tpZCBpcyBob3cgbWFueSBpbnN0cnVjdGlvbnMKZXhlY3V0ZSBiZXR3ZWVuIGFuIGV2ZW50
IG9mIGludGVyZXN0IGhhcHBlbmluZyBhbmQgdGhlIGtlcm5lbApiZWluZyBhYmxlIHRvIHN0b3Ag
YW5kIHJlY29yZCB0aGUgZXZlbnQuClNtYWxsZXIgc2tpZCBpcwpiZXR0ZXIgYW5kIGFsbG93cyBt
b3JlIGFjY3VyYXRlIHJlcG9ydGluZyBvZiB3aGljaCBldmVudHMKY29ycmVzcG9uZCB0byB3aGlj
aCBpbnN0cnVjdGlvbnMsIGJ1dCBoYXJkd2FyZSBpcyBvZnRlbiBsaW1pdGVkCndpdGggaG93IHNt
YWxsIHRoaXMgY2FuIGJlLgoKVGhlIHZhbHVlcyBvZiB0aGlzIGFyZSB0aGUgZm9sbG93aW5nOgou
UlMKLlRQCjAgLQouQiBTQU1QTEVfSVAKY2FuIGhhdmUgYXJiaXRyYXJ5IHNraWQKLlRQCjEgLQou
QiBTQU1QTEVfSVAKbXVzdCBoYXZlIGNvbnN0YW50IHNraWQKLlRQCjIgLQouQiBTQU1QTEVfSVAK
cmVxdWVzdGVkIHRvIGhhdmUgMCBza2lkCi5UUAozIC0KLkIgU0FNUExFX0lQCm11c3QgaGF2ZSAw
IHNraWQuClNlZSBhbHNvCi5CUiBQRVJGX1JFQ09SRF9NSVNDX0VYQUNUX0lQIC4KLlJFCgouVFAK
LklSICJtbWFwX2RhdGEiICIgKFNpbmNlIExpbnV4IDIuNi4zNikiCkluY2x1ZGUgbW1hcCBldmVu
dHMgaW4gdGhlIHJpbmdfYnVmZmVyLgoKLlRQCi5JUiAic2FtcGxlX2lkX2FsbCIgIiAoU2luY2Ug
TGludXggMi42LjM4KSIKSWYgc2V0LCB0aGVuIGFsbCBzYW1wbGUgSUQgaW5mbyAoVElELCBUSU1F
LCBJRCwgQ1BVLCBTVFJFQU1fSUQpCndpbGwgYmUgcHJvdmlkZWQuCgouVFAKLklSICJleGNsdWRl
X2hvc3QiICIgKFNpbmNlIExpbnV4IDMuMikiCkRvIG5vdCBtZWFzdXJlIHRpbWUgc3BlbnQgaW4g
Vk0gaG9zdAoKLlRQCi5JUiAiZXhjbHVkZV9ndWVzdCIgIiAoU2luY2UgTGludXggMy4yKSIKRG8g
bm90IG1lYXN1cmUgdGltZSBzcGVudCBpbiBWTSBndWVzdAoKCi5UUAouSVIgIndha2V1cF9ldmVu
dHMiICIsICIgIndha2V1cF93YXRlcm1hcmsiClRoaXMgdW5pb24gc2V0cyBob3cgbWFueSBldmVu
dHMKLlJJICggd2FrZXVwX2V2ZW50cyApCm9yIGJ5dGVzCi5SSSAoIHdha2V1cF93YXRlcm1hcmsg
KQpoYXBwZW4gYmVmb3JlIGFuIG92ZXJmbG93IHNpZ25hbCBoYXBwZW5zLgpXaGljaCBvbmUgaXMg
dXNlZCBpcyBzZWxlY3RlZCBieSB0aGUKLkkgd2F0ZXJtYXJrCmJpdGZsYWcuCgouVFAKLklSICJi
cF90eXBlIiAiIChTaW5jZSBMaW51eCAyLjYuMzMpIgpUaGlzIGNob29zZXMgdGhlIGJyZWFrcG9p
bnQgdHlwZS4KSXQgaXMgb25lIG9mOgouUlMKLlRQCi5CUiBIV19CUkVBS1BPSU5UX0VNUFRZCm5v
IGJyZWFrcG9pbnQKLlRQCi5CUiBIV19CUkVBS1BPSU5UX1IKY291bnQgd2hlbiB3ZSByZWFkIHRo
ZSBtZW1vcnkgbG9jYXRpb24KLlRQCi5CUiBIV19CUkVBS1BPSU5UX1cKY291bnQgd2hlbiB3ZSB3
cml0ZSB0aGUgbWVtb3J5IGxvY2F0aW9uCi5UUAouQlIgSFdfQlJFQUtQT0lOVF9SVwpjb3VudCB3
aGVuIHdlIHJlYWQgb3Igd3JpdGUgdGhlIG1lbW9yeSBsb2NhdGlvbgouVFAKLkJSIEhXX0JSRUFL
UE9JTlRfWApjb3VudCB3aGVuIHdlIGV4ZWN1dGUgY29kZSBhdCB0aGUgbWVtb3J5IGxvY2F0aW9u
Ci5UUAouQlIgSFdfQlJFQUtQT0lOVF9JTlZBTElECi5cIiBGSVhNRSBjbGFyaWZ5CmludmFsaWQg
YnJlYWtwb2ludD8KLlJFCgouVFAKLklSICJicF9hZGRyIiAiIChTaW5jZSBMaW51eCAyLjYuMzMp
IgouXCIgRklYTUUgZm9sbG93aW5nIGlzIHVuY2xlYXIKLkkgYnBfYWRkcgphZGRyZXNzIG9mIHRo
ZSBicmVha3BvaW50LgoKLlRQCi5JUiAiY29uZmlnMSIgIiAoU2luY2UgTGludXggMi42LjM5KSIK
LkkgY29uZmlnMQppcyB1c2VkIGZvciBzZXR0aW5nIGV2ZW50cyB0aGF0IG5lZWQgYW4gZXh0cmEg
cmVnaXN0ZXIgb3Igb3RoZXJ3aXNlCmRvIG5vdCBmaXQgaW4gdGhlIHJlZ3VsYXIgY29uZmlnIGZp
ZWxkLgpSYXcgT0ZGQ09SRV9FVkVOVFMgb24gTmVoYWxlbS9XZXN0bWVyZS9TYW5keUJyaWRnZSB1
c2UgdGhpcyBmaWVsZApvbiAzLjMgYW5kIGxhdGVyIGtlcm5lbHMuCgouVFAKLklSICJicF9sZW4i
ICIgKFNpbmNlIExpbnV4IDIuNi4zMykiCi5JIGJwX2xlbgppcyB0aGUgbGVuZ3RoIG9mIHRoZSBi
cmVha3BvaW50IGJlaW5nIG1lYXN1cmVkIGlmCi5JIHR5cGUKaXMKLkJSIFBFUkZfVFlQRV9CUkVB
S1BPSU5UIC4KT3B0aW9ucyBhcmUKLkJSIEhXX0JSRUFLUE9JTlRfTEVOXzEgLAouQlIgSFdfQlJF
QUtQT0lOVF9MRU5fMiAsCi5CUiBIV19CUkVBS1BPSU5UX0xFTl80ICwKLkJSIEhXX0JSRUFLUE9J
TlRfTEVOXzggLgpGb3IgYW4gZXhlY3V0aW9uIGJyZWFrcG9pbnQsIHNldCB0aGlzIHRvCi5JUiBz
aXplb2YobG9uZykgLgoKLlRQCi5JUiAiY29uZmlnMiIgIiAoU2luY2UgTGludXggMi42LjM5KSIK
Ci5JIGNvbmZpZzIKaXMgYSBmdXJ0aGVyIGV4dGVuc2lvbiBvZiB0aGUKLkkgY29uZmlnMQpmaWVs
ZC4KCi5UUAouSVIgImJyYW5jaF9zYW1wbGVfdHlwZSIgIiAoU2luY2UgTGludXggMy40KSIKVGhp
cyBpcyB1c2VkIHdpdGggdGhlIENQVXMgaGFyZHdhcmUgYnJhbmNoIHNhbXBsaW5nLCBpZiBhdmFp
bGFibGUuCkl0IGNhbiBoYXZlIG9uZSBvZiB0aGUgZm9sbG93aW5nIHZhbHVlczoKLlJTCi5UUAou
QiBQRVJGX1NBTVBMRV9CUkFOQ0hfVVNFUgpCcmFuY2ggdGFyZ2V0IGlzIGluIHVzZXIgc3BhY2UK
LlRQCi5CIFBFUkZfU0FNUExFX0JSQU5DSF9LRVJORUwKQnJhbmNoIHRhcmdldCBpcyBpbiBrZXJu
ZWwgc3BhY2UKLlRQCi5CIFBFUkZfU0FNUExFX0JSQU5DSF9IVgpCcmFuY2ggdGFyZ2V0IGlzIGlu
IGh5cGVydmlzb3IKLlRQCi5CIFBFUkZfU0FNUExFX0JSQU5DSF9BTlkKQW55IGJyYW5jaCB0eXBl
LgouVFAKLkIgUEVSRl9TQU1QTEVfQlJBTkNIX0FOWV9DQUxMCkFueSBjYWxsIGJyYW5jaAouVFAK
LkIgUEVSRl9TQU1QTEVfQlJBTkNIX0FOWV9SRVRVUk4KQW55IHJldHVybiBicmFuY2gKLlRQCi5C
UiBQRVJGX1NBTVBMRV9CUkFOQ0hfSU5EX0NBTEwKSW5kaXJlY3QgY2FsbHMKLlRQCi5CUiBQRVJG
X1NBTVBMRV9CUkFOQ0hfUExNX0FMTApVc2VyLCBrZXJuZWwsIGFuZCBodgouUkUKCgouU1MgIk1N
QVAgTGF5b3V0IgoKV2hlbiB1c2luZwouQlIgcGVyZl9ldmVudF9vcGVuKCkKaW4gc2FtcGxlZCBt
b2RlLCBhc3luY2hyb25vdXMgZXZlbnRzCihsaWtlIGNvdW50ZXIgb3ZlcmZsb3cgb3IKLkIgUFJP
VF9FWEVDCm1tYXAgdHJhY2tpbmcpCmFyZSBsb2dnZWQgaW50byBhIHJpbmctYnVmZmVyLgpUaGlz
IHJpbmctYnVmZmVyIGlzIGNyZWF0ZWQgYW5kIGFjY2Vzc2VkIHRocm91Z2gKLkJSIG1tYXAgKDIp
LgoKVGhlIG1tYXAgc2l6ZSBzaG91bGQgYmUgMSsyXm4gcGFnZXMsIHdoZXJlIHRoZSBmaXJzdCBw
YWdlIGlzIGEKbWV0YWRhdGEgcGFnZQouSVIgKCAic3RydWN0IHBlcmZfZXZlbnRfbW1hcF9wYWdl
IiApCnRoYXQgY29udGFpbnMgdmFyaW91cwpiaXRzIG9mIGluZm9ybWF0aW9uIHN1Y2ggYXMgd2hl
cmUgdGhlIHJpbmctYnVmZmVyIGhlYWQgaXMuCgpCZWZvcmUga2VybmVsIDIuNi4zOSwgdGhlcmUg
aXMgYSBidWcgdGhhdCBtZWFucyB5b3UgbXVzdCBhbGxvY2F0ZSBhIG1tYXAKcmluZyBidWZmZXIg
d2hlbiBzYW1wbGluZyBldmVuIGlmIHlvdSBkbyBub3QgcGxhbiB0byBhY2Nlc3MgaXQuCgpUaGUg
c3RydWN0dXJlIG9mIHRoZSBmaXJzdCBtZXRhZGF0YSBtbWFwIHBhZ2UgaXMgYXMgZm9sbG93czoK
Ci5pbiArNG4KLm5mCnN0cnVjdCBwZXJmX2V2ZW50X21tYXBfcGFnZSB7CiAgICBfX3UzMiB2ZXJz
aW9uOyAgICAgICAgICAvKiB2ZXJzaW9uIG51bWJlciBvZiB0aGlzIHN0cnVjdHVyZSAgICovCiAg
ICBfX3UzMiBjb21wYXRfdmVyc2lvbjsgICAvKiBsb3dlc3QgdmVyc2lvbiB0aGlzIGlzIGNvbXBh
dCB3aXRoICovCiAgICBfX3UzMiBsb2NrOyAgICAgICAgICAgICAvKiBzZXFsb2NrIGZvciBzeW5j
aHJvbml6YXRpb24gICAgICAgICovCiAgICBfX3UzMiBpbmRleDsgICAgICAgICAgICAvKiBoYXJk
d2FyZSBjb3VudGVyIGlkZW50aWZpZXIgICAgICAgICovCiAgICBfX3M2NCBvZmZzZXQ7ICAgICAg
ICAgICAvKiBhZGQgdG8gaGFyZHdhcmUgY291bnRlciB2YWx1ZSAgICAgICovCiAgICBfX3U2NCB0
aW1lX2VuYWJsZWQ7ICAgICAvKiB0aW1lIGV2ZW50IGFjdGl2ZSAgICAgICAgICAgICAgICAgICov
CiAgICBfX3U2NCB0aW1lX3J1bm5pbmc7ICAgICAvKiB0aW1lIGV2ZW50IG9uIENQVSAgICAgICAg
ICAgICAgICAgICovCiAgICB1bmlvbiB7CiAgICAgICAgX191NjQgICBjYXBhYmlsaXRpZXM7CiAg
ICAgICAgX191NjQgICBjYXBfdXNyX3RpbWUgIDogMSwKICAgICAgICAgICAgICAgIGNhcF91c3Jf
cmRwbWMgOiAxLAogICAgfTsKICAgIF9fdTE2ICAgcG1jX3dpZHRoOwogICAgX191MTYgICB0aW1l
X3NoaWZ0OwogICAgX191MzIgICB0aW1lX211bHQ7CiAgICBfX3U2NCAgIHRpbWVfb2Zmc2V0Owog
ICAgX191NjQgICBfX3Jlc2VydmVkWzEyMF07ICAgLyogUGFkIHRvIDFrICAgICAgICAgICAgICAg
ICovCiAgICBfX3U2NCAgIGRhdGFfaGVhZDsgICAgICAgICAvKiBoZWFkIGluIHRoZSBkYXRhIHNl
Y3Rpb24gKi8KICAgIF9fdTY0ICAgZGF0YV90YWlsOyAgICAgICAgIC8qIHVzZXItc3BhY2Ugd3Jp
dHRlbiB0YWlsICAqLwp9Ci5maQouaW4KCgoKVGhlIGZvbGxvd2luZyBsb29rcyBhdCB0aGUgZmll
bGRzIGluIHRoZQouSSBwZXJmX2V2ZW50X21tYXBfcGFnZQpzdHJ1Y3R1cmUgaW4gbW9yZSBkZXRh
aWwuCgouUlMKCi5UUAouSSB2ZXJzaW9uClZlcnNpb24gbnVtYmVyIG9mIHRoaXMgc3RydWN0dXJl
LgoKLlRQCi5JIGNvbXBhdF92ZXJzaW9uClRoZSBsb3dlc3QgdmVyc2lvbiB0aGlzIGlzIGNvbXBh
dGlibGUgd2l0aC4KCi5UUAouSSBsb2NrCkEgc2VxbG9jayBmb3Igc3luY2hyb25pemF0aW9uLgoK
LlRQCi5JIGluZGV4OwpBIHVuaXF1ZSBoYXJkd2FyZSBjb3VudGVyIGlkZW50aWZpZXIuCgouVFAK
Lkkgb2Zmc2V0Ci5cIiBGSVhNRSBjbGFyaWZ5CkFkZCB0aGlzIHRvIGhhcmR3YXJlIGNvdW50ZXIg
dmFsdWU/PwoKLlRQCi5JIHRpbWVfZW5hYmxlZApUaW1lIHRoZSBldmVudCB3YXMgYWN0aXZlLgoK
LlRQCi5JIHRpbWVfcnVubmluZwpUaW1lIHRoZSBldmVudCB3YXMgcnVubmluZy4KCi5UUAouSSBj
YXBfdXNyX3RpbWUKVXNlciB0aW1lIGNhcGFiaWxpdHkKCi5UUAouSSBjYXBfdXNyX3JkcG1jCklm
IHRoZSBoYXJkd2FyZSBzdXBwb3J0cyB1c2VyLXNwYWNlIHJlYWQgb2YgcGVyZm9ybWFuY2UgY291
bnRlcnMKd2l0aG91dCBzeXNjYWxsICh0aGlzIGlzIHRoZSAicmRwbWMiIGluc3RydWN0aW9uIG9u
IHg4NiksIHRoZW4KdGhlIGZvbGxvd2luZyBjb2RlIGNhbiBiZSB1c2VkIHRvIGRvIGEgcmVhZDoK
Ci5pbiArNG4KLm5mCnUzMiBzZXEsIHRpbWVfbXVsdCwgdGltZV9zaGlmdCwgaWR4LCB3aWR0aDsK
dTY0IGNvdW50LCBlbmFibGVkLCBydW5uaW5nOwp1NjQgY3ljLCB0aW1lX29mZnNldDsKczY0IHBt
YyA9IDA7CgpkbyB7CiAgICBzZXEgPSBwY1wtPmxvY2s7CiAgICBiYXJyaWVyKCk7CiAgICBlbmFi
bGVkID0gcGNcLT50aW1lX2VuYWJsZWQ7CiAgICBydW5uaW5nID0gcGNcLT50aW1lX3J1bm5pbmc7
CgogICAgaWYgKHBjXC0+Y2FwX3Vzcl90aW1lICYmIGVuYWJsZWQgIT0gcnVubmluZykgewogICAg
ICAgIGN5YyA9IHJkdHNjKCk7CiAgICAgICAgdGltZV9vZmZzZXQgPSBwY1wtPnRpbWVfb2Zmc2V0
OwogICAgICAgIHRpbWVfbXVsdCAgID0gcGNcLT50aW1lX211bHQ7CiAgICAgICAgdGltZV9zaGlm
dCAgPSBwY1wtPnRpbWVfc2hpZnQ7CiAgICB9CgogICAgaWR4ID0gcGNcLT5pbmRleDsKICAgIGNv
dW50ID0gcGNcLT5vZmZzZXQ7CgogICAgaWYgKHBjXC0+Y2FwX3Vzcl9yZHBtYyAmJiBpZHgpIHsK
ICAgICAgICB3aWR0aCA9IHBjXC0+cG1jX3dpZHRoOwogICAgICAgIHBtYyA9IHJkcG1jKGlkeCBc
LSAxKTsKICAgIH0KCiAgICBiYXJyaWVyKCk7Cn0gd2hpbGUgKHBjXC0+bG9jayAhPSBzZXEpOwou
ZmkKLmluCgoKCi5UUAouSSBwbWNfd2lkdGgKSWYKLklSIGNhcF91c3JfcmRwbWMgLAp0aGlzIGZp
ZWxkIHByb3ZpZGVzIHRoZSBiaXQtd2lkdGggb2YgdGhlIHZhbHVlCnJlYWQgdXNpbmcgdGhlIHJk
cG1jIG9yIGVxdWl2YWxlbnQgaW5zdHJ1Y3Rpb24uClRoaXMgY2FuIGJlIHVzZWQgdG8gc2lnbiBl
eHRlbmQgdGhlIHJlc3VsdCBsaWtlOgoKLmluICs0bgoubmYKcG1jIDw8PSA2NCBcLSBwbWNfd2lk
dGg7CnBtYyA+Pj0gNjQgXC0gcG1jX3dpZHRoOyAvLyBzaWduZWQgc2hpZnQgcmlnaHQKY291bnQg
Kz0gcG1jOwouZmkKLmluCgoKLlRQCi5JUiB0aW1lX3NoaWZ0ICIsICIgdGltZV9tdWx0ICIsICIg
dGltZV9vZmZzZXQKCklmCi5JUiBjYXBfdXNyX3RpbWUgLAp0aGVzZSBmaWVsZHMgY2FuIGJlIHVz
ZWQgdG8gY29tcHV0ZSB0aGUgdGltZQpkZWx0YSBzaW5jZSB0aW1lX2VuYWJsZWQgKGluIG5zKSB1
c2luZyByZHRzYyBvciBzaW1pbGFyLgoubmYKCiAgICB1NjQgcXVvdCwgcmVtOwogICAgdTY0IGRl
bHRhOwogICAgcXVvdCA9IChjeWMgPj4gdGltZV9zaGlmdCk7CiAgICByZW0gPSBjeWMgJiAoKDEg
PDwgdGltZV9zaGlmdCkgXC0gMSk7CiAgICBkZWx0YSA9IHRpbWVfb2Zmc2V0ICsgcXVvdCAqIHRp
bWVfbXVsdCArCiAgICAgICAgICAgICgocmVtICogdGltZV9tdWx0KSA+PiB0aW1lX3NoaWZ0KTsK
LmZpCgpXaGVyZSB0aW1lX29mZnNldCx0aW1lX211bHQsdGltZV9zaGlmdCBhbmQgY3ljIGFyZSBy
ZWFkIGluIHRoZQpzZXFjb3VudCBsb29wIGRlc2NyaWJlZCBhYm92ZS4KVGhpcyBkZWx0YSBjYW4g
dGhlbiBiZSBhZGRlZCB0bwplbmFibGVkIGFuZCBwb3NzaWJsZSBydW5uaW5nIChpZiBpZHgpLCBp
bXByb3ZpbmcgdGhlIHNjYWxpbmc6Ci5uZgoKICAgIGVuYWJsZWQgKz0gZGVsdGE7CiAgICBpZiAo
aWR4KQogICAgICAgIHJ1bm5pbmcgKz0gZGVsdGE7CiAgICBxdW90ID0gY291bnQgLyBydW5uaW5n
OwogICAgcmVtICA9IGNvdW50ICUgcnVubmluZzsKICAgIGNvdW50ID0gcXVvdCAqIGVuYWJsZWQg
KyAocmVtICogZW5hYmxlZCkgLyBydW5uaW5nOwouZmkKCi5UUAouSSBkYXRhX2hlYWQKVGhpcyBw
b2ludHMgdG8gdGhlIGhlYWQgb2YgdGhlIGRhdGEgc2VjdGlvbi4KT24gU01QLWNhcGFibGUgcGxh
dGZvcm1zLCBhZnRlciByZWFkaW5nIHRoZSBkYXRhX2hlYWQgdmFsdWUsCnVzZXItc3BhY2Ugc2hv
dWxkIGlzc3VlIGFuIHJtYigpLgoKLlRQCi5JIGRhdGFfdGFpbDsKV2hlbiB0aGUgbWFwcGluZyBp
cwouQlIgUFJPVF9XUklURSAsCnRoZSBkYXRhX3RhaWwgdmFsdWUgc2hvdWxkIGJlIHdyaXR0ZW4g
YnkKdXNlcnNwYWNlIHRvIHJlZmxlY3QgdGhlIGxhc3QgcmVhZCBkYXRhLgpJbiB0aGlzIGNhc2Ug
dGhlIGtlcm5lbCB3aWxsIG5vdCBvdmVyLXdyaXRlIHVucmVhZCBkYXRhLgoKLlJFCgoKVGhlIGZv
bGxvd2luZyAyXm4gcmluZy1idWZmZXIgcGFnZXMgaGF2ZSB0aGUgbGF5b3V0IGRlc2NyaWJlZCBi
ZWxvdy4KCklmCi5JIHBlcmZfZXZlbnRfYXR0ci5zYW1wbGVfaWRfYWxsCmlzIHNldCwgdGhlbiBh
bGwgZXZlbnQgdHlwZXMgd2lsbApoYXZlIHRoZSBzYW1wbGVfdHlwZSBzZWxlY3RlZCBmaWVsZHMg
cmVsYXRlZCB0byB3aGVyZS93aGVuIChpZGVudGl0eSkKYW4gZXZlbnQgdG9vayBwbGFjZSAoVElE
LCBUSU1FLCBJRCwgQ1BVLCBTVFJFQU1fSUQpIGRlc2NyaWJlZCBpbgouQiBQRVJGX1JFQ09SRF9T
QU1QTEUKYmVsb3csIGl0IHdpbGwgYmUgc3Rhc2hlZCBqdXN0IGFmdGVyIHRoZQpwZXJmX2V2ZW50
X2hlYWRlciBhbmQgdGhlIGZpZWxkcyBhbHJlYWR5IHByZXNlbnQgZm9yIHRoZSBleGlzdGluZwpm
aWVsZHMsIGkuZS4sIGF0IHRoZSBlbmQgb2YgdGhlIHBheWxvYWQuClRoYXQgd2F5IGEgbmV3ZXIg
cGVyZi5kYXRhCmZpbGUgd2lsbCBiZSBzdXBwb3J0ZWQgYnkgb2xkZXIgcGVyZiB0b29scywgd2l0
aCB0aGVzZSBuZXcgb3B0aW9uYWwKZmllbGRzIGJlaW5nIGlnbm9yZWQuCgpUaGUgbW1hcCB2YWx1
ZXMgc3RhcnQgd2l0aCBhIGhlYWRlcjoKCi5pbiArNG4KLm5mCnN0cnVjdCBwZXJmX2V2ZW50X2hl
YWRlciB7CiAgICBfX3UzMiAgIHR5cGU7CiAgICBfX3UxNiAgIG1pc2M7CiAgICBfX3UxNiAgIHNp
emU7Cn07Ci5maQouaW4KCkJlbG93LCB3ZSBkZXNjcmliZSB0aGUKLkkgcGVyZl9ldmVudF9oZWFk
ZXIKZmllbGRzIGluIG1vcmUgZGV0YWlsLgoKLlRQCi5JIHR5cGUKVGhlCi5JIHR5cGUKdmFsdWUg
aXMgb25lIG9mIHRoZSBiZWxvdy4KVGhlIHZhbHVlcyBpbiB0aGUgY29ycmVzcG9uZGluZyByZWNv
cmQgKHRoYXQgZm9sbG93cyB0aGUgaGVhZGVyKQpkZXBlbmQgb24gdGhlCi5JIHR5cGUKc2VsZWN0
ZWQgYXMgc2hvd24uCgouUlMKLlRQCi5CIFBFUkZfUkVDT1JEX01NQVAKVGhlIE1NQVAgZXZlbnRz
IHJlY29yZCB0aGUKLkIgUFJPVF9FWEVDCm1hcHBpbmdzIHNvIHRoYXQgd2UgY2FuIGNvcnJlbGF0
ZQp1c2Vyc3BhY2UgSVBzIHRvIGNvZGUuClRoZXkgaGF2ZSB0aGUgZm9sbG93aW5nIHN0cnVjdHVy
ZToKCi5pbiArNG4KLm5mCnN0cnVjdCB7CiAgICBzdHJ1Y3QgcGVyZl9ldmVudF9oZWFkZXIgaGVh
ZGVyOwogICAgdTMyICAgIHBpZCwgdGlkOwogICAgdTY0ICAgIGFkZHI7CiAgICB1NjQgICAgbGVu
OwogICAgdTY0ICAgIHBnb2ZmOwogICAgY2hhciAgIGZpbGVuYW1lW107Cn07Ci5pbgoKLlRQCi5C
IFBFUkZfUkVDT1JEX0xPU1QKVGhpcyByZWNvcmQgaW5kaWNhdGVzIHdoZW4gZXZlbnRzIGFyZSBs
b3N0LgoKLmluICs0bgoubmYKc3RydWN0IHsKICAgIHN0cnVjdCBwZXJmX2V2ZW50X2hlYWRlciBo
ZWFkZXI7CiAgICB1NjQgaWQ7CiAgICB1NjQgbG9zdDsKfTsKLmZpCi5pbgoKLlRQCi5CIFBFUkZf
UkVDT1JEX0NPTU0KVGhpcyByZWNvcmQgaW5kaWNhdGVzIGEgY2hhbmdlIGluIHRoZSBwcm9jZXNz
IG5hbWUuCgouaW4gKzRuCi5uZgpzdHJ1Y3QgewogICAgc3RydWN0IHBlcmZfZXZlbnRfaGVhZGVy
IGhlYWRlcjsKICAgIHUzMiBwaWQsIHRpZDsKICAgIGNoYXIgY29tbVtdOwp9OwouZmkKLmluCgou
VFAKLkIgUEVSRl9SRUNPUkRfRVhJVApUaGlzIHJlY29yZCBpbmRpY2F0ZXMgYSBwcm9jZXNzIGV4
aXQgZXZlbnQuCgouaW4gKzRuCi5uZgpzdHJ1Y3QgewogICAgc3RydWN0IHBlcmZfZXZlbnRfaGVh
ZGVyIGhlYWRlcjsKICAgIHUzMiBwaWQsIHBwaWQ7CiAgICB1MzIgdGlkLCBwdGlkOwogICAgdTY0
IHRpbWU7Cn07Ci5maQouaW4KCi5UUAouQlIgUEVSRl9SRUNPUkRfVEhST1RUTEUgIiwgIiBQRVJG
X1JFQ09SRF9VTlRIUk9UVExFClRoaXMgcmVjb3JkIGluZGljYXRlcyBhIHRocm90dGxlL3VudGhy
b3R0bGUgZXZlbnQuCgouaW4gKzRuCi5uZgpzdHJ1Y3QgewogICAgc3RydWN0IHBlcmZfZXZlbnRf
aGVhZGVyIGhlYWRlcjsKICAgIHU2NCB0aW1lOwogICAgdTY0IGlkOwogICAgdTY0IHN0cmVhbV9p
ZDsKfTsKLmZpCi5pbgoKLlRQCi5CIFBFUkZfUkVDT1JEX0ZPUksKVGhpcyByZWNvcmQgaW5kaWNh
dGVzIGEgZm9yayBldmVudC4KCi5pbiArNG4KLm5mCnN0cnVjdCB7CiAgICBzdHJ1Y3QgcGVyZl9l
dmVudF9oZWFkZXIgaGVhZGVyOwogICAgdTMyIHBpZCwgcHBpZDsKICAgIHUzMiB0aWQsIHB0aWQ7
CiAgICB1NjQgdGltZTsKfTsKLmZpCi5pbgoKLlRQCi5CIFBFUkZfUkVDT1JEX1JFQUQKVGhpcyBy
ZWNvcmQgaW5kaWNhdGVzIGEgcmVhZCBldmVudC4KCi5pbiArNG4KLm5mCnN0cnVjdCB7CiAgICBz
dHJ1Y3QgcGVyZl9ldmVudF9oZWFkZXIgaGVhZGVyOwogICAgdTMyIHBpZCwgdGlkOwogICAgc3Ry
dWN0IHJlYWRfZm9ybWF0IHZhbHVlczsKfTsKLmZpCi5pbgoKLlRQCi5CIFBFUkZfUkVDT1JEX1NB
TVBMRQpUaGlzIHJlY29yZCBpbmRpY2F0ZXMgYSBzYW1wbGUuCgouaW4gKzRuCi5uZgpzdHJ1Y3Qg
ewogICAgc3RydWN0IHBlcmZfZXZlbnRfaGVhZGVyIGhlYWRlcjsKICAgIHU2NCAgIGlwOyAgICAg
ICAgICAvKiBpZiBQRVJGX1NBTVBMRV9JUCAgICAgICovCiAgICB1MzIgICBwaWQsIHRpZDsgICAg
LyogaWYgUEVSRl9TQU1QTEVfVElEICAgICAqLwogICAgdTY0ICAgdGltZTsgICAgICAgIC8qIGlm
IFBFUkZfU0FNUExFX1RJTUUgICAgKi8KICAgIHU2NCAgIGFkZHI7ICAgICAgICAvKiBpZiBQRVJG
X1NBTVBMRV9BRERSICAgICovCiAgICB1NjQgICBpZDsgICAgICAgICAgLyogaWYgUEVSRl9TQU1Q
TEVfSUQgICAgICAqLwogICAgdTY0ICAgc3RyZWFtX2lkOyAvKiBpZiBQRVJGX1NBTVBMRV9TVFJF
QU1fSUQgKi8KICAgIHUzMiAgIGNwdSwgcmVzOyAgICAvKiBpZiBQRVJGX1NBTVBMRV9DUFUgICAg
ICovCiAgICB1NjQgICBwZXJpb2Q7ICAgICAgLyogaWYgUEVSRl9TQU1QTEVfUEVSSU9EICAqLwog
ICAgc3RydWN0IHJlYWRfZm9ybWF0IHY7IC8qIGlmIFBFUkZfU0FNUExFX1JFQUQgKi8KICAgIHU2
NCAgIG5yOyAgICAgICAgLyogaWYgUEVSRl9TQU1QTEVfQ0FMTENIQUlOICovCiAgICB1NjQgICBp
cHNbbnJdOyAgIC8qIGlmIFBFUkZfU0FNUExFX0NBTExDSEFJTiAqLwogICAgdTMyICAgc2l6ZTsg
ICAgICAgIC8qIGlmIFBFUkZfU0FNUExFX1JBVyAgICAgKi8KICAgIGNoYXIgIGRhdGFbc2l6ZV07
ICAvKiBpZiBQRVJGX1NBTVBMRV9SQVcgICAgICovCiAgICB1NjQgICBmcm9tOyAgIC8qIGlmIFBF
UkZfU0FNUExFX0JSQU5DSF9TVEFDSyAqLwogICAgdTY0ICAgdG87ICAgICAvKiBpZiBQRVJGX1NB
TVBMRV9CUkFOQ0hfU1RBQ0sgKi8KICAgIHU2NCAgIGZsYWdzOyAgLyogaWYgUEVSRl9TQU1QTEVf
QlJBTkNIX1NUQUNLICovCiAgICB1NjQgICBsYnJbbnJdOy8qIGlmIFBFUkZfU0FNUExFX0JSQU5D
SF9TVEFDSyAqLwp9OwouZmkKLmluCgpUaGUgUkFXIHJlY29yZCBkYXRhIGlzIG9wYXF1ZSB3aXRo
IHJlc3BlY3QgdG8gdGhlIEFCSS4KVGhlIEFCSSBkb2Vzbid0IG1ha2UgYW55IHByb21pc2VzIHdp
dGggcmVzcGVjdCB0byB0aGUgc3RhYmlsaXR5Cm9mIGl0cyBjb250ZW50LCBpdCBtYXkgdmFyeSBk
ZXBlbmRpbmcKb24gZXZlbnQsIGhhcmR3YXJlLCBhbmQga2VybmVsIHZlcnNpb24uCgouUkUKCgou
VFAKLkkgbWlzYwpUaGUKLkkgbWlzYwpmaWVsZCBpcyBvbmUgb2YgdGhlIGZvbGxvd2luZzoKLlJT
Ci5UUAouQiBQRVJGX1JFQ09SRF9NSVNDX0NQVU1PREVfTUFTSwpbVG8gYmUgZG9jdW1lbnRlZF0K
LlRQCi5CIFBFUkZfUkVDT1JEX01JU0NfQ1BVTU9ERV9VTktOT1dOCltUbyBiZSBkb2N1bWVudGVk
XQouVFAKLkIgUEVSRl9SRUNPUkRfTUlTQ19LRVJORUwKW1RvIGJlIGRvY3VtZW50ZWRdCi5UUAou
QiBQRVJGX1JFQ09SRF9NSVNDX1VTRVIKW1RvIGJlIGRvY3VtZW50ZWRdCi5UUAouQiBQRVJGX1JF
Q09SRF9NSVNDX0hZUEVSVklTT1IKW1RvIGJlIGRvY3VtZW50ZWRdCi5UUAouQiBQRVJGX1JFQ09S
RF9NSVNDX0dVRVNUX0tFUk5FTApbVG8gYmUgZG9jdW1lbnRlZF0KLlRQCi5CIFBFUkZfUkVDT1JE
X01JU0NfR1VFU1RfVVNFUgpbVG8gYmUgZG9jdW1lbnRlZF0KLlRQCi5CIFBFUkZfUkVDT1JEX01J
U0NfRVhBQ1RfSVAKVGhpcyBpbmRpY2F0ZXMgdGhhdCB0aGUgY29udGVudCBvZgouQiBQRVJGX1NB
TVBMRV9JUApwb2ludHMKdG8gdGhlIGFjdHVhbCBpbnN0cnVjdGlvbiB0aGF0IHRyaWdnZXJlZCB0
aGUgZXZlbnQuClNlZSBhbHNvCi5JUiBwZXJmX2V2ZW50X2F0dHIucHJlY2lzZV9pcCAuCgouUkUK
Ci5UUAouSSBzaXplClRoaXMgaW5kaWNhdGVzIHRoZSBzaXplIG9mIHRoZSByZWNvcmQuCgoKLlNT
ICJTaWduYWwgT3ZlcmZsb3ciCgpDb3VudGVycyBjYW4gYmUgc2V0IHRvIHNpZ25hbCB3aGVuIGEg
dGhyZXNob2xkIGlzIGNyb3NzZWQuClRoaXMgaXMgc2V0IHVwIHVzaW5nIHRyYWRpdGlvbmFsIHRo
ZQouQlIgcG9sbCAoMiksCi5CUiBzZWxlY3QgKDIpLAouQlIgZXBvbGwgKDIpCmFuZAouQlIgZmNu
dGwgKDIpLApzeXN0ZW0gY2FsbHMuCgpOb3JtYWxseSwgYSBub3RpZmljYXRpb24gaXMgZ2VuZXJh
dGVkIGZvciBldmVyeSBwYWdlIGZpbGxlZCwgaG93ZXZlcgpvbmUgY2FuIGFkZGl0aW9uYWxseSBz
ZXQKLkkgcGVyZl9ldmVudF9hdHRyLndha2V1cF9ldmVudHMKdG8gZ2VuZXJhdGUgb25lIGV2ZXJ5
IHNvIG1hbnkgY291bnRlciBvdmVyZmxvdyBldmVudHMuCgouU1MgIlJlYWRpbmcgUmVzdWx0cyIK
T25jZSBhCi5CUiBwZXJmX2V2ZW50X29wZW4oKQpmaWxlIGRlc2NyaXB0b3IgIGhhcyBiZWVuIG9w
ZW5lZCwgdGhlIHZhbHVlcwpvZiB0aGUgZXZlbnRzIGNhbiBiZSByZWFkIGZyb20gdGhlIGZpbGUg
ZGVzY3JpcHRvci4KVGhlIHZhbHVlcyB0aGF0IGFyZSB0aGVyZSBhcmUgc3BlY2lmaWVkIGJ5IHRo
ZQouSSByZWFkX2Zvcm1hdApmaWVsZCBpbiB0aGUgYXR0ciBzdHJ1Y3R1cmUgYXQgb3BlbiB0aW1l
LgoKSWYgeW91IGF0dGVtcHQgdG8gcmVhZCBpbnRvIGEgYnVmZmVyIHRoYXQgaXMgbm90IGJpZyBl
bm91Z2ggdG8gaG9sZCB0aGUKZGF0YSwgYW4gZXJyb3IgaXMgcmV0dXJuZWQKLklSICggRU5PU1BD
ICkuCgpIZXJlIGlzIHRoZSBsYXlvdXQgb2YgdGhlIGRhdGEgcmV0dXJuZWQgYnkgYSByZWFkLgoK
SWYKLkIgUEVSRl9GT1JNQVRfR1JPVVAKd2FzIHNwZWNpZmllZCB0byBhbGxvdyByZWFkaW5nIGFs
bCBldmVudHMgaW4gYSBncm91cCBhdCBvbmNlOgoKLmluICs0bgoubmYKc3RydWN0IHsKICAgIHU2
NCBucjsgICAgICAgICAgICAgLyogVGhlIG51bWJlciBvZiBldmVudHMgKi8KICAgIHU2NCB0aW1l
X2VuYWJsZWQ7ICAgLyogaWYgUEVSRl9GT1JNQVRfVE9UQUxfVElNRV9FTkFCTEVEICovCiAgICB1
NjQgdGltZV9ydW5uaW5nOyAgIC8qIGlmIFBFUkZfRk9STUFUX1RPVEFMX1RJTUVfUlVOTklORyAq
LwogICAgc3RydWN0IHsKICAgICAgICB1NjQgdmFsdWU7ICAgICAgLyogVGhlIHZhbHVlIG9mIHRo
ZSBldmVudCAqLwogICAgICAgIHU2NCBpZDsgICAgICAgICAvKiBpZiBQRVJGX0ZPUk1BVF9JRCAq
LwogICAgfSB2YWx1ZXNbbnJdOwp9OwouZmkKLmluCgpJZgouQiBQRVJGX0ZPUk1BVF9HUk9VUAp3
YXMKLkkgbm90CnNwZWNpZmllZCwgdGhlbiB0aGUgcmVhZCB2YWx1ZXMgbG9vayBhcyBmb2xsb3dp
bmc6CgouaW4gKzRuCi5uZgpzdHJ1Y3QgewogICAgdTY0IHZhbHVlOyAgICAgICAgIC8qIFRoZSB2
YWx1ZSBvZiB0aGUgZXZlbnQgKi8KICAgIHU2NCB0aW1lX2VuYWJsZWQ7ICAvKiBpZiBQRVJGX0ZP
Uk1BVF9UT1RBTF9USU1FX0VOQUJMRUQgKi8KICAgIHU2NCB0aW1lX3J1bm5pbmc7ICAvKiBpZiBQ
RVJGX0ZPUk1BVF9UT1RBTF9USU1FX1JVTk5JTkcgKi8KICAgIHU2NCBpZDsgICAgICAgICAgICAv
KiBpZiBQRVJGX0ZPUk1BVF9JRCAqLwp9OwouZmkKLmluCgpUaGUgdmFsdWVzIHJlYWQgYXJlIGRl
c2NyaWJlZCBpbiBtb3JlIGRldGFpbCBiZWxvdy4KLlJTCi5UUAouSSBucgpUaGUgbnVtYmVyIG9m
IGV2ZW50cyBpbiB0aGlzIGZpbGUgZGVzY3JpcHRvci4KT25seSBhdmFpbGFibGUgaWYKLkIgUEVS
Rl9GT1JNQVRfR1JPVVAKd2FzIHNwZWNpZmllZC4KCi5UUAouSVIgdGltZV9lbmFibGVkICIsICIg
dGltZV9ydW5uaW5nClRvdGFsIHRpbWUgdGhlIGV2ZW50IHdhcyBlbmFibGVkIGFuZCBydW5uaW5n
LgpOb3JtYWxseSB0aGVzZSBhcmUgdGhlIHNhbWUuCklmIG1vcmUgZXZlbnRzIGFyZSBzdGFydGVk
CnRoYW4gYXZhaWxhYmxlIGNvdW50ZXIgc2xvdHMgb24gdGhlIFBNVSwgdGhlbiBtdWx0aXBsZXhp
bmcKaGFwcGVucyBhbmQgZXZlbnRzIG9ubHkgcnVuIHBhcnQgb2YgdGhlIHRpbWUuCkluIHRoYXQg
Y2FzZSB0aGUKLkkgdGltZV9lbmFibGVkCmFuZAouSSB0aW1lIHJ1bm5pbmcKdmFsdWVzIGNhbiBi
ZSB1c2VkIHRvIHNjYWxlIGFuIGVzdGltYXRlZCB2YWx1ZSBmb3IgdGhlIGNvdW50LgoKLlRQCi5J
IHZhbHVlCkFuIHVuc2lnbmVkIDY0LWJpdCB2YWx1ZSBjb250YWluaW5nIHRoZSBjb3VudGVyIHJl
c3VsdC4KCi5UUAouSSBpZApBIGdsb2JhbGx5IHVuaXF1ZSB2YWx1ZSBmb3IgdGhpcyBwYXJ0aWN1
bGFyIGV2ZW50LCBvbmx5IHRoZXJlIGlmCi5CIFBFUkZfRk9STUFUX0lECndhcyBzcGVjaWZpZWQg
aW4gcmVhZF9mb3JtYXQuCgouUkUKCgoKCi5SRQoKLlNTICJyZHBtYyBpbnN0cnVjdGlvbiIKU3Rh
cnRpbmcgd2l0aCBMaW51eCAzLjQgb24geDg2LCB5b3UgY2FuIHVzZSB0aGUKLkkgcmRwbWMKaW5z
dHJ1Y3Rpb24gdG8gZ2V0IGxvdy1sYXRlbmN5IHJlYWRzIHdpdGhvdXQgaGF2aW5nIHRvIGVudGVy
IHRoZSBrZXJuZWwuCgoKLlNTICJwZXJmX2V2ZW50IGlvY3RsIGNhbGxzIgouUFAKVmFyaW91cyBp
b2N0bHMgYWN0IG9uCi5CUiBwZXJmX2V2ZW50X29wZW4oKQpmaWxlIGRlc2NyaXB0b3JzCi5cIiBG
SVhNRSB0aGUgYXJndW1lbnRzIGZvciB0aGVzZSBpb2N0bCgpIG9wZXJhdGlvbnMgbmVlZCB0byBi
ZSBkZXNjcmliZWQKLlRQCi5CIFBFUkZfRVZFTlRfSU9DX0VOQUJMRQpFbmFibGVzIGFuIGluZGl2
aWR1YWwgY291bnRlciBvciBjb3VudGVyIGdyb3VwLgoKLlRQCi5CIFBFUkZfRVZFTlRfSU9DX0RJ
U0FCTEUKRGlzYWJsZXMgYW4gaW5kaXZpZHVhbCBjb3VudGVyIG9yIGNvdW50ZXIgZ3JvdXAuCgpF
bmFibGluZyBvciBkaXNhYmxpbmcgdGhlIGxlYWRlciBvZiBhIGdyb3VwIGVuYWJsZXMgb3IgZGlz
YWJsZXMgdGhlCmVudGlyZSBncm91cDsgdGhhdCBpcywgd2hpbGUgdGhlIGdyb3VwIGxlYWRlciBp
cyBkaXNhYmxlZCwgbm9uZSBvZiB0aGUKY291bnRlcnMgaW4gdGhlIGdyb3VwIHdpbGwgY291bnQu
CkVuYWJsaW5nIG9yIGRpc2FibGluZyBhIG1lbWJlciBvZiBhIGdyb3VwIG90aGVyIHRoYW4gdGhl
IGxlYWRlciBvbmx5CmFmZmVjdHMgdGhhdCBjb3VudGVyOyBkaXNhYmxpbmcgYSBub24tbGVhZGVy
CnN0b3BzIHRoYXQgY291bnRlciBmcm9tIGNvdW50aW5nIGJ1dCBkb2Vzbid0IGFmZmVjdCBhbnkg
b3RoZXIgY291bnRlci4KCi5UUAouQiBQRVJGX0VWRU5UX0lPQ19SRUZSRVNICk5vbi1pbmhlcml0
ZWQgb3ZlcmZsb3cgY291bnRlcnMgY2FuIHVzZSB0aGlzCnRvIGVuYWJsZSBhIGNvdW50ZXIgZm9y
ICducicgZXZlbnRzLCBhZnRlciB3aGljaCBpdCBnZXRzIGRpc2FibGVkIGFnYWluLgouXCIgRklY
TUUgdGhlIGZvbGxvd2luZyBuZWVkcyBjbGFyaWZpY2F0aW9uL2NvbmZpcm1hdGlvbgpJIHRoaW5r
IHRoZSBnb2FsIG9mIElPQ19SRUZSRVNIIGlzIG5vdCB0byByZWxvYWQgdGhlIHBlcmlvZCBidXQg
c2ltcGx5IHRvCmFkanVzdCB0aGUgbnVtYmVyIG9mIGV2ZW50cyBiZWZvcmUgdGhlIG5leHQgbm90
aWZpY2F0aW9ucy4KCi5UUAouQiBQRVJGX0VWRU5UX0lPQ19SRVNFVApSZXNldCB0aGUgZXZlbnQg
Y291bnQgdG8gemVyby4KVGhpcyBvbmx5IHJlc2V0cyB0aGUgY291bnRzOyB0aGVyZSBpcyBubyB3
YXkgdG8gcmVzZXQgdGhlCm11bHRpcGxleGluZwouSSB0aW1lX2VuYWJsZWQKb3IKLkkgdGltZV9y
dW5uaW5nCnZhbHVlcy4KV2hlbiBzZW50IHRvIGEgZ3JvdXAgbGVhZGVyLCBvbmx5CnRoZSBsZWFk
ZXIgaXMgcmVzZXQgKGNoaWxkIGV2ZW50cyBhcmUgbm90KS4KCi5UUAouQiBQRVJGX0VWRU5UX0lP
Q19QRVJJT0QKSU9DX1BFUklPRCBpcyB0aGUgY29tbWFuZCB0byB1cGRhdGUgdGhlIHBlcmlvZDsg
aXQKZG9lcyBub3QgdXBkYXRlIHRoZSBjdXJyZW50IHBlcmlvZCBidXQgaW5zdGVhZCBkZWZlcnMg
dW50aWwgbmV4dC4KCi5UUAouQiBQRVJGX0VWRU5UX0lPQ19TRVRfT1VUUFVUClRoaXMgdGVsbHMg
dGhlIGtlcm5lbCB0byByZXBvcnQgZXZlbnQgbm90aWZpY2F0aW9ucyB0byB0aGUgc3BlY2lmaWVk
CmZpbGUgZGVzY3JpcHRvciByYXRoZXIgdGhhbiB0aGUgZGVmYXVsdCBvbmUuClRoZSBmaWxlIGRl
c2NyaXB0b3JzIG11c3QgYWxsIGJlIG9uIHRoZSBzYW1lIENQVS4KCi5UUAouQlIgUEVSRl9FVkVO
VF9JT0NfU0VUX0ZJTFRFUiAiIChTaW5jZSBMaW51eCAyLjYuMzMpIgpUaGlzIGFkZHMgYW4gZnRy
YWNlIGZpbHRlciB0byB0aGlzIGV2ZW50LgoKLlNTICJVc2luZyBwcmN0bCIKQSBwcm9jZXNzIGNh
biBlbmFibGUgb3IgZGlzYWJsZSBhbGwgdGhlIGNvdW50ZXIgZ3JvdXBzIHRoYXQgYXJlCmF0dGFj
aGVkIHRvIGl0IHVzaW5nCi5CUiBwcmN0bCAoMikuClRoaXMgYXBwbGllcyB0byBhbGwgY291bnRl
cnMgb24gdGhlIGN1cnJlbnQgcHJvY2Vzcywgd2hldGhlciBjcmVhdGVkIGJ5CnRoaXMgcHJvY2Vz
cyBvciBieSBhbm90aGVyLCBhbmQgZG9lcyBub3QgYWZmZWN0IGFueSBjb3VudGVycyB0aGF0IHRo
aXMKcHJvY2VzcyBoYXMgY3JlYXRlZCBvbiBvdGhlciBwcm9jZXNzZXMuCkl0IG9ubHkgZW5hYmxl
cyBvciBkaXNhYmxlcwp0aGUgZ3JvdXAgbGVhZGVycywgbm90IGFueSBvdGhlciBtZW1iZXJzIGlu
IHRoZSBncm91cHMuCgouVFAKLlwiIEZJWE1FIHRoZSBmb2xsb3dpbmcgbmVlZCB0byBiZSBkb2N1
bWVudGVkIGhlcmUsIG9yIGluIHByY3RsKDIpLgouSSAgcHJjdGwoUFJfVEFTS19QRVJGX0VWRU5U
U19FTkFCTEUpCi5UUAouSSAgcHJjdGwoUFJfVEFTS19QRVJGX0VWRU5UU19ESVNBQkxFKQoKLlNT
IC9wcm9jL3N5cy9rZXJuZWwvcGVyZl9ldmVudF9wYXJhbm9pZAoKVGhlCi5JIC9wcm9jL3N5cy9r
ZXJuZWwvcGVyZl9ldmVudF9wYXJhbm9pZApmaWxlIGNhbiBiZSBzZXQgdG8gcmVzdHJpY3QgYWNj
ZXNzIHRvIHRoZSBwZXJmb3JtYW5jZSBjb3VudGVycy4KMgptZWFucyBubyBtZWFzdXJlbWVudHMg
YWxsb3dlZCwKMQptZWFucyBub3JtYWwgY291bnRlciBhY2Nlc3MsCjAKbWVhbnMgeW91IGNhbiBh
Y2Nlc3MgQ1BVLXNwZWNpZmljIGRhdGEsIGFuZApcLTEKbWVhbnMgbm8gcmVzdHJpY3Rpb25zLgoK
VGhlIGV4aXN0ZW5jZSBvZiB0aGUKLkkgcGVyZl9ldmVudF9wYXJhbm9pZApmaWxlIGlzIHRoZSBv
ZmZpY2lhbCBtZXRob2QgZm9yIGRldGVybWluaW5nIGlmIGEga2VybmVsIHN1cHBvcnRzCi5CUiBw
ZXJmX2V2ZW50X29wZW4oKS4KCi5TSCAiUkVUVVJOIFZBTFVFIgouQlIgcGVyZl9ldmVudF9vcGVu
ICgpCnJldHVybnMgdGhlIG5ldyBmaWxlIGRlc2NyaXB0b3IsIG9yIFwtMSBpZiBhbiBlcnJvciBv
Y2N1cnJlZAooaW4gd2hpY2ggY2FzZSwKLkkgZXJybm8KaXMgc2V0IGFwcHJvcHJpYXRlbHkpLgou
U0ggRVJST1JTCi5UUAouQiBFSU5WQUwKUmV0dXJuZWQgaWYgdGhlIHNwZWNpZmllZCBldmVudCBp
cyBub3QgYXZhaWxhYmxlLgouVFAKLkIgRU5PU1BDClByaW9yIHRvIExpbnV4IDMuMywgaWYgdGhl
cmUgd2FzIG5vIGNvdW50ZXIgcm9vbSwKLkIgRU5PU1BDCndhcyByZXR1cm5lZC4KTGludXMgZGlk
IG5vdCBsaWtlIHRoaXMsIGFuZCB0aGlzIHdhcyBjaGFuZ2VkIHRvCi5CUiBFSU5WQUwgLgouQiBF
Tk9TUEMKaXMgc3RpbGwgcmV0dXJuZWQgaWYgeW91IHRyeSB0byByZWFkIHJlc3VsdHMgaW50bwp0
b28gc21hbGwgYSBidWZmZXIuCgouU0ggVkVSU0lPTgoKLkJSIHBlcmZfZXZlbnRfb3BlbiAoKQp3
YXMgaW50cm9kdWNlZCBpbiBMaW51eCAyLjYuMzEgYnV0IHdhcyBjYWxsZWQKLkJSIHBlcmZfY291
bnRlcl9vcGVuICgpIC4KSXQgd2FzIHJlbmFtZWQgaW4gTGludXggMi42LjMyLgoKLlNIIENPTkZP
Uk1JTkcgVE8KClRoaXMgY2FsbCBpcyBzcGVjaWZpYyB0byBMaW51eAphbmQgc2hvdWxkIG5vdCBi
ZSB1c2VkIGluIHByb2dyYW1zIGludGVuZGVkIHRvIGJlIHBvcnRhYmxlLgoKLlNIIE5PVEVTCkds
aWJjIGRvZXMgbm90IHByb3ZpZGUgYSB3cmFwcGVyIGZvciB0aGlzIHN5c3RlbSBjYWxsOyBjYWxs
IGl0IHVzaW5nCi5CUiBzeXNjYWxsICgyKS4KClRoZSBvZmZpY2lhbCB3YXkgb2Yga25vd2luZyBp
ZgouQlIgcGVyZl9ldmVudF9vcGVuKCkKc3VwcG9ydCBpcyBlbmFibGVkIGlzIGNoZWNraW5nCmZv
ciB0aGUgZXhpc3RlbmNlIG9mIHRoZSBmaWxlCi5JIC9wcm9jL3N5cy9rZXJuZWwvcGVyZl9ldmVu
dF9wYXJhbm9pZAoKLlNIIEJVR1MKClRoZQouQiBGX1NFVE9XTl9FWApvcHRpb24gdG8KLklSIGZj
bnRsICgyKQppcyBuZWVkZWQgdG8gcHJvcGVybHkgZ2V0IG92ZXJmbG93IHNpZ25hbHMgaW4gdGhy
ZWFkcy4KVGhpcyB3YXMgaW50cm9kdWNlZCBpbiBMaW51eCAyLjYuMzIuCgpQcmlvciB0byBMaW51
eCAyLjYuMzMgKGF0IGxlYXN0IGZvciB4ODYpIHRoZSBrZXJuZWwgZGlkIG5vdCBjaGVjawppZiBl
dmVudHMgY291bGQgYmUgc2NoZWR1bGVkIHRvZ2V0aGVyIHVudGlsIHJlYWQgdGltZS4KVGhlIHNh
bWUgaGFwcGVucyBvbiBhbGwga25vd24ga2VybmVscyBpZiB0aGUgTk1JIHdhdGNoZG9nIGlzIGVu
YWJsZWQuClRoaXMgbWVhbnMgdG8gc2VlIGlmIGEgZ2l2ZW4gZXZlbnRzZXQgd29ya3MgeW91IGhh
dmUgdG8KLkJSIHBlcmZfZXZlbnRfb3BlbiAoKSwKc3RhcnQsIHRoZW4gcmVhZCBiZWZvcmUgeW91
IGtub3cgZm9yIHN1cmUgeW91CmNhbiBnZXQgdmFsdWUgbWVhc3VyZW1lbnRzLgoKUHJpb3IgdG8g
TGludXggMi42LjM0IGV2ZW50IGNvbnN0cmFpbnRzIHdlcmUgbm90IGVuZm9yY2VkIGJ5IHRoZSBr
ZXJuZWwuCkluIHRoYXQgY2FzZSwgc29tZSBldmVudHMgd291bGQgc2lsZW50bHkgcmV0dXJuICIw
IiBpZiB0aGUga2VybmVsCnNjaGVkdWxlZCB0aGVtIGluIGFuIGltcHJvcGVyIGNvdW50ZXIgc2xv
dC4KClByaW9yIHRvIExpbnV4IDIuNi4zNCB0aGVyZSB3YXMgYSBidWcgd2hlbiBtdWx0aXBsZXhp
bmcgd2hlcmUgdGhlCndyb25nIHJlc3VsdHMgY291bGQgYmUgcmV0dXJuZWQuCgpLZXJuZWxzIGZy
b20gTGludXggMi42LjM1IHRvIExpbnV4IDIuNi4zOSBjYW4gcXVpY2tseSBjcmFzaCB0aGUga2Vy
bmVsIGlmCiJpbmhlcml0IiBpcyBlbmFibGVkIGFuZCBtYW55IHRocmVhZHMgYXJlIHN0YXJ0ZWQu
CgpQcmlvciB0byBMaW51eCAyLjYuMzUsCi5CIFBFUkZfRk9STUFUX0dST1VQCmRpZCBub3Qgd29y
ayB3aXRoIGF0dGFjaGVkIHByb2Nlc3Nlcy4KCkluIG9sZGVyIExpbnV4IDIuNiB2ZXJzaW9ucywK
cmVmcmVzaGluZyBhbiBldmVudCBncm91cCBsZWFkZXIgcmVmcmVzaGVkIGFsbCBzaWJsaW5ncywK
YW5kIHJlZnJlc2hpbmcgd2l0aCBhIHBhcmFtZXRlciBvZiAwIGVuYWJsZWQgaW5maW5pdGUgcmVm
cmVzaC4KVGhpcyBiZWhhdmlvciBpcyB1bnN1cHBvcnRlZCBhbmQgc2hvdWxkIG5vdCBiZSByZWxp
ZWQgb24uCgpUaGVyZSBpcyBhIGJ1ZyBpbiB0aGUga2VybmVsIGNvZGUgYmV0d2VlbgpMaW51eCAy
LjYuMzYgYW5kIExpbnV4IDMuMCB0aGF0IGlnbm9yZXMgdGhlCiJ3YXRlcm1hcmsiIGZpZWxkIGFu
ZCBhY3RzIGFzIGlmIGEgd2FrZXVwX2V2ZW50CndhcyBjaG9zZW4gaWYgdGhlIHVuaW9uIGhhcyBh
Cm5vbi16ZXJvIHZhbHVlIGluIGl0LgoKQWx3YXlzIGRvdWJsZS1jaGVjayB5b3VyIHJlc3VsdHMh
ICBWYXJpb3VzIGdlbmVyYWxpemVkIGV2ZW50cwpoYXZlIGhhZCB3cm9uZyB2YWx1ZXMuCkZvciBl
eGFtcGxlLCByZXRpcmVkIGJyYW5jaGVzIG1lYXN1cmVkCnRoZSB3cm9uZyB0aGluZyBvbiBBTUQg
bWFjaGluZXMgdW50aWwgTGludXggMi42LjM1LgoKLlNIIEVYQU1QTEUKVGhlIGZvbGxvd2luZyBp
cyBhIHNob3J0IGV4YW1wbGUgdGhhdCBtZWFzdXJlcyB0aGUgdG90YWwKaW5zdHJ1Y3Rpb24gY291
bnQgb2YgYSBjYWxsIHRvIHByaW50ZigpLgoubmYKCiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1
ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5j
bHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+CiNpbmNsdWRl
IDxhc20vdW5pc3RkLmg+Cgpsb25nIHBlcmZfZXZlbnRfb3Blbiggc3RydWN0IHBlcmZfZXZlbnRf
YXR0ciAqaHdfZXZlbnQsIHBpZF90IHBpZCwKICAgICAgICAgICAgICAgICAgICAgIGludCBjcHUs
IGludCBncm91cF9mZCwgdW5zaWduZWQgbG9uZyBmbGFncyApCnsKICAgIGludCByZXQ7CgogICAg
cmV0ID0gc3lzY2FsbCggX19OUl9wZXJmX2V2ZW50X29wZW4sIGh3X2V2ZW50LCBwaWQsIGNwdSwK
ICAgICAgICAgICAgICAgICAgIGdyb3VwX2ZkLCBmbGFncyApOwogICAgcmV0dXJuIHJldDsKfQoK
CmludAptYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKewoKICAgIHN0cnVjdCBwZXJmX2V2ZW50
X2F0dHIgcGU7CiAgICBsb25nIGxvbmcgY291bnQ7CiAgICBpbnQgZmQ7CgogICAgbWVtc2V0KCZw
ZSwgMCwgc2l6ZW9mKHN0cnVjdCBwZXJmX2V2ZW50X2F0dHIpKTsKICAgIHBlLnR5cGUgPSBQRVJG
X1RZUEVfSEFSRFdBUkU7CiAgICBwZS5zaXplID0gc2l6ZW9mKHN0cnVjdCBwZXJmX2V2ZW50X2F0
dHIpOwogICAgcGUuY29uZmlnID0gUEVSRl9DT1VOVF9IV19JTlNUUlVDVElPTlM7CiAgICBwZS5k
aXNhYmxlZCA9IDE7CiAgICBwZS5leGNsdWRlX2tlcm5lbCA9IDE7CiAgICBwZS5leGNsdWRlX2h2
ID0gMTsKCiAgICBmZCA9IHBlcmZfZXZlbnRfb3BlbigmcGUsIDAsIFwtMSwgXC0xLCAwKTsKICAg
IGlmIChmZCA8IDApIHsKICAgICAgIGZwcmludGYoc3RkZXJyLCAiRXJyb3Igb3BlbmluZyBsZWFk
ZXIgJWxseFxcbiIsIHBlLmNvbmZpZyk7CiAgICB9CgogICAgaW9jdGwoZmQsIFBFUkZfRVZFTlRf
SU9DX1JFU0VULCAwKTsKICAgIGlvY3RsKGZkLCBQRVJGX0VWRU5UX0lPQ19FTkFCTEUsIDApOwoK
ICAgIHByaW50ZigiTWVhc3VyaW5nIGluc3RydWN0aW9uIGNvdW50IGZvciB0aGlzIHByaW50Zlxc
biIpOwoKICAgIGlvY3RsKGZkLCBQRVJGX0VWRU5UX0lPQ19ESVNBQkxFLCAwKTsKICAgIHJlYWQo
ZmQsICZjb3VudCwgc2l6ZW9mKGxvbmcgbG9uZykpOwoKICAgIHByaW50ZigiVXNlZCAlbGxkIGlu
c3RydWN0aW9uc1xcbiIsIGNvdW50KTsKCiAgICBjbG9zZShmZCk7Cn0KLmZpCgouU0ggIlNFRSBB
TFNPIgouQlIgZmNudGwgKDIpLAouQlIgbW1hcCAoMiksCi5CUiBvcGVuICgyKSwKLkJSIHByY3Rs
ICgyKSwKLkJSIHJlYWQgKDIpCg==
--14dae93406d71de10104cc914201--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
