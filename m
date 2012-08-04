From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] prctl: document new seccomp options
Date: Fri,  3 Aug 2012 20:28:46 -0700
Message-ID: <1344050926-2810-1-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 |   71 +++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index eb53aa8..383e2a8 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -45,7 +45,7 @@
 .\" FIXME: Document PR_SET_TIMERSLACK and PR_GET_TIMERSLACK (new in 2.6.28)
 .\"		commit 6976675d94042fbd446231d1bd8b7de71a980ada
 .\"
-.TH PRCTL 2 2012-04-23 "Linux" "Linux Programmer's Manual"
+.TH PRCTL 2 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 prctl \- operations on a process
 .SH SYNOPSIS
@@ -231,16 +231,44 @@ Return the current value of the parent process death signal,
 in the location pointed to by
 .IR "(int\ *) arg2" .
 .TP
-.BR PR_SET_SECCOMP " (since Linux 2.6.23)"
+.BR PR_SET_NO_NEW_PRIVS " (since Linux 3.4)"
+After being set, operations that grant new privileges (i.e. execve)
+will either fail or not grant them.  This affects suid/sgid,
+file capabilities, and LSMs.
+
+Operations that merely manipulate or drop existing privileges (setresuid,
+capset, etc.) will still work.  Drop those privileges if you want them gone.
+
+Changing LSM security domain is considered a new privilege.  So, for example,
+asking selinux for a specific new context (e.g. with runcon) will result
+in execve returning -EPERM. See
+.IR Documentation/prctl/no_new_privs.txt
+for more details.
+.TP
+.BR PR_GET_NO_NEW_PRIVS " (since Linux 3.4)"
+Return the no_new_privs status of the calling thread. Returns 1 if set and 0
+if not set.
+.TP
+.BR PR_SET_SECCOMP
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
+.BR SECCOMP_FILTER
+enabled, respectively. The value in
+.I arg2
+is one of the options below.
+.RS
+.TP
+.BR SECCOMP_MODE_STRICT " (since Linux 2.6.23)"
+The only system calls that the thread is permitted to make are
 .BR read (2),
 .BR write (2),
 .BR _exit (2),
@@ -249,11 +277,20 @@ and
 Other system calls result in the delivery of a
 .BR SIGKILL
 signal.
-Secure computing mode is useful for number-crunching applications
-that may need to execute untrusted byte code,
-perhaps obtained by reading from a pipe or socket.
-This operation is only available
-if the kernel is configured with CONFIG_SECCOMP enabled.
+.TP
+.BR SECCOMP_MODE_FILTER " (since Linux 3.5 on x86)"
+Filter syscalls based on a user supplied program of type
+.BR "struct seccomp_data"
+in
+.IR arg3 .
+In order to use
+.BR SECCOMP_MODE_FILTER
+as a non-root user, you must
+first set
+.BR PR_SET_NO_NEW_PRIVS
+to 1.
+
+.RE
 .TP
 .BR PR_GET_SECCOMP " (since Linux 2.6.23)"
 Return the secure computing mode of the calling thread.
@@ -265,8 +302,6 @@ if the caller is in secure computing mode, then the
 call will cause a
 .B SIGKILL
 signal to be sent to the process.
-This operation is only available
-if the kernel is configured with CONFIG_SECCOMP enabled.
 .TP
 .BR PR_SET_SECUREBITS " (since Linux 2.6.26)"
 Set the "securebits" flags of the calling thread to the value supplied in
@@ -579,6 +614,10 @@ or
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
@@ -593,7 +632,7 @@ is not valid value for this
 is
 .BR PR_SET_SECCOMP
 or
-.BR PR_SET_SECCOMP ,
+.BR PR_GET_SECCOMP ,
 and the kernel was not configured with
 .BR CONFIG_SECCOMP .
 .TP
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
