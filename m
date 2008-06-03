From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 3 Jun 2008 13:39:07 +0200
Message-ID: <cfd18e0f0806030439n5a11fa4aocd6251ffab66b6dd@mail.gmail.com>
References: <482D4665.4050401@gmail.com>
	 <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com>
	 <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com>
	 <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu>
	 <20080603112221.GW28946@ZenIV.linux.org.uk>
	 <cfd18e0f0806030427p22a274dev746e1656662f34f6@mail.gmail.com>
	 <20080603113018.GA27955@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080603113018.GA27955-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Jun 3, 2008 at 1:30 PM, Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org> wrote:
> Michael Kerrisk wrote:
>> > FWIW, I very much doubt that you are right wrt required
>> > permissions, though.  AFAICS, intent here is "if you can write to
>> > file, you can touch the timestamps anyway" and having descriptor
>> > opened for write gives that, current permissions be damned.
>>
>> The standard is pretty clear on this point:
>>
>> [[
>> Only a process with the effective user ID equal to the user ID of the
>> file, or with write access to the file, or with appropriate privileges
>> may use futimens( ) or utimensat( ) with a null pointer as the times
>> argument or with both tv_nsec fields set to the special value
>> UTIME_NOW.
>> ]]
>>
>> The crucial words here are "a process ... with write access to the
>> file" -- in other words, the permissions are determined by the
>> process's credentials, not by the access mode of the file descriptor.
>> I was not 100% sure on that to start with, so I did check it out with
>> one of the folk at The Open Group, to make sure of my understanding.
>
> Is there anything else where the file descriptor's access mode allows
> doing things on Linux, but the standard requires a permissions check
> each time?

Jamie,

I can't think of examples offhand -- but I'm also not quite sure what
your question is about.  Could you say a little more?

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
