From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] proc(5): fix indentation for net examples
Date: Tue, 31 Dec 2013 00:43:48 -0500
Message-ID: <201312310043.48914.vapier@gentoo.org>
References: <1388237204-12791-1-git-send-email-vapier@gentoo.org> <52C15897.5060309@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3261719.ILAfvW54If";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52C15897.5060309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart3261719.ILAfvW54If
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 30 December 2013 06:27:19 Michael Kerrisk (man-pages) wrote:
> On 12/29/13 02:26, Mike Frysinger wrote:
> > Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>=20
> I'm not sure what the goal of this change is. What's broken?
> (Note that there is some value, in terms of easy parsing of
> man output, to having only the section headings start in
> column 1.)

i'm not sure what you mean here.  having it at col 1 makes scanning the man=
=20
page harder imo, and indenting it to match the content that it's part of ma=
kes=20
sense.  it's what most every other section does in this man page already.

if you're worried about 80 cols, then this table already widely exceeds tha=
t=20
limit even when placed at col 1.  so fixing the indentation doesn't really =
hurt=20
that scenario.
=2Dmike

--nextPart3261719.ILAfvW54If
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSwlmUAAoJEEFjO5/oN/WBhs8P/AkQfEYcYDxKR1akVBVuOZNB
0stV7DM50nBVDxq7ceiAuhKRJttEFG91r5dopbn/uS3h/HrHhzDBLISMtqXy0rmv
SohTQl2Zj++0UZykJhdG0B26VE59doQWCv/gjBry1cP9rMw6hmm3MOm4EKR6t/ng
Em0Dguld+jyHakJWRJE9nDFHakwHWeed4rZn0RY6sA755DX7LCR0+bCS2kfQqqi4
hLobp7SWzj6fZw1IzVBJNKCJckgf/epaEEknwziki9Cr8HSk/xg2RMuUwQ44ZSw0
gr4JLiA/T2jdoNXYIuLGxHOWn2OD/LLPs3ckwkBScepMB71KJLxyDJ1yoSBA9NOo
eRyIiMF9MwQ/KBdWDnYwH2TehgWjtkknn1K1gKUrILnWYtRRvy/iOdnHFiIUdZ7h
MeyGfnDR5FolhOckg01ljOipEJ1etKzVxykVeuadJjag1d1u0fS2jKzffjiJ4lUO
hhQoaH2LAUVBiLIUnAttsibwV97lMSinMmNwd374/KXmvXrPOzoawa3tFMs2Rsp5
Gegh+6K/QmBqZWBH5aq4Nltqhfam4ZxXElMTIW52D0q4tStgbI+9twMzTiLb0Opb
vlKWSDOLK9zmQZd5GIf5xwuLz6YWRL1GiqsMI4bJEd7GjbLlEW5T7ynqmOtI8LsX
U2LIn0gYUZWO1M0KXa97
=a2Rb
-----END PGP SIGNATURE-----

--nextPart3261719.ILAfvW54If--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
