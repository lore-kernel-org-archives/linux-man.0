From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/2] perf_event_open.2: Document the interaction of perf
 counters and execve
Date: Wed, 28 Dec 2016 14:57:06 -0500 (EST)
Message-ID: <alpine.DEB.2.20.1612281443200.19246@macbook-air>
References: <20161227215241.GA1214@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161227215241.GA1214-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 27 Dec 2016, Keno Fischer wrote:

> +.SS Interaction with execve(2)
> +It is important to separate the consideration of a file descriptor obtained
> +from
> +.BR perf_event_open
> +and that of the underlying performance counters. The two may be, but often
> +aren't, associated with the same task. With the exception of the
> +.BR PERF_FLAG_FD_CLOEXEC
> +flag (see above) there is nothing special about the file descriptors, so this
> +section will discuss the underlying performance counters.

The termonology gets to be a bit complicated here.

Often (at least in academic works) there is the distinction:
+ performance counter = the underlying hardware counter 
	(at the silicon level)
+ performance event = the particular architectural event being
	measured on a performance counter

I'm not sure what the most clear terminology is for a perf_event_open 
derived file descriptor which encapsulates a series of process-specific 
counter/event mappings.

> +When
> +.BR perf_event_open
> +is called, in addition to the file descriptor, the underlying performance counters
> +are created and associated with each thread in the specified process's thread group.
> +This association ends whenever the task exits, but generally persists across
> +.BR execve(2)
> +(unless of course, the execve causes the last file descriptor referencing these counters
> +to close). However, for security reasons, the association is broken if the
> +.BR execve(2)
> +causes the task's "dumpable", flag to be reset (see
> +.BR prctl(2)
> +).

I guess this part is the inspiration for adding this section?

> +If the
> +.IR inherit
> +option is specified, new children of any task already associated with these performance counters,
> +will inherit this association.

This is a complex area that could use more discussion.

> +Once all associations are broken, no further events are counted. However, the file descriptor
> +will not indicate this condition through an error return
> +(i.e.
> +.BR read(2)
> +and
> +.BR mmap(2)
> +will still succeed

It gets even messier with respect to signal handling and such too.


So anyway as a summary, this is probably a needed section to add to the 
manpage but it will be a challenge to document is properly.  I've spent a 
lot of time writing tests in this area and I'm not 100% sure I could 
entirely explain the interactions of fork/exec/inherit/inherit_stat 
especially when arbitrary children start messing with the file 
descriptor.

Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
