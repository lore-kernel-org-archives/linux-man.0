From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2: Add git commit references
Date: Fri, 23 Jan 2015 12:58:19 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1501231255420.15389@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


I noticed you were adding git commit references to the various
Linux version markers.

This adds git commit references for all Linux kernel version
notes in perf_event_open.2

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 27885f3..e91ef21 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -158,6 +158,7 @@ using the
 flag.
 .TP
 .BR PERF_FLAG_FD_OUTPUT " (broken since Linux 2.6.35)"
+.\" commit ac9721f3f54b27a16c7e1afb2481e7ee95a70318
 This flag re-routes the event's sampled output to instead
 be included in the mmap buffer of the event specified by
 .IR group_fd .
@@ -301,7 +302,8 @@ Breakpoints can be read/write accesses to an address as well as
 execution of an instruction address.
 .TP
 .RB "dynamic PMU"
-Since Linux 2.6.39,
+Since Linux 2.6.38,
+.\" commit 2e80a82a49c4c7eca4e35734380f28298ba5db19
 .BR perf_event_open ()
 can support multiple PMUs.
 To enable this, a value exported by the kernel can be used in the
@@ -334,8 +336,12 @@ The related define
 is set to 64; this was the size of the first published struct.
 .B PERF_ATTR_SIZE_VER1
 is 72, corresponding to the addition of breakpoints in Linux 2.6.33.
+.\" commit cb5d76999029ae7a517cb07dfa732c1b5a934fc2
+.\" this was added much later when PERF_ATTR_SIZE_VER2 happened
+.\" but the actual attr_size had increased in 2.6.33
 .B PERF_ATTR_SIZE_VER2
 is 80 corresponding to the addition of branch sampling in Linux 3.4.
+.\" commit cb5d76999029ae7a517cb07dfa732c1b5a934fc2
 .B PERF_ATTR_SIZE_VER3
 is 96 corresponding to the addition
 of
@@ -343,6 +349,7 @@ of
 and
 .I sample_stack_user
 in Linux 3.7.
+.\" commit 1659d129ed014b715b0b2120e6fd929bdd33ed03
 .TP
 .I "config"
 This specifies which event you want, in conjunction with
@@ -402,8 +409,9 @@ event to calculate cache miss rates.
 .TP
 .B PERF_COUNT_HW_BRANCH_INSTRUCTIONS
 Retired branch instructions.
-Prior to Linux 2.6.34, this used
+Prior to Linux 2.6.35, this used
 the wrong event on AMD processors.
+.\" commit f287d332ce835f77a4f5077d2c0ef1e3f9ea42d2
 .TP
 .B PERF_COUNT_HW_BRANCH_MISSES
 Mispredicted branch instructions.
@@ -412,9 +420,11 @@ Mispredicted branch instructions.
 Bus cycles, which can be different from total cycles.
 .TP
 .BR PERF_COUNT_HW_STALLED_CYCLES_FRONTEND " (since Linux 3.0)"
+.\" commit 8f62242246351b5a4bc0c1f00c0c7003edea128a
 Stalled cycles during issue.
 .TP
 .BR PERF_COUNT_HW_STALLED_CYCLES_BACKEND  " (since Linux 3.0)"
+.\" commit 8f62242246351b5a4bc0c1f00c0c7003edea128a
 Stalled cycles during retirement.
 .TP
 .BR PERF_COUNT_HW_REF_CPU_CYCLES  " (since Linux 3.3)"
@@ -445,6 +455,7 @@ This reports the number of page faults.
 This counts context switches.
 Until Linux 2.6.34, these were all reported as user-space
 events, after that they are reported as happening in the kernel.
+.\" commit e49a5bd38159dfb1928fd25b173bc9de4bbadb21
 .TP
 .B PERF_COUNT_SW_CPU_MIGRATIONS
 This reports the number of times the process
@@ -879,6 +890,7 @@ system calls as well as writing to
 If the
 .I comm_exec
 flag is also successfully set (possible since Linux 3.16),
+.\" commit 82b897782d10fcc4930c9d4a15b175348fdd2871
 then the misc flag
 .B PERF_RECORD_MISC_COMM_EXEC
 can be used to differentiate the
@@ -917,6 +929,7 @@ Otherwise, overflow notifications happen after
 samples.
 .TP
 .IR "precise_ip" " (since Linux 2.6.35)"
+.\" commit ab608344bcbde4f55ec4cd911b686b0ce3eae076
 This controls the amount of skid.
 Skid is how many instructions
 execute between an event of interest happening and the kernel
@@ -949,6 +962,7 @@ See also
 .RE
 .TP
 .IR "mmap_data" " (since Linux 2.6.36)"
+.\" commit 3af9e859281bda7eb7c20b51879cf43aa788ac2e
 The counterpart of the
 .I mmap
 field.
@@ -961,6 +975,7 @@ calls that do not have
 set (for example data and SysV shared memory).
 .TP
 .IR "sample_id_all" " (since Linux 2.6.38)"
+.\" commit c980d1091810df13f21aabbce545fd98f545bbf7
 If set, then TID, TIME, ID, STREAM_ID, and CPU can
 additionally be included in
 .RB non- PERF_RECORD_SAMPLE s
@@ -990,18 +1005,28 @@ struct sample_id {
 .fi
 .TP
 .IR "exclude_host" " (since Linux 3.2)"
+.\" commit a240f76165e6255384d4bdb8139895fac7988799
 Do not measure time spent in VM host.
 .TP
 .IR "exclude_guest" " (since Linux 3.2)"
+.\" commit a240f76165e6255384d4bdb8139895fac7988799
 Do not measure time spent in VM guest.
 .TP
 .IR "exclude_callchain_kernel" " (since Linux 3.7)"
+.\" commit d077526485d5c9b12fe85d0b2b3b7041e6bc5f91
 Do not include kernel callchains.
 .TP
 .IR "exclude_callchain_user" " (since Linux 3.7)"
+.\" commit d077526485d5c9b12fe85d0b2b3b7041e6bc5f91
 Do not include user callchains.
 .TP
 .IR "mmap2" " (since Linux 3.16)"
+.\" commit 13d7a2410fa637f450a29ecb515ac318ee40c741
+.\" This is tricky; was committed during 3.12 development
+.\" but right before release was disabled.
+.\" So while you could select mmap2 starting with 3.12
+.\" it did not work until 3.16
+.\" commit a5a5ba72843dd05f991184d6cb9a4471acce1005
 Generate an extended executable mmap record that contains enough
 additional information to uniquely identify shared mappings.
 The
@@ -1009,6 +1034,7 @@ The
 flag must also be set for this to work.
 .TP
 .IR "comm_exec" " (since Linux 3.16)"
+.\" commit 82b897782d10fcc4930c9d4a15b175348fdd2871
 This is purely a feature-detection flag, it does not change
 kernel behavior.
 If this flag can successfully be set, then, when
@@ -1044,11 +1070,13 @@ types choose watermark and set
 to 1.
 
 Prior to Linux 3.0 setting
+.\" commit f506b3dc0ec454a16d40cab9ee5d75435b39dc50
 .I wakeup_events
 to 0 resulted in no overflow notifications;
 more recent kernels treat 0 the same as 1.
 .TP
 .IR "bp_type" " (since Linux 2.6.33)"
+.\" commit 24f1e32c60c45c89a997c73395b69c8af6f0a84e
 This chooses the breakpoint type.
 It is one of:
 .RS
@@ -1079,6 +1107,7 @@ is not allowed.
 .RE
 .TP
 .IR "bp_addr" " (since Linux 2.6.33)"
+.\" commit 24f1e32c60c45c89a997c73395b69c8af6f0a84e
 .I bp_addr
 address of the breakpoint.
 For execution breakpoints this is the memory address of the instruction
@@ -1086,6 +1115,7 @@ of interest; for read and write breakpoints it is the memory address
 of the memory location of interest.
 .TP
 .IR "config1" " (since Linux 2.6.39)"
+.\" commit a7e3ed1e470116c9d12c2f778431a481a6be8ab6
 .I config1
 is used for setting events that need an extra register or otherwise
 do not fit in the regular config field.
@@ -1093,6 +1123,7 @@ Raw OFFCORE_EVENTS on Nehalem/Westmere/SandyBridge use this field
 on 3.3 and later kernels.
 .TP
 .IR "bp_len" " (since Linux 2.6.33)"
+.\" commit 24f1e32c60c45c89a997c73395b69c8af6f0a84e
 .I bp_len
 is the length of the breakpoint being measured if
 .I type
@@ -1107,6 +1138,7 @@ For an execution breakpoint, set this to
 .IR sizeof(long) .
 .TP
 .IR "config2" " (since Linux 2.6.39)"
+.\" commit a7e3ed1e470116c9d12c2f778431a481a6be8ab6
 
 .I config2
 is a further extension of the
@@ -1114,6 +1146,7 @@ is a further extension of the
 field.
 .TP
 .IR "branch_sample_type" " (since Linux 3.4)"
+.\" commit bce38cd53e5ddba9cb6d708c4ef3d04a4016ec7e
 If
 .B PERF_SAMPLE_BRANCH_STACK
 is enabled, then this specifies what branches to include
@@ -1174,12 +1207,14 @@ Branch not in transactional memory transaction.
 
 .TP
 .IR "sample_regs_user" " (since Linux 3.7)"
+.\" commit 4018994f3d8785275ef0e7391b75c3462c029e56
 This bit mask defines the set of user CPU registers to dump on samples.
 The layout of the register mask is architecture-specific and
 described in the kernel header
 .IR arch/ARCH/include/uapi/asm/perf_regs.h .
 .TP
 .IR "sample_stack_user" " (since Linux 3.7)"
+.\" commit c5ebcedb566ef17bda7b02686e0d658a7bb42ee7
 This defines the size of the user stack to dump if
 .B PERF_SAMPLE_STACK_USER
 is specified.
@@ -1345,6 +1380,7 @@ Time the event was active.
 Time the event was running.
 .TP
 .IR cap_usr_time " / " cap_usr_rdpmc " / " cap_bit0 " (since Linux 3.4)"
+.\" commit c7206205d00ab375839bd6c7ddb247d600693c09
 There was a bug in the definition of
 .I cap_usr_time
 and
@@ -1358,6 +1394,7 @@ or
 were actually set.
 
 Starting with Linux 3.12, these are renamed to
+.\" commit fa7315871046b9a4c48627905691dbde57e51033
 .I cap_bit0
 and you should use the
 .I cap_user_time
@@ -1367,6 +1404,7 @@ fields instead.
 
 .TP
 .IR cap_bit0_is_deprecated " (since Linux 3.12)"
+.\" commit fa7315871046b9a4c48627905691dbde57e51033
 If set, this bit indicates that the kernel supports
 the properly separated
 .I cap_user_time
@@ -1383,6 +1421,7 @@ be used with caution.
 
 .TP
 .IR cap_user_rdpmc " (since Linux 3.12)"
+.\" commit fa7315871046b9a4c48627905691dbde57e51033
 If the hardware supports user-space read of performance counters
 without syscall (this is the "rdpmc" instruction on x86), then
 the following code can be used to do a read:
@@ -1420,10 +1459,12 @@ do {
 .in
 .TP
 .IR cap_user_time " (since Linux 3.12)"
+.\" commit fa7315871046b9a4c48627905691dbde57e51033
 This bit indicates the hardware has a constant, nonstop
 timestamp counter (TSC on x86).
 .TP
 .IR cap_user_time_zero " (since Linux 3.12)"
+.\" commit fa7315871046b9a4c48627905691dbde57e51033
 Indicates the presence of
 .I time_zero
 which allows mapping timestamp values to
@@ -1481,6 +1522,7 @@ enabled and possible running (if idx), improving the scaling:
 .fi
 .TP
 .IR time_zero " (since Linux 3.12)"
+.\" commit fa7315871046b9a4c48627905691dbde57e51033
 
 If
 .I cap_usr_time_zero
@@ -1583,11 +1625,11 @@ Sample happened in user code.
 .B PERF_RECORD_MISC_HYPERVISOR
 Sample happened in the hypervisor.
 .TP
-.BR PERF_RECORD_MISC_GUEST_KERNEL " (since Linux2.6.35)"
+.BR PERF_RECORD_MISC_GUEST_KERNEL " (since Linux 2.6.35)"
 .\" commit 39447b386c846bbf1c56f6403c5282837486200f
 Sample happened in the guest kernel.
 .TP
-.B PERF_RECORD_MISC_GUEST_USER " (since Linux2.6.35)"
+.B PERF_RECORD_MISC_GUEST_USER " (since Linux 2.6.35)"
 .\" commit 39447b386c846bbf1c56f6403c5282837486200f
 Sample happened in guest user code.
 .RE
@@ -1939,9 +1981,11 @@ The branch target was mispredicted.
 The branch target was predicted.
 .TP
 .IR in_tx " (since Linux 3.11)"
+.\" commit 135c5612c460f89657c4698fe2ea753f6f667963
 The branch was in a transactional memory transaction.
 .TP
 .IR abort " (since Linux 3.11)"
+.\" commit 135c5612c460f89657c4698fe2ea753f6f667963
 The branch was in an aborted transactional memory transaction.
 
 .P
@@ -2309,12 +2353,19 @@ once the counter reaches 0
 is indicated and
 the underlying event is disabled.
 
+Refreshing an event group leader refreshes all siblings,
+and refreshing with a parameter of 0 enables infinite refresh.
+This behavior is unsupported and should not be relied on.
+.\" See https://lkml.org/lkml/2011/5/24/337
+
 Starting with Linux 3.18,
+.\" commit 179033b3e064d2cd3f5f9945e76b0a0f0fbf4883
 .B POLL_HUP
 is indicated if the event being monitored is attached to a different
 process and that process exits.
 .SS rdpmc instruction
 Starting with Linux 3.4 on x86, you can use the
+.\" commit c7206205d00ab375839bd6c7ddb247d600693c09
 .I rdpmc
 instruction to get low-latency reads without having to enter the kernel.
 Note that using
@@ -2391,7 +2442,10 @@ reset, even if the event specified is not the group leader
 .B PERF_EVENT_IOC_PERIOD
 This updates the overflow period for the event.
 
-Since Linux 3.7 (on ARM) and Linux 3.14 (all other architectures),
+Since Linux 3.7 (on ARM)
+.\" commit 3581fe0ef37ce12ac7a4f74831168352ae848edc
+and Linux 3.14 (all other architectures),
+.\" commit bad7192b842c83e580747ca57104dd51fe08c223
 the new period takes effect immediately.
 On older kernels, the new period did not take effect until
 after the next overflow.
@@ -2399,7 +2453,9 @@ after the next overflow.
 The argument is a pointer to a 64-bit value containing the
 desired new period.
 
-Prior to Linux 2.6.36 this ioctl always failed due to a bug
+Prior to Linux 2.6.36
+.\" commit ad0cf3478de8677f720ee06393b3147819568d6a
+this ioctl always failed due to a bug
 in the kernel.
 
 .TP
@@ -2488,6 +2544,7 @@ Information on how to program these PMUs can be found under
 Each subdirectory corresponds to a different PMU.
 .TP
 .IR /sys/bus/event_source/devices/*/type " (since Linux 2.6.38)"
+.\" commit abe43400579d5de0078c2d3a760e6598e183f871
 This contains an integer that can be used in the
 .I type
 field of
@@ -2495,11 +2552,13 @@ field of
 to indicate that you wish to use this PMU.
 .TP
 .IR /sys/bus/event_source/devices/*/rdpmc " (since Linux 3.4)"
+.\" commit 0c9d42ed4cee2aa1dfc3a260b741baae8615744f
 If this file is 1, then direct user-space access to the
 performance counter registers is allowed via the rdpmc instruction.
 This can be disabled by echoing 0 to the file.
 .TP
 .IR /sys/bus/event_source/devices/*/format/ " (since Linux 3.4)"
+.\" commit 641cc938815dfd09f8fa1ec72deb814f0938ac33
 This subdirectory contains information on the architecture-specific
 subfields available for programming the various
 .I config
@@ -2519,6 +2578,7 @@ of
 .IR perf_event_attr::config1 .
 .TP
 .IR /sys/bus/event_source/devices/*/events/ " (since Linux 3.4)"
+.\" commit 641cc938815dfd09f8fa1ec72deb814f0938ac33
 This subdirectory contains files with predefined events.
 The contents are strings describing the event settings
 expressed in terms of the fields found in the previously mentioned
@@ -2540,6 +2600,7 @@ This file is the standard kernel device interface
 for injecting hotplug events.
 .TP
 .IR /sys/bus/event_source/devices/*/cpumask " (since Linux 3.7)"
+.\" commit 314d9f63f385096580e9e2a06eaa0745d92fe4ac
 The
 .I cpumask
 file contains a comma-separated list of integers that
@@ -2651,6 +2712,7 @@ some unsupported generic events.
 .TP
 .B ENOSPC
 Prior to Linux 3.3, if there was not enough room for the event,
+.\" commit aa2bc1ade59003a379ffc485d6da2d92ea3370a6
 .B ENOSPC
 was returned.
 In Linux 3.3, this was changed to
@@ -2685,14 +2747,17 @@ when the requested event requires
 permissions (or a more permissive perf_event paranoid setting).
 This includes setting a breakpoint on a kernel address,
 and (since Linux 3.13) setting a kernel function-trace tracepoint.
+.\" commit a4e95fc2cbb31d70a65beffeaf8773f881328c34
 .TP
 .B ESRCH
 Returned if attempting to attach to a process that does not exist.
 .SH VERSION
 .BR perf_event_open ()
 was introduced in Linux 2.6.31 but was called
+.\" commit 0793a61d4df8daeac6492dbf8d2f3e5713caae5e
 .BR perf_counter_open ().
 It was renamed in Linux 2.6.32.
+.\" commit cdd6c482c9ff9c55475ee7392ec8f672eddb7be6
 .SH CONFORMING TO
 This
 .BR perf_event_open ()
@@ -2715,8 +2780,11 @@ option to
 .BR fcntl (2)
 is needed to properly get overflow signals in threads.
 This was introduced in Linux 2.6.32.
+.\" commit ba0a6c9f6fceed11c6a99e8326f0477fe383e6b5
 
-Prior to Linux 2.6.33 (at least for x86), the kernel did not check
+Prior to Linux 2.6.33 (at least for x86),
+.\" commit b690081d4d3f6a23541493f1682835c3cd5c54a1
+the kernel did not check
 if events could be scheduled together until read time.
 The same happens on all known kernels if the NMI watchdog is enabled.
 This means to see if a given set of events works you have to
@@ -2727,35 +2795,37 @@ can get valid measurements.
 Prior to Linux 2.6.34, event constraints were not enforced by the kernel.
 In that case, some events would silently return "0" if the kernel
 scheduled them in an improper counter slot.
+.\" FIXME: cannot find a kernel commit for this one
 
 Prior to Linux 2.6.34, there was a bug when multiplexing where the
 wrong results could be returned.
+.\" commit 45e16a6834b6af098702e5ea6c9a40de42ff77d8
 
 Kernels from Linux 2.6.35 to Linux 2.6.39 can quickly crash the kernel if
 "inherit" is enabled and many threads are started.
+.\" commit 38b435b16c36b0d863efcf3f07b34a6fac9873fd
 
 Prior to Linux 2.6.35,
+.\" commit 050735b08ca8a016bbace4445fa025b88fee770b
 .B PERF_FORMAT_GROUP
 did not work with attached processes.
 
-In older Linux 2.6 versions,
-refreshing an event group leader refreshed all siblings,
-and refreshing with a parameter of 0 enabled infinite refresh.
-This behavior is unsupported and should not be relied on.
-
 There is a bug in the kernel code between
 Linux 2.6.36 and Linux 3.0 that ignores the
 "watermark" field and acts as if a wakeup_event
 was chosen if the union has a
 nonzero value in it.
+.\" commit 4ec8363dfc1451f8c8f86825731fe712798ada02
 
 From Linux 2.6.31 to Linux 3.4, the
 .B PERF_IOC_FLAG_GROUP
 ioctl argument was broken and would repeatedly operate
 on the event specified rather than iterating across
 all sibling events in a group.
+.\" commit 724b6daa13e100067c30cfc4d1ad06629609dc4e
 
 From Linux 3.4 to Linux 3.11, the mmap
+.\" commit fa7315871046b9a4c48627905691dbde57e51033
 .I cap_usr_rdpmc
 and
 .I cap_usr_time
@@ -2770,6 +2840,7 @@ Always double-check your results!
 Various generalized events have had wrong values.
 For example, retired branches measured
 the wrong thing on AMD machines until Linux 2.6.35.
+.\" commit f287d332ce835f77a4f5077d2c0ef1e3f9ea42d2
 .SH EXAMPLE
 The following is a short example that measures the total
 instruction count of a call to
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
