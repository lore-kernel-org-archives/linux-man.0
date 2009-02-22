From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: cpuid(7) manpage
Date: Sun, 22 Feb 2009 18:06:16 +0100
Message-ID: <20090222170616.GA23612@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Simple manpage for the cpuid devices.

-Andi


.\" Description based on comment in arch/x86/kernel/cpuid.c
.TH MSR 7 2009-02-22 "Linux" "Linux Programmer's Manual"
.SH NAME
cpuid \- x86 CPUID access device
.SH DESCRIPTIONS
CPUID allows to query information about the x86 CPU.

This device is accessed by 
.I lseek(2) 
or
.I pread(2)
to the appropriate CPUID level
and then read in chunks of 16 bytes.  A larger size means multiple
reads of consecutive levels.

The lower 32 bits of the file position is used as the incoming %eax,
and the upper 32 bits of the file position as the incoming %ecx,
the latter intended for "counting" eax levels like eax=4.

This driver uses 
.I /dev/cpu/CPUNUM/cpuid 
where
.I CPUNUM is the minor number, and on
an SMP box will direct the access to CPU CPUNUM as listed in 
.I /proc/cpuinfo.
.SH NOTES
The CPUID instruction can be directly executed by a program
using inline assembler. However this device allows convenient
access to all CPUs without changing process affinity. 

Most of the information in CPUID is reported by the kernel
in cooked form either in 
.I /proc/cpuinfo
or through sub directories in 
.I /sys/devices/system/cpu
Direct cpuid access through this device should only
be used in exceptional cases.

The 
.I cpuid
driver is not auto-loaded. On modular kernel you might need to use
.B modprobe cpuid
to load it explicitely before use.

There is no support for cpuid functions that require additional
input registers.

Very old x86 CPUs don't support CPUID.
.SH SEE ALSO
Intel Corporation, Intel 64 and IA-32 Architectures Software Developer's Manual Volume 2A
Instruction Set Reference, A-M, 3-180 CPUID reference.

Intel Corporation, Intel Processor Identification and the CPUID Instruction, Application note
485.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
