From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: elf(5): what is the scope?
Date: Thu, 17 Nov 2016 06:23:19 -0800
Message-ID: <20161117142319.GT21655@vapier.lan>
References: <20161116223905.GQ21655@vapier.lan>
 <CAKgNAkjtZcSXoBbYE7UL-F9j=zLxN+S6=4YW1d7Mb=8Hsm=9gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Vs6r5beQVWevPlSD"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjtZcSXoBbYE7UL-F9j=zLxN+S6=4YW1d7Mb=8Hsm=9gw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--Vs6r5beQVWevPlSD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17 Nov 2016 07:58, Michael Kerrisk (man-pages) wrote:
> On 16 November 2016 at 23:39, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > what is fair game for the elf(5) man page ?
> >
> > things that i think are missing:
> >  - Elf##_Lib entries as found in at least SHT_GNU_LIBLIST (prelink)
> >  - the format of SHT_HASH and SHT_GNU_HASH
> >  - Elf##_Nhdr notes found in SHT_NOTE
> >  - Elf##_Chdr for compressed sections
> >  - Elf##_Syminfo
> >  - Elf##_Ver{def,need} found in SHT_GNU_ver{def,need}
>=20
> It all sounds fair game to me. Is this an offer to tackle some
> of this?

i'll try ... i've been needing to reference these recently
-mike

--Vs6r5beQVWevPlSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYLb1XAAoJEEFjO5/oN/WBJBwP/jDA2o2YRzJHKe/z4Ap1VZGp
iCp0R/6vqmTozKHiCwVlzCd2GG4YFBGKqmn0olgwUqlj97/XP4Pv+DK19puKZDzk
FqybJsRGAIYAPuj82CWvCp4OawiFkdUiuy4QaEiBeVBQvN6vmkocp46Ve1XLtKDc
clONes/MHwqrxiPNb2GI+9MjmYtYeB7Z8y8hieEGW0j0+yXJwtwJiSOy5jHLTYyw
s7jYG+l81rzzvbnKP/8LuRYnvt6tLm4/SD77f9oLNd4/KNbi6HcKMSACv1c5isT8
Thvq5fCVdaMRKf5TH3IzajgCK3BkEGYWFpvn784yI9z68fReWPr6iZvA5OcvBYhK
EErGeio2DH4bTTAbVNhnOSuKKfypfzaznFGrnaPti7mQQve/BCHaMLJ/cV5/LZPg
xEy3NoE82Svd15fuM6A/0kfGiouH7kq+XftygjsoQDAhHFwhDtVFqbHVLtWU/oUI
hKNb+T1iLaxKIMDFS3JgrYuIOEZWPBeicAsUwNvN3y38SQWhNn0mkJLmq6GITtq2
du8VW9K8qpSZGhtRlPknySY38MvjfJnE/44W8IriBJEdID9YDvHeGXHcJk7vH5eV
O6L6a9sDng38mDMHk097fmoLaKHs6DUc7LNsmJfKrw7z8tapQfwemOdDfYmduVaH
EPa/her92SJyGuHLb5z+
=uyLL
-----END PGP SIGNATURE-----

--Vs6r5beQVWevPlSD--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
