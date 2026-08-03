Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2612836E
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785799166; cv=none; b=OAs2G9sKV1hvRpFgs6maDp9d+qgtTfpylJQacJE7Rp57E39WkwU94viiJ9HJVQoa5R0E/SYYlE0JkDwM9rMZ1ygeOmfclo66I5GjuYiU1447iq2mmcI0pCT5kODD4tKMgex+HNZaasA6XG29x+xMko4osUBKBQsfMW3ue4tqR0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785799166; c=relaxed/simple;
	bh=NNloX0YgPxt9kH0jSBWR+Iaqr7lkE6U/3PQGqwEbYYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGElaHyNRv69HUmPvk4g1Aw5ILdsE+NO5i55t8id/tPn3s9/yxow2Z8Vtk8Mn/UW47hYZ2jCcp6nHpYU/5EeTL+VUMaYQe9GCM+hHL91FdIcPIH8fGp2LGypoU6b4pKm+BTdy/xcfoekpGnjs4QUL8gRPAt/DvHS4PrTq7bsTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiZfT2Rt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiZfT2Rt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430071F000E9;
	Mon,  3 Aug 2026 23:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785799164;
	bh=u7oxmZmVJ4qH9mZiUBvDiDw6uY7zEEAYS1x5NjjQQXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UiZfT2Rt7YDL8VpB6fSrDcNjmR8AeonWA1hQ2zSQYngX1mxOuA7yjZbGqkzQ8O3R0
	 edEmUm7tjFfWJAZQc6JL7KDWYkYPDxbth3gs4fbrVQ2VYw2Ol/skU7lDPt7INWQN2Q
	 BE2MEDtGW3gKwi3uRYwGGKsaUDrDeN3ku2xypSc3XBn5RxZ3iCE18DEyC8Blvoebmg
	 gaD8NTw1UMAOhebkUq3Jk4kbQPLC7zIIttL4SWPnarhWvsUUo3p7FIfD32BstMoKZ+
	 2JECgSTp7LHXYvNNAWpqfDlaEyvQ11GlyjFOjensG8HbktoKEQGyUKuz2XOoSdw5+7
	 jlnO1hxIlQarQ==
Date: Tue, 4 Aug 2026 01:19:22 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anEg1YHvSakrHb89@devuan>
References: <am1GD8EYQqLBrXCT@devuan>
 <xn33wv57kw.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="awripvgwo24w5ebv"
Content-Disposition: inline
In-Reply-To: <xn33wv57kw.fsf@greed.delorie.com>


--awripvgwo24w5ebv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anEg1YHvSakrHb89@devuan>
References: <am1GD8EYQqLBrXCT@devuan>
 <xn33wv57kw.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xn33wv57kw.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-03 15:26:23-0400
> From: DJ Delorie <dj@redhat.com>
>
[...]
> > (I haven't pushed patch 1 yet, so if you want to modify it, I can amend
> >  it.)
>=20
> Well, you did push it ;-)

Yup, I thought we could always go back and edit the page if necessary.
That also makes it easier for you to rebase the patches, not needing to
keep many patches around, which can be messy for projects to which you
don't contribute too often.  :)

> I added a signed-off-by to the new 2/4 but I've never had to do that due
> to Red Hat's blanket copyright assignments everywhere.  Assuming those
> are in place for man-pages, I was under the impression that a
> signed-off-by would be contra-indicated.

I have no idea what RH does.  I guess you mean the GNU stuff?  We're not
GNU in the man-pages, so I guess it doesn't apply.  I certainly don't
know of any copyright assignments from RH, and there's nobody else here,
so I guess they don't exist.  :)

If you point me to any documents, I can look at them.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--awripvgwo24w5ebv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpxIfQACgkQ64mZXMKQ
wqnlYg/9GqMN0P7i6pf0SZQKJXhcDIowj2w80KZ2LNLJI9nx/vPRcPJHJBvH7TU5
KadQ9umgDDjL5DIJ2Pk4wE+3GZWk8XrftHfNAdV1xzL8E/+9rCUzNttcAvs46VTf
zGqmxRz5rPBGnh1DMBTbwklU7ntYV1fJntidQp+2p98ozUqZJH4UJSouZXr5DLGI
9VRszGFxmV6lGqRty4rvGKiZb8TebS1coO+6klTeV3dK/23BDoTDi/ZWXh3vrt0n
/M1WxPCa/YAMU2+jJSHsStufrzgSx2yyQWroEnkTvtoIx4dELEyuH0DWwpjjG69V
l/As68GhCE6OdLg1qrft2Yb9ptYP0VRPkdvm0Tr0Yr6u215s0K7L0F0MPgj2uMA5
tNqJRgg+5c4hzqikzfdV2FHSUuPDoLuM/p8NuA22XmQLjZbA6et7+itel8kBteP5
P3qJ2OJ1wZtxrmKAznv9HNzdwW9dZoi7UEvpUqJhN0KlvSddN9BFZ5T3lQEi3YqW
mrjhTKWOYMxsqovSEsFY5MHwsrEkPRc685cHwKT1MH2Fjqv9z1dSn4GSEGnDT59q
H3+3o+8kXfwB/5Om8pHJdZ0vVo1SKyVBtKmM4DPhbJN0RoAbnCFFFTOkzMZG45pa
TEim7pX/h8sDj5tYeUp7yBX6QY2Y+NnqnZXiUu7IeHTsJGJCMvA=
=Bcw0
-----END PGP SIGNATURE-----

--awripvgwo24w5ebv--
