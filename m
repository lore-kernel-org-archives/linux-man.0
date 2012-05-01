From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fork(2): add ENOSYS
Date: Tue, 1 May 2012 14:33:09 -0400
Message-ID: <201205011433.10803.vapier@gentoo.org>
References: <1335847802-15646-1-git-send-email-vapier@gentoo.org> <201205011149.34086.vapier@gentoo.org> <CAKgNAkiHQX4o0EiVW53W=PQbgp+RW6-LMqY7NpOb+4bGPdHFQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6408807.IXzpl9MBAV";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiHQX4o0EiVW53W=PQbgp+RW6-LMqY7NpOb+4bGPdHFQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart6408807.IXzpl9MBAV
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 01 May 2012 14:21:36 Michael Kerrisk (man-pages) wrote:
> On Wed, May 2, 2012 at 3:49 AM, Mike Frysinger wrote:
> > On Tuesday 01 May 2012 01:38:35 Michael Kerrisk (man-pages) wrote:
> >> On Tue, May 1, 2012 at 4:50 PM, Mike Frysinger wrote:
> >> > --- a/man2/fork.2
> >> > +++ b/man2/fork.2
> >> > @@ -184,6 +184,10 @@ capability.
> >> >  .B ENOMEM
> >> >  .BR fork ()
> >> >  failed to allocate the necessary kernel structures because memory is
> >> > tight. +.TP
> >> > +.B ENOSYS
> >> > +.BR fork ()
> >> > +is not supported on this platform (e.g. a no-mmu setup).
> >> >  .SH "CONFORMING TO"
> >> >  SVr4, 4.3BSD, POSIX.1-2001.
> >> >  .SH NOTES
> >>=20
> >> I'm curious. Which architectures currently do this, do you know?
> >=20
> > ones w/out an mmu ;)
> >=20
> > looking at 'config MMU', arch/*/Kconfig, i see it could happen to:
> >        arm blackfin c6x frv h8300 microblaze mips xtensa
>=20
> Thanks Mike. Patch applied. (But I couldn't see how one deduces that
> mips is on that list.)

ah, i guess no-mmu mips hasn't been merged yet.  i thought it had (much lik=
e=20
arm no-mmu finally was).
=2Dmike

--nextPart6408807.IXzpl9MBAV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPoCxmAAoJEEFjO5/oN/WBZd0QANFdqWQPiYjphThsb25MWtRd
co3aKxKazIpnwRN7dPqEyRxGtoq7dLrGT9X8Tro4kdrIqNGrbkdTe0gfekNtC2TW
F9QJRTLFMx04Nyv33Ig/piiaSgrE7b+lbD1dDXSmQfF3i19lJZgLPO1idapWN4Lx
Kqy8ZjnByTHBXhjKSRfFbwX3lEaEpxQhVt145bszyFphTR4LHWHY6wjLux6L3Ta8
Q+wCagTaPQDDshYrOsFSjw3+RMVislcCKj1yMFBaWbJRm33pnH7xhptoxJG3W7af
jyuoBy8ivNgla1TJs04Jp841txbyYPAuU9DckxVC+6rhUAQaajcNngVAvD0jHvLl
DY3biAMwTt9xDjvSMvHERm20Jm6wtvDWRsTTDB9ra0eLKguntXOoesKU8aBIKzTP
1kFPIy07T9QwtLGO87UysKu32mTCXW2uAMOuwOVW+CijQKWWGnCD94KyrtWk2o7z
ruM4k0Zrawu2MkaagosFus2B0qv1s2Fj+tdgUWkY4ydrXXQtjW+OVT8SYb7KVZce
ZNGW9wkMnhyuCpylx0EQmkiovD0bMwUkB1yRzLH8X+RpQrqqBv1Iqe5jciyw6LrI
SFtrmXsoJaslvCcsf4VjS7tR/f7/r+ooB32nhOFfSnN13jbU+G4nEmzFvkYyJAUo
JSfzcHzAfahO0SurdOnP
=Ompr
-----END PGP SIGNATURE-----

--nextPart6408807.IXzpl9MBAV--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
