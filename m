From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] [1/3] Document the prctl/signal hwpoison extensions for 2.6.32
Date: Fri,  6 Nov 2009 18:52:11 +0100 (CET)
Message-ID: <20091106652.255147301@firstfloor.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


diff -u man2/sigaction.2-o man2/sigaction.2
--- man2/sigaction.2-o	2009-10-03 21:38:22.000000000 +0200
+++ man2/sigaction.2	2009-10-03 21:49:25.000000000 +0200
@@ -39,6 +39,7 @@
 .\" 2004-12-09, mtk, added SI_TKILL + other minor changes
 .\" 2005-09-15, mtk, split sigpending(), sigprocmask(), sigsuspend()
 .\"	out of this page into separate pages.
+.\" 2009-10-03 Andi Kleen, add hwpoison signal extensions
 .\"
 .TH SIGACTION 2 2009-07-25 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -271,6 +272,7 @@
     void    *si_addr;     /* Memory location which caused fault */
     int      si_band;     /* Band event */
     int      si_fd;       /* File descriptor */
+    short    si_addr_lsb; /* Least Signifcant bit of address */
 }
 .fi
 .in
@@ -343,7 +345,20 @@
 .B SIGBUS
 fill in
 .I si_addr
-with the address of the fault.
+with the address of the fault. Some suberrors of 
+.I SIGBUS,
+in particular
+.B BUS_MCEERR_AO
+and 
+.B BUS_MCEERR_AR
+also fill in 
+.B si_addr_lsb
+This field defines the least significant bit of the reported address and therefore the extent of 
+the corruption. For example if a full page was corrupted it contains log2(get_page_size()).
+.I BUS_MCERR_*
+and
+.I si_addr_lsb
+are only available with Linux 2.6.32 and later and are a Linux specific extension.
 .B SIGPOLL
 fills in
 .IR si_band " and " si_fd .
@@ -483,6 +498,12 @@
 .TP
 .B BUS_OBJERR
 object-specific hardware error
+.TP
+.B BUS_MCEERR_AR
+hardware memory error consumed after a machine check: action required. Program cannot continue current execution stream. For this error the si_addr_lsb field is valid. Since Linux 2.6.32 and a Linux specific extension.
+.TP
+.B BUS_MCEERR_AO
+hardware memory error detected in process but not consumed: action optional. Program is allowed to continue current execution stream, but the page containing the reported address is corrupted. The extent of the corruption is defined by the si_addr_lsb field. Since Linux 2.6.32 and a Linux specific extension.
 .RE
 .PP
 The following values can be placed in
diff -u man2/prctl.2-o man2/prctl.2
--- man2/prctl.2-o	2009-10-03 23:29:33.000000000 +0200
+++ man2/prctl.2	2009-11-06 18:35:35.000000000 +0100
@@ -37,6 +37,7 @@
 .\" 2008-06-13 Erik Bosman, <ejbosman-FV+mU1CFjts@public.gmane.org>
 .\"     Document PR_GET_TSC and PR_SET_TSC.
 .\" 2008-06-15 mtk, Document PR_SET_SECCOMP, PR_GET_SECCOMP
+.\" 2009-10-03 Andi Kleen, document PR_MCE_KILL_*
 .\"
 .TH PRCTL 2 2008-07-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -318,6 +319,45 @@
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
@@ -400,6 +440,12 @@
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
--- man2/madvise.2-o	2009-11-06 18:45:57.000000000 +0100
+++ man2/madvise.2	2009-11-06 18:49:54.000000000 +0100
@@ -141,6 +141,15 @@
 .BR MADV_DONTFORK ,
 restoring the default behavior, whereby a mapping is inherited across
 .BR fork (2).
+.TP
+.BR MADV_HWPOISON " (Since Linux 2.6.32)
+Poison a page and handle it like a hardware memory corruption.
+Only allowed for processes with
+.I CAP_SYS_ADMIN
+privileges. This may result in the calling process receiving a 
+.I SIGBUS
+and the page being unmapped.
+Intended for testing.
 .SH "RETURN VALUE"
 On success
 .BR madvise ()
@@ -148,6 +157,7 @@
 On error, it returns \-1 and
 .I errno
 is set appropriately.
+.\" XXX someone document the KSM extensions
 .SH ERRORS
 .TP
 .B EAGAIN
@@ -198,8 +208,9 @@
 
 .BR MADV_REMOVE ,
 .BR MADV_DONTFORK ,
+.BR MADV_DOFORK ,
 and
-.B MADV_DOFORK
+.BR MADV_HWPOISON 
 are Linux-specific.
 .SH NOTES
 .SS "Linux Notes"
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
