From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH mtd-utils] include sys/sysmacros.h for major/minor/makedev
Date: Mon, 18 Apr 2016 12:49:08 -0400
Message-ID: <20160418164908.GR5369@vapier.lan>
References: <1460860245-14895-1-git-send-email-vapier@gentoo.org>
 <20160418163926.GB52272@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7a4X6VOqfbl9xMrG"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160418163926.GB52272-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org


--7a4X6VOqfbl9xMrG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18 Apr 2016 09:39, Brian Norris wrote:
> On Sat, Apr 16, 2016 at 10:30:45PM -0400, Mike Frysinger wrote:
> > These functions have always been defined in sys/sysmacros.h under
> > Linux C libraries.  For some, including sys/types.h implicitly
> > includes that as well, but glibc wants to deprecate that, and some
> > others already have.  Include the header explicitly for the funcs.
> >=20
> > Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>=20
> Patch looks fine to me, thanks. Pushed to mtd-utils.git.
>=20
> But I don't see this change documented anywhere. (Helpfully, I do see
> the change from your other patch -- _BSD_SOURCE -> _DEFAULT_SOURCE --
> documented though!) Should the man-pages project be updated? I see the
> latest makedev(5) still recommends #include <sys/types.h>.

glibc hasn't moved forward (yet).  we should update the man pages now
though to mention sys/sysmacros.h.
-mike

--7a4X6VOqfbl9xMrG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXFRAEAAoJEEFjO5/oN/WB0nAP/i/PVPI0n2jp5RuhguMuP0Ap
vEXT2rP6IWW5xg5fLMcE8fzjII1k+OBXdQAceIgz1Qku660YhWARBMVrH2sBkGpM
ThH1R2IO8V3dNFd9x4PHz5IoqLlo4vcV5lO55SQmxj3ZrR/M2xsstgqoJUxTh8X8
mjljSE/c4z/tybDdClgUR4sBbmpz09CpN8TqBN9J8UfVaXjwJ2fbTRuD79n5f6NV
1bloJz2RDtpYFCfxqr9HYij6PY153l1Ah18zftBp1kauGB2L3VXE5GAEjqjbPpDD
5s5HJURgAPdiVNuikuB9Jr4QNoAI3Vcb6SA7QoawHjfU5eyvhVrXy+MuFIVM6oJo
vxmvSmHecWBYNmEAjriuPH7F8mTsVOrsQtqBMs4VclnFswm/jEVwt0NXxnah4ci9
JdGBQbW8zEdLc6nkQNfR9goWB9xnxoqS/as6if06ToXqAiIu97LjJM8QMDvqCf2Z
HVNem7V/n6Br6/sWqvvO6ykrND7LfbMXI/c0zG6n38bWF2zw2hx1iFyie1tfem7+
WImpDEbXIlmOvVTD6Y9b6XVrNbEZOvAXHkbNXpx01CQvySLPeLUe1ouaVs2Unlig
oEEukBJJZHmBcVqidxLU9jQw0EUvzh3yQj6gZWEI8TyWEjHyi8MrXC3orRhTemVA
rzIUoPkw0K7UYOxr1MB1
=TPB4
-----END PGP SIGNATURE-----

--7a4X6VOqfbl9xMrG--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
