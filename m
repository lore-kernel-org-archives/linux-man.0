From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: charmap.5: clarify keyword syntax
Date: Tue, 14 Jun 2016 12:56:43 -0400
Message-ID: <20160614165643.GF4053@vapier.lan>
References: <575E5EA5.6050707@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZW6EFwch5npBRW5X"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <575E5EA5.6050707-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--ZW6EFwch5npBRW5X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 13 Jun 2016 10:20, Marko Myllynen wrote:
> The patch below updates charmap.5 to match the syntax all the glibc
> charmap files are using currently.

hmm, i guess this is confusing.  when i read the man page, i see it as
the normal syntax of "<required value>" rather than the <> being literal
characers that you need to type out.  although in that regard, i would
expect it to look something like:
	<character> <byte-sequence> [comment]

although in the locale(5) page, we rarely use the <foo> syntax.
-mike

--ZW6EFwch5npBRW5X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXYDdLAAoJEEFjO5/oN/WBolQQAJKlJ8nb52KE98GcpFeIMKwd
bfd2BrJDNkypXE7DLAztd4ufwal+uqV7UpGKwpwUzq23ygq0phGW0RcoJq7O83lT
5B+g8WDBmT/ioc/9d5iTWS5YJ8Us+fYa8zAaeQfUhy7PM5wqLxVCgBxrybF4JPf8
GJyM/0RAM62z4a17V7CaG+SufOVgPF+KaiZ2Ez3RPmchTw43xNZehno26GViHcuO
FfLjI2DvwTK594lgXmHlaAGor9wHhiM67NFrVZ5kZGOpoO7o4yXf7CsGkxBNMDgy
4CSTuOmKPl4nvAHDKihhchWohFGzzJ3GhTLIFyjYdS+508zxz90VnFlgO65+ni1T
5c1xy4ZTAt0QzXflRW2c6X+b+MTeLdgEO/74DNgMmN2iwmxdh5M4z345Y7+whOvM
VR0n/7tqrEZw6Woy5fLXnyelQ1WSOIJlUuSfdL2zH9sUB1zGYXI45t3bsQ5hfpaM
C8NWWWieZ7NnO0cV3NWtWHaA4rRYE8zXaF+w1VKkMDf89vITG9RVZKPGQHiy12mt
SmFBwF3fPsJVsvAjbv1koGoK7Dv5i9hbR3QxFVIOVjTBDbKMw4ZvrrtgbX/3zKx5
YZSmFEO1YG3n5RGvuoOwsMw4bxjqRjs75A+yAQBoxxLtWu2Ub3g6IWdAL0bqHFMG
HkFY5JFdzEw7cBUp3bwp
=Tqxf
-----END PGP SIGNATURE-----

--ZW6EFwch5npBRW5X--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
