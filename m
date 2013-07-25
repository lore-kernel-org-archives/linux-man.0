From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: Documenting MT-safe vs. MT-unsafe.
Date: Thu, 25 Jul 2013 11:13:52 +0800
Message-ID: <51F097F0.2010007@cn.fujitsu.com>
References: <51F08029.1000403@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F08029.1000403-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 07/25/2013 09:32 AM, Carlos O'Donell wrote:
> At present I am a little worried that glibc is going
> to document what we want to be true e.g. MT-unsafe,
> but that the linux kernel man pages project is going
> to document what is actually implemented e.g. MT-safe.
> This may lead users to believe functions are safe 
> when they are not guaranteed to be so.
> 
> The other problem is that the two documents might
> diverge and this information is very important.
> 
> What can we do to keep the two documents in sync?
> 

At present, when make the patch, I will look up Alex's result
(branch lxoliva/thread-safety-docs). 
If thread-safety level is the same with Alex or POSIX, 
I will send the patch. otherwise, the patch will be put off.

> When Alex completes his project we'll have MT-safety
> data (with a series of exceptions) for almost all
> of the glibc functions. Could we use that data to
> drive the generation of the attributes in the 
> linux kernel man pages?
> 

Maybe this will wait for a long time:(


-- 
Best Regards,
Peng

> Comments?
> 
> Cheers,
> Carlos.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
