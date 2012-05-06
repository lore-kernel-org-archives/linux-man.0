From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], syscalls(2): Table too wide for line length, use text blocks
Date: Mon, 7 May 2012 09:09:07 +1200
Message-ID: <CAKgNAkhKm7-WvYnAG9XQDpvf1AX0MchFAUhgXBO++2Hor93AJQ@mail.gmail.com>
References: <20120506201024.GA1067@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120506201024.GA1067-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bjarni,

On Mon, May 7, 2012 at 8:10 AM, Bjarni Ingi Gislason <bjarniig-2945IVfuVpc@public.gmane.org=
s> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "groff -ww ..." (or "man --warnings=3Dw ..."):
>
> warning: around line 157: table wider than line width
>
> =A0Have to use text blocks. =A0Move some text to its correct column.
> =A0Split text to two columns to avoid hyphenation.
>
> =A0Patch:

I thought further about your patch. What it needed as
=2Ead l
=2Ead j
around the table, since (IMO) right justifying the third column didn't
look so good. I applied your patch, with that addition.

Thanks,

Michael

> --- syscalls.2 =A02012-04-26 22:58:36.000000000 +0000
> +++ syscalls.2.new =A0 =A0 =A02012-05-06 03:51:43.000000000 +0000
> @@ -164,8 +164,9 @@
> =A0\fBadjtimex\fP(2)
> =A0\fBalarm\fP(2)
> =A0\fBalloc_hugepages\fP(2) =A0 =A0 =A0 2.5.36 =A0Removed in 2.5.44
> -\fBbdflush\fP(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0 Deprecated (does nothin=
g)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 since 2.6
> +\fBbdflush\fP(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0 T{
> +Deprecated (does nothing) since 2.6
> +T}
> =A0\fBbind\fP(2)
> =A0\fBbrk\fP(2)
> =A0\fBcacheflush\fP(2) =A0 =A01.2 =A0 =A0 Not on i386
> @@ -185,7 +186,7 @@
> =A0\fBclose\fP(2)
> =A0\fBconnect\fP(2)
> =A0\fBcreat\fP(2)
> -\fBcreate_module\fP(2) Removed in 2.6
> +\fBcreate_module\fP(2) =A0 =A0 =A0 =A0 Removed in 2.6
> =A0\fBdelete_module\fP(2)
> =A0\fBdup\fP(2)
> =A0\fBdup2\fP(2)
> @@ -235,7 +236,7 @@
> =A0\fBftruncate64\fP(2) =A0 2.4
> =A0\fBfutex\fP(2) 2.6
> =A0\fBfutimesat\fP(2) =A0 =A0 2.6.16
> -\fBget_kernel_syms\fP(2) =A0 =A0 =A0 Removed in 2.6
> +\fBget_kernel_syms\fP(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0 Removed in 2.6
> =A0\fBget_mempolicy\fP(2) 2.6.6
> =A0\fBget_robust_list\fP(2) =A0 =A0 =A0 2.6.17
> =A0\fBget_thread_area\fP(2) =A0 =A0 =A0 2.6
> @@ -365,8 +366,9 @@
> =A0.\" , PowerPC, ARM; not i386
> =A0\fBpciconfig_write\fP(2) =A0 =A0 =A0 2.0.26; 2.2 =A0 =A0 Not on i3=
86
> =A0.\" , PowerPC, ARM; not i386
> -\fBperf_event_open\fP(2) =A0 =A0 =A0 2.6.31 =A0Was called perf_count=
er_open()
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 in 2.6.31; renamed in 2.6.32
> +\fBperf_event_open\fP(2) =A0 =A0 =A0 2.6.31 =A0T{
> +Was called perf_counter_open() in 2.6.31; renamed in 2.6.32
> +T}
> =A0\fBpersonality\fP(2) =A0 1.2
> =A0.\" \fBperfctr\fP(2) =A0 ??? =A0 =A0 Sparc32, Sparc64
> =A0.\" \fBperfmonctl\fP(2) =A0 =A0 =A0 =A0??? =A0 =A0 ia64
> @@ -376,8 +378,9 @@
> =A0\fBpoll\fP(2) =A02.2
> =A0\fBppoll\fP(2) 2.6.16
> =A0\fBprctl\fP(2) 2.2
> -\fBpread64\fP(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0 Added as "pread" in 2.2=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 renamed "pread64" in 2.6
> +\fBpread64\fP(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0 T{
> +Added as "pread" in 2.2; renamed "pread64" in 2.6
> +T}
> =A0\fBpreadv\fP(2) =A0 =A0 =A0 =A02.6.30
> =A0\fBprlimit\fP(2) =A0 =A0 =A0 2.6.36
> =A0\fBprocess_vm_readv(2)\fP =A0 =A0 =A03.2
> @@ -385,8 +388,9 @@
> =A0\fBpselect6\fP(2) =A0 =A0 =A02.6.16
> =A0.\" Implements \fBpselect\fP(2)
> =A0\fBptrace\fP(2)
> -\fBpwrite64\fP(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0Added as "pwrite" in 2.=
2;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 renamed "pwrite64" in 2.6
> +\fBpwrite64\fP(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0T{
> +Added as "pwrite" in 2.2; renamed "pwrite64" in 2.6
> +T}
> =A0\fBpwritev\fP(2) =A0 =A0 =A0 2.6.30
> =A0\fBquery_module\fP(2) =A02.2 =A0 =A0 Removed in 2.6
> =A0\fBquotactl\fP(2)
> @@ -442,8 +446,9 @@
> =A0\fBset_robust_list\fP(2) =A0 =A0 =A0 2.6.17
> =A0\fBset_thread_area\fP(2) =A0 =A0 =A0 2.6
> =A0\fBset_tid_address\fP(2) =A0 =A0 =A0 2.6
> -\fBset_zone_reclaim\fP(2) =A0 =A0 =A02.6.13 =A0Removed in 2.6.16 (wa=
s never
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 available to userspace)
> +\fBset_zone_reclaim\fP(2) =A0 =A0 =A02.6.13 =A0T{
> +Removed in 2.6.16 (was never available to userspace)
> +T}
> =A0.\" See http://lkml.org/lkml/2005/8/1/83
> =A0.\" "[PATCH] remove sys_set_zone_reclaim()"
> =A0\fBsetdomainname\fP(2)
> @@ -504,17 +509,19 @@
> =A0\fBstatfs\fP(2)
> =A0\fBstatfs64\fP(2) =A0 =A0 =A02.6
> =A0\fBstime\fP(2)
> -\fBsubpage_prot\fP(2) =A02.6.25 =A0PowerPC if CONFIG_PPC_64K_PAGES
> +\fBsubpage_prot\fP(2) =A02.6.25 =A0PowerPC if
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 CONFIG_PPC_64K_PAGES
> =A0\fBswapoff\fP(2)
> =A0\fBswapon\fP(2)
> =A0\fBsymlink\fP(2)
> =A0\fBsymlinkat\fP(2) =A0 =A0 2.6.16
> =A0\fBsync\fP(2)
> =A0\fBsync_file_range\fP(2) =A0 =A0 =A0 2.6.17
> -\fBsync_file_range2\fP(2) =A0 =A0 =A02.6.22 =A0Architecture-specific=
 variant
> +\fBsync_file_range2\fP(2) =A0 =A0 =A02.6.22 =A0T{
> +Architecture-specific variant of \fBsync_file_range\fP(2)
> +T}
> =A0.\" PowerPC, ARM, tile
> =A0.\" First appeared on ARM, as arm_sync_file_range(), but later ren=
amed
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 of \fBsync_file_range\fP(2)
> =A0.\" \fBsys_debug_setcontext\fP(2) =A0 =A0 =A0??? =A0 =A0 PowerPC i=
f CONFIG_PPC32
> =A0\fBsyncfs\fP(2) =A0 =A0 =A0 =A02.6.39
> =A0\fBsysfs\fP(2) 1.2
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
