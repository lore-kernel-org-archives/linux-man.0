From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] ld.so.8: clarify synopsis
Date: Thu, 20 Oct 2011 14:51:08 -0400
Message-ID: <201110201451.09734.vapier@gentoo.org>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net> <201110201426.07094.vapier@gentoo.org> <CAOnWdojWj5PYAp7ANX_qmvTJjR9EicSy0yG5LUTumOxQTpmQAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1352787.PLZv7nkium";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOnWdojWj5PYAp7ANX_qmvTJjR9EicSy0yG5LUTumOxQTpmQAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Cc: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart1352787.PLZv7nkium
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 20 October 2011 14:28:39 Reuben Thomas wrote:
> On 20 October 2011 13:26, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > On Thursday 20 October 2011 14:17:39 Reuben Thomas wrote:
> >> On 20 October 2011 13:08, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> >> > On Thursday 20 October 2011 03:04:12 Jonathan Nieder wrote:
> >> >> +.RB \*(lq /lib/ld-linux.so.*
> >> >> +.RI [ options ]
> >> >> +.I program
> >> >> +.RI [ arguments ]\*(rq.
> >> >=20
> >> > can we avoid lq/rq ?  it's pretty uncommon and imo, just useless
> >> > noise.
> >>=20
> >> Au contraire, proper quotation marks make man pages more readable; to
> >> be encouraged.
> >=20
> > sorry, my point was lq/rq vs "", not lq/rq vs nothing ...
>=20
> In that case I retract my retraction: I'd much rather have curly
> quotes. They're more readable and they make it easier to tell when
> quotes are part of input/output (in which case they're straight).

it's uncommon in the man-pages tree.  if you want to start a discussion abo=
ut=20
the style in the tree, then feel free, but please don't introduce deviation=
=2E =20
do it right from the start.
=2Dmike

--nextPart1352787.PLZv7nkium
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJOoG2dAAoJEEFjO5/oN/WBfpYQANB110kQsLy27iPPYUYL9zfc
vR+5nM99obnvZ8HQiZrfVVW1SWfi8rK2nkLew2rQx3OtCVtz5UKtSCeLOeUXbUbt
6IsCNnXyKiDDDcxmFuLDqlwHpMcwFlNY/IfEofPtP/yrUpU7rZr6r2vO5OxouN0M
a+eFLBaEklNoefNWMTOO7Sqit6NJqjdJErEAD5W2JWkImUdJ8ik/s4aFibKNSzsU
V9lLba8AdFjNSFgjqVk6arQOg7giVsQL/gGIp4+JerXbyMtN6hJTU+OViEWQgJPo
LHbMg1wlnOQoHIGnucYvvyZrWHa9g4ZXBFsGsCiqPIkzgOdKt2dyFiq6SPbU9+fZ
C/6fsFbs/awdb/iMKvH2ljen9e//PciS042uc7gLpPgPlxbdbf2IQfR81l9XCdaS
OhWm4MbjMGUmrSrto721oAkwrQ1tmwTno8nziAC/qq7zIaFTxI38UmUjNv669gph
0/sqoTb6JKIS502Roi2W9GmZq0yLGARnaH6FF0UnI1eIKx3MIJoF+x659Tvk6aMm
VYM+IzcLkL0B9M8T73KtqGk7iZsi+wde2FrmPi+rVEY6usXsWT7WmRB4pcq7t9ks
fpreZekB41sy+yPMSFflA45YIpfAkCp1jaki6NXc8zzGiML5duLizs8t7xfrZHY2
NFmqDoEO0bNZv9M/kMNK
=nHas
-----END PGP SIGNATURE-----

--nextPart1352787.PLZv7nkium--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
