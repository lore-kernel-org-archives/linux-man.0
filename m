From: Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
Subject: Re: networks.5 man page
Date: Fri, 5 Sep 2008 09:35:48 +0200
Message-ID: <20080905073547.GC1145@finlandia.home.infodrom.org>
References: <48BD0587.4080803@gmail.com> <20080902115633.GK1145@finlandia.home.infodrom.org> <cfd18e0f0809020504v26c9b61bu6ad45ce56d5d5be6@mail.gmail.com> <cfd18e0f0809042318w25398e00n9772dfed69fbef0c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0809042318w25398e00n9772dfed69fbef0c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> On Tue, Sep 2, 2008 at 2:04 PM, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> > On Tue, Sep 2, 2008 at 4:56 AM, Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org> wrote:
> >> Michael Kerrisk wrote:
> >>> Hi Joey,
> >>>
> >>> I see that Debian downstream has a networks(5) page (below) that you
> >>> wrote some years back (before my time as maintainer).  It seems
> >>> to me that it might make sense to take this page upstream.
> >>> What do you think?
> >>
> >> Great!  I'd appreciate this!
> >
> > And your thoughts on this piece?
> >
> > [[
> > PS The FreeBSD networks(5) page has some details not in your page
> > http://www.freebsd.org/cgi/man.cgi?query=networks&apropos=0&sektion=0&manpath=FreeBSD+7.0-RELEASE&format=html
> > Perhaps some of those details might also be usefully
> > covered in your page?
> > ]]

I'd appreciate if you could merge both contents.  I'm happy if manpages
contain comprehensive information about the subjects they ought to
describe.

> After reviewing the FreeBSD page, and doing a little testing, I
> made a few edits to the Debian downstream networks(5) page
> and have included it for man-pages-3.09.
> 
> Could you please review the diff below?  The most notable
> change is the substitution of "dotted-decimal" by "numbers-and-dots"
> notation, since getnetent(3) etc. do indeed accept that more
> general form, according to my tests.

Yes, that's fine with me.

I'm sorry that I had postponed the response and only remembered it
yesterday night again.  Thankfully, it didn't stall the process
and you were able to continue work nevertheless.

Regards,

	Joey

-- 
Beware of bugs in the above code; I have only proved it correct,
not tried it.  -- Donald E. Knuth
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
