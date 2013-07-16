From: Andrey Vagin <avagin@openvz.org>
Subject: [PATCH 2/3] ptrace.2: add description for PTRACE_PEEKSIGINFO
Date: Tue, 16 Jul 2013 12:19:32 +0400
Message-ID: <1373962773-2041-3-git-send-email-avagin@openvz.org>
References: <1373962773-2041-1-git-send-email-avagin@openvz.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373962773-2041-1-git-send-email-avagin@openvz.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, criu@openvz.org, Andrey Vagin <avagin@openvz.org>
List-Id: linux-man@vger.kernel.org

Retrieve signals without removing them from a queue.

Signed-off-by: Andrey Vagin <avagin@openvz.org>
---
 man2/ptrace.2 | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 5fcac2b..e74535e 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -317,6 +317,45 @@ itself.
 .RI ( addr
 is ignored.)
 .TP
+.BR PTRACE_PEEKSIGINFO " (since Linux 3.10)"
+.\" commit 84c751bd4aebbaae995fe32279d3dba48327bad4
+Retrieve
+.I siginfo_t
+structures without removing signals from a queue.
+.I addr
+points to a
+.I ptrace_peeksiginfo_args
+structure.
+.I siginfo_t
+structures are copied into the buffer starting at
+.I data.
+The return value contains a number of copied signals (zero indicates
+that a signal with this sequence number doesn't exist).
+A result
+.I siginfo
+contains a kernel part of
+.IR si_code
+(
+.BR __SI_CHLD,
+.BR __SI_FAULT,
+etc), which is not shown in other places.
+.PP
+.in +10n
+.nf
+struct ptrace_peeksiginfo_args {
+	u64 off;        /* from which siginfo to start */
+	u32 flags;
+	s32 nr;         /* how may siginfos to take */
+};
+.fi
+
+Currently here is only one flag
+.BR PTRACE_PEEKSIGINFO_SHARED
+for dumping signals from process-wide queue.
+If this flag is not set, signals are read from a per-thread queue.
+.in
+.PP
+.TP
 .BR PTRACE_SETOPTIONS " (since Linux 2.4.6; see BUGS for caveats)"
 Set ptrace options from
 .IR data .
-- 
1.8.3.1
