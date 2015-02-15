From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] syscall.2: add arm64 and mips
Date: Sun, 15 Feb 2015 05:46:09 -0500
Message-ID: <20150215104609.GF32251@vapier>
References: <20150118072204.GA12237@www.outflux.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150118072204.GA12237-0X9Bc/hWBUTk6RaD4rd5nQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17 Jan 2015 23:22, Kees Cook wrote:
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -36,6 +36,8 @@
>  .\"
>  .\" 2002-03-20  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>  .\"	- adopted for Linux
> +.\" 2015-01-17, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +.\"	Added mips and arm64.
>  .\"

can we scrub changelogs from the man pages in general ?  they're usually=20
incomplete and rarely provide more than `git log -p`.
-mike

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU4HjxAAoJEEFjO5/oN/WBMnkQANx/9Pw3VuDBuC1Tq7/WtL1T
PsmXdHv22Ff1yF69fqfVnXYGTQtGbRymMhnOUY+bdRcxWAVKgp6a2lZWwnNmEXnH
6w+/gVfQnSbIR4uNwcJHCdW2ya0ONKuinXHeDn0agF4x2EznuB2ob7cUX18+6cN5
QtCIaloxVITRKfdVBP5T/vyBgJiv1ChacipXzUKPaJ9Lng/thkVtQXBagCZZl3ER
j5Lb/Q6z4JXqrifWsY3uYAlV0zBqLUjkCVzHRpyK6g+BeT/8LwNiRYeXfYPD+p7R
lGnBprxG6Sq8XyLdejJr8AW57toi4TaWyXaBWfxMxK+QSuJ5qddZEl7NZYU8We+w
jIsBK/slPbvhK0SH+95sa+H62tGCRd1dnCtSOEGpgGLJZPIeGuSS/D/R84yok72X
Y5VNKgfL9owZLTt/vbrO5Thw7Oec9/9Ru+WYSt+BEArEZ9nTqM+zHzQURVNlpA+X
b9xAer3qR0lshIC6x50SRJIuvvPDPHllQHlLGSwIZKe7IllkzWEn85dE8ZNNJSYl
lSIpiy6Un6uxc40ShKr5pFXLaE2fSswifneLje/AJwifD1DMgQYuEdOV/cDmfQp0
k/wo+fq6rDAC1zTPWUDB+WQoTZA2xvRbBtZn4vrcxMtMhj+trUpiwdUyFTawxemz
NszddSGKq98zxnXl7zvr
=VO5G
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
