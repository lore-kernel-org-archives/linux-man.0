Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE11419A4
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420850; cv=none; b=Uhm1uIA+HLJtpNEKPwf8n8o4gEiaRSFTQ/BnGYtmRCnfdjPw3XbDyuQuBBEtACDi/hszVw9PhZlEHq6Jkp80K80moaLJmU4LtH36WfTn/VS9f+dgmYUtuaDQkHUvdBjpwVgZli/zw/JFQgL9lKFIF6yHbg5iUaujeKVf/PswmOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420850; c=relaxed/simple;
	bh=04ITckkbo44so/9tMjgVFM98RZiM6w9Y3W0cyVpn1AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADwbK8p3LAHxkvkaWnUX+fwkK2lqtcCE0Qqs0k9kf3AyKWpf2QkH66CRpfE5EogUlIf79jdR5yQJr+sN6Sq3iTrNoqSbqjVTiW1ATGGFbYa6DHs7B3c0NRzREpXTZDP+mDPrMzG5mCtorqf8vjqdUIk8R0Z1GUDNSzw7rk6wJXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYiwvq99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYiwvq99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77931F00A3A;
	Sat, 22 Aug 2026 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787420849;
	bh=OezrGtztJXaBakjp0HWfSKIcDoJofelMyA6CXEXDndI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SYiwvq99n0eje7gBCoVsv9TPe7THV2bb0x8Vz85ppeeHY2DGqVhawcsvYsD6OEz9l
	 vFU4FQvbGKcj73S7kHy7HXHXcAIeJy0nlfcV/WyJU5z60DMjuCVjH1UHbBMQP3isQn
	 dC+BUBYGKE6K1zIB9anvtv0gDCnN3X/dSZEipVPrJhyL44WZkO7zaB7J7oy+DBUqOy
	 vOU4hQUdZ1SvK5JAN2ZImT1fHTVV/nQFaYsjmWVsu1estxWDC8xEBtfu+W5qFh16rP
	 JHsRtfTxWvQXKhO8nxhImCLZFkuxWiSswjIWbOtnghia1Bnvh/tMKg9H2aEJTeSudQ
	 OMgugW4CGa42A==
Date: Sat, 22 Aug 2026 19:47:26 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aonfyurBGGpdjEil@devuan>
References: <aomtdXK5M19xrk0z@devuan>
 <xnecfq9jhi.fsf@greed.delorie.com>
 <aonffTpk4ABQKkGH@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2s3nvq76wswkpjo3"
Content-Disposition: inline
In-Reply-To: <aonffTpk4ABQKkGH@devuan>


--2s3nvq76wswkpjo3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aonfyurBGGpdjEil@devuan>
References: <aomtdXK5M19xrk0z@devuan>
 <xnecfq9jhi.fsf@greed.delorie.com>
 <aonffTpk4ABQKkGH@devuan>
MIME-Version: 1.0
In-Reply-To: <aonffTpk4ABQKkGH@devuan>

> Date: 2026-08-22 19:43:17+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi DJ,
>=20
> > Date: 2026-08-22 13:02:17-0400
> > From: DJ Delorie <dj@redhat.com>
> >
> > Alejandro Colomar <alx@kernel.org> writes:
> > >> +.BI [ filter : pattern ]
> > >> +.EE
> > >> +.in
> > >> +.TP
> > >> +.B proc
> > >> +The
> > >> +.B proc
> > >> +filter limits the following tunables to processes
> > >> +whose name matches the pattern.

Another detail I noticed now: How is the process name taken?

Does it have to do with __progname?
Or is it the name of the program file that is loaded by exec(3)?


Cheers,
Alex

> > >
> > > Is this also a glob(7) pattern?  Or is it a literal name?
> >=20
> > No, it matches /pattern/ exactly.
>=20
> Hmmm, then let's say file.  Does that sound good to you?
>=20
>=20
> Cheers,
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--2s3nvq76wswkpjo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqJ4K4ACgkQ64mZXMKQ
wqlRKQ//cn3/fy/5oelryLtaSvkcZgVjrTXpuxV950JeMIhKX9ynsnXM0qBLHTYK
Gg8YnNjyN16g2Trzp11lFLP8lChDjl7TV8whE0a+jwzbEPEz45/asMYEjHkqxL+R
Wm05ToZjZFKsItL3QRXBk31m5OplALgKsaldZBPsW2KJvhnYJUm6fdqNBSDKyEKS
pTaRWTv+iZaZ6Au5RtvgREtFGLsN5bfcUNjqUIa+B3KOENnwlbdDz1nOkYant1F1
dR0jR+kXb66a2+UI5mowb6Pg1tbKrqlsdnI+oV9OMbxlmPXwyahDqNByp1IPmzGs
euL1ggRa5GEEa+cYdbMSel3EljYCqyBSCjNukX9M3Hkv9h0mjrfyEre/IgiMPfga
15pBHK0NwDHf1IPZMctE3dtlzqR8H3D2zEop7ZIlUTtuQjktFR+BcpyoQNRuEwVg
a5U15jrF5QIM5khqg7lMO4xSc54zMoxDX25ZF7tybbYSerlY8kwN7w98jKgeE4do
4NTGAV3Hdf7+wOOp76EuAmFsgrvnKi0h6yPyf8fxPBVCrIjYhr9i5TyR79eOW+Xz
w2zh/0Y6TjbHP6YMq0bD/grGHf01DQDj4XWYfr3q5tINZiqSoaBG+SJ/5aLQ39Vj
KwIgUPDSDEmD7PFQPL4xDFLJqgQZ+DNKLgnq+a62uO/I0xLE+ys=
=KZtx
-----END PGP SIGNATURE-----

--2s3nvq76wswkpjo3--
