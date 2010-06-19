From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [1/3] Document the prctl/signal hwpoison extensions for
	2.6.32
Date: Sat, 19 Jun 2010 09:13:40 +0200
Message-ID: <AANLkTikjiR9I4NkVEnOoAsKlEcaKPgt1ukyA_nkgBy33@mail.gmail.com>
References: <20091106652.255147301@firstfloor.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091106652.255147301-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

Earlier, I missed you MADV_HWPOISON patch.

I applied the following slightly modified version of your patch. Could
you please review:

--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -144,6 +144,18 @@ Undo the effect of
 .BR MADV_DONTFORK ,
 restoring the default behavior, whereby a mapping is inherited across
 .BR fork (2).
+.TP
+.BR MADV_HWPOISON " (Since Linux 2.6.32)
+Poison a page and handle it like a hardware memory corruption.
+This operation is only available for privileged
+.RB ( CAP_SYS_ADMIN )
+processes.
+This operation may result in the calling process receiving a
+.B SIGBUS
+and the page being unmapped.
+This feature is intended for memory testing.
+This feature is only available if the kernel was configured with
+.BR CONFIG_MEMORY_FAILURE .
 .SH "RETURN VALUE"
 On success
 .BR madvise ()
@@ -201,8 +213,9 @@ for file access.

 .BR MADV_REMOVE ,
 .BR MADV_DONTFORK ,
+.BR MADV_DOFORK ,
 and
-.B MADV_DOFORK
+.BR MAD_HWPOISON
 are Linux-specific.
 .SH NOTES
 .SS "Linux Notes"

Cheers,

Michael


On Fri, Nov 6, 2009 at 7:52 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>
> diff -u man2/sigaction.2-o man2/sigaction.2
> --- man2/sigaction.2-o =A02009-10-03 21:38:22.000000000 +0200
> +++ man2/sigaction.2 =A0 =A02009-10-03 21:49:25.000000000 +0200
> @@ -39,6 +39,7 @@
> =A0.\" 2004-12-09, mtk, added SI_TKILL + other minor changes
> =A0.\" 2005-09-15, mtk, split sigpending(), sigprocmask(), sigsuspend=
()
> =A0.\" =A0 =A0out of this page into separate pages.
> +.\" 2009-10-03 Andi Kleen, add hwpoison signal extensions
> =A0.\"
> =A0.TH SIGACTION 2 2009-07-25 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> @@ -271,6 +272,7 @@
> =A0 =A0 void =A0 =A0*si_addr; =A0 =A0 /* Memory location which caused=
 fault */
> =A0 =A0 int =A0 =A0 =A0si_band; =A0 =A0 /* Band event */
> =A0 =A0 int =A0 =A0 =A0si_fd; =A0 =A0 =A0 /* File descriptor */
> + =A0 =A0short =A0 =A0si_addr_lsb; /* Least Signifcant bit of address=
 */
> =A0}
> =A0.fi
> =A0.in
> @@ -343,7 +345,20 @@
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
> @@ -483,6 +498,12 @@
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
> diff -u man2/prctl.2-o man2/prctl.2
> --- man2/prctl.2-o =A0 =A0 =A02009-10-03 23:29:33.000000000 +0200
> +++ man2/prctl.2 =A0 =A0 =A0 =A02009-11-06 18:35:35.000000000 +0100
> @@ -37,6 +37,7 @@
> =A0.\" 2008-06-13 Erik Bosman, <ejbosman-FV+mU1CFjts@public.gmane.org>
> =A0.\" =A0 =A0 Document PR_GET_TSC and PR_SET_TSC.
> =A0.\" 2008-06-15 mtk, Document PR_SET_SECCOMP, PR_GET_SECCOMP
> +.\" 2009-10-03 Andi Kleen, document PR_MCE_KILL_*
> =A0.\"
> =A0.TH PRCTL 2 2008-07-16 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> @@ -318,6 +319,45 @@
> =A0for information on versions and architectures)
> =A0Return unaligned access control bits, in the location pointed to b=
y
> =A0.IR "(int\ *) arg2" .
> +.TP
> +.BR PR_MCE_KILL
> +(Since Linux 2.6.32)
> +Set the machine check memory corruption kill policy for the current =
thread.
> +When
> +.I arg2
> +is
> +.B PR_MCE_KILL_CLEAR
> +clear thread memory corruption kill policy and use system-wide defau=
lt.
> +When
> +.I arg2
> +is
> +.B PR_MCE_KILL_SET
> +use a thread-specific memory corruption kill policy. =A0 In this cas=
e
> +.I arg3
> +defines whether the policy is
> +.I early kill (
> +.B PR_MCE_KILL_EARLY
> +)
> +or
> +.I late kill (
> +.B PR_MCE_KILL_LATE
> +) or
> +.B PR_MCE_KILL_DEFAULT.
> +Early kill means that the task receives a
> +.I SIGBUS
> +signal as soon as hardware memory corruption is detected inside its =
address space.
> +In late kill mode the process is only killed when it accesses a corr=
upted page.
> +See
> +.I sigaction(2)
> +for more information on the
> +.I SIGBUS.
> +The policy is inherited by children.
> +Unused arguments upto 6 must be zero for future compatibility.
> +.TP
> +.BR PR_MCE_KILL_GET
> +returns the current per process machine check kill policy as defined=
 above.
> +All following arguments upto 6 must be 0.
> +
> =A0.SH "RETURN VALUE"
> =A0On success,
> =A0.BR PR_GET_DUMPABLE ,
> @@ -400,6 +440,12 @@
> =A0The
> =A0.BR prctl ()
> =A0system call was introduced in Linux 2.1.57.
> +
> +The
> +.I PR_MCE_KILL
> +and
> +.I PR_MCE_KILL_GET
> +suboptions were introduced with Linux 2.6.32.
> =A0.\" The library interface was added in glibc 2.0.6
> =A0.SH "CONFORMING TO"
> =A0This call is Linux-specific.
> --- man2/madvise.2-o =A0 =A02009-11-06 18:45:57.000000000 +0100
> +++ man2/madvise.2 =A0 =A0 =A02009-11-06 18:49:54.000000000 +0100
> @@ -141,6 +141,15 @@
> =A0.BR MADV_DONTFORK ,
> =A0restoring the default behavior, whereby a mapping is inherited acr=
oss
> =A0.BR fork (2).
> +.TP
> +.BR MADV_HWPOISON " (Since Linux 2.6.32)
> +Poison a page and handle it like a hardware memory corruption.
> +Only allowed for processes with
> +.I CAP_SYS_ADMIN
> +privileges. This may result in the calling process receiving a
> +.I SIGBUS
> +and the page being unmapped.
> +Intended for testing.
> =A0.SH "RETURN VALUE"
> =A0On success
> =A0.BR madvise ()
> @@ -148,6 +157,7 @@
> =A0On error, it returns \-1 and
> =A0.I errno
> =A0is set appropriately.
> +.\" XXX someone document the KSM extensions
> =A0.SH ERRORS
> =A0.TP
> =A0.B EAGAIN
> @@ -198,8 +208,9 @@
>
> =A0.BR MADV_REMOVE ,
> =A0.BR MADV_DONTFORK ,
> +.BR MADV_DOFORK ,
> =A0and
> -.B MADV_DOFORK
> +.BR MADV_HWPOISON
> =A0are Linux-specific.
> =A0.SH NOTES
> =A0.SS "Linux Notes"
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
