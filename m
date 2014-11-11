From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: ioctl_list.2: complete overhaul needed
Date: Tue, 11 Nov 2014 02:52:42 -0500
Message-ID: <20141111075242.GB28132@vapier.wh0rd.info>
References: <545F8D2E.5030308@gmx.de>
 <5461B768.7040603@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5461B768.7040603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11 Nov 2014 08:14, Michael Kerrisk (man-pages) wrote:
> On 11/09/2014 04:50 PM, Heinrich Schuchardt wrote:
> > The list contains hex values of different constants. I just wonder for=
=20
> > which architecture (alpha, i386, mips, or sparc at that time). No=20
> > information is supplied.
> >=20
> > Current values depend on the architecture, e.g.
> >=20
> > On amd64
> > 0x82307201      VFAT_IOCTL_READDIR_BOTH
> > 0x82307202      VFAT_IOCTL_READDIR_SHORT
> > 0x80047210      FAT_IOCTL_GET_ATTRIBUTES
> > 0x40047211      FAT_IOCTL_SET_ATTRIBUTES
> > 0x80047213      FAT_IOCTL_GET_VOLUME_ID
> >=20
> > On mips
> > 0x42187201      VFAT_IOCTL_READDIR_BOTH
> > 0x42187202      VFAT_IOCTL_READDIR_SHORT
> > 0x40047210      FAT_IOCTL_GET_ATTRIBUTES
> > 0x80047211      FAT_IOCTL_SET_ATTRIBUTES
> > 0x40047213      FAT_IOCTL_GET_VOLUME_ID
> >
> > Hence hex values should be removed.
>=20
> It sounds like you are right that the hex values should be=20
> removed. But, how did you determine those different
> hex values above? Grepping the sources, it's not
> obvious that amd64 and mips should be different.

ioctl's can integrate the type size right ?  so wouldn't be surprised if it=
=20
changed across arches.

fwiw, strace carries a script to try and do all this magic automatically:
http://sourceforge.net/p/strace/code/ci/master/tree/linux/ioctlent.sh
of course it misses out on ioctls that aren't exported in headers and are=
=20
internal to specific drivers.  i.e. it's not perfect at all, but that's bec=
ause=20
ioctls are a goddamn mess :).

i agree though that the man page should drop hex values as they aren't usef=
ul. =20
if you're using a "standard" ioctl, you should get it from the relevant hea=
der=20
file.  if you're using a "non-standard" ioctl, then you get the pieces.

> > I further suggest to remove all documentation of structure details.
>=20
> Could you elaborate this point a little. Some examples, and
> why you think they should be removed. I'm not disagreeing, just
> looking to clarify what you mean.

i think for the common/standard ioctls, it's useful to have manpages that d=
elve=20
down into the details.  but for the fringe ones, it's a waste of time for t=
he=20
vast majority of people.

maybe one way to determine whether it's worth documenting, see if strace ha=
s a=20
decoder for it :).
-mike

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUYcBKAAoJEEFjO5/oN/WBIe4QAMb+2BRdRvHZTNp7CdtF2eBI
Vj0B7ceqpkR+UmV3QqoTbeaLAJL260mTGN1L5zQ7+Uk85u7dpbRr3poEFjTnBUwD
qeM5G60PZQUUwJnWNhyxd784kM/AOTLBbsyMFEOXpZRKaaa2uN4VpjK3xjAer03s
Le2OChE4wAKGnuvdRkGLUqFCLrl4ilOb3yKCAJZqLl2E3LHK3hmPhsgZgsEbJiHR
bzOMl3UeUPTCwbQZbkaD/UeJtuozc+wGZ+ksHP4dESSYjMIUAYzV47IGfmbUdpjC
ePPBRra9Cd15BhbFXOSKclGWC3O6IJKbcoALGf3S3j5keGD3Rs0o/8g7rviPSZaO
ygu+m71tztPK9QO4YBC7wrTbet+ykVSuBlL0z05g+M/+wg9M7n53R2jcktnEujgE
R7qXbBjkdV4fgUXTdOysSMxYZn6QZN9kNaalmT1IPiuhp7eDBSYsVwhhZTmrBR29
4yWu/Krp5FWB3f9/3SRQR7YfKJfE285T7Qa51zRS4nYaWJQbWGbyEq+iwCiRgzkT
DDFPzQxbb/nFWLkwu9kwNSmZzln46AyomP3Pa64PMI8yP+bO7XKDjEZdrp2wryxd
X1ynXjPAK54wHkiPuEsrMAMgPqEzJtgLxCRRPNRQ9pL8aw1C/8z7wmLMKL7K3PFh
jU1P0kF3mMnFYGxGUD4+
=G36K
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
