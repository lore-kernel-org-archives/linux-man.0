From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch] perf_event_open() updates for Linux 3.12
Date: Wed, 11 Dec 2013 23:42:07 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1312112336470.13794@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1309201412380.26813@vincent-weaver-1.um.maine.edu> <52A93180.6090807@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52A93180.6090807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, 12 Dec 2013, Michael Kerrisk (man-pages) wrote:

> I just wanted to double check with you: everything in this 
> old mail has now been applied via other patches, right?
> (Indeed, I believe I have no more outstanding patches from you, 
> right?)

yes, everything relevant from there was applied in the later broken-out 
patch set that you have already applied.

The only think missing is the MMAP2 stuff, but that was disabled at the 
last minute before the 3.12 release (and for whatever reason it does
not seem like it will be re-enabled for 3.13 either, despite the defines 
still existing in perf_event.h)

So you're caught up with regards to patches from me.

At some point I'll send the patches for 3.13 changes, and eventually make 
a try at better explaining the complicated perf_event mmap/ring_buffer 
interface that has seen a lot of lkml discussion recently.

Thanks,

Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
