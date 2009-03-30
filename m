From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: cpuid(7) manpage
Date: Tue, 31 Mar 2009 09:57:55 +1300
Message-ID: <cfd18e0f0903301357k486bc323ra1ac935ad03ca02@mail.gmail.com>
References: <20090222170616.GA23612@one.firstfloor.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090222170616.GA23612-qrUzlfsMFqo/4alezvVtWx2eb7JE58TQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andi,

On 2/23/09, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> Simple manpage for the cpuid devices.

Thanks for this page!

I've incorporated this page for man-pages-3.20, with the following changes:

* made some small wording edits to the page
* I added a copyright in your name, and a license -- I used the
verbatim license, since that's what you used at least some times in
the past:
http://www.kernel.org/doc/man-pages/licenses.html#verbatim
* I added text noting that the file is readable only for root/root.
* I moved the page to section 4 (not 7), since that is the sectiion
for device pages.

Please let me know if any of the above should be changed/fixed.

The current draft of the page is below.

Thanks,

Michael


.\" Copyright (c) 2009 by Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
.\" Description based on comments in arch/x86/kernel/cpuid.c
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.TH CPUID 4 2009-03-31 "Linux" "Linux Programmer's Manual"
.SH NAME
cpuid \- x86 CPUID access device
.SH DESCRIPTIONS
CPUID provides an interface for querying information about the x86 CPU.

This device is accessed by
.I lseek(2)
or
.I pread(2)
to the appropriate CPUID level and reading in chunks of 16 bytes.
A larger read size means multiple reads of consecutive levels.

The lower 32 bits of the file position is used as the incoming
.IR %eax ,
and the upper 32 bits of the file position as the incoming
.IR %ecx ,
the latter intended for "counting"
.I eax
levels like
.IR eax=4 .

This driver uses
.IR /dev/cpu/CPUNUM/cpuid ,
where
.I CPUNUM
is the minor number,
and on an SMP box will direct the access to CPU
.I CPUNUM
as listed in
.I /proc/cpuinfo.

This file is protected so that it can only be read by the user
.IR root ,
or members of the group
.IR root .
.SH NOTES
The CPUID instruction can be directly executed by a program
using inline assembler.
However this device allows convenient
access to all CPUs without changing process affinity.

Most of the information in
.I cpuid
is reported by the kernel in cooked form either in
.I /proc/cpuinfo
or through subdirectories in
.IR /sys/devices/system/cpu .
Direct CPUID access through this device should only
be used in exceptional cases.

The
.I cpuid
driver is not auto-loaded.
On modular kernels you might need to use the following command
to load it explicitly before use:

     $ \fImodprobe cpuid\fP

There is no support for CPUID functions that require additional
input registers.

Very old x86 CPUs don't support CPUID.
.SH SEE ALSO
Intel Corporation, Intel 64 and IA-32 Architectures
Software Developer's Manual Volume 2A:
Instruction Set Reference, A-M, 3-180 CPUID reference.

Intel Corporation, Intel Processor Identification and
the CPUID Instruction, Application note 485.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
