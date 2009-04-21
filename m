From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: man-pages-3.21 released
Date: Tue, 21 Apr 2009 11:05:29 +0200
Message-ID: <20090421090528.GL21271@machine.or.cz>
References: <cfd18e0f0904202202l3f50bde9yd0085e0797a553e3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0904202202l3f50bde9yd0085e0797a553e3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  Hullo,

On Tue, Apr 21, 2009 at 05:02:25PM +1200, Michael Kerrisk wrote:
> Gidday,
>=20
> The Linux man-pages maintainer proudly announces:
>=20
> =A0 =A0man-pages-3.21.tar.gz - man pages for Linux
>=20
> This release is now available for download at:
>=20
> =A0http://www.kernel.org/pub/linux/docs/man-pages
> =A0or ftp://ftp.kernel.org/pub/linux/docs/man-pages

  can you please push out your current tree?

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes =
in man-pages-3.21 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>=20
> Released: 2009-04-15, Los Gatos

  Isn't this date wrong?

> Changes to individual pages
> ---------------------------
>=20
> initrd.4
> =A0 =A0Michael Kerrisk
> =A0 =A0 =A0 =A0Various minor wording improvements
>=20
> initrd.4
> =A0 =A0Frank Dana
> =A0 =A0 =A0 =A0Add missing word in description
>=20
> feature_test_macros.7
> =A0 =A0Michael Kerrisk
> =A0 =A0 =A0 =A0Update for glibc 2.10 changes to <features.h>
> =A0 =A0 =A0 =A0 =A0 =A0From glibc 2.10, <features.h> understands the =
values 200809
> =A0 =A0 =A0 =A0 =A0 =A0for _POSIX_C_SOURCE and 700 for _XOPEN_SOURCE,=
 and makes
> =A0 =A0 =A0 =A0 =A0 =A0corresponding changes to defaults for other fe=
ature test macros.

  So far I was guessing that man-pages are supposed only to have change=
s
in latest released glibc version when they aren't in flux yet. Is the
policy different? Or is it just a "common sense" policy that changes
that are obviously fixed already are included?

--=20
				Petr "Pasky" Baudis
The average, healthy, well-adjusted adult gets up at seven-thirty
in the morning feeling just terrible. -- Jean Kerr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
