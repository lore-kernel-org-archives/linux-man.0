From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] vdso.7: update for MIPS
Date: Wed, 6 Apr 2016 15:01:37 -0400
Message-ID: <20160406190137.GH6588@vapier.lan>
References: <1459869874-61625-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v96iYeCKywqbD3+a"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459869874-61625-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--v96iYeCKywqbD3+a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05 Apr 2016 16:24, Zubair Lutfullah Kakakhel wrote:
> Document the symbols exported by the MIPS VDSO.
> VDSO support was added from kernel 4.4 onwards.
>=20
> See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/a=
rch/mips/vdso

is there a reason for not exporting sigreturn/rt_sigreturn even though
it's included in the vdso image ?
-mike

--v96iYeCKywqbD3+a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXBV0RAAoJEEFjO5/oN/WBBPwP/0CxvJlRR+90lqHjFTdE6fte
bK2Sp59ylfn34DsRYgMxlPH20ARL7xl480c4tpyQsyVGdUGtvh2odBcVqg9eBc4S
3NDnAS9+7I9Fgu6GSHjwhjScnyU/Z5PaDz4pGsjnFwJ8vrzXZFDgPFAzY9AgQqyc
6+z5B7NhgNEf80/QirkXoik5Mi5YMqr3F5M+ONYaf9OrPIxMMnkzN20SJjANnMlS
CmO4GqP4G5DRiyQ36F5fFpsDW9jX9Sd+AqpiQ65gXKazcS4TNnyD1FgpJMb3jY29
s+U+ZTmBhr8fBGicszlozb7noK9s+DMnPAkpSo6Wb3rxfyOuUJOJ/SiMXtevPMSb
Wp/UvVNuh3BjszaBh32DmEs5YqB94GUQNFCeoxUVQxhnvW1E8xLtrInmcQLW9Zfp
ufoCPNB9PfIsW0byRc938lKeNKrCHxiSMLu7bXnxEb4Qnso9QeLg2vu8zhBvD+aH
34+3qOOYQDFn+b2iuXt6ibyPaw0Wh7oq5kLteGYnFUNB2Hd0JszQIscpoG4YU35i
bVqZ5Q4LaG5bUjEFHEgbniC/Jmjrw0jiaEFKc7f/Gloh2uTKMZwR2Dhqjnif9qvc
b7yOI1uq3yJjGyjT0PhKQKW0JWu58brxvduVcQUEO9N1gv9SgdmvTdHjDBdOVaLm
rltayHxJ+BH7rj+hSOPW
=WuhR
-----END PGP SIGNATURE-----

--v96iYeCKywqbD3+a--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
