From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: msr(7) manpage
Date: Tue, 24 Feb 2009 11:14:40 +0100
Message-ID: <20090224101440.GV26292@one.firstfloor.org>
References: <20090222170549.GA23589@one.firstfloor.org> <cfd18e0f0902240140u464fdb95g25f9bb97a49cda63@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0902240140u464fdb95g25f9bb97a49cda63-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Feb 24, 2009 at 10:40:57PM +1300, Michael Kerrisk wrote:
> > .\" Some sentences copied from comment in arch/x86/kernel/msr.c
> > .TH MSR 7 2009-02-22 "Linux" "Linux Programmer's Manual"
> > .SH NAME
> > msr \- x86 CPU MSR access device
> > .SH DESCRIPTION
> > .I /dev/cpu/CPUNUM/msr
> > allows to read and write the model specific registers (MSRs) of an x86 CPU.
> > .I CPUNUM
> > is the number of the cpu to access as listed in
> > .I /proc/cpuinfo.
> > The register access is done by opening the file and seeking to the MSR
> > number
> 
> Could you clarify "seek to the MSR number" == does that mean seek to
> offset (MSR_number * 8) or something like that?

No it means seek to MSR number. Yes the semantics are a little weird.

> 
> > as offset in the file and then read or write in chunks of 8 bytes.
> > A larger size than 8 bytes means multiple reads or writes of the
> > same register.
> 
> What are the semantics of reading the same register multiple times?
> Is a read non-destructive?  Do the multiple reads always get the same
> value?

It depends on the hardware. A typical x86 CPU has hundreds
of different MSRs. Typically they're non destructive, but some
might still change. I intentionally didn't try to cover that but
just added references (although those could be probably also
extended)

BTW what I also forgot was a note that it's root only.

Please just edit it yourself. I assume you'll be doing that anyways.

-Andi

-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
