From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: Error in man page: realloc(ptr, 0) is not equivalent to free(ptr)
Date: Thu, 21 Feb 2008 01:59:02 -0500
Message-ID: <200802210159.03465.vapier@gentoo.org>
References: <47BD19AF.4000101@trn.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1995177.HKOzvWdSKH";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <47BD19AF.4000101-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lasse =?iso-8859-1?q?K=E4rkk=E4inen?= <tronic-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1995177.HKOzvWdSKH
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 21 February 2008, Lasse K=C3=A4rkk=C3=A4inen wrote:
> The man page says that realloc(ptr, 0) is equivalent to free, even
> though it isn't. The text on the man page says
>
> ---
> realloc()  changes the size of the memory block pointed to by ptr to
> size bytes.  The contents will be unchanged to the minimum of the old
> and new sizes;  newly  allocated memory  will  be  uninitialized.   If
> ptr  is  NULL,  the call is equivalent to malloc(size); if size is equal
> to zero, the call is equivalent to free(ptr).  Unless ptr is NULL, it
> must have been returned by an earlier call to malloc(), calloc() or
> realloc().  If the area pointed to was moved, a free(ptr) is done.
> [...]
> realloc()  returns a pointer to the newly allocated memory, which is
> suitably aligned for any kind of variable and may be different from ptr,
> or NULL if the request fails.  If  size  was equal to 0, either NULL or
> a pointer suitable to be passed to free() is returned.  If realloc()
> fails the original block is left untouched; it is not freed or moved.

i would just word it to say that when realloc() is given a size of 0, it is=
=20
implementation defined as to the behavior, but it tends to match the behavi=
or=20
of malloc(0) (which too is implementation defined).  POSIX and C99 allow bo=
th=20
cases to return either a NULL pointer or a "unique" pointer.  glibc will=20
return a unique pointer (which cannot actually be used to store anything),=
=20
but uClibc may return NULL.
=2Dmike

--nextPart1995177.HKOzvWdSKH
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iQIVAwUAR70hN0FjO5/oN/WBAQKxbBAAyPynRVx9jdIri869pAYPUq6bWADHEeoQ
U1bo9II+tSkq+MN6+Gwftt2QLuE+9CEqng3PXLiRKr0i1hPIvrbaB8GP0bSRFr8A
BuZMePSkV4EiUTlrhQJvA9/aPN6ZeyeFLfNqi2D9t0HOKLmVn/ilNTZEovHP23Gi
1YSKxj6NFOX11ihaUor1BEo8FdV55vTXF3a0I6J3xiaHbMe9kHrNz0Kn37dXpnKP
Rf6QISYQHOZqEQKLzLV90unZS5soXiRefyw91iBT0u4AcoEEByrCbWGNhG1SUjo5
PrIflarMszQVYCWn1X7DCHNKpFBMTyrxFeakXFcof0jOU+TObIP7WkH6P1C+ZmYo
d4P5h+c3+owKU6lfV5X+92TljJGZUkBahfyLsbn0AxFl4J5kqeqVZkgLbTJQtUXc
cXPTrsTNO7pdFpoYytO9gE8kpE5xPZ1ER3zSoVrZLFL9E/M6qrsLoxr0yZrYJLsz
ppMfyjrqXaoOXdxbPlEk+h6llEtNYffTPbJZqibb3xt3HCHW46ARgvXTux7w684I
kp8uKAUNC1fCr5a3ozgRanFvTcjtmQz5gheI0LDIANQl029m7wjHtjxo91oUkZES
Szq7aKHD9c2hSEG5B4qcBwHjuDCy0lryJU6igeh89HBlOUkQofBeppsm322pCaB/
WA/DYGDXVxY=
=akgQ
-----END PGP SIGNATURE-----

--nextPart1995177.HKOzvWdSKH--
