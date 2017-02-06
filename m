From: Eugene Syromiatnikov <esyr-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH RFC] prctl.2: Add task isolation descrpition
Date: Mon, 6 Feb 2017 11:39:30 +0100
Message-ID: <20170206103930.GA1418@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Metcalf <cmetcalf-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello.

This is some draft for the possible addition for the prctl(2) man page for the
upcoming task isolation feature [1]. It is intended to be applied (in some more
refined form) after the task isolation patch would be adopted in the mainline
kernel. For now, it documents current behaviour with amendment of the proposed
prctl(2) handling [2].

[1] https://lkml.org/lkml/2016/8/16/825
[2] https://lkml.org/lkml/2017/2/2/365

---
 man2/prctl.2 | 143 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 97cf21a..dc143f7 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -942,6 +942,103 @@ Return (as the function result)
 the "securebits" flags of the calling thread.
 See
 .BR capabilities (7).
+.\"
+.TP
+.BR PR_SET_TASK_ISOLATION " (since Linux 4.11)"
+Set the task isolation flags for the process. Task isolation is a mechanism for
+ensuring that kernel performs no interruptions for a process, which can be
+enabled on supported architectures (currently AMD64, ARM64 and tile) by
+compiling the kernel with the
+.BR CONFIG_TASK_ISOLATION = y .
+
+In order to do this, a process should set its affinity to a specific task
+isolating core (which is set using
+.BR task_isolation= " or " task_isolation_all
+kernel parameters) and then issue a
+.BR prctl ()
+call with
+.B PR_SET_TASK_ISOLATION
+command and the
+.I arg2
+argument with the
+.B PR_TASK_ISOLATION_ENABLE
+bit set. After the successful call, in case user space is interrupted by kernel
+activity (syscall handling, interrupt handling, other scheduled task, etc), the
+fact is reported by sending a signal to the isolated task
+.RB ( SIGKILL
+by default; it can be changed by providing the
+.B PR_TASK_ISOLATION_USERSIG
+flag in the
+.I arg2
+parameter and providing signal number via the
+.BI PR_TASK_ISOLATION_SET_SIG( signal )
+macro when performing task isolation setup). For additional information, see
+.BR Documentation/task_isolation.txt .
+
+Full description of the
+.I arg2
+fields is available below:
+.RS
+.TP
+.B PR_TASK_ISOLATION_ENABLE
+Indicates that task wants to enter into isolated state. When this bit is set,
+kernel ensures that, from its perspective, task can be executed on the selected
+CPU without interruptions. When this flag is unset
+.TP
+.B PR_TASK_ISOLATION_USERSIG
+If this flag is set, the signal provided via the
+.BI PR_TASK_ISOLATION_SET_SIG( sig )
+macro in the higher bits of the
+.I arg2
+value.
+.TP
+.BI PR_TASK_ISOLATION_SET_SIG( sig )
+Provides the number of the signal which should be sent to the isolated task
+instead of
+.B SIGKILL
+in the event of breach of task isolation promise. This value is used only in
+case
+.B PR_TASK_ISOLATION_USERSIG
+is set. In case
+.I sig
+provided is equal to 0, it enables special "no signal" mode of task isolation
+operation, when no signals are delivered to the isolated task upon task
+isolation violation, and kernel works in best effort mode in order to ensure
+task isolation operation in this case. There is special shortcut macro,
+.BR PR_TASK_ISOLATION_NOSIG ,
+which combines
+.B PR_TASK_ISOLATION_USERSIG
+and
+.B PR_TASK_ISOLATION_SET_SIG(0)
+values.
+.RE
+.IP
+The
+.IR arg3 ,
+.IR arg4 ,
+and
+.IR arg5
+arguments should be set to 0.
+
+.TP
+.BR PR_GET_TASK_ISOLATION " (since Linux 4.11)"
+Return task isolation configuration value set with the
+.B PR_SET_TASK_ISOLATION
+call. The value of custom signal set (in case
+.B PR_TASK_ISOLATION_USERSIG
+bit set)
+can be retrieved via the
+.BI PR_TASK_ISOLATION_GET_SIG( val )
+macro.
+
+The
+.IR arg2 ,
+.IR arg3 ,
+.IR arg4 ,
+and
+.IR arg5
+arguments should be set to 0.
+'\"
 .TP
 .BR PR_SET_THP_DISABLE " (since Linux 3.15)"
 .\" commit a0715cc22601e8830ace98366c0c2bd8da52af52
@@ -1204,6 +1301,12 @@ is
 .BR PR_SET_MM_EXE_FILE ,
 the file is not executable.
 .TP
+.B EAGAIN
+.I option
+is
+.B PR_SET_TASK_ISOLATION
+and kernel can't guarantee no further interruptions (tick can't be stopped).
+.TP
 .B EBADF
 .I option
 is
@@ -1436,6 +1539,46 @@ and
 .IR arg3
 does not specify a valid capability.
 .TP
+.B EINVAL
+.I option
+is
+.B PR_SET_TASK_ISOLATION
+and task has more than one CPU in its affinity mask.
+.TP
+.B EINVAL
+.I option
+is
+.B PR_SET_TASK_ISOLATION
+and CPU is not a CPU on which task isolation is enabled (CPU is not part of task
+isolation map set via
+.B task_isolation
+and
+.B task_isolation_all
+kernel parameters).
+.TP
+.B EINVAL
+.I option
+is
+.B PR_SET_TASK_ISOLATION
+and
+.IR arg3 ,
+.IR arg4 ,
+or
+.IR arg5
+is nonzero.
+.TP
+.B EINVAL
+.I option
+is
+.B PR_GET_TASK_ISOLATION
+and
+.IR arg2 ,
+.IR arg3 ,
+.IR arg4 ,
+or
+.IR arg5
+is nonzero.
+.TP
 .B ENXIO
 .I option
 was
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
