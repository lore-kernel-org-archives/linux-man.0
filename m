Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151053F929A
	for <linux-man@vger.kernel.org>; Tue,  7 Jul 2026 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426146; cv=none; b=Ta4GuRRPhSW9v6P8NeR1o/8jO/zVMLPjrpgfmx2epul5rvChHuQYB49MOK5gvBafdq7Gx0QK1+LE8rLpr5Ei6rPPj0Zu6A6vyYshGxJycQ9USXU6ttMAHm8ceCEk+UICGTyNbS+S6Ual9/7+Ckdcc+5PTcKNtGUeoyKyn3Xi1Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426146; c=relaxed/simple;
	bh=vNK7QtioAzfyNUu6aqa50mbglwdvd1S2xNR9Pb5b9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vcg0l7gNTbNX1xmdxMX2zFZuw021yNe1XliXh25TCWeXxSFYXgJBgjWvLDdeRYMeuA0UJ/10e2ZzskPASUvZA8eC0S17vR5hRhSzclvqE59QICdqtShH+VIJAEImzi73NtLc9TJL+fXo8dTGRkAAAHPFJJOQyqF2/uSUaIUV1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHbPuYO7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHbPuYO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993941F000E9;
	Tue,  7 Jul 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783426144;
	bh=OZz3AbviVB7KonteMN7EQF8xipqokin/bug+27noykI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHbPuYO7H3zpll3W7pOXpLcKm6BmRZE+u8ngbfVkZ+u/9e99gxQWLlBu+FJolydxA
	 Gq9I51cL35/9aLDFTfSTHVzP5mBfF3+p0t0mu7I2RFZ9zTUydwc2q1pa/UkdVuP3SG
	 LLRCr9Q2t/Znepr+nIdrG5QrzhsEja7a7nPzK6ICXBJF+cHv/QdjTIJ9qVNAyxqQO3
	 XkGTva9UkZ0k8PygcghrHZvE02LuoybuHqFz4pwcLGagifhf5yx2aXNs5dUxVTvWIr
	 +i0hdzE9Ezm0XZl0/x3gIl5RZ8QiY4v+Uy9gQDEnWdt78GNQhrjX7Fnvlt5UeTrPhW
	 BZ27ZaL6JRTEQ==
Date: Tue, 7 Jul 2026 14:09:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 3/3] man/man7/landlock.7: Document
 LANDLOCK_ACCESS_FS_RESOLVE_UNIX (ABI v9)
Message-ID: <akzsStBRlv14WWYZ@devuan>
References: <20260515165753.8830-1-gnoack3000@gmail.com>
 <20260515165753.8830-4-gnoack3000@gmail.com>
 <agekjdIfWwu581gH@devuan>
 <akzkkxh-9CUYG69k@google.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wf3sbqf5qmlvfvjd"
Content-Disposition: inline
In-Reply-To: <akzkkxh-9CUYG69k@google.com>


--wf3sbqf5qmlvfvjd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 3/3] man/man7/landlock.7: Document
 LANDLOCK_ACCESS_FS_RESOLVE_UNIX (ABI v9)
Message-ID: <akzsStBRlv14WWYZ@devuan>
References: <20260515165753.8830-1-gnoack3000@gmail.com>
 <20260515165753.8830-4-gnoack3000@gmail.com>
 <agekjdIfWwu581gH@devuan>
 <akzkkxh-9CUYG69k@google.com>
MIME-Version: 1.0
In-Reply-To: <akzkkxh-9CUYG69k@google.com>

Hi G=C3=BCnther!

On 2026-07-07T13:35:47+0200, G=C3=BCnther Noack wrote:
> Hello Alejandro!
>=20
> On Sat, May 16, 2026 at 12:56:42AM +0200, Alejandro Colomar wrote:
> > On 2026-05-15T18:57:53+0200, G=C3=BCnther Noack wrote:
> > > Document the new LANDLOCK_ACCESS_FS_RESOLVE_UNIX filesystem access ri=
ght,
> > > which controls lookups of pathname UNIX domain sockets.  Restricts bo=
th
> > > connect(2) and sendmsg(2) with an explicit recipient address to UNIX
> > > sockets created outside the Landlock domain (same semantics as
> > > LANDLOCK_SCOPE_* flags).  Denied attempts return EACCES.
> > >=20
> > > Available since Linux 7.1 (Landlock ABI version 9).
> > >=20
> > > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> >=20
> > Reviewed-by: Alejandro Colomar <alx@kernel.org>
>=20
> Friendly ping on this patch.
>=20
> This feature had not landed in stable yet at the time we reviewed it,
> but now it is in Linux 7.1 and would be ready to pick up for the next
> man-pages release :)

Thanks!  I've applied the patch.


Have a lovely day!
Alex

>=20
> Thanks,
> =E2=80=94G=C3=BCnther

--=20
<https://www.alejandro-colomar.es>

--wf3sbqf5qmlvfvjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpM7F0ACgkQ64mZXMKQ
wqlE2Q//c/qj2pCxcPyyhYLt4fD4GLZEOYbILJaFXLHpvWCynpAr/wh9Y6XE1mYC
eKXup607KsrnmjH2XemI9rIFsAFdEM285lnvGTl7+zrfjpYdhLOT7+lfJA0U3h+3
MYHME7k3GAb7ZkcLZe4gU8WL6qtVvLDdYcIJ6yp9PNMQrk8MsaIatyvDI/XBnxpI
ds+D48jYGAVKqV/ROpPzsOUyDVoRFh+6liADoTGdA0qy0E0JK3r5dwN7dMml3+U7
0LHO+AuNRqLwAgOPztwsQ+oaeVS/HIAfObBTPf+USWMIu2wmBpTFKtWNUPyRvlSu
xV+QphJiyehfVjWZbSJkAFssaOaaTueAc8jX3bnpTr9zSDBJUlR6AzQ4wyM8NBkK
RaFAuWpIfqAox1HQ1U2a7UK8jJsbVSHPFRAqG1yUPSmn8qejA8ifO6tkINXp6Lw6
XwtPnlkLx+Ntbw7zo4Fr9Y+hO2x3kdbpIDgH7pjUkRHIyp0Vsk4+A/Eq1hwVJqvT
p+J1sSuwpRMvn6k8YbxlUKTuLZ4Mw7AOHkdUSl95efvvPbaarZ0vDUMz/H0ChWno
3liiV1tZE/Jvr1i7EE1yI475OUnTR+TclspmLMO3P6LKUzjtqz3Iu+vwlZ6porxB
w1tOV0Mge1PsQF29PluBSMJEg/TNfnwUmoHka5Xi3dCal/NZ2iw=
=2Cp4
-----END PGP SIGNATURE-----

--wf3sbqf5qmlvfvjd--
