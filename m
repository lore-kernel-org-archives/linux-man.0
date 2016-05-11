From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Wed, 11 May 2016 16:22:49 +0100
Message-ID: <20160511152249.GI3051@e104818-lin.cambridge.arm.com>
References: <571E731A.6050809@canonical.com>
 <20160509213140.GD26300@vapier.lan>
 <573103C8.9050008@canonical.com>
 <20160511025040.GL26300@vapier.lan>
 <20160511131855.GG3051@e104818-lin.cambridge.arm.com>
 <5733348D.7010301@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5733348D.7010301-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 11, 2016 at 02:33:01PM +0100, Colin Ian King wrote:
> On 11/05/16 14:18, Catalin Marinas wrote:
> > On Tue, May 10, 2016 at 10:50:40PM -0400, Mike Frysinger wrote:
> >> On 09 May 2016 22:40, Colin Ian King wrote:
> >>> On 09/05/16 22:31, Mike Frysinger wrote:
> >>>> On 25 Apr 2016 20:42, Colin Ian King wrote:
> >>>>> currently, the aarch64 clone() system call requires the stack to be
> >>>>> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
> >>>>> copy_thread():
> >>>>>
> >>>>>                 if (stack_start) {
> >>>>>                         if (is_compat_thread(task_thread_info(p)))
> >>>>>                                 childregs->compat_sp = stack_start;
> >>>>>                         /* 16-byte aligned stack mandatory on AArch64 */
> >>>>>                         else if (stack_start & 15)
> >>>>>                                 return -EINVAL;
> >>>>>                         else
> >>>>>                                 childregs->sp = stack_start;
> >>>>>                 }
> >>>>>
> >>>>>
> >>>>> ..and returns -EINVAL if not aligned correctly.  This should be added to
> >>>>> the manual page clone(2) as it took me a while to figure out why clone()
> >>>>> was failing with -EINVAL for aarch64 but not on x86.
> >>>>
> >>>> seems weird for the kernel to be enforcing this.  is it just because of
> >>>> the stated ABI ?  or is there some weird requirement in the kernel itself
> >>>> that requires this ?  it's not like other arches have this check, and
> >>>> there are def ABI requirements about stack alignments in C.
> >>>
> >>> The article here indicates it is an aarch64 convention:
> >>>
> >>> https://community.arm.com/groups/processors/blog/2015/11/19/using-the-stack-in-aarch32-and-aarch64
> >>
> >> that checks my point about the ABI having alignment requirements, but
> >> that doesn't mean it needs to be checked/enforced in the kernel.  all
> >> the limitations i see there can be seen in other arches, but we don't
> >> have those arches do any stack alignment checking.  so should we be
> >> dropping it from aarch64 ?  why does it need to be special here ?
> > 
> > It is not just a software ABI requirement but a hardware one. If you try
> > to access the stack with an unaligned SP value, you get a fault followed
> > by a SIGBUS delivered to the user application. We decided to enforce
> > this at the copy_thread() level, it is easier to catch such issue early
> > than debugging SIGBUS delivered to a thread.
> 
> Rather than returning -EINVAL would it be more useful re-align
> stack_start to the 16 byte boundary in copy_thread as a silent but
> useful fixup?

I wouldn't silently re-align the stack, it's a significant kernel ABI
change. Even dropping -EINVAL in favour of a later SIGBUS is an ABI
change, though not sure if any user apps or libraries would be affected
(I wouldn't expect them to rely on the -EINVAL return).

It seems that musl does this alignment in its clone(2) implementation:

https://git.musl-libc.org/cgit/musl/tree/src/thread/aarch64/clone.s

IIUC, glibc does not.

> It took me a while to debug the -EINVAL on the clone() system call to
> figure out what was wrong because I didn't realize aarch64 has this
> constraint.

Would it have been easier to get a SIGBUS on the first stack access?

It's worth posting a patch removing -EINVAL on linux-arm-kernel for
wider discussion.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
