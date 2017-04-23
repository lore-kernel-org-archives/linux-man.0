From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ttyname(3): add NOTES section
Date: Sun, 23 Apr 2017 14:52:37 +0300
Message-ID: <20170423115237.GA26862@altlinux.org>
References: <8c7cb5df-bc2f-94d4-0a17-6efdf86f43b3@gmail.com>
 <20170421200509.23616-1-christian.brauner@ubuntu.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170421200509.23616-1-christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org, stgraber-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 10:05:09PM +0200, Christian Brauner wrote:
> Signed-off-by: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> ---
>  man3/ttyname.3 | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/man3/ttyname.3 b/man3/ttyname.3
> index 0be50c62a..f184b4505 100644
> --- a/man3/ttyname.3
> +++ b/man3/ttyname.3
> @@ -75,7 +75,7 @@ was too small to allow storing the pathname.
>  .\" glibc commit 15e9a4f378c8607c2ae1aa465436af4321db0e23
>  .B ENODEV
>  File descriptor refers to a slave pseudoterminal device
> -but the corresponding pathname could not be found.
> +but the corresponding pathname could not be found (see NOTES).
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> @@ -93,6 +93,22 @@ T}	Thread safety	MT-Safe
>  .TE
>  .SH CONFORMING TO
>  POSIX.1-2001, POSIX.1-2008, 4.2BSD.
> +.SH NOTES
> +Processes keeping a file descriptor to a
> +.BR pts (4)
> +device open when switching to
> +.BR mount_namespaces (7)
> +that use a different
> +.IR /dev/ptmx
> +instance may still accidently find that a device path of the same name
> +for that file descriptor exists. However, this device path refers to a
> +different device and thus cannot not be used to modify the device that

s/to modify the device/to access the device/


--=20
ldv

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY/JWEAAoJEAVFT+BVnCUIAU4P/A0rhfxV+oKF/vtzH9PbA/7R
gZa+Ox2SXQPDHG94Yu6/BMORv0E7SGYwvSdyfdnjixfChe8EtgbHrYeIkzuzafby
1X8fBvStJNU36ew0D5CcGLJkl17EvBPOxVJ7eGOckVqfoq/UlIrODeEPD4+QM760
O6MHiwD/yrjaIfHEu+pGWmJ/hlrpbMFeJa+zKblk807ykVIuMKK4tbY7DxrhJdmM
wbfpdDRvy3l4RxkNhP7GJE4e1xiVqUffoStLeLPyWRJMnE4yejOtUSS//wpQR2ev
7qcxXprqFI9/9DPg9cNvE+t6z2n71eAeTJjbRfbV7EwQOByE0twt0o/YYPwMO9Cx
jVAtlXMiMBNqUeYX7rbpe66YZDIdp1RdxQNqN9aKAtOoI/L612nuDTja1X0gUjIU
/HNw780BQ/uc+CzcgQSGaCqTqdeV5712UlPoXwXFyNg70K/MXOUnyfrPT0ml3eVw
Nz5MnA/na4PcmZOT5dZmLcHO8otIrhqKAAQM0MJhXY1aJ7gUjY+7HR8rUOo32gKD
s+QR1aQMioFFQpy7XauOcfR1ED1GgZPoTglxJSz4jtw/9UlfCb/VPKXfJd4G+N8u
Wu9Y9eLr+iKdgFJwz7mrh41LWo9YbLAALG+gow3bPH/i7WoPEh1xSXUq9vynAU5B
uPl8/DELLK5a9/B8A1/+
=btL0
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
