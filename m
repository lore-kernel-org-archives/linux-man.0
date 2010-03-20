From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] [1/4] Document hwpoison signal extensions
Date: Sat, 20 Mar 2010 16:29:28 +0100 (CET)
Message-ID: <20100320152928.0FA17B19E8@basil.firstfloor.org>
References: <20100320429.026463287@firstfloor.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100320429.026463287-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Also clarify siginfo_t behaviour in signal.7 a bit with a new table.

Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Index: man-pages-3.24/man7/signal.7
===================================================================
--- man-pages-3.24.orig/man7/signal.7
+++ man-pages-3.24/man7/signal.7
@@ -40,6 +40,7 @@
 .\"     Added section on system call restarting (SA_RESTART)
 .\"     Added section on stop/cont signals interrupting syscalls.
 .\" 2008-10-05, mtk: various additions
+.\" 2009-10-03, Andi Kleen: add reference to implicit siginfo_t
 .\"
 .TH SIGNAL 7  2010-02-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -335,6 +336,29 @@ is synonymous with
 .\" parisc is the only exception: SIGSYS is 12, SIGUNUSED is 31
 .B SIGSYS
 on most architectures.
+
+Some of these signals, carry special additional information in a siginfo_t argument,
+clarifying why they were sent.
+.TS
+l l
+_____
+lB l.
+Signal                    siginfo_t fields
+SIGKILL                   si_pid, si_uid
+SIGCHLD                   si_pid, si_uid, si_status, si_utime, si_stime
+SIGILL                    si_code, si_addr, si_trapno
+SIGFPE                    si_code, si_addr, si_trapno
+SIGSEGV                   si_code, si_addr, si_trapno
+SIGBUS                    si_code, si_addr, si_trapno, si_addr_lsb
+SIGTRAP                   si_code, si_addr, si_trapno
+SIGPOLL                   si_band, si_fd
+realtime signals > 32     si_pid, si_uid, si_value
+posix timer               si_tid, si_overrun, si_sigval
+.TE
+
+Please see the
+.I sigaction(2)
+manpage for more details on the various fields
 .SS "Real-time Signals"
 Linux supports real-time signals as originally defined in the POSIX.1b
 real-time extensions (and now included in POSIX.1-2001).
Index: man-pages-3.24/man2/sigaction.2
===================================================================
--- man-pages-3.24.orig/man2/sigaction.2
+++ man-pages-3.24/man2/sigaction.2
@@ -39,6 +39,7 @@
 .\" 2004-12-09, mtk, added SI_TKILL + other minor changes
 .\" 2005-09-15, mtk, split sigpending(), sigprocmask(), sigsuspend()
 .\"	out of this page into separate pages.
+.\" 2009-10-03 Andi Kleen, add hwpoison signal extensions
 .\"
 .TH SIGACTION 2 2009-07-25 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -271,6 +272,7 @@ siginfo_t {
     void    *si_addr;     /* Memory location which caused fault */
     int      si_band;     /* Band event */
     int      si_fd;       /* File descriptor */
+    short    si_addr_lsb; /* Least Signifcant bit of address */
 }
 .fi
 .in
@@ -343,7 +345,20 @@ and
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
@@ -483,6 +498,12 @@ nonexistent physical address
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
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
