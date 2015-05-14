From: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Thu, 14 May 2015 18:50:31 +0200
Message-ID: <20150514165031.GB13385@chrystal.uk.oracle.com>
References: <55520EAC.2010003@oracle.com>
 <5554A6B0.2090409@gmail.com>
 <5554A8A4.7060404@redhat.com>
 <20150514162807.GA13385@chrystal.uk.oracle.com>
 <5554CFDF.6070602@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5554CFDF.6070602-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, May 14, 2015 at 06:39:59PM +0200, Denys Vlasenko wrote:
> On 05/14/2015 06:28 PM, Quentin Casasnovas wrote:
> > Should we also add a little paragraph detailing that waitpid() would hang
> > indefinitely if one thread terminates while the others are in ptrace-stop?
> 
> It implies this by saying "but the subsequent WIFEXITED notification
> will not be delivered until all other threads exit".
>
> If another thread is in ptrace-stop, it did not exit yet. Therefore,
> WIFEXITED notification to the thread group leader will not be delivered.
> Therefore, waitpid() on it would hang.
> 

Right, I guess it just wasn't obvious to us (or just me) that the threads
would not exit while in ptrace-stop.

> > The only way for us to work-around this behaviour was to have
> > PTRACE_O_TRACEEXIT and detach from the threads when we were notified of a
> > thread termination, without PTRACE_O_TRACEEXIT I don't think one can be
> > notified in way, leading to hangs almost certainly when tracing multiple
> > threads and some are in ptrace-stop.
> 
> Why do you do that waitpid on thread group leader?
> 
> strace is the user of ptrace, and it has no problem with this behavior.
> It simply waits for all tracees via waitpid(-1). Whichever sends the next
> notification is processed.
>

That's because strace has all threads running; in our use-case, we attach
to all threads of a group and restart a single thread to do some work.  In
this particular case, waitpid(-1, ...) does not help because to exit, the
other threads need to be PTRACE_CONT'ed.

Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
