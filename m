From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mkstemp: fix _POSIX_C_SOURCE value for mkstemp()
Date: Tue, 2 Aug 2016 22:58:09 -0400
Message-ID: <20160803025809.GE6702@vapier.lan>
References: <20160708000626.GA26576@alpha.fifth.space>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tpZe61tYkA9f+p/0"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160708000626.GA26576-lvRy8M+iZ/WfwRssfSzb0bNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Rameau <quinq-UlqG2OPX9a0ue8ZPuPpd/Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--tpZe61tYkA9f+p/0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08 Jul 2016 02:06, Quentin Rameau wrote:
> Here are more informations to save you the time searching for it.
> Introduced in f095bb7 (2010-01-09) in stdlib/stdlib.h line 609:
>=20
> +#if defined __USE_MISC || defined __USE_XOPEN_EXTENDED \
> +    || defined __USE_XOPEN2K8
> [..]
> extern int mkstemp (char *__template) __nonnull ((1)) __wur;
>=20
> And in include/features.h (from glibc 2.12 e28c887):
>=20
> #if (_POSIX_C_SOURCE - 0) >=3D 200112L
> # define __USE_XOPEN2K		1
> # undef __USE_ISOC95
> # define __USE_ISOC95		1
> # undef __USE_ISOC99
> # define __USE_ISOC99		1
> #endif
>=20
> #if (_POSIX_C_SOURCE - 0) >=3D 200809L
> # define __USE_XOPEN2K8		1
> # undef  _ATFILE_SOURCE
> # define _ATFILE_SOURCE	1
> #endif

what is it you're trying to report ?  the man page already reads:
       mkstemp():
           _XOPEN_SOURCE >=3D 500
               || /* Since glibc 2.12: */ _POSIX_C_SOURCE >=3D 200112L
               || /* Glibc versions <=3D 2.19: */ _SVID_SOURCE || _BSD_SOUR=
CE

can you attach a patch ?
-mike

--tpZe61tYkA9f+p/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXoV3BAAoJEEFjO5/oN/WBH28QAIJnKIqfF+Yb/CbVx0yaMN5w
p+f9Hor02BM8uD1stUqYTrHa7uaHpMHQXhZbM81bR0iVpoxnFzEajb+qdf4ylUNH
ovwBvCK/FavA8MrYXphZq1pxWnFGE93bGjUIisssNZNxSpMlgn7LBrhlz4LQcFHt
DgqzOKEm3WfKgxmNnJkfnZpCD7sUEvPHG8rWcoemyDcZzuip2haDlND5v33T5uBj
pa7rJsQPGi28mJguzlnccksFDiY3zooX935i9rr1u3tDBud9pe6qfsUm5lIPg53m
LJkMOOKK08TsOOer8It1Xwcu1UEOQqXKdFgqRiEDMf7QXhkNKpUwdCJXiNDyJHx6
XkaX4WnpNQpem9lgNJ5dLb1SdTzn8/UKitNIeh1iBM6XY4b4G5Fs/HoChy3HRJYn
1I9rPnjgj1pVm8Vpl0r8WnPX8MEv/UJ1Ak5xIc4Pl+S8zH8TI/EoKmvpSDP0M7zc
QSRK8yobIZraFJw6bVY/h04alT/TJl9oG288mnxjwUhroVkWVezFnd0LXZsOagL5
qWvD0xrWurC3QFaXTQBlxc+FKkt9WrfG2AdG6MJCBZ32Ilqub4Z7ULL3B8whGTK6
kWOp/Kn4Sm8cvcwMMvg9FoRCjGnyd0Y9rOyIu23Z//VvQ9np6Kt7CxqDcNlqVZep
jgDguKXoh9mmmo7vrj9x
=Y6yh
-----END PGP SIGNATURE-----

--tpZe61tYkA9f+p/0--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
