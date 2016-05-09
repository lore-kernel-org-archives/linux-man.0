From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Mon, 9 May 2016 17:31:40 -0400
Message-ID: <20160509213140.GD26300@vapier.lan>
References: <571E731A.6050809@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mlvFMpb4NrD3AMcD"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571E731A.6050809-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--mlvFMpb4NrD3AMcD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 25 Apr 2016 20:42, Colin Ian King wrote:
> currently, the aarch64 clone() system call requires the stack to be
> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
> copy_thread():
>=20
>                 if (stack_start) {
>                         if (is_compat_thread(task_thread_info(p)))
>                                 childregs->compat_sp =3D stack_start;
>                         /* 16-byte aligned stack mandatory on AArch64 */
>                         else if (stack_start & 15)
>                                 return -EINVAL;
>                         else
>                                 childregs->sp =3D stack_start;
>                 }
>=20
>=20
> ..and returns -EINVAL if not aligned correctly.  This should be added to
> the manual page clone(2) as it took me a while to figure out why clone()
> was failing with -EINVAL for aarch64 but not on x86.

seems weird for the kernel to be enforcing this.  is it just because of
the stated ABI ?  or is there some weird requirement in the kernel itself
that requires this ?  it's not like other arches have this check, and
there are def ABI requirements about stack alignments in C.
-mike

--mlvFMpb4NrD3AMcD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXMQG8AAoJEEFjO5/oN/WBVe8P/2vMsEiF9fSOk9DetlAwGHFd
WXjy6YhljWOcjTiknktRD3lvoUeSZDkT0QInLnrQRHlfDxYi2h7bmG4+e/fs1Rkd
l6F+QvHKAS2uO7Xh5XymzrDyegicGqaIMOsQfU2+BFxxXHP5Nfg6BGpDej/TryHh
73hDoq9hvrlwjW/i6ant7bxERfDD6sPiShGn1bx+b047EYnw5boHWZ2xMZMRpr5z
/EGuuqYv+/0mlnLViqg1t0KPbh4QpgrOfefFP6F6HkuJtrzIVtKbsFpKckTPtxHo
1OB9gBI9YDUFi5CO6MkCf6uG4J4w5wZDuT09k/gVLq4eGAbJikZ5hJ9cBAgFCEdU
GELe5DEYgBpg5K1aXT4GCHtez2/rVEhV8hlYGF2oiI0QzGoBNpqW70RQgLIrTF9J
sDS8zNgw/55VjBXVS0OvMluRnIE1NKS6wgLtxEU+28FSq9/GYcbFTilums5RDgBh
+ywL7mffssfWPSJ4HIFJxeYkQNWZOFZBF4lErf907yAJU2AG3HnkEpjLqITGurq8
xU1/44nXnFk1ILFmxVOjpTbcLEn+YR22XJXx5mUJFdYdlOX7DRtazuFiSzddzaqe
QErE73R44vgF/UgxVbeUoRhhbBCjkNRYmFZTimp8Kbngg1IRUAE/lO5LsJvmzhfC
GZSsmgcpBtDuduiZxve0
=NVnI
-----END PGP SIGNATURE-----

--mlvFMpb4NrD3AMcD--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
