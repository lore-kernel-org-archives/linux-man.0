From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 -- expand ERRORS section
Date: Tue, 15 Apr 2014 14:25:22 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1404151342450.15528@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1404070052310.16856@vincent-weaver-1.um.maine.edu> <5346F5EC.6080600@gmail.com> <alpine.DEB.2.10.1404101621260.30596@vincent-weaver-1.um.maine.edu> <534BBC07.7040105@gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2102942130-1397586326=:15528"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534BBC07.7040105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2102942130-1397586326=:15528
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 14 Apr 2014, Michael Kerrisk (man-pages) wrote:

> 
>        EACCES Returned when the requested event requires root  permis‐
>               sions  (or  a  more  permissive perf_event paranoid set‐
>               ting).  Some common cases where an unprivileged  process
>               may  encounter  this  error:  are attaching to a process
>               owned by a different user; monitoring all processes on a
>               given CPU; and not setting exclude_kernel when the para‐
>               noid setting requires it.
> 
> But, now I have some more questions:
> 
> * What are "root permissions" here? It's these days usual to express
>   things precisely in terms of the required capability.

Yes, I guess that should really be CAP_SYS_ADMIN

> * I am puzzled by "monitoring all processes on a CPU"? So, monitoring 
>   _some_ (i.e., < all) processes on a CPU won't trigger this error?

I was a bit confused here.

A regular user can monitor "the specified process on CPU X" or "the 
specified process on any CPU".

A user running as root can also monitor "all procceses belonging to anyone 
on CPU X"

Other combinations aren't possible.

> >>> +.B EPERM
> >>> +Returned if sufficient permissions not available to create the event.
> 
> Again, somewhere here, the text should mention the required capability.

Yes, it's CAP_SYS_ADMIN again.

> > This is a recent change.  
> 
> So, the text should mention a kernel version number. Could you patch 
> that please. I guess it should be something like:
> 
>     and (since Linux 3.??) setting an ftrace function-trace tracepoint

Yes, I'll do that.

Vince
--8323329-2102942130-1397586326=:15528--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
