From: =?iso-8859-1?Q?J=F6rn?= Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Subject: Re: mlockall(MCL_FUTURE) implies MAP_POPULATE
Date: Wed, 16 Dec 2015 10:50:06 -0800
Message-ID: <20151216185006.GA31243@Sligo.logfs.org>
References: <20151028010510.GF21688@Sligo.logfs.org>
 <CAFs=pgb+LatY8WKV+sZsvgUGMtzVsSxwX0FTKx3u5Nuj1AiOYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFs=pgb+LatY8WKV+sZsvgUGMtzVsSxwX0FTKx3u5Nuj1AiOYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Dec 16, 2015 at 07:44:16PM +0100, Michael Kerrisk (man7.org) wr=
ote:
> On 28 October 2015 at 02:05, J=F6rn Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org> wro=
te:
> > Hello Michael!
> >
> > Just came across this.  When reading the manpage MLOCK(2), I assume=
 that
> > mlockall(MCL_FUTURE) does _not_ imply MAP_POPULATE.  But when readi=
ng
> > the code, I see that it does.
> >
> > This little detail can be rather crucial for RT-people, so it might=
 be
> > worth spelling it out explicitly in the manpage.
>=20
> But, this detail doesn't seem so surprising to me. MCL_FUTURE =3D=3D =
new
> pages that are mapped will be locked. Of course they must be populate=
d
> into memory when the mapping is created. Or: to put it another way,
> maybe it would help if you explain why you find the behavior
> surprising. That might give me a clue about what should be fixed in
> the man page.
>=20
> But, please take this thread to mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, and cc
> linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

Done. :)

I guess it is a judgement call now.  One fool (me) made the wrong
assumption and had to a) get into an argument with a coworker and b)
check the code to realize the mistake.  If fools like me are common, it
might be worth making this point explicit.  If I am the oddball, it
would be wasting file size and reading time for everyone else.

J=F6rn

--
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
