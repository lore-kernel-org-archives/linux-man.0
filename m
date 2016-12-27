From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] pid_namespaces.7: CLONE_SIGHAND|CLONE_VM|CLONE_NEWPID is no
 longer disallowed
Date: Tue, 27 Dec 2016 14:34:08 -0500
Message-ID: <20161227193408.GA560@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/pid_namespaces.7 | 74 +++++++++++++++------------------------------------
 1 file changed, 22 insertions(+), 52 deletions(-)

diff --git a/man7/pid_namespaces.7 b/man7/pid_namespaces.7
index 984bea9..0327e8e 100644
--- a/man7/pid_namespaces.7
+++ b/man7/pid_namespaces.7
@@ -233,71 +233,41 @@ between processes mirrors the parental relationship between PID namespaces:
 the parent of a process is either in the same namespace
 or resides in the immediate parent PID namespace.
 .SS Compatibility of CLONE_NEWPID with other CLONE_* flags
+In current versions of Linux
 .BR CLONE_NEWPID
-can't be combined with some other
-.BR CLONE_*
-flags:
-.IP * 3
-.B CLONE_THREAD
-requires being in the same PID namespace in order that
+can't be combined with
+.BR CLONE_THREAD .
+Threads are required to be in the same PID namespace such that
 the threads in a process can send signals to each other.
 Similarly, it must be possible to see all of the threads
 of a processes in the
 .BR proc (5)
-filesystem.
-.IP *
-.BR CLONE_SIGHAND
-requires being in the same PID namespace;
-otherwise the process ID of the process sending a signal
+filesystem. Additionally, if two threads were in different PID
+namespaces, the process ID of the process sending a signal
 could not be meaningfully encoded when a signal is sent
 (see the description of the
 .I siginfo_t
 type in
 .BR sigaction (2)).
-A signal queue shared by processes in multiple PID namespaces
-will defeat that.
-.IP *
-.BR CLONE_VM
-requires all of the threads to be in the same PID namespace,
-because, from the point of view of a core dump,
-if two processes share the same address space then they are threads and will
-be core dumped together.
-When a core dump is written, the PID of each
-thread is written into the core dump.
-Writing the process IDs could not meaningfully succeed
-if some of the process IDs were in a parent PID namespace.
-.PP
-To summarize: there is a technical requirement for each of
-.BR CLONE_THREAD ,
-.BR CLONE_SIGHAND ,
-and
-.BR CLONE_VM
-to share a PID namespace.
-(Note furthermore that in
-.BR clone (2)
-requires
-.BR CLONE_VM
-to be specified if
-.BR CLONE_THREAD
-or
-.BR CLONE_SIGHAND
-is specified.)
-Thus, call sequences such as the following will fail (with the error
-.BR EINVAL ):
-
-.nf
-    unshare(CLONE_NEWPID);
-    clone(..., CLONE_VM, ...);    /* Fails */
+Since this is computed when signals are enqueued,
+a signal queue shared by processes in multiple PID namespaces
+would defeat that.
 
-    setns(fd, CLONE_NEWPID);
-    clone(..., CLONE_VM, ...);    /* Fails */
+.\" Note these restrictions were all introduced in
+.\" 8382fcac1b813ad0a4e68a838fc7ae93fa39eda0
+.\" when CLONE_NEWPID|CLONE_VM was disallowed
 
-    clone(..., CLONE_VM, ...);
-    setns(fd, CLONE_NEWPID);      /* Fails */
+In prior versions of Linux,
+.BR CLONE_NEWPID
+was additionally disallowed in combination with
+.BR CLONE_SIGHAND
+.\" (restriction lifted in faf00da544045fdc1454f3b9e6d7f65c841de302)
+(Linux 3.5-4.3)
+as well as
+.\" (restriction lifted in e79f525e99b04390ca4d2366309545a836c03bf1)
+.BR CLONE_VM
+(Linux 3.5-3.12).
 
-    clone(..., CLONE_VM, ...);
-    unshare(CLONE_NEWPID);        /* Fails */
-.fi
 .\"
 .\" ============================================================
 .\"
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
