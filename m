From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Fri, 11 Jun 2010 10:06:50 +0200
Message-ID: <AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100320152928.0FA17B19E8-Oisruko67ZwogZNkvFMw5WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote=
:
>
> Also clarify siginfo_t behaviour in signal.7 a bit with a new table.
>
> Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> Index: man-pages-3.24/man7/signal.7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- man-pages-3.24.orig/man7/signal.7
> +++ man-pages-3.24/man7/signal.7
> @@ -40,6 +40,7 @@
> =A0.\" =A0 =A0 Added section on system call restarting (SA_RESTART)
> =A0.\" =A0 =A0 Added section on stop/cont signals interrupting syscal=
ls.
> =A0.\" 2008-10-05, mtk: various additions
> +.\" 2009-10-03, Andi Kleen: add reference to implicit siginfo_t
> =A0.\"
> =A0.TH SIGNAL 7 =A02010-02-03 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> @@ -335,6 +336,29 @@ is synonymous with
> =A0.\" parisc is the only exception: SIGSYS is 12, SIGUNUSED is 31
> =A0.B SIGSYS
> =A0on most architectures.
> +
> +Some of these signals, carry special additional information in a sig=
info_t argument,
> +clarifying why they were sent.
> +.TS
> +l l
> +_____
> +lB l.
> +Signal =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0siginfo_t fields
> +SIGKILL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_pid, si_uid
> +SIGCHLD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_pid, si_uid, si_statu=
s, si_utime, si_stime
> +SIGILL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0si_code, si_addr, si_t=
rapno
> +SIGFPE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0si_code, si_addr, si_t=
rapno
> +SIGSEGV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_code, si_addr, si_tra=
pno
> +SIGBUS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0si_code, si_addr, si_t=
rapno, si_addr_lsb
> +SIGTRAP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_code, si_addr, si_tra=
pno
> +SIGPOLL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_band, si_fd
> +realtime signals > 32 =A0 =A0 si_pid, si_uid, si_value
> +posix timer =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_tid, si_overrun, si_sigva=
l
> +.TE
> +
> +Please see the
> +.I sigaction(2)
> +manpage for more details on the various fields

The information in this patch is rather incomplete, and is in any case
covered more completely in sigaction(2), so I haven't applied this
patch. On the other hand, it triggered me to make some improvements to
sigaction(2), as shown below.

Cheers,

Michael

--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -39,7 +39,8 @@
 .\" 2004-12-09, mtk, added SI_TKILL + other minor changes
 .\" 2005-09-15, mtk, split sigpending(), sigprocmask(), sigsuspend()
 .\"    out of this page into separate pages.
-+.\" 2010-06-10 Andi Kleen, add hwpoison signal extensions
+.\" 2010-06-11 Andi Kleen, add hwpoison signal extensions
+.\" 2010-06-11 mtk, improvements to discussion of various siginfo_t fi=
elds.
 .\"
 .TH SIGACTION 2 2010-06-11 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -174,7 +175,7 @@ or resume (i.e., they receive
 This flag is only meaningful when establishing a handler for
 .BR SIGCHLD .
 .TP
-.BR SA_NOCLDWAIT " (Since Linux 2.6)"
+.BR SA_NOCLDWAIT " (since Linux 2.6)"
 .\" To be precise: Linux 2.5.60 -- MTK
 If
 .I signum
@@ -270,9 +271,10 @@ siginfo_t {
     int      si_timerid;  /* Timer ID; POSIX.1b timers */
 .\" In the kernel: si_tid
     void    *si_addr;     /* Memory location which caused fault */
-    int      si_band;     /* Band event */
+    long     si_band;     /* Band event (was \fIint\fP in
+                             glibc 2.3.2 and earlier) */
     int      si_fd;       /* File descriptor */
-    short    si_addr_lsb; /* Least signifcant bit of address
+    short    si_addr_lsb; /* Least significant bit of address
                              (since kernel 2.6.32) */
 }
 .fi
@@ -285,8 +287,10 @@ is generally unused on Linux.)
 The rest of the struct may be a union, so that one should only
 read the fields that are meaningful for the given signal:
 .IP * 2
-POSIX.1b signals and
-.B SIGCHLD
+Signals sent with
+.BR kill (2)
+and
+.BR sigqueue (2)
 fill in
 .IR si_pid " and " si_uid .
 .IP *
@@ -299,15 +303,35 @@ The
 field is an internal ID used by the kernel to identify
 the timer; it is not the same as the timer ID returned by
 .BR timer_create (2).
+The
+.I si_overrun
+field is the timer overrun count;
+this is the same information as is obtained by a call to
+.BR timer_getoverrun (2).
+These fields are nonstandard Linux extensions.
 .IP *
 .B SIGCHLD
 fills in
-.IR si_status ", " si_utime " and " si_stime .
+.IR si_pid ", " si_uid ", " si_status ", " si_utime " and " si_stime ,
+providing information about the child.
+The
+.I si_pid
+field is the process ID of the child;
+.I si_uid
+is the child's real user ID.
+The
+.I si_status
+field contains the exit status of the child (if
+.I si_code
+is
+.BR CLD_EXITED ),
+or the signal number that caused the process to change state.
 The
 .I si_utime
 and
 .I si_stime
-fields do not include the times used by waited-for children (unlike
+contain the user and system CPU time used by the child process;
+these fields do not include the times used by waited-for children (unl=
ike
 .BR getrusage (2)
 and
 .BR time (2)).
@@ -318,7 +342,7 @@ In 2.6 kernels before 2.6.27,
 a bug meant that these fields reported time in units
 of the (configurable) system jiffy (see
 .BR time (7)).
-\" FIXME .
+.\" FIXME .
 .\" When si_utime and si_stime where originally implemented, the
 .\" measurement unit was HZ, which was the same as clock ticks
 .\" (sysconf(_SC_CLK_TCK)).  In 2.6, HZ became configurable, and
@@ -348,7 +372,7 @@ fill in
 .I si_addr
 with the address of the fault.
 Some suberrors of
-.I SIGBUS,
+.BR SIGBUS ,
 in particular
 .B BUS_MCEERR_AO
 and
@@ -365,9 +389,19 @@ contains
 and
 .I si_addr_lsb
 are Linux-specific extensions.
-.B SIGPOLL
+.IP *
+.BR SIGPOLL / SIGIO
 fills in
 .IR si_band " and " si_fd .
+The
+.I si_band
+event is a bit mask containing the same values as are filled in the
+.I revents
+field by
+.BR poll (2).
+The
+.I si_fd
+field indicates the file descriptor for which the I/O event occurred.
 .PP
 .I si_code
 is a value (not a bit mask)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
