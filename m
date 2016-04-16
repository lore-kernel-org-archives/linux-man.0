From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] Improve support for compressed man pages
Date: Sat, 16 Apr 2016 00:50:58 -0400
Message-ID: <20160416045058.GS6588@vapier.lan>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KKauK+tA+COOvO64"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160416022503.1df762cb.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--KKauK+tA+COOvO64
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 16 Apr 2016 02:25, Alexander Miller wrote:
> when I looked at the Makefile I noticed it has incomplete compression
> support. Most notably the screen and uninstall targets didn't support
> switching to a different compression type. More precisely, uninstall
> supported only switching from gz or bz2 (but not xz) to uncompressed.
> The screen target had no explicit compression support and when it
> worked for compressed files it was pure luck.
> The patches 2 and 3 provide new recipes for both targets that can
> handle any combination of the supported compression types. Any file,
> installed or source, may be uncompressed or compressed with any of
> gz, bz2, or xz. Whether you compress before or after screen and uninstall
> doesn't matter any more.

imo, we should just drop all compression support.  distros already
handle this properly and pick whatever they want/need.  if no one
is using this code, then it's just sucking up space.
-mike

--KKauK+tA+COOvO64
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXEcSyAAoJEEFjO5/oN/WBhu4P/3aeLt7lwKW4gRKKpH8NnpCQ
WWzoiZ1wyMQr18ud7g1voYBoDg/MNlgYIHf9VY6SF85apbcnIjTccLNhZmZeJ9Vk
bLZrEeeuDQ5llctbPL86x2NcnxAMOt4/kAwqVNkrWECJdPpSPKzLJjYNNGIEHTo7
82mR29SQjSDZPgXQ6K4aRVsWjrzHv7Bq5cgdDGnK3mZ0lEcn/Ub2C44gJD6PU3iE
+QrzqPAH6GE4b6rlCN9tUWxTszma2mcwLEqy63UU0hP+s3/2dPNv7/TUE2zUJrfn
hzQD7tWII3a+rgbt5dH48p8IAUdXn/QM8LKkelAkBNV2gMg0JNPWKrdgX06qB7P7
k/aadtW2Q199LsHpcT/5g+u5qpJ9xkz035nVNCp3kQuN93oNAogkGkUseoC49NHQ
L3R9Fcm+WMr7n+ohfP9YVeYXLDDrj6bK4dHUqH01VKzmj5FbbNAyfm9FY5KIkaqU
MLC1V0fTvd6SlPOyuR3P/ZS1HH3dmq3XT5dN8m0/3/6rInWvdcfek6C90Azl6vrw
69j6o3IQ3bmB4Je1rGZ34fVsHDZCPTIuH9uDgX0bZfT4u7+JXRipYO0eB2I9nrfR
+aTmn1YOxIxUVkow7SOb8ACOD36FWuKX3U9oQMZ8AuzuUBg27l+o6u+vebso7bVC
1oA4pt9ZwEZC4z/CihBI
=RpLR
-----END PGP SIGNATURE-----

--KKauK+tA+COOvO64--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
