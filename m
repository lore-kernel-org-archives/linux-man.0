From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH man v3] bpf.2: various updates/follow-ups to address some
 fixmes
Date: Wed, 29 Jul 2015 01:58:11 -0400
Message-ID: <20150729055811.GH21252@vapier>
References: <86038f69cd3d753350b9947b675365fb7fe9da60.1438114491.git.daniel@iogearbox.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <86038f69cd3d753350b9947b675365fb7fe9da60.1438114491.git.daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28 Jul 2015 22:25, Daniel Borkmann wrote:
> -.BR bpf ()
> +.BR bpf (2)

i thought the style for man pages was to not include the section number for=
 the=20
function you're currently documenting.  since this is already the bpf(2) pa=
ge,
it should use "bpf()" and not "bpf(2)".  other man pages though should use=
=20
"bpf(2)".
-mike

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVuGtyAAoJEEFjO5/oN/WBq+YP/1DuvfpWdJXMadkHkopS+yE6
H5WXNP4YOPI/xIU9N9Q/wt/ao0Lq1U3FnYvyRbZKsEGlz3EibXb4LGIFfcIw96vK
bzji4OInEi/CokZ+LvflBV1vkBbhrRA8KWA6QkBxPtetKT6OeLf17WnYHGhLtoco
greP5zsupotyEaWyciziiuYf3E0N43Tb/CvHK0aYFI3Kn942N4hc3pbCkQ/KWxsD
ec/Vn0Qqr/I10VOnC659Vb6FrmjkzD70jxO5ZclBC0badHx65qzGbguEIwH2mIGw
focSKyKq+yypNdsnWMtw2mPlGGzFyEKVVkCUo0J6kLNF4U8s4XgrfeJHfHMuqNC5
n9sK8v5UU/JpKKi6LxCWiAUyZKmy5qOPzxhPrv2+5S1HVmxZltRtYYqO7vX27474
MUQSqFKisirC5xNp729I09HVXoFCzy7p/+vN7jrDklnqwUS5hYL8YvcTxMc0FJx2
8HUVfsg49kWucUyJSlP0hjR7QpclRujtPIoHvuCcTnXutep1pZ3dix+QeNDFRyFa
MT9R4w595iesIOQgOEx7txNlpuLLy47YZ6Z8jIWtS+N4GENKhwOLcDNnTQLHWh3K
tbHMX1bOaFI3exkEghC6zJ33+Ik2v2g1+Ys+IqBkjfhWqr/Ppruu50y3fjDUbWJb
7GB4r5Y2giQQGrKjacaV
=R9LE
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
