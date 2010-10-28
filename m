From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] kexec_load manpage
Date: Thu, 28 Oct 2010 14:25:40 +0200
Message-ID: <20101028122540.GA29759@basil.fritz.box>
References: <20100619132633.GA24277@basil.fritz.box>
 <m1mxuqu8yr.fsf@fess.ebiederm.org>
 <AANLkTillNx5owgU4O71izNz9FEL06MiI-FquTZ3ofktP@mail.gmail.com>
 <AANLkTi=HKMce2UojSRmqVdoLO3H4v+6Xtp-bgFuHwH+D@mail.gmail.com>
 <AANLkTinHP0Z-sQOgtETQsQ_5ZV1UbT+tGDJ47B23E4=0@mail.gmail.com>
 <20101024213802.GB9922@basil.fritz.box>
 <20101028121417.GD16206@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101028121417.GD16206-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kexec Mailing List <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Oct 28, 2010 at 09:14:17PM +0900, Simon Horman wrote:
> On Sun, Oct 24, 2010 at 11:38:02PM +0200, Andi Kleen wrote:
> > On Sun, Oct 24, 2010 at 04:56:24PM +0200, Michael Kerrisk wrote:
> > > Hey Andi,
> > > 
> > > I'd like to push this page out the door, but I'm blocked doing so
> > > until I hear back from you regarding the question below (plus a new
> > > version of the page, if needed please).
> > 
> > Probably. Eric should know.
> > 
> > Frankly without an header the syscall is pretty much unusable
> > for normal programs anyways, so I gave up on this.
> 
> I'm not sure that I ever understood the impasse over the header.

It's basically: should kexec_load only be used from kexec(8)
or is it a generally available syscall.

If the former is true no header or manpage is needed.
For the later both are.

-Andi
-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
