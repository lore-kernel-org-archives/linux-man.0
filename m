From: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Thu, 14 May 2015 18:28:07 +0200
Message-ID: <20150514162807.GA13385@chrystal.uk.oracle.com>
References: <55520EAC.2010003@oracle.com>
 <5554A6B0.2090409@gmail.com>
 <5554A8A4.7060404@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5554A8A4.7060404-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, May 14, 2015 at 03:52:36PM +0200, Denys Vlasenko wrote:
> On 05/14/2015 03:44 PM, Michael Kerrisk (man-pages) wrote:
> > Hi Denys,
> > 
> > Do you have any thoughts on the below?
> 
> Yes, the poster is right: this part needs fixing, the behavior is
> the same on any kind of process termination.
> 
> 
> > On 05/12/2015 04:31 PM, Vegard Nossum wrote:
> >> We hit another edge case in the ptrace() interface and after several
> >> hours of chasing it down, we found that it was already described in the
> >> "BUGS" section:
> >>
> >> "If a thread group leader is traced and exits by calling _exit(2), a
> 
> I think a possible fix is just to replace "exits by calling _exit(2)" part
> of the above text with "terminates".
> 

Should we also add a little paragraph detailing that waitpid() would hang
indefinitely if one thread terminates while the others are in ptrace-stop?
This behaviour was quite puzzling as during our experiments,
waitpid(<thread_pid>, ...) was hanging on a zombie thread, and even using
waitpid(-1, ...)  wasn't helping.

The only way for us to work-around this behaviour was to have
PTRACE_O_TRACEEXIT and detach from the threads when we were notified of a
thread termination, without PTRACE_O_TRACEEXIT I don't think one can be
notified in way, leading to hangs almost certainly when tracing multiple
threads and some are in ptrace-stop.

Or maybe that's obvious from the following sentence:

"If a thread group leader is traced and exits by calling _exit(2), a
PTRACE_EVENT_EXIT stop will happen for it (if requested), but the
subsequent WIFEXITED notification will not be delivered until all other
threads exit."

I know we didn't realize the other threads would not exit (because they
were in ptrace-stop), blocking the delivery.

Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
