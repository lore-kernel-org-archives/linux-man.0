From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 3/3] perf_event_open.2: document new comm_exec flag
Date: Sat, 16 Aug 2014 06:58:19 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1408160654480.32274@vincent-weaver-1.umelst.maine.edu>
References: <alpine.DEB.2.11.1408061401400.1325@vincent-weaver-1.umelst.maine.edu> <53EE5D84.5050809@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53EE5D84.5050809-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, 15 Aug 2014, Michael Kerrisk (man-pages) wrote:
> > +If the additional
> > +.I comm_exec
> > +flag can be set (starting with Linux 3.16)
> 
> Would that last line be better as:
> 
>     flag is set (possible since Linux 3.16)
> 

It's tricky wording, as you can always set the flag, but the actual open 
call will fail pre-3.16 if the flag is set.

Maybe 
	"flag is successfully set (possible since Linux 3.16)"

might be better?

Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
