From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] Improve support for compressed man pages
Date: Mon, 18 Apr 2016 14:30:24 -0400
Message-ID: <20160418183024.GX5369@vapier.lan>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
 <20160416045058.GS6588@vapier.lan>
 <20160416183013.352f4ba6.alex.miller@gmx.de>
 <5714D9D2.8050501@gmail.com>
 <20160418191026.7fa8c669.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nqu5fpgjE+BQlEdo"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160418191026.7fa8c669.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--nqu5fpgjE+BQlEdo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18 Apr 2016 19:10, Alexander Miller wrote:
> On Mon, 18 Apr 2016 13:57:54 +0100 Michael Kerrisk wrote:
> > On 04/16/2016 05:30 PM, Alexander Miller wrote:
> > > On Sat, 16 Apr 2016 00:50:58 -0400
> > > Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > >  =20
> > >> imo, we should just drop all compression support.  distros already
> > >> handle this properly and pick whatever they want/need. =20
> > >=20
> [...]
> > >=20
> > > We can drop compression support or do it right - I'm fine with
> > > either option. We shouldn't keep the status quo, though. =20
> >=20
> > I'm inclined to say drop it. Would you mind putting together a=20
> > patch, Alex?
>=20
> I'm not sure what exactly we should do.
> The problem isn't really compressing the files, but the "screen"
> and "uninstall" targets.
>=20
> If we drop support for compressing man pages ourselves, what shall
> we do with those targets? They aren't useful for distros either.
> And they *still* might have to deal with files compressed by the
> distro's package manager (if a user tries to update manually).
> We could
> - drop "screen" and/or "uninstall", too
>   (getting rid of the problem and simplifying the Makefile but
>   being inconvenient for users);
> - fix them to handle man pages compressed by the distro
>   (but not compressed sources, resulting in only slightly simpler
>   patches than those I've posted);
> - or explicitly state "screen" (and maybe "uninstall") don't support
>   compressed files. This is problematic IMO, especially since they
>   are used by "make all". Moreover, "uninstall" can remove .gz/.bz2
>   files but no .xz files right now; this could be changed to include
>   .xz or to exclude .gz/.bz2.

imo, drop the screen target.  for uninstall, that's a semi-common
idiom that packages have (and autotools supports out of the box).
keeping that sounds fine.

i don't think we need to worry about supporting `make uninstall` if
the package was installed initially by the distro -- you have to deal
with version skew of course which pretty much no one does.  just make
sure `make install && make uninstall` works sanely.

wrt compression, we could be lazy/greedy here too.  when we uninstall
locale.5, just rm locale.5*.  in practice, this is unlikely to be an
issue ...
-mike

--nqu5fpgjE+BQlEdo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXFSfAAAoJEEFjO5/oN/WBJBgP/2IoAVnSh32e9MVEfHmK9RSL
/gJs1DMie1Ju6iFzHAlyQVwwv5nGoglnoDc73gJ8nR3s3enF4EEj5HXxg3JUqhpl
F+tyi0wfvGhVwu+hFIc0bX7IF1JHLx8sLiO2mDVhIWoYDBm7zW+dcGo2PCJM1m5k
bYIAyON0kG0nuH9cC9OYHsNOSFF895wo8CSI4Aqu7pWF5w/EM3W7BgTSGfIM+dUt
KJ3jxm1vnTrgAM7nYUY7XW/W8upgDAN5Hah7gh0n6eeSNfaM4CVlTgdfeqaCf+wq
HkvZ5eE6n88eLPWmHFuHm2kZgDUGy5IsVsSRKh3J8TBRywcksi7//yTMj/aywVzK
gesnE+5yP1ziivBll7derXfxgu6bC0sB3Khecag99njAiy68CIIGHkCLF8c8GqB5
i3DrxnHWtUlVOXwoo8NXZ5TpY5DK5DpylHlrp3uo+Qps79gZfBSTrWqclSgu+ykC
hr5u0w7sy0rwNkru8jBbdzdt/TMun6p3CUCxzhvaXPJpMjo/X7e+11sfpBEQM3ul
X46r5qKJ4Mf/oY2fp9MD5B0WWag+3DHzCDKzZeX0x+/0lAPWrZNCKgV5M09zLsKE
N3SAajNjc9lH5RjmvSCaC8Q0KIuwlOo6CXVn4OzlH/ahmi9elu/32JdnJume3zhh
HG/K3OzDwD1tz6iWxvIo
=bE6R
-----END PGP SIGNATURE-----

--nqu5fpgjE+BQlEdo--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
