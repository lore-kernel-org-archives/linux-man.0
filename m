From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages text for MAV_MERGEABLE and MADV_UNMERGEABLE
Date: Sat, 19 Jun 2010 14:38:42 +0200
Message-ID: <AANLkTimkOErPh0PF89LnitLaZhmVGH3cbhIw1cAcRT_p@mail.gmail.com>
References: <AANLkTinX4TlNfvwrCtjfkU-bar3URnpvmPJB-sOi-9aT@mail.gmail.com>
	<20100619085849.GD18946@basil.fritz.box> <AANLkTikNEECT9CgPuCKy0h1LVKfjdXM-lavzW-TnUTz-@mail.gmail.com>
	<20100619122918.GJ18946@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100619122918.GJ18946-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: hugh.dickins-IWqWACnzNjwqdlJmJB21zg@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Sat, Jun 19, 2010 at 2:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> On Sat, Jun 19, 2010 at 02:22:33PM +0200, Michael Kerrisk wrote:
>> Hi Andi,
>>
>> On Sat, Jun 19, 2010 at 10:58 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>> >> +.IR len .
>> >> +The KSM daemon
>> >> +.RI ( ksmd )
>> >
>> > You should probably make clear it's a kernel thread, not a classic
>> > daemon.
>>
>> Thanks. I changed it to "KSM kernel thread"
>>
>> >> +periodically scans those areas of user memory that have
>> >> +been marked as mergeable,
>> >> +looking for pages with identical content.
>> >
>> > Overall it seems like an internal implementation detail.
>>
>> Not sure how I could improve this. Did you have some specific idea in mind?
>
> Just dropping the sentence or using soft language like "the kernel regularly
> attempts to merge pages"

Thanks. I reworded like as you suggest.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
