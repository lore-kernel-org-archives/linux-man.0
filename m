From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: msr(7) manpage
Date: Sun, 22 Feb 2009 18:05:49 +0100
Message-ID: <20090222170549.GA23589@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Here's a simple manpage for the msr device.

-Andi


.\" Some sentences copied from comment in arch/x86/kernel/msr.c
.TH MSR 7 2009-02-22 "Linux" "Linux Programmer's Manual"
.SH NAME
msr \- x86 CPU MSR access device
.SH DESCRIPTION
.I /dev/cpu/CPUNUM/msr
allows to read and write the model specific registers (MSRs) of an x86 CPU.
.I CPUNUM 
is the number of the cpu to access as listed in 
.I /proc/cpuinfo.
The register access is done by opening the file and seeking to the MSR number
as offset in the file and then read or write in chunks of 8 bytes.
A larger size than 8 bytes means multiple reads or writes of the 
same register.
.SH NOTES
The 
.I msr
driver is not auto-loaded. On modular kernel you might need to use
.B modprobe msr
to load it explicitely before use.
.SH SEE ALSO
Intel Corporation Intel 64 and IA-32 Architectures Software Developer's Manual Volume 3B Appendix B
for an overview of the Intel CPU MSRs.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
