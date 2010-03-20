From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] [4/4] Document the hwpoison prctls in 2.6.32
Date: Sat, 20 Mar 2010 16:29:31 +0100 (CET)
Message-ID: <20100320152931.17E2DB19E8@basil.firstfloor.org>
References: <20100320429.026463287@firstfloor.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100320429.026463287-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Index: man-pages-3.24/man2/prctl.2
===================================================================
--- man-pages-3.24.orig/man2/prctl.2
+++ man-pages-3.24/man2/prctl.2
@@ -37,6 +37,7 @@
 .\" 2008-06-13 Erik Bosman, <ejbosman-FV+mU1CFjts@public.gmane.org>
 .\"     Document PR_GET_TSC and PR_SET_TSC.
 .\" 2008-06-15 mtk, Document PR_SET_SECCOMP, PR_GET_SECCOMP
+.\" 2009-10-03 Andi Kleen, document PR_MCE_KILL_*
 .\"
 .TH PRCTL 2 2008-07-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -318,6 +319,45 @@ on unaligned user access.
 for information on versions and architectures)
 Return unaligned access control bits, in the location pointed to by
 .IR "(int\ *) arg2" .
+.TP
+.BR PR_MCE_KILL
+(Since Linux 2.6.32)
+Set the machine check memory corruption kill policy for the current thread.
+When
+.I arg2
+is
+.B PR_MCE_KILL_CLEAR
+clear thread memory corruption kill policy and use system-wide default.
+When
+.I arg2
+is
+.B PR_MCE_KILL_SET
+use a thread-specific memory corruption kill policy.   In this case
+.I arg3
+defines whether the policy is
+.I early kill (
+.B PR_MCE_KILL_EARLY
+)
+or
+.I late kill (
+.B PR_MCE_KILL_LATE
+) or
+.B PR_MCE_KILL_DEFAULT.
+Early kill means that the task receives a
+.I SIGBUS
+signal as soon as hardware memory corruption is detected inside its address space.
+In late kill mode the process is only killed when it accesses a corrupted page.
+See
+.I sigaction(2)
+for more information on the
+.I SIGBUS.
+The policy is inherited by children.
+Unused arguments upto 6 must be zero for future compatibility.
+.TP
+.BR PR_MCE_KILL_GET
+returns the current per process machine check kill policy as defined above.
+All following arguments upto 6 must be 0.
+
 .SH "RETURN VALUE"
 On success,
 .BR PR_GET_DUMPABLE ,
@@ -400,6 +440,12 @@ capability.
 The
 .BR prctl ()
 system call was introduced in Linux 2.1.57.
+
+The
+.I PR_MCE_KILL
+and
+.I PR_MCE_KILL_GET
+suboptions were introduced with Linux 2.6.32.
 .\" The library interface was added in glibc 2.0.6
 .SH "CONFORMING TO"
 This call is Linux-specific.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
