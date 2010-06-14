From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Mon, 14 Jun 2010 10:20:54 +0200
Message-ID: <20100614082054.GD17092@basil.fritz.box>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org> <AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com> <20100611083134.GF6864@basil.fritz.box> <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa@mail.gmail.com> <20100613103343.GE31464@basil.fritz.box> <AANLkTilzdFecfwtgrMjEX2bT_ruPa6oegFeVUgSXBvM0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilzdFecfwtgrMjEX2bT_ruPa6oegFeVUgSXBvM0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jun 14, 2010 at 07:10:06AM +0200, Michael Kerrisk wrote:
> >> * It's incomplete. If you compare against the corresponding
> >> information in sigaction(2) [better pull the latest page from git for
> >> this comparison], there is more information about which fields are set
> >> by the various signals. Also, various siginfo_t fields (si_signo) are
> >> missing from your table.
> >
> > Ok it could be listed.
> 
> This was an example. I didn't check for all incomplete pieces.

What else should be missing?

I generated the table by looking at the trap handlers.

> >> Likewise, it suggests that there is useful info in si_trapno, but
> >> usually there is not. The entry for SIGKILL also seems strange.
> >
> > There is useful information in trapno for the signals where
> > I listed it.
> 
> So, there may be a problem here. sigaction.2 currently states
> 
>                int      si_trapno;   /* Trap number that caused
>                                         hardware-generated signal
>                                         (unused on most architectures) */
> 
> Is the last line true? Checking this, my reading of the source is that

It's not true.

I think it's also needed in some cases to figure out what exactly
happened, although in most cases code gives this information.

> si_trapno is only used on SPARC/MIPS/Alpha. (These are the
> architectures that define __ARCH_SI_TRAPNO) Is that wrong? In
> particular, x86 doesn't generally seem to set si_trapno, right?

arch/x86/kernel/signal.c:162:             put_user_ex(current->thread.trap_no, &sc->trapno);
> 
> > Why is SIGKILL strange?
> 
> I suspect that this should be a more general statement about signals
> sent with kill(2), right? There's nothing special about SIGKILL in
> this respect, AFAIK. By the way, the sigaction.2 page, has a statement
> that covers this.

It was more a comparison to non KILL signals, but ok
you're right RT signals would need to be listed too.

-Andi
-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
