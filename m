From: Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] getgrent.3: Add ENOENT to error list.
Date: Wed, 10 Sep 2014 20:23:07 +0530
Message-ID: <20140910145307.GC14885@spoyarek.pnq.redhat.com>
References: <54105ED1.5020206@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54105ED1.5020206-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simo Sorce <ssorce-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Hrozek <jhrozek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2014 at 10:23:13AM -0400, Carlos O'Donell wrote:
> It's possible to get ENOENT returned from getgrent
> if the backend, for example say SSSD, isn't configured
> or the daemon isn't running. The same can be said of any
> of the NSS backend.

The daemon not running is internally a NSS_STATUS_TRYAGAIN +
EAGAIN[1], i.e. that is what the sssd nss plugin should return to
glibc.  glibc then should return that as a NOTFOUND, which for
getgrent is a NULL return without errno set.  I don't see why ENOENT
is necessary.

Siddhesh

[1] http://www.gnu.org/software/libc/manual/html_node/NSS-Modules-Interface.html
--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUEGXSAAoJEHnEPfvxzyGH+KUIAI+QvHi0H9B/k/W1fjSWGlq9
S6jByEbMlwUA/N6DI8iGGdS8yr11XL5Tx0BU33HXd8bmf+09SsWdq7mAE60TTlGD
/4UNYmUxM8viaed6zlsX6pUGUA3jkPdYAAl5ueSBSz5lEcaI/N01v1AZi8dG90JY
FrY2W3coeEXLBQEAHlTSRtbwdej4d+PYn0dhpUI9EyFQ7TYPapD25or0EnqceyhG
FhDACroEShkFSVx69KQ8o3vLSvuVFI0BKiqdXrrjzBOxcH0vW6gRj6LwctGYJ5M9
R+I/Uo97Kzf6araZYzVyLt5VJdG5w91bl0QuIDrleacS9WP4MaYajLi260Q86/o=
=ikNJ
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
