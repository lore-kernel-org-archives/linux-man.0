From: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Subject: Re: BLKGETSIZE64 not documented
Date: Fri, 17 Jan 2014 14:40:34 +0100
Message-ID: <20140117134034.GB29966@aym.net2.nerim.net>
References: <20140117093029.GA29966@aym.net2.nerim.net>
 <CAKgNAkgbDWs5wa9hi11ACk5abJONDe3xsLb+FpdJuKQeEiyjfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgbDWs5wa9hi11ACk5abJONDe3xsLb+FpdJuKQeEiyjfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 2014-01-17 23:03 +1300, Michael Kerrisk (man-pages) wrote:
> On Fri, Jan 17, 2014 at 10:30 PM, Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>=
 wrote:
> > [Re-sending this as it seems to have fallen through the cracks.]
> >
> > No trace of BLKGETSIZE64 in
> > www.kernel.org/pub/linux/docs/man-pages/man-pages-3.54.tar.xz
> >
> > I think it should be listed along BLKGETSIZE in sd(4).
> >
> > Probably applies to fd(4) and hd(4) too.
> >
> > And of course ioctl_list(2) but completing _that_ one sounds
> > like a major project in itself. <g>
> >
> > Note that /usr/include/linux/fs.h quotes the argument as being
> > "*u64" but I believe that it would be better written as
> > "*uint64_t", which is standard.
> >
> > There may be other related ioctl()s missing, like those used in
> > blockdev(8), I'm reporting the one I'm sure about.
>=20
> Would you be able to write a patch for this?

Hello Michael. If I knew how to list which ioctls a device
supports, I wouldn't need the man page. :-/

--=20
Andr=E9 Majorel http://www.teaser.fr/~amajorel/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
