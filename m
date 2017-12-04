From: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH RFC] stat.2: Document that stat can fail with EINTR
Date: Mon, 4 Dec 2017 14:31:50 -0800
Message-ID: <20171204223149.GA9998@bombadil.infradead.org>
References: <20171203002359.GA17037@juliacomputing.com>
 <20171203022504.GA14505@bombadil.infradead.org>
 <CABV8kRwbsjW1XbybDx12HmC9Gd1_5_C-KDhdtEz12KSZf-84_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABV8kRwbsjW1XbybDx12HmC9Gd1_5_C-KDhdtEz12KSZf-84_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Dec 02, 2017 at 10:15:33PM -0500, Keno Fischer wrote:
> This is exactly the discussion I want to generate, so thank you.
> I should point out that I'm not advocating for anything other
> than clarity of what kernel behavior user space may assume.

I don't think we tend to document short-lived now-fixed special-case
bugs ... right, Michael?

> On Sat, Dec 2, 2017 at 9:25 PM, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> > On Sat, Dec 02, 2017 at 07:23:59PM -0500, Keno Fischer wrote:
> >> The catalyst for this patch was me experiencing EINTR errors when
> >> using the 9p file system. In linux commit 9523feac, the 9p file
> >> system was changed to use wait_event_killable instead of
> >> wait_event_interruptible, which does indeed address my problem,
> >> but also makes me a bit unhappy, because uninterruptable waits
> >> prevents things like ^C'ing the execution and some debugging
> >> tools which depend on being able to cancel long-running operations
> >> by sending signals.
> >
> > Wait, wait, wait.  killable is not uninterruptible.  It's "can accept
> > a signal if the signal is fatal".  ie userspace will never see it.
> > So, no, it doesn't prevent ^C.  It does prevent the debugging tool you're
> > talking about from working, because it's handling the signal, so it's not
> > fatal.
> 
> This probably shows that I've been in REPL based environments too long,
> that catch SIGINT ;). You are of course correct that a fatal SIGINT would
> still be delivered.

I think ^\ (SIGQUIT) is a good signal that REPL environments don't tend
to catch, and everybody's favourite SIGKILL can't be intercepted.  But
REPL environments are actually a great example of a place where the
prctl() I mentioned would make sense.  When your code is managed, you can
make blanket statements like "All signals are handled correctly", because
the code manager (the REPL environment, the JVM, gdb, whatever) is auditable.

> >> I realize I'm probably 20 years too late here, but it feels like
> >> clarificaion on what to expect from the kernel would still go a long
> >> way here.
> >
> > A change to user-visible behaviour has to be opt-in.
> 
> I agree. However, it was my impression that stat() can return EINTR
> depending on the file system. Prior to the referenced commit,
> this was certainly true on 9p and I suspect it's not the only network file
> system for which this is true (though prior to my experiencing this
> with 9p, the only
> time I've ever experienced it was on HPC clusters with who knows what
> code providing the network filesystem). If it is indeed the case that
> an EINTR return from stat() and similar is illegal and should be considered
> a kernel bug, a statement to that extent all I'm looking for here.

I would be happy to make the statement that returning EINTR from stat()
is a kernel bug.  It may be wider-spread than anybody would like, and of
course HPC people do rather tend to emphasise expedience over standards
compliance ;-)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
