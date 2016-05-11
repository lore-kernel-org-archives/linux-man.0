From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Wed, 11 May 2016 16:26:23 +0100
Message-ID: <20160511152622.GJ3051@e104818-lin.cambridge.arm.com>
References: <571E731A.6050809@canonical.com>
 <20160509213140.GD26300@vapier.lan>
 <573103C8.9050008@canonical.com>
 <20160511025040.GL26300@vapier.lan>
 <20160511131855.GG3051@e104818-lin.cambridge.arm.com>
 <20160511140024.GM26300@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160511140024.GM26300-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 11, 2016 at 10:00:24AM -0400, Mike Frysinger wrote:
> On 11 May 2016 14:18, Catalin Marinas wrote:
> > On Tue, May 10, 2016 at 10:50:40PM -0400, Mike Frysinger wrote:
> > > On 09 May 2016 22:40, Colin Ian King wrote:
> > > > On 09/05/16 22:31, Mike Frysinger wrote:
> > > > > On 25 Apr 2016 20:42, Colin Ian King wrote:
> > > > >> currently, the aarch64 clone() system call requires the stack to be
> > > > >> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
> > > > >> copy_thread():
> > > > >>
> > > > >>                 if (stack_start) {
> > > > >>                         if (is_compat_thread(task_thread_info(p)))
> > > > >>                                 childregs->compat_sp = stack_start;
> > > > >>                         /* 16-byte aligned stack mandatory on AArch64 */
> > > > >>                         else if (stack_start & 15)
> > > > >>                                 return -EINVAL;
> > > > >>                         else
> > > > >>                                 childregs->sp = stack_start;
> > > > >>                 }
> > > > >>
> > > > >>
> > > > >> ..and returns -EINVAL if not aligned correctly.  This should be added to
> > > > >> the manual page clone(2) as it took me a while to figure out why clone()
> > > > >> was failing with -EINVAL for aarch64 but not on x86.
> > > > > 
> > > > > seems weird for the kernel to be enforcing this.  is it just because of
> > > > > the stated ABI ?  or is there some weird requirement in the kernel itself
> > > > > that requires this ?  it's not like other arches have this check, and
> > > > > there are def ABI requirements about stack alignments in C.
> > > > 
> > > > The article here indicates it is an aarch64 convention:
> > > > 
> > > > https://community.arm.com/groups/processors/blog/2015/11/19/using-the-stack-in-aarch32-and-aarch64
> > > 
> > > that checks my point about the ABI having alignment requirements, but
> > > that doesn't mean it needs to be checked/enforced in the kernel.  all
> > > the limitations i see there can be seen in other arches, but we don't
> > > have those arches do any stack alignment checking.  so should we be
> > > dropping it from aarch64 ?  why does it need to be special here ?
> > 
> > It is not just a software ABI requirement but a hardware one. If you try
> > to access the stack with an unaligned SP value, you get a fault followed
> > by a SIGBUS delivered to the user application. We decided to enforce
> > this at the copy_thread() level, it is easier to catch such issue early
> > than debugging SIGBUS delivered to a thread.
> 
> as i said, that same behavior can be observed on other arches.  i know of
> at least one for sure that if the stack is unaligned, then push/pop ops
> will also trigger SIGBUS.  x86 tends to be more forgiving, but if it isn't
> 16bytes, then it is known that SSE optimized code will often fault.
> 
> so the question is still: why is aarch64 enforcing in the kernel what all
> other arches have left alone even when they behave the same in hardware ?

This was an early decision before we upstreamed the AArch64 kernel
patches. Whether it was right or not it doesn't matter much now; at this
point it is considered kernel-user (syscall) ABI and any change would
require careful review.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
