From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: msr(7) manpage
Date: Tue, 24 Feb 2009 22:40:57 +1300
Message-ID: <cfd18e0f0902240140u464fdb95g25f9bb97a49cda63@mail.gmail.com>
References: <20090222170549.GA23589@one.firstfloor.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090222170549.GA23589-qrUzlfsMFqo/4alezvVtWx2eb7JE58TQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2/23/09, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> Here's a simple manpage for the msr device.
>
> -Andi

Thanks for this page Andi.

A few comments/questions below.

> .\" Some sentences copied from comment in arch/x86/kernel/msr.c
> .TH MSR 7 2009-02-22 "Linux" "Linux Programmer's Manual"
> .SH NAME
> msr \- x86 CPU MSR access device
> .SH DESCRIPTION
> .I /dev/cpu/CPUNUM/msr
> allows to read and write the model specific registers (MSRs) of an x86 CPU.
> .I CPUNUM
> is the number of the cpu to access as listed in
> .I /proc/cpuinfo.
> The register access is done by opening the file and seeking to the MSR
> number

Could you clarify "seek to the MSR number" == does that mean seek to
offset (MSR_number * 8) or something like that?

> as offset in the file and then read or write in chunks of 8 bytes.
> A larger size than 8 bytes means multiple reads or writes of the
> same register.

What are the semantics of reading the same register multiple times?
Is a read non-destructive?  Do the multiple reads always get the same
value?

Cheers,

Michael

> .SH NOTES
> The
> .I msr
> driver is not auto-loaded. On modular kernel you might need to use
> .B modprobe msr
> to load it explicitely before use.
> .SH SEE ALSO
> Intel Corporation Intel 64 and IA-32 Architectures Software Developer's
> Manual Volume 3B Appendix B
> for an overview of the Intel CPU MSRs.
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
