Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000875;
	b=fy333u7W/O83YgHEEVjDftVWS0h6lT99vvtYPMZHCkWyKc464F8XXzP8ovZxa+vgHiSa
	 Ix2KekPxmVpFOcjhMZYgmWItubWRc/OY9sg3lAz6+Q97hNsyZRKX3REnYorayXgsDemKE
	 Oj7B9/GxbUkMVW2xDWE9n04rqlYzTfwWxgZhWTxtHQIuN7bbl9uUIqxs3ZPhkyosKF33B
	 C+OMFIiaZx52Stj77vz/HCqVjqvPsfLejXT4/8oePvBK72h9ly5PeJgCiHZH/SsDMV2yk
	 N+rLr+cVGAASBUeg/msdJ2Yg53JaoiM9Ri3+bRPLbPJcGttQ1LQWSXJmc5saDIprtiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000875;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HgwZwnMTLPuC+DukBZ9I+QZALd9feUQFyWcTuv49ZuU=;
	b=fvQs4IMsEFRCuXTMkM5geS3WmN5WcwHDD19fjZRkQGktsvVinxVoOpkMA5WRwXVHAND4
	 olrRSRuJUIytOiU0+vhXdOjOlQpUFkEss/Ho3Z9AjmRJ8GHEniTL5Y3ldzZsHOu9RDryU
	 dvCkzDbI0AYePLTy6hpfyiPPtp5MvkKu7sIGvodnnaWMOwbNj4xjD3jgAhlVoSCpKvPL7
	 Zz82nZlfOWbTSyf7wuVi7OeVW0n+3L5YCs9bp1GG8TMWi6ssGaLQCUcPcwQApWg8+3MD1
	 8VaUViS1MluGttD64olWEZId4S8pRF3dAaLZhIIuuez3cV1CST3awtdLNn9RFOKZ/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bzh4TY9R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A3606A31C
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bzh4TY9R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB04C1F000C4;
	Wed, 18 Nov 2026 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795000875;
	bh=HgwZwnMTLPuC+DukBZ9I+QZALd9feUQFyWcTuv49ZuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bzh4TY9RVbTmI6aVWT9PikkjdRPscyaM+39OwnQv6+nTPdbIUfDz6OQtdHZk2rdxV
	 25b3iTU3ujgKIwqYan3QB4NiqkZEWV+f+NwHXV/V6yM0qjaqb5kPTVJtJ7IKXOzzar
	 jospTf6cGEyLgnCsgGudohtA3erdDC+TdVsO9ytRdfOZCXmAehm2EoLi/g6UZ16zVZ
	 tOza41XEoWg1g0MHpeeiRYnyRVKviGutbaX3zjkfgXyJ0/jIuOc+2wyA+OrSLfpmSR
	 e1paHUw/zIK/oO8Gj04XkKIMtYBSCjEaVZpiQhdqQ3l2ZgWF98f4OuR+KPRBRxBukj
	 HnHkbT/6Lb9YA==
Date: Wed, 18 Nov 2026 12:21:12 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Jorge Almeida <jjalmeida@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [bug report] opendir(3): document file offset behavior for
 fdopendir()
Message-ID: <av2JnhGHAaSed-VU@devuan>
References: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>
 <aveC_KnRVLx8eCkt@devuan>
 <avz09FM5Bf5n6g-4@devuan>
 <CAKpSnpJtcEf-RT+4yf=t3KtdYDWD3hfKqM51Di26ay7JHSj5MQ@mail.gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmczppytowym23xl"
Content-Disposition: inline
In-Reply-To: <CAKpSnpJtcEf-RT+4yf=t3KtdYDWD3hfKqM51Di26ay7JHSj5MQ@mail.gmail.com>


--cmczppytowym23xl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Jorge Almeida <jjalmeida@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [bug report] opendir(3): document file offset behavior for
 fdopendir()
Message-ID: <av2JnhGHAaSed-VU@devuan>
References: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>
 <aveC_KnRVLx8eCkt@devuan>
 <avz09FM5Bf5n6g-4@devuan>
 <CAKpSnpJtcEf-RT+4yf=t3KtdYDWD3hfKqM51Di26ay7JHSj5MQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKpSnpJtcEf-RT+4yf=t3KtdYDWD3hfKqM51Di26ay7JHSj5MQ@mail.gmail.com>

Hi Jorge,

[Please keep the mailing list in CC]

> Date: 2026-11-18 10:16:51+0000
> From: Jorge Almeida <jjalmeida@gmail.com>
>
> On Wed, 18 Nov 2026 at 00:45, Alejandro Colomar
> <alx+linux-man@kernel.org> wrote:
> >
>=20
>=20
> >
> >         commit 7b4329e4945b1506f75c67c18730ad0191e09fb0
> >         Author: Alejandro Colomar <alx@kernel.org>
> >         Date:   2026-11-18 01:38:13 +0100
> >
> >             man/man3/opendir.3: fdopendir(): Use wording mirroring that=
 of fdopen(3)
> >
> >             The old documentation didn't clarify whether the position i=
ndicator was
> >             reset or was that of the existing file descriptor.  Let's u=
se wording
> >             mirroring fdopen(3), which already made this clear.  This m=
akes the
> >             pages more consistent.
> >
> >             Reported-by: Jorge Almeida <jjalmeida@gmail.com>
> >             Message-ID: <CAKpSnp+XojktUF=3DUL81JZ2bFyBSxXHneFSBsiPi2BMg=
043xa3g@mail.gmail.com>
> >             Signed-off-by: Alejandro Colomar <alx@kernel.org>
> >
> >         diff --git a/man/man3/opendir.3 b/man/man3/opendir.3
> >         index 443ea8f3dd0a..8184844893b9 100644
> >         --- a/man/man3/opendir.3
> >         +++ b/man/man3/opendir.3
> >         @@ -43,16 +43,16 @@ .SH DESCRIPTION
> >          The
> >          .BR fdopendir ()
> >          function
> >         -is like
> >         -.BR opendir (),
> >         -but returns a directory stream for the directory referred
> >         -to by the open file descriptor
> >         +associates a directory stream
> >         +with the existing directory file descriptor,
> >          .IR fd .
> >         -After a successful call to
> >         -.BR fdopendir (),
> >         -.I fd
> >         -is used internally by the implementation,
> >         -and should not otherwise be used by the application.
> >         +The stream position indicator of the new directory stream
> >         +is set to that belonging to
> >         +.IR fd .
> >         +The file descriptor is not dup'ed,
> >         +and will be closed when the directory stream created by
> >         +.BR fdopendir ()
> >         +is closed.
> >          .SH RETURN VALUE
> >          The
> >          .BR opendir ()
> >
> > Let me know if you'd apply any changes after this patch.
> >
> >
> > Cheers,
> > Alex
> >
>=20
> Clear enough.

Thanks!

> However, "with the existing directory file descriptor"
> misses the "open". I believe O_PATH is not enough!

Indeed, I was also concerned that we were removing that.  But fdopen(3)
didn't say "open", so I copied it from there.  Now we should add "open"
to both pages.

Would you mind sending a patch?  Even without being comfortable with
man(7), it should be trivial.  :)


Have a lovely day!
Alex

>=20
> Cheers
>=20
> Jorge

--=20
<https://www.alejandro-colomar.es>

--cmczppytowym23xl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr9iigACgkQ64mZXMKQ
wqnJdQ//RIb5wtrjWh0Uxg4PAhKejH6RAHwNWMsW2H3PR8NCMLuWSHecVjuWMntW
8GOUrfI+bYGI9ERgIvqRX9GDDPiJ0caSUZ4LfPT1M8rXrWIctzZ2K7YzuvA3GeGk
rpd05nD2h6tO85qrZfxW2I8uqMxs7Zeb0+23f8jKsqGQc0UgOwXIkKHPScHgI3MB
+F8wprWL8nBt2EDEGIIbJgBXDiN7P5pOP90gPgF+aghV5aY03lzChi48oiCbAfu8
11ZmwEMu3GzQPG+yQ+9/vtzrM1jYIplCwjIYrVb/+UFgEy8+z2hXRDtYxkVsGuLC
MLPH6S2gne2h4OoRGlC0nCYOIWzCvDB8QApy76Gx/E/wXEOSMgXY/RvMZt73TYDC
BA30NgIWWexHH262P9o8Hj+UOYWui2+RngS8lBxmgu312TRZfL26+CsX8Y2e4Gqc
BeIvDS0rCsKsCsD5kbR3d+7zbvLavG1pMFcz6xFgUs+/3stYAaLD827pMJtbJosP
kEw3JVayZSrQg3VJN5zyqDoA1DZ+RjvI6K1WRHCk78ziWl1ly8svkPVGzderRwMu
yzUYqg7OhOdAXxNSZztYh+BulOldr0EFLDnFOqaTomNGfp376oHJE7LtHg2jAREU
/y5w1OGwfM+QF9+VY/EAYYZ9JY5mNgIt4roUQXj1N7MFyBlxB/c=
=uYZ4
-----END PGP SIGNATURE-----

--cmczppytowym23xl--
