From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: import queue(3) man page ?
Date: Sun, 26 Oct 2008 05:00:38 -0400
Message-ID: <200810260500.39607.vapier@gentoo.org>
References: <200810260058.02527.vapier@gentoo.org> <200810260422.47918.vapier@gentoo.org> <20081026083055.GA9020@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1697254.dJgUjmXOnb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081026083055.GA9020-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1697254.dJgUjmXOnb
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 26 October 2008, Christoph Hellwig wrote:
> On Sun, Oct 26, 2008 at 04:22:46AM -0400, Mike Frysinger wrote:
> > it's the "updated" part that's the rub.  stock glibc has an ancient
> > queue.h while we've been updating it in Gentoo.  i thought i checked and
> > found that man-pages simply didnt have one, but it's more a matter of it
> > being old.
>
> When I imported queue.h it matches what was in glibc back then.  I tried
> updating queue.h in glibc around the same time, but Uli doesn't like it.

yeah, it should get updated or punted already.

> Updating the man page to reflected some distro fork of the header
> doesn't seem like a good idea.

i wasnt suggesting we do that.  i was explaining why i started this thread =
in=20
the first place.

> And at least five year ago all the maintained BSDs actually had quite
> different additions to queue.h, so which one to pick would be rather
> hard and I at least partially understand Uli's rejection.

meh, having an outdated one is just as bad i think.
=2Dmike

--nextPart1697254.dJgUjmXOnb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJJBDG3AAoJEEFjO5/oN/WB/d8QAKu43Q98Xwb187vuSBFI98Ah
NSuxK0YQ8WuKzAsNJaKsuX1Pji5WPMmtZ0Cg0M1I3eyQXtR8zVDdoD7psb7E5o2O
XDEPgNG5KP9njPyEr33cwN2V811YnNXkV9a/IPXa003rFOariAYyuKbkiAaO7BM8
2wxfdhWR2J4bWxrHPAEhpd70Hn+NDCeIa50uzNTEGn/p9ZR7grmdwHCGKkAZ4cbq
3Olqf3MTYdp7e/jMy2uaEX+l9DdE98UpmDL4xMXG8IoteTZ/LYy9wjC3AnmQ3hYl
pOA9p6eNUnt+2/579ryd6OMUlIQmGJXag4lqhMC9+bFE8Id0fYAof/i8L6rSd/vj
ojnNAul4TCfFBZkHYKuMptOxiylSgREs5vq02WAYKz0yHfIrzssk6wFzmOGUA4tm
pRihR47GwSHtfg92mllDOHU4immKL6bknIbdquLG8cwET19oENW14tgJ5WpSYGhy
HnDUBMaFfqCBynTAHAWeNRmJ5/VnylxcrGi2+1TCrK7V/ApN8DgB5qt6ftuVlWBQ
buL3UY8kTIcm0TATKEXlHEfM63M7kKFjvXyMzdnMSLSq9jZgcljCb0yC+WRjrEEA
M0MYbiamLHVOc+5bJ9jFC7/QbSAgPoad4JYOqc31GndO3kvewJRYqUG5N2NaOC5N
lzv00yWta8rrdl4K0ugl
=+wic
-----END PGP SIGNATURE-----

--nextPart1697254.dJgUjmXOnb--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
