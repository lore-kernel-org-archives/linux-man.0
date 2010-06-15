From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Tue, 15 Jun 2010 13:05:52 +0200
Message-ID: <20100615110552.GG6727@basil.fritz.box>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org> <AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com> <20100611083134.GF6864@basil.fritz.box> <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa@mail.gmail.com> <20100613103343.GE31464@basil.fritz.box> <AANLkTilzdFecfwtgrMjEX2bT_ruPa6oegFeVUgSXBvM0@mail.gmail.com> <20100614082054.GD17092@basil.fritz.box> <AANLkTikvazub4Ni-3aL4CFhimfVoTYz4xI1FskFUMSGd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikvazub4Ni-3aL4CFhimfVoTYz4xI1FskFUMSGd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Jun 15, 2010 at 07:25:36AM +0200, Michael Kerrisk wrote:

Hi Michael,

> Okay -- so at this point I plead ignorance/blindness. These are the
> things that confuse me (and I admit not being able to follow all the
> kernel code convolutions here):

Sorry, it was actually me being wrong. The trapno is only set in
the sigcontext on x86, not in the siginfo.

So you're right on this.

> In principle, I'd accept a patch like you suggest for sigaction.2 --
> probably by the time we finish this discussion, I'll be able to write
> it myself ;-).

Ok, I assume you'll be writing it.

-Andi

-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
