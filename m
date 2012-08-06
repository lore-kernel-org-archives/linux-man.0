From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] prctl.2: document new seccomp options
Date: Sun,  5 Aug 2012 23:18:57 -0700
Message-ID: <1344233940-2680-1-git-send-email-shawnlandden@gmail.com>
References: <1344113204-4294-3-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344113204-4294-3-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

the seccomp stuff requires
 #include <linux/seccomp.h>
But I am not sure where/how to specify that.
---
 man2/prctl.2 |  135 +++++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 25 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index eb53aa8..5c829e7 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -41,11 +41,14 @@
 .\" 2012-04 Cyrill Gorcunov, Document PR_SET_MM
 .\" 2012-04-25 Michael Kerrisk, Document PR_TASK_PERF_EVENTS_DISABLE and
 .\"				PR_TASK_PERF_EVENTS_ENABLE
+.\" 2012-08-03 Shawn Landden, Document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS,
+.\"       SECCOMP_MODE_STRICT, SECCOMP_MODE_FILTER
+.\"       (thx Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> 259e5e6c)
 .\"
 .\" FIXME: Document PR_SET_TIMERSLACK and PR_GET_TIMERSLACK (new in 2.6.28)
 .\"		commit 6976675d94042fbd446231d1bd8b7de71a980ada
 .\"
-.TH PRCTL 2 2012-04-23 "Linux" "Linux Programmer's Manual"
+.TH PRCTL 2 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 prctl \- operations on a process
 .SH SYNOPSIS
@@ -231,16 +234,53 @@ Return the current value of the parent process death signal,
 in the location pointed to by
 .IR "(int\ *) arg2" .
 .TP
+.BR PR_SET_NO_NEW_PRIVS " (since Linux 3.4)"
+Takes a boolean argument as
+.IR arg2 .
+After being set, the process and all its children can never gain new privleges.
+Operations that grant new privileges (i.e. execve)
+will either fail or not grant them.  This affects suid/sgid,
+file capabilities, and LSMs.
+
+Operations that merely manipulate or drop existing privileges (
+.BR setresuid (2) ,
+.BR capset (2) ,
+etc.) will still work.  Drop those privileges if you want them gone.
+
+Changing LSM security domain is considered a new privilege.  So, for example,
+asking selinux for a specific new context (e.g. with
+.BR runcon (1))
+will result
+in execve returning
+.BR EPERM .
+See
+.IR Documentation/prctl/no_new_privs.txt
+for more details.
+.TP
+.BR PR_GET_NO_NEW_PRIVS " (since Linux 3.4)"
+Return the no_new_privs status of the calling thread. Returns 1 if set and 0
+if not set.
+.TP
 .BR PR_SET_SECCOMP " (since Linux 2.6.23)"
 .\" See http://thread.gmane.org/gmane.linux.kernel/542632
 .\" [PATCH 0 of 2] seccomp updates
 .\" andrea-Vyt77T80VFVWk0Htik3J/w@public.gmane.org
-Set the secure computing mode for the calling thread.
-In the current implementation,
-.IR arg2
-must be 1.
-After the secure computing mode has been set to 1,
-the only system calls that the thread is permitted to make are
+Set the secure computing mode for the calling thread. Secure computing mode is
+useful for number-crunching applications
+that may need to execute untrusted byte code,
+perhaps obtained by reading from a pipe or socket.
+These operations are only available
+if the kernel is configured with
+.BR CONFIG_SECCOMP
+or
+.BR CONFIG_SECCOMP_FILTER
+enabled, respectively. The value in
+.I arg2
+is one of the options below.
+.RS
+.TP
+.BR SECCOMP_MODE_STRICT
+The only system calls that the thread is permitted to make are
 .BR read (2),
 .BR write (2),
 .BR _exit (2),
@@ -249,24 +289,39 @@ and
 Other system calls result in the delivery of a
 .BR SIGKILL
 signal.
-Secure computing mode is useful for number-crunching applications
-that may need to execute untrusted byte code,
-perhaps obtained by reading from a pipe or socket.
-This operation is only available
-if the kernel is configured with CONFIG_SECCOMP enabled.
+.TP
+.\" See https://lwn.net/Articles/475043/
+.BR SECCOMP_MODE_FILTER " (since Linux 3.5 on x86)"
+Filter syscalls based on a user supplied program in the format of
+.BR "struct seccomp_data"
+in
+.IR arg3 .
+In order to use
+.BR SECCOMP_MODE_FILTER
+without the
+.BR CAP_SYS_ADMIN
+capability, you must
+first set
+.BR PR_SET_NO_NEW_PRIVS
+to 1. If
+.BR prctl (2)
+is allowed by the attached filter, additional filters may be attached.
+.RE
 .TP
 .BR PR_GET_SECCOMP " (since Linux 2.6.23)"
-Return the secure computing mode of the calling thread.
-Not very useful for the current implementation (mode equals 1),
-but may be useful for other possible future modes:
-if the caller is not in secure computing mode, this operation returns 0;
-if the caller is in secure computing mode, then the
+Return the secure computing mode of the calling thread. Returns
+.BR SECCOMP_MODE_DISABLED ,
+.BR SECCOMP_MODE_STRICT ,
+or
+.BR SECCOMP_MODE_FILTER .
+If the caller is in secure computing mode, then the
 .BR prctl ()
 call will cause a
 .B SIGKILL
 signal to be sent to the process.
-This operation is only available
-if the kernel is configured with CONFIG_SECCOMP enabled.
+This operation is only available if the kernel is configured with
+.BR CONFIG_SECCOMP
+enabled.
 .TP
 .BR PR_SET_SECUREBITS " (since Linux 2.6.26)"
 Set the "securebits" flags of the calling thread to the value supplied in
@@ -551,6 +606,7 @@ On success,
 .BR PR_GET_TIMING ,
 .BR PR_GET_SECUREBITS ,
 .BR PR_MCE_KILL_GET ,
+.BR PR_GET_NO_NEW_PRIVS ,
 and (if it returns)
 .BR PR_GET_SECCOMP
 return the nonnegative values described above.
@@ -562,6 +618,19 @@ On error, \-1 is returned, and
 is set appropriately.
 .SH ERRORS
 .TP
+.B EACCES
+.I option
+is
+.BR PR_SET_SECCOMP ,
+.I arg2
+is
+.BR SECCOMP_MODE_FILTER ,
+the caller does not have the
+.BR CAP_SYS_ADMIN
+capability, and
+.BR PR_SET_NO_NEW_PRIVS
+has not been set as documented above.
+.TP
 .B EFAULT
 .I arg2
 is an invalid address.
@@ -579,6 +648,10 @@ or
 .BR PR_MCE_KILL_GET
 or
 .BR PR_SET_MM ,
+or
+.BR PR_SET_NO_NEW_PRIVS ,
+or
+.BR PR_GET_NO_NEW_PRIVS ,
 and unused
 .BR prctl ()
 arguments were not specified as zero.
@@ -593,9 +666,15 @@ is not valid value for this
 is
 .BR PR_SET_SECCOMP
 or
-.BR PR_SET_SECCOMP ,
+.BR PR_GET_SECCOMP ,
 and the kernel was not configured with
 .BR CONFIG_SECCOMP .
+(or
+.BR CONFIG_SECCOMP_FILTER
+if
+.I arg2
+is
+.BR SECCOMP_MODE_FILTER )
 .TP
 .B EINVAL
 .I option
@@ -603,11 +682,6 @@ is
 .BR PR_SET_MM ,
 and one of the following is true
 .RS
-.IP * 3
-.I arg4
-or
-.I arg5
-is nonzero;
 .IP *
 .I arg3
 is greater than
@@ -637,6 +711,17 @@ or specifies a value that would cause the
 resource limit to be exceeded.
 .RE
 .TP
+.B EINVAL
+.I option
+is
+.BR PR_SET_SECCOMP ,
+.I arg2
+is
+.BR SECCOMP_MODE_FILTER ,
+and
+.I arg3
+is not a valid filter program.
+.TP
 .B EPERM
 .I option
 is
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
