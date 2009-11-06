From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] [3/3] Better documentation for the siginfo_t passed to signal handlers
Date: Fri,  6 Nov 2009 18:52:13 +0100 (CET)
Message-ID: <20091106175213.45FCCB1627@basil.firstfloor.org>
References: <20091106652.255147301@firstfloor.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091106652.255147301-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


diff -u man7/signal.7-o man7/signal.7
--- man7/signal.7-o	2009-10-03 21:36:45.000000000 +0200
+++ man7/signal.7	2009-10-03 23:28:52.000000000 +0200
@@ -40,6 +40,7 @@
 .\"     Added section on system call restarting (SA_RESTART)
 .\"     Added section on stop/cont signals interrupting syscalls.
 .\" 2008-10-05, mtk: various additions
+.\" 2009-10-03, Andi Kleen: add reference to implicit siginfo_t
 .\"
 .TH SIGNAL 7  2008-10-15 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -328,6 +329,30 @@
 .B SIGIO
 (which is not specified in POSIX.1-2001) is ignored by default
 on several other Unix systems.
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
+
 .SS "Real-time Signals"
 Linux supports real-time signals as originally defined in the POSIX.1b
 real-time extensions (and now included in POSIX.1-2001).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
