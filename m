From: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Thu, 14 May 2015 19:41:23 +0200
Message-ID: <20150514174123.GC13385@chrystal.uk.oracle.com>
References: <55520EAC.2010003@oracle.com>
 <5554A6B0.2090409@gmail.com>
 <5554A8A4.7060404@redhat.com>
 <20150514162807.GA13385@chrystal.uk.oracle.com>
 <5554CFDF.6070602@redhat.com>
 <20150514165031.GB13385@chrystal.uk.oracle.com>
 <5554D5F8.8050305@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5554D5F8.8050305-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, May 14, 2015 at 07:06:00PM +0200, Denys Vlasenko wrote:
> On 05/14/2015 06:50 PM, Quentin Casasnovas wrote:
> >>> The only way for us to work-around this behaviour was to have
> >>> PTRACE_O_TRACEEXIT and detach from the threads when we were notified of a
> >>> thread termination, without PTRACE_O_TRACEEXIT I don't think one can be
> >>> notified in way, leading to hangs almost certainly when tracing multiple
> >>> threads and some are in ptrace-stop.
> >>
> >> Why do you do that waitpid on thread group leader?
> >>
> >> strace is the user of ptrace, and it has no problem with this behavior.
> >> It simply waits for all tracees via waitpid(-1). Whichever sends the next
> >> notification is processed.
> >>
> > 
> > That's because strace has all threads running; in our use-case, we attach
> > to all threads of a group and restart a single thread to do some work.  In
> > this particular case, waitpid(-1, ...) does not help because to exit, the
> > other threads need to be PTRACE_CONT'ed.
> 
> Can you be more specific?
> IF you have thread(s) which "do some work", then waitpid(-1) would work
> for you - presumably, you wait for them to finish doing work,
> or otherwise terminate, get a signal, whatever?

Oh you are right, PEBCAK!  It would appear I did not test this properly, I
cannot reproduce this behaviour...

So, if we attach to all threads of a group, call them thread A and B, then
CONT thread A, which then terminates for any reason, doing a waitpid(-1)
will indeed notify us for the termination even though thread B is in
ptrace-stop.

Sorry for the noise.

Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
