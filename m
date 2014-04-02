From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch v2] perf_event_open.2 : document PERF_FLAG_FD_CLOEXEC
 flag
Date: Wed, 2 Apr 2014 11:22:47 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1404021116290.19485@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1404011734320.17339@vincent-weaver-1.um.maine.edu> <533BBF1F.4070608@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <533BBF1F.4070608-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 2 Apr 2014, Michael Kerrisk (man-pages) wrote:

> I applied, and reworked the text to be:
> 
>        PERF_FLAG_FD_CLOEXEC (since Linux 3.14).
>               This flag enables the close-on-exec flag for the created
>               event  file  descriptor,  so that the file descriptor is
>               automatically closed on execve(2).  Setting  the  close-
>               on-exec  flags at  creation time, rather than later with
>               fcntl(2), avoids potential  race  conditions  where  the
>               calling  thread  invokes  perf_event_open()  at the same
>               time as another thread calls fork(2) then execve(2).
> 
> Okay?

I think the actual race condition being worried about is this:


thread1                   thread2

fd=perf_event_open()         |
      |                    fork()
      |                    exec()
      |                      |
fcntl(CLOEXEC)               |
                          fd has escaped past exec because
                          fcntl didn't happen fast enough

so if you do a

fd=perf_event_open(...,PERF_FLAG_FD_CLOEXEC);

then fd is always CLOEXEC and you don't have a brief window of time
before the fcntl() where the fd can escape.


I'm not sure of a scuccint way to express that though.

Vince

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
