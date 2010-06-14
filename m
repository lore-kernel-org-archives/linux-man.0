From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [4/4] Document the hwpoison prctls in 2.6.32
Date: Mon, 14 Jun 2010 06:22:32 +0200
Message-ID: <AANLkTimn8W2LIpAXSV6rPNSw0mgM0igN8Ilj-zu5jfcV@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152931.17E2DB19E8@basil.firstfloor.org>
	<AANLkTiloYpJOYq8_r2O9pT2Zj336Zw2mca7XRWlqcy00@mail.gmail.com>
	<20100613101919.GC31464@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100613101919.GC31464-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Sun, Jun 13, 2010 at 12:19 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> On Sat, Jun 12, 2010 at 04:50:55PM +0200, Michael Kerrisk wrote:
>> Hi Andi,
>>
>> On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>> >
>> > Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> Thanks for this patch. I've done a few language fixes, and also
>> attempted to refine some details. Could you review the below, which
>> will be in 3.25?
>
> Looks good thanks
>
> I don't remember if this was in my original, but I would have clarified
> that the SIGBUS has a BUS_MCEERR_AR or _AO subclass.

You covered that in your patch to sigaction(2), which the prctl() text
refers to. Probably that suffices?

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
