From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: msr(7) manpage
Date: Tue, 31 Mar 2009 08:29:31 +1300
Message-ID: <cfd18e0f0903301229n73c47368v64c1aadc12f58056@mail.gmail.com>
References: <20090222170549.GA23589@one.firstfloor.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090222170549.GA23589-qrUzlfsMFqo/4alezvVtWx2eb7JE58TQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Mon, Feb 23, 2009 at 6:05 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> Here's a simple manpage for the msr device.

I've incorporated this page for man-pages-3.20, with the following changes:

* made some small wording edits to the page
* I added a copyright in your name, and a license -- I used the
verbatim license, since that's what you used at least some times in
the past:
http://www.kernel.org/doc/man-pages/licenses.html#verbatim
* I added text noting that the file is only r/w for root.root.

Please let me know if any of the above should be changed/fixed.

The current draft of the page is below.

Cheers,

Michael


.\" Copyright (c) 2009 by Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
.\" Some sentences copied from comments in arch/x86/kernel/msr.c
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
.TH MSR 7 2009-03-31 "Linux" "Linux Programmer's Manual"
.SH NAME
msr \- x86 CPU MSR access device
.SH DESCRIPTION
.I /dev/cpu/CPUNUM/msr
provides an interface to read and write the model-specific
registers (MSRs) of an x86 CPU.
.I CPUNUM
is the number of the CPU to access as listed in
.IR /proc/cpuinfo .

The register access is done by opening the file and seeking
to the MSR number as offset in the file, and then
reading or writing in chunks of 8 bytes.
An I/O transfer of more than 8 bytes means multiple reads or writes
of the same register.

This file is protected so that it can only be read and written by the user
.IR root ,
or members of the group
.IR root .
.SH NOTES
The
.I msr
driver is not auto-loaded.
On modular kernels you might need to use the following command
to load it explicitly before use:

    $ \fImodprobe msr\fP
.SH SEE ALSO
Intel Corporation Intel 64 and IA-32 Architectures
Software Developer's Manual Volume 3B Appendix B
for an overview of the Intel CPU MSRs.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
