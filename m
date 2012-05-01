From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fork(2): add ENOSYS
Date: Tue, 1 May 2012 11:49:33 -0400
Message-ID: <201205011149.34086.vapier@gentoo.org>
References: <1335847802-15646-1-git-send-email-vapier@gentoo.org> <CAKgNAkjx1a002xLYEYtgJr8Luy8mKSiWo8J8ZT+aYbzhVrRz5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4946428.JDVtY5Dn0E";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjx1a002xLYEYtgJr8Luy8mKSiWo8J8ZT+aYbzhVrRz5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart4946428.JDVtY5Dn0E
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 01 May 2012 01:38:35 Michael Kerrisk (man-pages) wrote:
> On Tue, May 1, 2012 at 4:50 PM, Mike Frysinger wrote:
> > --- a/man2/fork.2
> > +++ b/man2/fork.2
> > @@ -184,6 +184,10 @@ capability.
> >  .B ENOMEM
> >  .BR fork ()
> >  failed to allocate the necessary kernel structures because memory is
> > tight. +.TP
> > +.B ENOSYS
> > +.BR fork ()
> > +is not supported on this platform (e.g. a no-mmu setup).
> >  .SH "CONFORMING TO"
> >  SVr4, 4.3BSD, POSIX.1-2001.
> >  .SH NOTES
>=20
> I'm curious. Which architectures currently do this, do you know?

ones w/out an mmu ;)

looking at 'config MMU', arch/*/Kconfig, i see it could happen to:
	arm blackfin c6x frv h8300 microblaze mips xtensa
=2Dmike

--nextPart4946428.JDVtY5Dn0E
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPoAYOAAoJEEFjO5/oN/WBu4MP/jqttOzBFGWWW8lxaLOKZmbR
PNXJYDoZRfiVe8dUixsdBAkgDMFtC5dj5euasUeMOuINR69ZI7bvBeNCXAedGbBx
jc5Idwg8cbBkt1Kb/VLyi8bNfWz+iCX6bwpw2Fs2luFjPQBKyABB1Hw41Oy/o24y
zyJxS62D10jhUVcG9kE/0RPuD5PRiLY6Ua90A2VUjsUzMAccP5Z4RcwlpIsyYbrz
EkOz1tChTIxmmMYjMDMP76ovqUQHI3e0IfLNQUobQvtxHCgdsULZZSaFTUoi+maA
/vFb1KhbAYBsXr/CiDIu3vzq9aUVfLFSZ1kGHyNznv8Y0LxVsqBoIc0NipHy49Za
fZ2v7CxU2tRFsn4eMWfLukv9A8jO8qFUXp4NDgLUx91+Tyil0ccwG2D7rOyVPFRq
CafOXqZTXjam8g1ac2X2nuI+V6Z6qYxmzWx2IAMLOAr4e0/K6x25PxWUrADx7+Eq
rfYtgqAaHvO8/iXZB82NeYLeGTKJgh2UDHts1AxBYVMXbdTFH1ohS9XESCSk4A0o
Pr8hkaIUvzgzghaJPC26mbwgDFkQYQhgKVi8YErXQbKeRqlkl1rBaKUEC80FDjvP
N7SoLBO2ziREBUJF6nBgKKUSgp/1gvtl3q/4lWbzlsPOm9TX2/vXHq5mo6WNWt6A
7VMTlFrnAQ5oypqdU0jq
=FZLH
-----END PGP SIGNATURE-----

--nextPart4946428.JDVtY5Dn0E--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
