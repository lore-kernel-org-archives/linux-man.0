From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] prctl: update seccomp sections
Date: Tue, 5 Jun 2012 11:12:09 -0700
Message-ID: <20120605181209.GP29466@outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-man@vger.kernel.org

This adds a short summary of the arguments used for "mode 2" (BPF)
seccomp.

Signed-off-by: Kees Cook <kees-oSa+0FWJbaXR7s880joybQ@public.gmane.org>
---
 man2/prctl.2 |   37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 215b945..4005054 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -235,11 +235,17 @@ in the location pointed to by
 .\" See http://thread.gmane.org/gmane.linux.kernel/542632
 .\" [PATCH 0 of 2] seccomp updates
 .\" andrea-Vyt77T80VFVWk0Htik3J/w@public.gmane.org
-Set the secure computing mode for the calling thread.
-In the current implementation,
+Set the secure computing mode for the calling thread, to limit
+the available syscalls.
+The seccomp mode is selected via
+.IR arg2 .
+(The seccomp constants are defined in
+.IR <linux/seccomp.h> .)
+
+With
 .IR arg2
-must be 1.
-After the secure computing mode has been set to 1,
+set to
+.BR SECCOMP_MODE_STRICT
 the only system calls that the thread is permitted to make are
 .BR read (2),
 .BR write (2),
@@ -249,22 +255,35 @@ and
 Other system calls result in the delivery of a
 .BR SIGKILL
 signal.
-Secure computing mode is useful for number-crunching applications
+Strict secure computing mode is useful for number-crunching applications
 that may need to execute untrusted byte code,
 perhaps obtained by reading from a pipe or socket.
 This operation is only available
 if the kernel is configured with CONFIG_SECCOMP enabled.
+
+With
+.IR arg2
+set to
+.BR SECCOMP_MODE_FILTER " (since Linux 3.5)"
+the system calls allowed are
+defined by a pointer passed in
+.IR arg3
+to a Berkeley Packet Filter, which can be designed to filter
+arbitrary syscalls and syscall arguments.
+This mode is only available if the kernel is configured with
+CONFIG_SECCOMP_FILTER enabled.
+
 .TP
 .BR PR_GET_SECCOMP " (since Linux 2.6.23)"
 Return the secure computing mode of the calling thread.
-Not very useful for the current implementation (mode equals 1),
-but may be useful for other possible future modes:
-if the caller is not in secure computing mode, this operation returns 0;
-if the caller is in secure computing mode, then the
+If the caller is not in secure computing mode, this operation returns 0;
+if the caller is in strict secure computing mode, then the
 .BR prctl ()
 call will cause a
 .B SIGKILL
 signal to be sent to the process.
+If the caller is in filter mode, and this syscall is allowed by the
+seccomp filters, it returns 2.
 This operation is only available
 if the kernel is configured with CONFIG_SECCOMP enabled.
 .TP
-- 
1.7.9.5

-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
