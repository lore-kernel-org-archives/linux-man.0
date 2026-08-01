Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A7F1A0BF3
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542495; cv=none; b=Q2AGlthJNdax8VnF4gTNT/qkHkhg/STnHa11NtR7wpOCwkOLsCSyHrWvLBuCDl5auxLmRZ96Y4tbEkAaqyV+q59Vn5trZm+gMIgkxpbjO/IQmIjr+Qo3lfE/TG+amFKuTPjl8v8W+rAjZp+VJcVXaLaIn36tnczYroLVGyxD9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542495; c=relaxed/simple;
	bh=LHctIzAxo+bOrN8P7DfsX0+eoiblUlRbO+5Jn962LzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECYwF295nTsTEAdE0vM+NEksh8fWRC8Rmfmlwm6d4bkaTAD5RcpL8xXLsPTFR+HUnhHpXhZX8syangcbHnZNZ+mbhuKG310m3sCEC/4bn0zvOR5n7BevysHsFYPWVBEobZx62i3jKKU8TO/JbnO59NW6OEl+r/QyqR244i8+nSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+6xxb0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+6xxb0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F351F00ACA;
	Sat,  1 Aug 2026 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785542491;
	bh=9vec4MD9p7RMbW3rEwusfjMk2TXra84BjWus9FLOQrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M+6xxb0GF4id4M9wAfy48s9m3omAR0hO7TEQLy+6di3v3p6V34vrzunsk/9vpar/2
	 IClXKILDdndwnEtsuEAHNvdG3F6IW++MWNkPCq9uv+LOrzZolzxxK7LPV76t8V33Qg
	 wzAQaX0ztN27T0t6hqBU9Gl8OYdgA+6nB+ygYu+YpawgxAMY4oJOMV5coCAy/zp5wU
	 w1KOgH5moj8cUm/1GgaA3C2mrZcr/cUTIYa/ISyHdeaThKsan9qo3ZTXAn6cWBMhIp
	 +y2s6Zd4PYElXwDkheWGWKmXLpnMmraLaQML0ozSo42kF0PATxgIbEt4ExnQ34SeNq
	 jFDHu/SzjxKGw==
Date: Sat, 1 Aug 2026 02:01:27 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem, strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am02CLY5CXnMBJ6n@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <m15x1u7max.fsf@gmail.com>
 <am01KjWKubOohd5r@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="77lpn6pdacgzcprj"
Content-Disposition: inline
In-Reply-To: <am01KjWKubOohd5r@devuan>


--77lpn6pdacgzcprj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem, strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am02CLY5CXnMBJ6n@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <m15x1u7max.fsf@gmail.com>
 <am01KjWKubOohd5r@devuan>
MIME-Version: 1.0
In-Reply-To: <am01KjWKubOohd5r@devuan>

Hi Collin,

> Date: 2026-08-01 01:52:37+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi Collin,
>=20
> > Date: 2026-07-31 16:48:38-0700
> > From: Collin Funk <collin.funk1@gmail.com>
> >
> > Joseph Myers <josmyers@redhat.com> writes:
> >=20
> > > I'd rather we add a mandatory deprecation warning to memory.h in glib=
c.
> >=20
> > I would be for this change, and am surprised it has not already been
> > done, to honest. The use of memory.h is a good indicator code hasn't
> > been touched since the 80s.
>=20
> Or that it has been touched in 2026.  :)

FWIW, a Debian code search shows 8.9k entries of 'include\s*<memory.h>',
including for example in utils-linux, which is well maintained code.

That breaking change is well beyond what I think can be possibly done.


Cheers,
Alex


>=20
> Cheers,
> Alex
>=20
> >=20
> > Collin
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--77lpn6pdacgzcprj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptN1YACgkQ64mZXMKQ
wqnG2xAArI3i9FVn3fXs1wuHXefE/aDC/R6fzeOsoOPn1szaW7Oh0yMZZ9CZ1WMh
TYY19d1VGNoC8J+er/Zm3ehYjn0QGKHiOCwSgBm8E4FcguJ3KCslIAfEqphIOk7Y
pT6m8dxGok1dPWBLir9JmSlmfMq/s/JjXSr6+Po9sgtDlSlfPe8ZaxNzywBc1Vbx
9mR3dW3uYkfBH3bbTv9O05DxOx39JWvGTlOswVthdKklFSCDsnQESlI6h5M3IWVD
K4WFAqaWUfDFH5MpeSOzvNMC8P4PhXjPNg+EMopgpblcFBfi7tTH86aVBKiQknWa
bSRBo0oDbKG5fWNgGTZd4MoDix1R0Zy0XwFzeTwfowUW5wKRcIq90K2LsnVzoYzO
vZZhDnL0rzLTumVwvXfM1mLot0pJ6fIm0KO4zXFpU09sq/KX+eLqWjtpYsLY+iIk
uhLgsjTfPCBpLBg6Tj2b7p3I2O8xfMoo4LuAE8t3UTTf4BVcmlY/cCq08mGUKRyv
fEJDSDtIZsY771v606YfEyVpJ/ZS+K0W2sq1XMGZVKCXCvzkwmAKSe+wj/1tFTlo
kSovqX9PdwNe0BjdMIpqdYNUWEdrHl4MnsafJXC/McLCedjCbABlQx/mfNMd/2H0
yZBwmGC309rmQOyViLgkm5BG8zA1qYnwHUL3yrNo+GAoFj+IGEA=
=v7Yf
-----END PGP SIGNATURE-----

--77lpn6pdacgzcprj--
