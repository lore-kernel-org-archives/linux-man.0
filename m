From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] [4/4] Document the hwpoison prctls in 2.6.32
Date: Sun, 13 Jun 2010 12:19:19 +0200
Message-ID: <20100613101919.GC31464@basil.fritz.box>
References: <20100320429.026463287@firstfloor.org> <20100320152931.17E2DB19E8@basil.firstfloor.org> <AANLkTiloYpJOYq8_r2O9pT2Zj336Zw2mca7XRWlqcy00@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTiloYpJOYq8_r2O9pT2Zj336Zw2mca7XRWlqcy00-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jun 12, 2010 at 04:50:55PM +0200, Michael Kerrisk wrote:
> Hi Andi,
> 
> On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> >
> > Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> Thanks for this patch. I've done a few language fixes, and also
> attempted to refine some details. Could you review the below, which
> will be in 3.25?

Looks good thanks

I don't remember if this was in my original, but I would have clarified
that the SIGBUS has a BUS_MCEERR_AR or _AO subclass.

-Andi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
