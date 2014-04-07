From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch v2] perf_event_open.2 : document PERF_FLAG_FD_CLOEXEC
 flag
Date: Mon, 7 Apr 2014 01:02:11 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1404070059480.16856@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1404011734320.17339@vincent-weaver-1.um.maine.edu> <533BBF1F.4070608@gmail.com> <alpine.DEB.2.10.1404021116290.19485@vincent-weaver-1.um.maine.edu> <533E6A8D.3020408@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <533E6A8D.3020408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 4 Apr 2014, Michael Kerrisk (man-pages) wrote:

> >>               on-exec  flags at  creation time, rather than later with
> >>               fcntl(2), avoids potential  race  conditions  where  the
> >>               calling  thread  invokes  perf_event_open()  at the same
> >>               time as another thread calls fork(2) then execve(2).
> > 
> > I'm not sure of a scuccint way to express that though.
> 
> I think the existing text suffices.

My concern is that it should be 
    "where the calling thread invokes *fcntl()* at the same time..."
rather than
    "where the calling thread invokes *perf_event_open()* at the same time..."

but maybe that's just a small detail, I'm fine with the current text 
otherwise.

Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
