From: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Subject: Re: readlink(2) handling of empty strings
Date: Tue, 30 Sep 2014 12:38:52 +0100
Message-ID: <1412077132.9388.99.camel@decadent.org.uk>
References: <1412033603.9388.68.camel@decadent.org.uk>
	 <542A655A.3090406@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fjE/eQuD2Yv4+9KJ1pZt"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A655A.3090406-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--=-fjE/eQuD2Yv4+9KJ1pZt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-09-30 at 10:10 +0200, Michael Kerrisk (man-pages) wrote:
> Hello Ben,
>=20
> On 09/30/2014 01:33 AM, Ben Hutchings wrote:
> > readlink(2) claims:
> >=20
> >        Since  Linux 2.6.39, pathname can be an empty string, in which c=
ase the
> >        call operates on the file referred to by dirfd  (which  may  hav=
e  been
> >        obtained using the open(2) O_PATH flag).  In this case, dirfd ca=
n refer
> >        to any type of file, not just a directory.
> >=20
> > The last sentence seems to be incorrect.  dirfd must refer to a symlink
> > that has been opened using the O_PATH flag.  (The symlink could refer t=
o
> > a file, directory, or nothing, but opening with O_PATH doesn't resolve
> > it.)
>=20
> Yes, you must be right. The existing text makes no sense; I suspect
> a cut-and-paste error as I went through updating some of the *at.2 pages.
> I've changed the text to:
>=20
>        Since  Linux  2.6.39,  pathname  can be an empty string, in which
>        case the call operates on the symbolic link referred to by  dirfd
>        (which  should have have been obtained using the open(2) with the
>        O_PATH and O_NOFOLLOW flags).
>=20
> Okay?

LGTM.

Ben.

--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-fjE/eQuD2Yv4+9KJ1pZt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVCqWTOe/yOyVhhEJAQrlsQ/8Dy/33VKoVZQjd6rVIypAdBXvQfac9jxu
2OPKkQgbDRljKp1kYzcKUjz3RZe0nEeOSkVnKiMP21XflC9ReXO1xBkZRX6Pvbyq
iiEi7zEDZxQ2MG0M6OikJ7GVW+oFCRZzDEiKY4dVhj+xbL3RMdsloTOwTj18dzEe
2UIxm1Ss57cdT29kfNkkPQ6o4SbVgv+ifHL99YavjyyXSK9axojeSSnK88lDRmZn
oFh3uknl4xDHA7Vap6wbK4JNaczXv8Yu4Whu220jyEG7u3B3Dl6HzTT/jUe7m9lO
plyld8VAHBwvPCP77dO3BYUCqKGnCn4OybFZXDnNRneZCSHrt6HOSUnhfN2kG9ET
hwIaqmkpqpPOecejZApadZ8kRUVvekoPpDInxPrG+r8tX+ITDW9o/lfSgMataSLj
fTt2uWSGHt1cD+KAGDG+giZkGJxeyH92HyHYsOH9kjdBBNpITTfM7hZ6Mr6uYqOI
J6D/uHJy8pRDjPTpbpROjWHN2Xi3nHmdegdrWbCSdF6CVYt9rkjNUnN0/L+JtStz
Y99Y3hwRmqHqnz3dWF3CVVf+UmMTJdi8jkZjV+Ro8mIcWrqU/KrEiAE/mgRKseI+
jw+4vnq0r+blYzBWXbcWLNAy+v19DbKpBMmueTflahC/6kuNcPK+uAS8HlbUObAI
QvWMXX37z3s=
=xJpq
-----END PGP SIGNATURE-----

--=-fjE/eQuD2Yv4+9KJ1pZt--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
