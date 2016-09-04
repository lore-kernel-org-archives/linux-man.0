From: Josh Triplett <josh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clone.2: Adjust syscall prototype and expand
 CLONE_SETTLS description
Date: Sat, 3 Sep 2016 22:11:02 -0700
Message-ID: <20160904051102.hgatyfxspa7fjvzz@x>
References: <20160824030607.GA2596@Kenos-MacBook-Pro-2.local>
 <2c257a1e-b7c5-c2bc-09ab-a2a685ae37b7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2c257a1e-b7c5-c2bc-09ab-a2a685ae37b7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 04, 2016 at 04:30:44PM +1200, Michael Kerrisk (man-pages) wrote:
> [CC += Josh]
> 
> Josh, I know you were submitting patches relate to the clone() TLS argument a 
> while back. Could you comment on this patch proposal below (also
> https://bugzilla.kernel.org/show_bug.cgi?id=118241 is relevant).

Sure.

> On 08/24/2016 03:06 PM, Keno Fischer wrote:
> > The prototype for the system call was added in 81f10dad, but looking at the
> > kernel's fork.c, I believe the relevant definition is
> > 
> > SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
> > int __user *, parent_tidptr,
> > int __user *, child_tidptr,
> > unsigned long, tls)
> > 
> > so the last argument is the tls argument, not a pt_regs argument.
> > I stumbled upon this while trying to understand CLONE_SETTLS, so I expanded
> > that description a little to cover other architectures.

This description and patch looks correct to me.
Reviewed-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>

Ideally, I'd suggest a follow-up patch to improve the prototypes for the
various architectures.  Rather than saying "x86 looks roughly this way,
on these architectures swap these arguments, on these architectures
...", I'd suggest explicitly giving each of the four prototypes (normal,
CONFIG_CLONE_BACKWARDS, CONFIG_CLONE_BACKWARDS2,
CONFIG_CLONE_BACKWARDS3) and the corresponding architectures.

> >  man2/clone.2 | 26 ++++++++++++++++++++------
> >  1 file changed, 20 insertions(+), 6 deletions(-)
> > 
> > diff --git a/man2/clone.2 b/man2/clone.2
> > index b867961..7c80e63 100644
> > --- a/man2/clone.2
> > +++ b/man2/clone.2
> > @@ -51,14 +51,14 @@ clone, __clone2 \- create a child process
> >  
> >  .BI "int clone(int (*" "fn" ")(void *), void *" child_stack ,
> >  .BI "          int " flags ", void *" "arg" ", ... "
> > -.BI "          /* pid_t *" ptid ", struct user_desc *" tls \
> > +.BI "          /* pid_t *" ptid ", void *" newtls \
> >  ", pid_t *" ctid " */ );"
> >  
> >  /* Prototype for the raw system call */
> >  
> >  .BI "long clone(unsigned long " flags ", void *" child_stack ,
> >  .BI "          void *" ptid ", void *" ctid ,
> > -.BI "          struct pt_regs *" regs );
> > +.BI "          unsigned long " newtls );
> >  .fi
> >  .SH DESCRIPTION
> >  .BR clone ()
> > @@ -544,11 +544,25 @@ then trace the child also (see
> >  .BR ptrace (2)).
> >  .TP
> >  .BR CLONE_SETTLS " (since Linux 2.5.32)"
> > -The
> > +The TLS (Thread Local Storage) descriptor is set to
> > +.I newtls.
> > +
> > +The interpretation of
> > +.I newtls
> > +and the resulting effect is architecture dependent.
> > +On x86,
> >  .I newtls
> > -argument is the new TLS (Thread Local Storage) descriptor.
> > +is interpreted as a
> > +.IR "struct user_desc *"
> >  (See
> > -.BR set_thread_area (2).)
> > +.BR set_thread_area (2)).
> > +On x86_64 it is the new value to be set for the %fs base register
> > +(See the
> > +.I ARCH_SET_FS
> > +argument to
> > +.BR arch_prctl (2)).
> > +On architectures with a dedicated TLS register, it is the new value
> > +of that register.
> >  .TP
> >  .BR CLONE_SIGHAND " (since Linux 2.0)"
> >  If
> > @@ -813,7 +827,7 @@ The raw system call interface on x86 and many other architectures is roughly:
> >  
> >  .BI "long clone(unsigned long " flags ", void *" child_stack ,
> >  .BI "           void *" ptid ", void *" ctid ,
> > -.BI "           struct pt_regs *" regs );
> > +.BI "           unsigned long " newtls );
> >  
> >  .fi
> >  .in
> > 
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
