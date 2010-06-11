From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Fri, 11 Jun 2010 07:45:35 +0200
Message-ID: <AANLkTikuSkJYM2BwPPS-QJZTx7ejdlCcbBLjOhZa2GN5@mail.gmail.com>
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
> =A0.SS "Real-time Signals"
> =A0Linux supports real-time signals as originally defined in the POSI=
X.1b
> =A0real-time extensions (and now included in POSIX.1-2001).
> Index: man-pages-3.24/man2/sigaction.2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- man-pages-3.24.orig/man2/sigaction.2
> +++ man-pages-3.24/man2/sigaction.2
> @@ -39,6 +39,7 @@
> =A0.\" 2004-12-09, mtk, added SI_TKILL + other minor changes
> =A0.\" 2005-09-15, mtk, split sigpending(), sigprocmask(), sigsuspend=
()
> =A0.\" =A0 =A0out of this page into separate pages.
> +.\" 2009-10-03 Andi Kleen, add hwpoison signal extensions
> =A0.\"
> =A0.TH SIGACTION 2 2009-07-25 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> @@ -271,6 +272,7 @@ siginfo_t {
> =A0 =A0 void =A0 =A0*si_addr; =A0 =A0 /* Memory location which caused=
 fault */
> =A0 =A0 int =A0 =A0 =A0si_band; =A0 =A0 /* Band event */
> =A0 =A0 int =A0 =A0 =A0si_fd; =A0 =A0 =A0 /* File descriptor */
> + =A0 =A0short =A0 =A0si_addr_lsb; /* Least Signifcant bit of address=
 */
> =A0}
> =A0.fi
> =A0.in
> @@ -343,7 +345,20 @@ and
> =A0.B SIGBUS
> =A0fill in
> =A0.I si_addr
> -with the address of the fault.
> +with the address of the fault. Some suberrors of
> +.I SIGBUS,
> +in particular
> +.B BUS_MCEERR_AO
> +and
> +.B BUS_MCEERR_AR
> +also fill in
> +.B si_addr_lsb
> +This field defines the least significant bit of the reported address=
 and therefore the extent of
> +the corruption. For example if a full page was corrupted it contains=
 log2(get_page_size()).
> +.I BUS_MCERR_*
> +and
> +.I si_addr_lsb
> +are only available with Linux 2.6.32 and later and are a Linux speci=
fic extension.
> =A0.B SIGPOLL
> =A0fills in
> =A0.IR si_band " and " si_fd .
> @@ -483,6 +498,12 @@ nonexistent physical address
> =A0.TP
> =A0.B BUS_OBJERR
> =A0object-specific hardware error
> +.TP
> +.B BUS_MCEERR_AR
> +hardware memory error consumed after a machine check: action require=
d. Program cannot continue current execution stream. For this error the=
 si_addr_lsb field is valid. Since Linux 2.6.32 and a Linux specific ex=
tension.
> +.TP
> +.B BUS_MCEERR_AO
> +hardware memory error detected in process but not consumed: action o=
ptional. Program is allowed to continue current execution stream, but t=
he page containing the reported address is corrupted. The extent of the=
 corruption is defined by the si_addr_lsb field. Since Linux 2.6.32 and=
 a Linux specific extension.
> =A0.RE
> =A0.PP
> =A0The following values can be placed in
>

It would have been best to separate these two patches. I took the
patch to sigaction.2, and enhanced slightly (some small grammar fixes,
plus addition of the new BUS_MCERR constants in the list further down
the page), as below. Thanks for that patch, and sorry for the long
delay in dealing with it.

The update will be in man-pages-3.25.

Cheers,

Michael


--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -39,8 +39,9 @@
 .\" 2004-12-09, mtk, added SI_TKILL + other minor changes
 .\" 2005-09-15, mtk, split sigpending(), sigprocmask(), sigsuspend()
 .\"    out of this page into separate pages.
++.\" 2010-06-10 Andi Kleen, add hwpoison signal extensions
 .\"
-.TH SIGACTION 2 2009-07-25 "Linux" "Linux Programmer's Manual"
+.TH SIGACTION 2 2010-06-11 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sigaction \- examine and change a signal action
 .SH SYNOPSIS
@@ -271,6 +272,8 @@ siginfo_t {
     void    *si_addr;     /* Memory location which caused fault */
     int      si_band;     /* Band event */
     int      si_fd;       /* File descriptor */
+    short    si_addr_lsb; /* Least signifcant bit of address
+                             (since kernel 2.6.32) */
 }
 .fi
 .in
@@ -344,6 +347,24 @@ and
 fill in
 .I si_addr
 with the address of the fault.
+Some suberrors of
+.I SIGBUS,
+in particular
+.B BUS_MCEERR_AO
+and
+.BR BUS_MCEERR_AR ,
+also fill in
+.IR si_addr_lsb .
+This field indicates the least significant bit of the reported address
+and therefore the extent of the corruption.
+For example, if a full page was corrupted,
+.I si_addr_lsb
+contains
+.IR log2(sysconf(_SC_PAGESIZE)) .
+.B BUS_MCERR_*
+and
+.I si_addr_lsb
+are Linux-specific extensions.
 .B SIGPOLL
 fills in
 .IR si_band " and " si_fd .
@@ -483,6 +504,12 @@ nonexistent physical address
 .TP
 .B BUS_OBJERR
 object-specific hardware error
+.TP
+.BR BUS_MCEERR_AR " (since Linux 2.6.32)"
+Hardware memory error consumed on a machine check; action required.
+.TP
+.BR BUS_MCEERR_AO " (since Linux 2.6.32)"
+Hardware memory error detected in process but not consumed; action opt=
ional.
 .RE
 .PP
 The following values can be placed in
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
