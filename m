From: Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] pow.3: Add note on performance characteristics of pow
Date: Fri, 17 Oct 2014 13:28:45 +0530
Message-ID: <20141017075845.GL1552@spoyarek.pnq.redhat.com>
References: <CAESRpQDx5TfgfRp1q69NiuCB5ve8+fR1NC2up9h5LOkogMKkqQ@mail.gmail.com>
 <5440A816.8000002@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AzNpbZlgThVzWita"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5440A816.8000002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Manuel =?iso-8859-1?B?TPNwZXotSWLh8WV6?= <lopezibanez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--AzNpbZlgThVzWita
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 07:24:38AM +0200, Michael Kerrisk (man-pages) wrote:
> > diff --git a/man3/pow.3 b/man3/pow.3
> > index d0a2ea8..3d2151a 100644
> > --- a/man3/pow.3
> > +++ b/man3/pow.3
> > @@ -320,6 +320,17 @@ The variant returning
> >  also conforms to
> >  SVr4, 4.3BSD, C89.
> >  .SH BUGS
> > +On 64-bits,
> > +.\"
> > +.\" https://sourceware.org/bugzilla/show_bug.cgi?id=3D13932
> > +.BR pow ()
> > +may be more than 10,000 times slower for some inputs than for other ne=
arby
>=20
> I plan to change "some" to "some (rare)". Sound okay? The point is not to
> worry people that this is a problem that is commonly encountered. (Or is =
it?)

Rare is OK, these points don't occur very frequently.

> > +inputs. The inputs that produce such behavior are different for
> > +.BR powf (),
> > +.BR pow ()
> > +and
> > +.BR powl ().
> > +

The slow fallback is only taken for pow, not powf or powl.

Siddhesh

--AzNpbZlgThVzWita
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUQMw1AAoJEHnEPfvxzyGHQ9IH/01oijGhD/rSH4jd4sALfDB3
IlbOwPQDc7XDBy5wgDiEMfd5H9bS1BNHTKOo1ndTIo4SnrKDt+LzvICThlDPrymO
5kf3yHLKA+fTDCF6WgFQyj966h+iRUv3J71IrV8KvuBexuGLblOwr24oj6sFtmzL
qA9e/O0kTGYYcP4SRTKrORzVAwWHzlpJlwBBx62clKohlGCVLKUckccgcAqnuDal
4fc90DwoAJS0ghlRNGnv45f09tZI05jXpwHC0Se/ajZd1LjZNRwuKWBdrubvMk73
j2ayLWgBJx2UajUjOfeu9Fd0Lr7Uws3pcVrqhh8PVn3wIqrVvOIc+PWQ9F5+9Mg=
=gKXt
-----END PGP SIGNATURE-----

--AzNpbZlgThVzWita--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
