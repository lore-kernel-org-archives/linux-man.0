From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH] kexec_load manpage
Date: Sun, 31 Oct 2010 15:58:10 +0900
Message-ID: <20101031065810.GB13793@verge.net.au>
References: <20100619132633.GA24277@basil.fritz.box>
 <m1mxuqu8yr.fsf@fess.ebiederm.org>
 <20100619194532.GQ18946@basil.fritz.box>
 <AANLkTi=eT_6UjgLsrOtQt833xeTOkjDvHXvd=xbEZ34c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=eT_6UjgLsrOtQt833xeTOkjDvHXvd=xbEZ34c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kexec Mailing List <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Oct 31, 2010 at 07:19:58AM +0100, Michael Kerrisk wrote:
> On Sat, Jun 19, 2010 at 9:45 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> > On Sat, Jun 19, 2010 at 12:18:52PM -0700, Eric W. Biederman wrote:
> >> Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> writes:
> >>
> >> > Here are the beginnings of a kexec_load manpage.
> >> >
> >> > Probably needs some more review from Eric and may need some additional
> >> > information.
> >> >
> >> > The syscall is actually only usable with a kernel patch to export
> >> > the header I just sent separately.
> >>
> >> The syscall has been used for years with a separate non-kernel header.
> >
> > Yes but that's not a sane interface that can be documented.
> 
> Agreed. Surely the right thing to do is export the proper header?

I am in favour of that option.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
