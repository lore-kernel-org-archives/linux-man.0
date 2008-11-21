From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: TCP_CONGESTION documentation
Date: Fri, 21 Nov 2008 22:16:03 +0100
Message-ID: <20081121211603.GI6703@one.firstfloor.org>
References: <4926DC7B.7020203@gmail.com> <cfd18e0f0811210808u349aad61y2ae8a1590904a821@mail.gmail.com> <20081121204210.GG6703@one.firstfloor.org> <cfd18e0f0811211244v5d391f8du3380332a721ed33@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0811211244v5d391f8du3380332a721ed33-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-net-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Nov 21, 2008 at 03:44:05PM -0500, Michael Kerrisk wrote:
> Hi Andi,
> 
> On Fri, Nov 21, 2008 at 3:42 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> > On Fri, Nov 21, 2008 at 11:08:22AM -0500, Michael Kerrisk wrote:
> >> [CC+= Andi, this time with the right address]
> >
> > Just a general comment. The initial DESCRIPTION in tcp should
> > be probably adapted to mentioned that Linux has pluggable
> > congestion avoidance modules now and also that the defaults
> > have changed (from NewReno to CUBIC etc.)
> 
> If I try to do this, I'm going to create rubbish, because I know next
> to nothing about these details...
> 
> Could I ask a favor?  Below is the DESCRIPTION text.  Could you note
> write some sentences in the rough location where you think they below,
> and I will turn that into a *roff patch.

It would be better if Stephen or David do that. They kept better
track of it than me. In the worst case I could try too.

-Andi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
