From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: ffix and tfix
Date: Mon, 25 Feb 2013 05:54:47 +0100
Message-ID: <CAKgNAkgqi2YLxd9NqBojeMCUz9p4WM3CV9FyhSiSfTDqUCuCDA@mail.gmail.com>
References: <1361551634-17115-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361551634-17115-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Fri, Feb 22, 2013 at 5:47 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man2/perf_event_open.2 |  126 ++++++++++++++++++++++++++++----------=
----------
>  1 file changed, 73 insertions(+), 53 deletions(-)
>
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index ed468f2..eb989d4 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -56,7 +56,7 @@ to measure multiple events simultaneously.
>  Events can be enabled and disabled in two ways: via
>  .BR ioctl (2)
>  and via
> -.BR prctl (2) .
> +.BR prctl (2).
>  When an event is disabled it does not count or generate overflows bu=
t does
>  continue to exist and maintain its count value.
>  .PP
> @@ -72,7 +72,7 @@ A
>  .I sampling
>  event periodically writes measurements to a buffer that can then
>  be accessed via
> -.BR  mmap (2) .
> +.BR  mmap (2).
>  .SS Arguments
>  .P
>  The argument
> @@ -164,7 +164,7 @@ This flag re-routes the output from an event to t=
he group leader.
>  This flag activates per-container system-wide monitoring.
>  A container
>  is an abstraction that isolates a set of resources for finer grain
> -control (CPUs, memory, etc...).
> +control (CPUs, memory, etc.).
>  In this mode, the event is measured
>  only if the thread running on the monitored CPU belongs to the desig=
nated
>  container (cgroup).
> @@ -226,7 +226,7 @@ struct perf_event_attr {
>                exclude_callchain_kernel : 1,
>                                      /* exclude kernel callchains */
>                exclude_callchain_user   : 1,
> -                                   /* exclude user callchains */
> +                                    /* exclude user callchains */
>                __reserved_1   : 41;
>
>      union {
> @@ -331,9 +331,9 @@ is set to 64; this was the size of the first publ=
ished struct.
>  .B PERF_ATTR_SIZE_VER1
>  is 72, corresponding to the addition of breakpoints in Linux 2.6.33.
>  .B PERF_ATTR_SIZE_VER2
> -is 80 corresponding to the addition of branch sampling in Linux 3.4.
> +is 80, corresponding to the addition of branch sampling in Linux 3.4=
=2E
>  .B PERF_ATR_SIZE_VER3
> -is 96 corresponding to the addition
> +is 96, corresponding to the addition
>  of sample_regs_user and sample_stack_user in Linux 3.7.
>
>  .TP
> @@ -378,12 +378,12 @@ to one of the following:
>  .TP
>  .B PERF_COUNT_HW_CPU_CYCLES
>  Total cycles.
> -Be wary of what happens during CPU frequency scaling
> +Be wary of what happens during CPU frequency scaling.
>  .TP
>  .B PERF_COUNT_HW_INSTRUCTIONS
>  Retired instructions.
>  Be careful, these can be affected by various
> -issues, most notably hardware interrupt counts
> +issues, most notably hardware interrupt counts.
>  .TP
>  .B PERF_COUNT_HW_CACHE_REFERENCES
>  Cache accesses.
> @@ -611,11 +611,11 @@ timer tick.
>  .I "sample_type"
>  The various bits in this field specify which values to include
>  in the sample.
> -They will be recorded in a ring-buffer,
> +They will be recorded in a ring buffer,
>  which is available to user-space using
>  .BR mmap (2).
>  The order in which the values are saved in the
> -sample are documented in the MMAP Layout subsection below;
> +sample is documented in the MMAP Layout subsection below;
>  it is not the
>  .I "enum perf_event_sample_format"
>  order.
> @@ -653,7 +653,8 @@ Records a unique ID for the opened event.
>  Unlike
>  .B PERF_SAMPLE_ID
>  the actual ID is returned, not the group leader.
> -This ID is the same as the one returned by PERF_FORMAT_ID.
> +This ID is the same as the one returned by
> +.BR PERF_FORMAT_ID .
>  .TP
>  .B PERF_SAMPLE_RAW
>  Records additional data, if applicable.
> @@ -661,7 +662,8 @@ Usually returned by tracepoint events.
>  .TP
>  .BR PERF_SAMPLE_BRANCH_STACK " (Since Linux 3.4)"
>  Records the branch stack.
> -See branch_sample_type.
> +See
> +.IR branch_sample_type .
>  .TP
>  .BR PERF_SAMPLE_REGS_USER " (Since Linux 3.7)"
>  Records the current register state.
> @@ -778,9 +780,9 @@ bit enables recording of exec mmap events.
>  The
>  .I comm
>  bit enables tracking of process command name as modified by the
> -.IR exec (2)
> +.BR exec (2)
>  and
> -.IR prctl (PR_SET_NAME)
> +.BR prctl (PR_SET_NAME)
>  system calls.
>  Unfortunately for tools,
>  there is no way to distinguish one system call versus the other.
> @@ -859,7 +861,7 @@ See also
>  The counterpart of the
>  .I mmap
>  field, but enables including data mmap events
> -in the ring-buffer.
> +in the ring buffer.
>
>  .TP
>  .IR "sample_id_all" " (Since Linux 2.6.38)"
> @@ -872,11 +874,11 @@ is selected.
>
>  .TP
>  .IR "exclude_host" " (Since Linux 3.2)"
> -Do not measure time spent in VM host
> +Do not measure time spent in VM host.
>
>  .TP
>  .IR "exclude_guest" " (Since Linux 3.2)"
> -Do not measure time spent in VM guest
> +Do not measure time spent in VM guest.
>
>  .TP
>  .IR "exclude_callchain_kernel" " (Since Linux 3.7)"
> @@ -932,7 +934,7 @@ is not allowed.
>  .TP
>  .IR "bp_addr" " (Since Linux 2.6.33)"
>  .I bp_addr
> -address of the breakpoint.
> +is the address of the breakpoint.
>  For execution breakpoints this is the memory address of the instruct=
ion
>  of interest; for read and write breakpoints it is the memory address
>  of the memory location of interest.
> @@ -941,7 +943,9 @@ of the memory location of interest.
>  .IR "config1" " (Since Linux 2.6.39)"
>  .I config1
>  is used for setting events that need an extra register or otherwise
> -do not fit in the regular config field.
> +do not fit in the regular
> +.I config
> +field.
>  Raw OFFCORE_EVENTS on Nehalem/Westmere/SandyBridge use this field
>  on 3.3 and later kernels.
>
> @@ -975,28 +979,28 @@ It can have one of the following values:
>  .RS
>  .TP
>  .B PERF_SAMPLE_BRANCH_USER
> -Branch target is in user space
> +Branch target is in user space.
>  .TP
>  .B PERF_SAMPLE_BRANCH_KERNEL
> -Branch target is in kernel space
> +Branch target is in kernel space.
>  .TP
>  .B PERF_SAMPLE_BRANCH_HV
> -Branch target is in hypervisor
> +Branch target is in hypervisor.
>  .TP
>  .B PERF_SAMPLE_BRANCH_ANY
>  Any branch type.
>  .TP
>  .B PERF_SAMPLE_BRANCH_ANY_CALL
> -Any call branch
> +Any call branch.
>  .TP
>  .B PERF_SAMPLE_BRANCH_ANY_RETURN
> -Any return branch
> +Any return branch.
>  .TP
>  .BR PERF_SAMPLE_BRANCH_IND_CALL
> -Indirect calls
> +Indirect calls.
>  .TP
>  .BR PERF_SAMPLE_BRANCH_PLM_ALL
> -User, kernel, and hv
> +User, kernel, and hv.
>  .RE
>
>  .TP
> @@ -1026,7 +1030,7 @@ structure at open time.
>  If you attempt to read into a buffer that is not big enough to hold =
the
>  data
>  .B ENOSPC
> -is returned
> +is returned.
>
>  Here is the layout of the data returned by a read:
>
> @@ -1095,7 +1099,8 @@ An unsigned 64-bit value containing the counter=
 result.
>  .I id
>  A globally unique value for this particular event, only there if
>  .B PERF_FORMAT_ID
> -was specified in read_format.
> +was specified in
> +.IR read_format .
>
>  .RE
>  .RE
> @@ -1110,15 +1115,15 @@ in sampled mode, asynchronous events
>  (like counter overflow or
>  .B PROT_EXEC
>  mmap tracking)
> -are logged into a ring-buffer.
> -This ring-buffer is created and accessed through
> +are logged into a ring buffer.
> +This ring buffer is created and accessed through
>  .BR mmap (2).
>
>  The mmap size should be 1+2^n pages, where the first page is a
>  metadata page
> -.IR ( "struct perf_event_mmap_page" )
> +.RI ( "struct perf_event_mmap_page" )
>  that contains various
> -bits of information such as where the ring-buffer head is.
> +bits of information such as where the ring buffer head is.
>
>  Before kernel 2.6.39, there is a bug that means you must allocate a =
mmap
>  ring buffer when sampling even if you do not plan to access it.
> @@ -1190,7 +1195,7 @@ Time the event was running.
>
>  .TP
>  .I cap_usr_time
> -User time capability
> +User time capability.
>
>  .TP
>  .I cap_usr_rdpmc
> @@ -1256,7 +1261,9 @@ count +=3D pmc;
>  If
>  .IR cap_usr_time ,
>  these fields can be used to compute the time
> -delta since time_enabled (in nanoseconds) using rdtsc or similar.
> +delta since
> +.I time_enabled
> +(in nanoseconds) using rdtsc or similar.
>  .nf
>
>      u64 quot, rem;
> @@ -1294,27 +1301,31 @@ The value continuously increases, it does not=
 wrap.
>  The value needs to be manually wrapped by the size of the mmap buffe=
r
>  before accessing the samples.
>
> -On SMP-capable platforms, after reading the data_head value,
> +On SMP-capable platforms, after reading the
> +.I data_head
> +value,
>  user-space should issue an rmb().
>
>  .TP
> -.I data_tail;
> +.I data_tail
>  When the mapping is
>  .BR PROT_WRITE ,
>  the
>  .I data_tail
>  value should be written by user space to reflect the last read data.
> -In this case the kernel will not over-write unread data.
> +In this case the kernel will not overwrite unread data.
>
>  .RE
>
>
> -The following 2^n ring-buffer pages have the layout described below.
> +The following 2^n ring buffer pages have the layout described below.
>
>  If
>  .I perf_event_attr.sample_id_all
>  is set, then all event types will
> -have the sample_type selected fields related to where/when (identity=
)
> +have the
> +.I sample_type
> +selected fields related to where/when (identity)
>  an event took place (TID, TIME, ID, CPU, STREAM_ID) described in
>  .B PERF_RECORD_SAMPLE
>  below, it will be stashed just after the
> @@ -1573,7 +1584,8 @@ the current sampling period is written.
>  .I v
>  If
>  .B PERF_SAMPLE_READ
> -is enabled, a structure of type read_format
> +is enabled, a structure of type
> +.I read_format
>  is included which has values for all events in the event group.
>  The values included depend on the
>  .I read_format
> @@ -1702,7 +1714,7 @@ The signal handler is set up using the
>  .BR select (2),
>  .BR epoll (2)
>  and
> -.BR fcntl (2),
> +.BR fcntl (2)
>  system calls.
>
>  To generate signals, sampling must be enabled
> @@ -1756,7 +1768,7 @@ to calculate event values can be found in that =
section.
>  .PP
>  Various ioctls act on
>  .BR perf_event_open ()
> -file descriptors
> +file descriptors.
>
>  .TP
>  .B PERF_EVENT_IOC_ENABLE
> @@ -1790,14 +1802,14 @@ A signal with
>  .B POLL_IN
>  set will happen on each overflow until the
>  count reaches 0; when that happens a signal with
> -POLL_HUP
> +.B POLL_HUP
>  set is sent and the event is disabled.
>  Using an argument of 0 is considered undefined behavior.
>
>  .TP
>  .B PERF_EVENT_IOC_RESET
>  Reset the event count specified by the
> -file descriptor argumentto zero.
> +file descriptor argument to zero.
>  This only resets the counts; there is no way to reset the
>  multiplexing
>  .I time_enabled
> @@ -1885,7 +1897,8 @@ The default value is
>  .TP
>  .I /proc/sys/kernel/perf_event_mlock_kb
>
> -Maximum number of pages an unprivileged user can mlock (2) .
> +Maximum number of pages an unprivileged user can
> +.BR mlock (2).
>  The default is 516 (kB).
>  .RE
>
> @@ -1903,7 +1916,9 @@ Each subdirectory corresponds to a different PM=
U.
>  .I /sys/bus/event_source/devices/*/type
>  This contains an integer that can be used in the
>  .I type
> -field of perf_event_attr to indicate you wish to use this PMU.
> +field of
> +.I perf_event_attr
> +to indicate you wish to use this PMU.
>
>  .TP
>  .I /sys/bus/event_source/devices/*/rdpmc
> @@ -1913,7 +1928,9 @@ field of perf_event_attr to indicate you wish t=
o use this PMU.
>  .I /sys/bus/event_source/devices/*/format/
>  This sub-directory contains information on what bits in the
>  .I config
> -field of perf_event_attr correspond to.
> +field of
> +.I perf_event_attr
> +correspond to.
>
>  .TP
>  .I /sys/bus/event_source/devices/*/events/
> @@ -1953,18 +1970,18 @@ Linus did not like this, and this was changed=
 to
>  is still returned if you try to read results into
>  too small of a buffer.
>
> -.SH VERSION
> +.SH VERSIONS
>
>  .BR perf_event_open ()
>  was introduced in Linux 2.6.31 but was called
> -.BR perf_counter_open () .
> +.BR perf_counter_open ().
>  It was renamed in Linux 2.6.32.
>
>  .SH CONFORMING TO
>
>  This
>  .BR perf_event_open ()
> -system call Linux- specific
> +system call is Linux-specific
>  and should not be used in programs intended to be portable.
>
>  .SH NOTES
> @@ -2002,8 +2019,9 @@ scheduled them in an improper counter slot.
>  Prior to Linux 2.6.34 there was a bug when multiplexing where the
>  wrong results could be returned.
>
> -Kernels from Linux 2.6.35 to Linux 2.6.39 can quickly crash the kern=
el if
> -"inherit" is enabled and many threads are started.
> +Kernels from Linux 2.6.35 to Linux 2.6.39 can quickly crash if
> +.I inherit
> +is enabled and many threads are started.
>
>  Prior to Linux 2.6.35,
>  .B PERF_FORMAT_GROUP
> @@ -2016,7 +2034,9 @@ This behavior is unsupported and should not be =
relied on.
>
>  There is a bug in the kernel code between
>  Linux 2.6.36 and Linux 3.0 that ignores the
> -"watermark" field and acts as if a wakeup_event
> +.I watermark
> +field and acts as if a
> +.I wakeup_event
>  was chosen if the union has a
>  non-zero value in it.
>
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
