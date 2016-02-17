From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: SEE ALSO: func based or man page based?
Date: Wed, 17 Feb 2016 10:58:59 +0100
Message-ID: <56C44463.105@gmail.com>
References: <20160216222613.GJ7732@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160216222613.GJ7732-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Mike,

On 02/16/2016 11:26 PM, Mike Frysinger wrote:
> i often remember the func name "sigprocmask".  but when i'm in that page,
> i have a hard time remembering the exact naming for the set operators.
> rather than search, i figure just checking out the SEE ALSO section will
> quickly answer me ... except it doesn't (directly).
> 
> this is what sigprocmask(2) has:
> SEE ALSO
>     kill(2), pause(2), sigaction(2), signal(2), sigpending(2),
>     sigsuspend(2), pthread_sigmask(3), sigqueue(3), sigsetops(3),
>     signal(7)
> 
> i read that a few times and then just start picking signal related
> pages until i stumble across sigsetops(3).
> 
> is there a policy against listing the functions that appear in a
> grouped page ?  

There is no general policy. But obviously the man page should
make this point obvious. (Other similar pages, such as 
sched_setaffinity(2) do make it obvious.) I added the 
following text:

       A  set of functions for modifying and inspecting variables of type
       sigset_t ("signal sets") is described in sigsetops(3).


> or would it be ok to add the funcs in the sigsetops
> page directly to sigprocmask's SEE ALSO ?  

I'm not sure that that's necessary. There are only a few pages like
this, and I think it's better to have sentences like the above.

> grepping shows that at
> least select_tut(2) is out of sync ...

I'm not sure what you mean here. Can you elaborate please?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
