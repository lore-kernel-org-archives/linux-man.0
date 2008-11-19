From: Michael Kerrisk <mtk.manpages@googlemail.com>
Subject: CLONE_NEWIPC documentation
Date: Wed, 19 Nov 2008 14:12:28 -0500
Message-ID: <4924651C.4080909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755108AbYKSTMv@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kirill Korotaev <dev@openvz.org>, Pavel Emelianov <xemul@openvz.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Cedric Le Goater <clg@fr.ibm.com>, lkml <linux-kernel@vger.kernel.org>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Kirill, Pavel,

Below is a patch to document the CLONE_NEWIPC flag that was
added in 2.6.19.

Could you please review and let me know of improvements
or inaccuracies?

Cheers,

Michael

--- a/man2/clone.2
+++ b/man2/clone.2
@@ -225,6 +224,36 @@ Calls to
 .BR umask (2)
 performed later by one of the processes do not affect the other process.
 .TP
+.BR CLONE_NEWIPC " (since Linux 2.4.19)"
+If
+.B CLONE_NEWIPC
+is set, then create the process in a new IPC namespace.
+If this flag is not set, then (as with
+.BR fork (2)),
+the process is created in the same IPC namespace as
+the calling process.
+This flag is intended for the implementation of control groups.
+
+An IPC namespace consistes of the set of identifiers for
+System V IPC objects.
+(These objects are created using
+.BR msgctl (2),
+.BR semctl (2),
+and
+.BR shmctl (2)).
+Objects created in an IPC namespace are visible to other processes
+that are members of that namespace,
+but are not visible to processes in other IPC namespaces.
+
+Use of this flag requires: a kernel configured with the
+.B CONFIG_SYSVIPC
+and
+.B CONFIG_IPC_NS
+configuration options and that the process be privileged
+.RB ( CAP_SYS_ADMIN ).
+This flag can't be specified in conjunction with
+.BR CLONE_SYSVSEM .
+.TP
 .BR CLONE_NEWNS " (since Linux 2.4.19)"
 Start the child in a new namespace.

@@ -729,6 +758,14 @@ were specified in
 .TP
 .B EINVAL
 Both
+.B CLONE_NEWIPC
+and
+.B CLONE_SYSVSEM
+were specified in
+.IR flags .
+.TP
+.B EINVAL
+Both
 .BR CLONE_NEWPID
 and
 .BR CLONE_THREAD
@@ -742,6 +779,16 @@ when a zero value is specified for
 .IR child_stack .
 .TP
 .B EINVAL
+.BR CLONE_NEWIPC
+was specified in
+.IR flags ,
+but the kernel was not configured with the
+.B CONFIG_SYSVIPC
+and
+.BR CONFIG_IPC_NS
+options.
+.TP
+.B EINVAL
 .BR CLONE_NEWPID
 was specified in
 .IR flags ,
