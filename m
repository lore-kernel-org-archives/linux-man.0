From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] posix_fallocate.3, prctl.2, sigaction.2, sysconf.3, tzset.3:
 minor rewording
Date: Thu, 01 Sep 2011 00:15:09 +0900
Message-ID: <4E5E4FFD.7020806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: Clarify description by rewording. Fix some typos.


diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
--- a/man3/posix_fallocate.3
+++ b/man3/posix_fallocate.3
@@ -94,7 +94,7 @@ referred to by
.TP
.B ESPIPE
.I fd
-refers to a pipe of file descriptor.
+refers to a pipe.
.SH VERSIONS
.BR posix_fallocate ()
is available since glibc 2.1.94.
diff --git a/man2/prctl.2 b/man2/prctl.2
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -157,7 +157,7 @@ in the location pointed to by
.TP
.BR PR_SET_FPEXC " (since Linux 2.4.21, 2.5.32, only on PowerPC)"
Set floating-point exception mode to \fIarg2\fP.
-Pass \fBPR_FP_EXC_SW_ENABLE\fP to use FPEXC for FP exception enables,
+Pass \fBPR_FP_EXC_SW_ENABLE\fP to use FPEXC for FP exception enabled,
\fBPR_FP_EXC_DIV\fP for floating-point divide by zero,
\fBPR_FP_EXC_OVF\fP for floating-point overflow,
\fBPR_FP_EXC_UND\fP for floating-point underflow,
diff --git a/man2/sigaction.2 b/man2/sigaction.2
--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -297,7 +297,7 @@ In addition, signals sent with
.BR sigqueue (2)
fill in
.IR si_int " and " si_ptr
-with the values specified by the sender the signal;
+with the values specified by the sender of the signal;
see
.BR sigqueue (2)
for more details.
diff --git a/man3/sysconf.3 b/man3/sysconf.3
--- a/man3/sysconf.3
+++ b/man3/sysconf.3
@@ -254,7 +254,7 @@ parentheses by
.BR expr (1).
.TP
.BR LINE_MAX " - " _SC_LINE_MAX
-The maximum length of a utility's input line length, either from
+The maximum length of a utility's input line, either from
standard input or from a file.
This includes length for a trailing
newline.
diff --git a/man3/tzset.3 b/man3/tzset.3
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -156,7 +156,7 @@ runs from the first Sunday in October to the third
Sunday in March,
and the changeovers happen at the default time of 02:00:00:
.nf

- TZ="NZST-12.00:00NZDT-13:00:00,M10.1.0,M3.3.0"
+ TZ="NZST-12:00:00NZDT-13:00:00,M10.1.0,M3.3.0"
.fi
.PP
The third format specifies that the timezone information should be read

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
