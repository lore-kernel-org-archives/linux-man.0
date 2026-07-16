Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5322C382299
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218836; cv=none; b=ZKTF9UTSLCNOjlooWg6nxhjccl7+CgNYPeMRxMwbqHAL0YNdXABzRXXJ+QMu/in68j3DEyJcr/u6I05f/D0NjlRmAGHhVHx8ghBR+LL3bNoFTm+V6gpCuYlZXw7sNCJvafWE2/scz8yIc7nfMPlc2N2r1KxkRCYrvnXbId4qGZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218836; c=relaxed/simple;
	bh=lCGpnqZueySmDcbk5PHqtW/HaT6cJ3NfoJib8Bwn4Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJZnfeFR3S68Aw4NcBlOBd237lWKNw5cpnWI1Te+PRBKbv0o37psB9LDUCQk0A+4bji/2zSb5Cc1xlKazFSokv+mYj2egGJjYpfdCKfxAZwnktCRlfQa1c6Ttrp7mLZo0ikLHl0QyKV7P0925Lk823c9RjKa9uHm5rGHMv2zKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8r4DoYI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8r4DoYI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B861F000E9;
	Thu, 16 Jul 2026 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784218833;
	bh=GW7NYoRkIRLAITpILECP8BeScaGxl7aRDhyytNQzQkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G8r4DoYIAUwe+IgKQNjebOFfkjJLqbCrHNjj2FtaMgpS4sVReurJyvPNfOGNWHkDg
	 Ujh1h3Q8/pDQ21yf3FFMzrpI9uGXdOMWNbZYYBRWF4375ZymHH/mGxLDTzn8LvlHyg
	 x/nG5OLdInKh0tZHRJIH1jnXpazUX9dbx87WT2Cd3Jg13VRP6suWBVuEvb3AWk+O51
	 VWEpqs3dt30bpJYdefBLa3y810QuQIBeNdTrRcryyLozB384J2Ly8R44bkC98IDoW1
	 NGsrFxtYXCUYFPC3CZkMH/ecn9Bm+Epk+ieCVD5RgTknLltlXx2dwGZTggCiwFkZeB
	 D2Gpl+hAN1IkQ==
Date: Thu, 16 Jul 2026 18:20:30 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <alkEKUNzTGnpiYdH@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqmb7dpirdql7fco"
Content-Disposition: inline
In-Reply-To: <20260716155544.o7fx7ecnpjj5sdai@illithid>


--nqmb7dpirdql7fco
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <alkEKUNzTGnpiYdH@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
MIME-Version: 1.0
In-Reply-To: <20260716155544.o7fx7ecnpjj5sdai@illithid>

Hi Branden,

On 2026-07-16T10:55:44-0500, G. Branden Robinson wrote:
> Hi Alex,
>=20
> At 2026-07-16T16:45:16+0200, Alejandro Colomar wrote:
> > On 2026-07-16T09:46:25-0400, Douglas McIlroy wrote:
> > > Here's a typical option heading (from tail(1))
> > >   *    -n, --lines=3D[+]NUM*
> > >=20
> > > It is tempting to assume (incorrectly) that the short alternative is
> > > -n=3D4.  As far as I can tell, the convention that "=3D" is part of o=
nly
> > > the long alternative is described nowhere.
> >=20
> > Agree.  I've had that concern for a long time.
>=20
> That's why I recommend a somewhat different presentation format.
>=20
> Illustration:
>=20
> $ cat ATTIC/tail.man
> .TH tail 1 2026-07-16 "groff test suite"
> .SH Name
> tail \- a porcine corkscrew
> .SH Description
> Print the last 10 lines of each
> .I file
> to standard output.
> .SH Options
> .TP
> .BR \-\-lines=3D [ + ]\c
> .IR num
> .TQ
> .BR \-n\~ [ + ]\c
> .IR num
> Print the last
> .I num
> lines instead.
> .
> Prefixing
> .I num
> with
> .RB \[lq] + \[rq]
> prints all lines from
> .I num
> forward.
>=20
> Rendering:
>=20
> $ nroff -rLL=3D72n -P -c -man ATTIC/tail.man
> tail(1)                  General Commands Manual                 tail(1)
>=20
> Name
>      tail - a porcine corkscrew
>=20
> Description
>      Print the last 10 lines of each file to standard output.
>=20
> Options
>      --lines=3D[+]num
>      -n [+]num
>             Print  the  last  num lines instead.  Prefixing num with =E2=
=80=9C+=E2=80=9D
>             prints all lines from num forward.
>=20
> groff test suite               2026=E2=80=9007=E2=80=9016                =
        tail(1)
>=20
> Regards,
> Branden

Agree; indeed, after checking, the manual pages of the Linux man-pages
project follow this convention.

The pages that use the dubious convention come from GNU coreutils.

I've had plans to write new pages for coreutils, and haven't done it
yet.  Maybe it's the time that I do that.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--nqmb7dpirdql7fco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpZBM0ACgkQ64mZXMKQ
wqkSdA/9EuTDHq+7yca+H2yV3fda9wsch2ij7X0HClsFd01ymsle9cw+wuAIOQvw
M9zSJdfuqdGwwdbK8Q/LlvX30G+Zb9/Zcj0oXPuVDaNGIwEf7nEZHoVwza8L/svV
F+TC1eYEguqM4iJsBNXTjvvredSEwdv2BVrnlYNLhHIY0UjPeNxfAq//PIe9P5rm
jZCBkJjs8SeyRxSvJC4V3NiSeRRGcUvR84vTPdKoedo27sjj2k6FjoYHJV+cpN8u
5YG/MQ3gQPiG7TsyJsSjOl8Pp6OCt8ZOUS1x6bdTZjMmq6eGAZez0tVq0DtROz5E
eEvkDzIYL+beUCzl1DEueMaQBy472FLYDT2XS1pipUInSPILUxO+Y3avXbFT+ft/
aM4Oyaam2dec2W8eMrLwILO3TZowvRLWiMdkiFDacL//r7CzX0KryHEGffW5CEzC
Sh3DontRQhKrcgl5FmVe0Mu/6Brq69UINBVzaooNnUtKVHjfXL/2fdYvipVVcCVa
/NWnqxdQBRcrweuu9inQdNnZGjx00GSvgzIn2lavADcy3Q6EysjqDthRSI0FpIGN
70RlGOYlxct+Eareem3mnrLMgyVlgyJN7kPUztsHJgRj9Hf40cuz8L2EZhX4PEeV
v7mBixsn9+t0FVHB62cctbDxa9joIdXAZljwo/9CuK4TFqMyBAA=
=nHKx
-----END PGP SIGNATURE-----

--nqmb7dpirdql7fco--
