From: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH] strtod.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Wed, 22 Jan 2014 09:29:03 +0100
Message-ID: <20140122082903.GE29966@aym.net2.nerim.net>
References: <1390205712-10266-1-git-send-email-penght@cn.fujitsu.com>
 <20140120122841.GC29966@aym.net2.nerim.net>
 <52DDE4A6.5070405@cn.fujitsu.com>
 <52DE1182.2030704@gmail.com>
 <52DE15E2.2080607@cn.fujitsu.com>
 <20140121135244.GD29966@aym.net2.nerim.net>
 <52DF29C0.7080404@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52DF29C0.7080404-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2014-01-22 10:15 +0800, Peng Haitao wrote:
> On 01/21/2014 09:52 PM, Andre Majorel wrote:
> >> These functions can be safely used in multithreaded
> >> applications, as long as setlocale(3) is not simultaneously
> >> called to change the locale.
> >=20
> > I find the word "simultaneous" ambiguous when it comes to events
> > whose duration is non-zero.
> >=20
> > Is the problem as simple as this ?
> > 1) A thread is interrupted while it's running strto*().
> > 2) The other thread calls setlocale().
> > 3) strto*() resumes with locale data which is now inconsistent
> >    or invalid.
> >=20
> > If that is the case, how about :
> >=20
> >   These functions can be safely used in multithreaded
> >   applications, as long as the locale is not changed during
> >   their execution.
>=20
> The above sentence is OK, but I think added setlocale(3) is
> better, thanks.
>=20
> These functions can be safely used in multithreaded
> applications, as long as setlocale(3) is not called
> to change the locale during their execution.

This wording can be interpreted to mean that calling setlocale()
*is* permitted as long as the locale doesn't change. If that is
really what you mean, then no further objections from me.
Otherwise, my recommendation would be

  These functions can be safely used in multithreaded
  applications, as long as setlocale() is not called during
  their execution.

--=20
Andr=E9 Majorel http://www.teaser.fr/~amajorel/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
