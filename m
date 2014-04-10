From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 -- expand ERRORS section
Date: Thu, 10 Apr 2014 16:30:21 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1404101621260.30596@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1404070052310.16856@vincent-weaver-1.um.maine.edu> <5346F5EC.6080600@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5346F5EC.6080600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, 10 Apr 2014, Michael Kerrisk (man-pages) wrote:

> I've applied this, but have a question or two below.
> 
> On 04/07/2014 06:56 AM, Vince Weaver wrote:

> > +.B EACCES
> > +Returned when the requested event requires root permissions
> > +(or a more permissive perf_event paranoid setting).
> > +Some common causes are attaching to a process owned by a different user,
> > +monitoring all processes on a given cpu,
> 
> I don't understand that line above. Could you clarify. How is
> "monitoring all processes on a given given cpu" a cause of 
> this error."

If you configure to monitor all processes by setting cpu=-1 then you
are potentially measuring processes belonging to other users, which
would be a security leak.  So you get EACCES.

> > +.B EPERM
> > +Returned if sufficient permissions not available to create the event.
> > +This includes attempting to set a breakpoint on a kernel address
> > +and setting a ftrace function trace tracepoint.
> 
> I don't understand the previous line. Why is "setting a ftrace function 
> trace tracepoint" a cause of EPERM?

Would it be cleared if it were "ftrace function-trace tracepoint"?

This is a recent change.  It was a lockup bug we found, it turns out
that letting an average user set function-trace tracepoints can cause
problems, if for example they set a tracepoint in an interrupt handler
that causes an overflow that triggers an interrupt you get a recursive 
loop.  The easy solution was to just make function-trace tracepoints
root-only (meaning that yes, root can crash the kernel easily using 
perf_event_open() ).

Now why it returns EPERM not EACCES, I don't know.

I can try to update the text in these two cases to be a bit more clear.
I'm never sure how much extra details like this are suitable without
overwhelming the document with extraneous details.

Vince


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
