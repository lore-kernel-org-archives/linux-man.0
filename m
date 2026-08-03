Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D21412C15
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767525; cv=none; b=B6LIvxDknU76l3oDlIk6USrV34B2y+F5aeRHh/0k9Per28F0X3EBAxKoaM0LJ2f/b2MVxqF4zbawGdWg+mgb6G+PFUt8i8Dhl33xtW+ifEJY7f7aU1A6ilPqomJlIs1pld523xy3kf+4V8iBhW4j/5K107HXqZScbuFunlzXhuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767525; c=relaxed/simple;
	bh=O/fjKW5+84DU0ysIKKDslFIeHfY7R9M8bR5eqpW4EN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hj5E79aXskRxWa1ktZ67CUTFFwTSGkwrQiAjoiw/ioE7JSYB9i/mjjNYpqv6JkIspTfMFkp5uigdFmlZCdrckJxFOgifGxsiuRIu7gFRyRsui0Lxa12nrs89fuUR8KM6QVqu+3+cmC6GOfhftrNbvx/e9Yrynz6mk+wKYTSsW4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsjd6pcf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsjd6pcf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFB01F000E9;
	Mon,  3 Aug 2026 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767523;
	bh=qvzTpwEZyPDJkZ1d9nzMe5yEG2g75jPvk8BdBMSI3KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jsjd6pcfB9CvGeeCQG5ZmcdsSq9S/ZUF+G5T6vdsl99uavZW4xfmPZ2cgg71bgnyB
	 xrXj9uCa/ZV/gqvyh2sBPRyk67UU0aB3pLMrVj4J0D/XVlYxzaJ1Ji36ZwpbBVMe3f
	 +3/ClGVHzMFeSVy4GDICcRgX0YLvjKMbo9kEOiuhFnGZAmFb9mR7aKN/CeIZrxrr85
	 0mgyW1kOBlL9Tm/vjp5sR0PWWnCWynr1tHl1nCjbtMXBgm9vEFq9KThywq+cAC39xP
	 G7D43E6lHna3kdykzH+gtfCG254C6LUIFAz2RZXdT/NPgFbTdoap6Q4Yx7bK9Nx1Fd
	 1hs2Cg0AcrCjQ==
Date: Mon, 3 Aug 2026 16:31:58 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>, linux-man@vger.kernel.org, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: proposed revision to memory.h(3head) (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <anClrRY_73UipkPt@devuan>
References: <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
 <cb916665-73fc-bca9-0e34-ea66552fe945@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m2ps4axsmplzsj3p"
Content-Disposition: inline
In-Reply-To: <cb916665-73fc-bca9-0e34-ea66552fe945@redhat.com>


--m2ps4axsmplzsj3p
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>, linux-man@vger.kernel.org, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: proposed revision to memory.h(3head) (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <anClrRY_73UipkPt@devuan>
References: <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
 <cb916665-73fc-bca9-0e34-ea66552fe945@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cb916665-73fc-bca9-0e34-ea66552fe945@redhat.com>

Hi Joseph,

> Date: 2026-08-03 14:10:30+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Sun, 2 Aug 2026, Alejandro Colomar wrote:
>=20
> > I don't know of any copy of SVID Issue 1.
>=20
> I have a printed copy.  It has <memory.h> on pages 208 and 209, with=20
> FUTURE DIRECTIONS saying "The declarations in <memory.h> will be moved to=
=20
> <string.h>.".  (Likewise in XPG1.)
>=20
> > I'd be curious to see whether XPG Issue 3 still kept <memory.h> (but
> > I suspect it won't, since it derives from POSIX.1-1988).
>=20
> Page 642 of volume 2 lists it as WITHDRAWN, "The declarations in=20
> <memory.h> have been moved to <string.h>.".
>=20
> So there you have explicit statements showing an intentional, planned=20
> move.

Thanks a lot!  I'll change the manual pages to reflect these historic
details.

I still think that since those are not mainstream, users shouldn't be
confused about the fact that <memory.h> has been obsolete for so long
and is now shown in documentation.

But these historic details will certainly change the documentation
I wrote.  Thanks!


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--m2ps4axsmplzsj3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwpl4ACgkQ64mZXMKQ
wqnG5w//VVg6Jc1MLHu5fF/boJCRTxVlSUyIcnIYs6BxF9iEMvkSLduxevJP/Dr2
jY7e2SUgmADGCHfJpD3MIZsC5HKB1m8RWS+EhK0RsuXbKH9EeZJ+0fTe8YwjIw/v
nAylr+mrXpf+Sb+7K+MXWrPYlgpoYLI4tlcwajsvjnOO9NFpvbSpMsagCp5V42HB
6JYfuQoh+1b2WWk96Dh0YxyUYSYlIFJFFHLWu+omjFp2lkxkTyZOJr8UZ8wUCV3y
WrHSGZif9BHx8xLFk2WfFWChg5zsU/8QSyLCU/D+/6takpsnYNXRCfD6bhSxe3xr
vQgYTu4ymCWAE5sv+JTg28NMwg5wkexVTElJ3sProlmrCW82dap3gqxin1vDcbbT
eV/O4buYuio3na6zmrabgs7PHjrKA5JCzNWkLR/otiBYEoHlw4DgTnReJsTd7lwe
mxQRexj5jcqweUmPtzlN5f+znje2YHyWRXwzpuZ3/mGlBkOS6IhWVpRUQ+ur05WO
TgWU6P57PaKIOJZ1/pFfQ0Fz77Q14m7KgLVbXbi5CwzVvQ59NAMhQs9S4hj+hTnF
nOavesr4kvUrPPQzpZ3jX8vOQ0vi3z175Fu/LfRlvzCZUdQ90W24lv2LQwpPAYZo
TeWT17Nx7vU1wMhRY/42gGAtdNsOGdTclv+CD9IkUhH+XncXvWQ=
=bAXj
-----END PGP SIGNATURE-----

--m2ps4axsmplzsj3p--
