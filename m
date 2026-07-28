Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F033A9F8
	for <linux-man@vger.kernel.org>; Tue, 28 Jul 2026 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254334; cv=none; b=GGmtNPe6AeT4kr3SLzlWp1HGI/7V94tssM2qO3v5nCsb3Iba883c0lXw8HftEF/8F3XlHlpbMC9p6yztUy/N+sfeXbsh8CS6BaXdbSKSccB8XTlktdfxFbzzi9EPpip9fSMLL3pZRT7FqB9fqpvF6cN9PXX1C5HbC4kDB9Kf5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254334; c=relaxed/simple;
	bh=XhpdAiHRJZrk8PUR6Ofs0Ixd0jQIblwE/iXWVWw3o9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgUJIf9y0nfBA7bNIdblMl6vh8A0CLvOSfFWB8KbKgWktfFHM1FrjwFFl/H5lSey5rpOI61upAqxpD9yOEUCg0QbNVHNCflfysHUsyiK4nPBTkjVPKm8qq1WV5wcvls0sUI3Dl6kNFFb1cLZPcPhRXzo7BJsoH4RPVPqgT+fGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBaoVgmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBaoVgmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BE81F000E9;
	Tue, 28 Jul 2026 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254332;
	bh=IalJwCaKsBrrkOdqT5d+CLm182pxQ2hjia+ZNis/lTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iBaoVgmAXFbUh3yvkdrmSWSOf5WWIhom81ck9R+NvWgBsheIzoHyTMKqyWfMcaExQ
	 y+p21HCqZFtHPD1nnGy9YOZvJ9JOKVhl/oUte0Z0+HeDMC+sJFA/Na4UDpNawRvsub
	 XnnmgZXjV2mMT6bApYwaXl5Ayi/15PJyU74tZNYwof8WwHSRv2sIEWBdYGOOwo2vqF
	 4bQ7KYbmFPOqAk/UZfPfZStrU5l9DIsoZLyZQ61nW6+2J2Tdoevmv76ZjAn5NFaxPI
	 kCQ7L759FZ8vUChGRLSZ8xMZ7vjvSzSY6E3cab8k2d2Fg4+mIsEyMoD784YWDWtUKK
	 0gfdgBWsynmDw==
Date: Tue, 28 Jul 2026 17:58:48 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amjRQGFh1PvsjJSC@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntwazjxefqnjumvx"
Content-Disposition: inline
In-Reply-To: <ami6Pbs0oT9gLi4W@devuan>


--ntwazjxefqnjumvx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amjRQGFh1PvsjJSC@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
MIME-Version: 1.0
In-Reply-To: <ami6Pbs0oT9gLi4W@devuan>

Hi Mark,

On 2026-07-28T17:04:20+0200, Alejandro Colomar wrote:
[...]
> > That is, memtostr(str, mem, n), introducing a whole
> > new area of potential confusion that was not present in any existing
> > mem*() or str*() functions.  If reducing potential confusion is that
> > important I would have expected maybe strfrommem(str, mem, n) or
> > similar.
>=20
> Hmmmm, interesting suggestion!  That makes it resemble the strfromd(3)
> family, with which it actually has some (minor) relation.  (It might be
> a bit
>=20
> strfrommemcat() would be a weird name, because the cat is next to mem
> instead of str.  Should it be strcatfrommem()?

On the other hand, there's precedent in strtol(3) having the arguments
reversed compared to the name.  Programmers are used to having the
destination in the first parameter.

Anyway, I'll mention these alternative names in the proposal.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--ntwazjxefqnjumvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpo0bIACgkQ64mZXMKQ
wqn/fBAAuOem0pa0DweagcDBsTKWL96sCfRPYpDVjXM95vmUegp11rSf0HSqvbYp
Bg58igqwAV9WydHL6V+xqL0vGi/lUZ4QfG8Yfj+sFIOhWlB1TPsFk2vz2HAF4Mbe
fSxPJrsOm8q01i6N6KBCrv/iXd+W+HpSNfMAipq5TO/lOtbKyF5HA1h7xcR6Zy5t
xv2zVjEzoaayIQ4Gqz5kwNRk4Gq8eiQL5cFAO2z2zorz1B1HSvKEfTRquS19U666
NEApSrDuYyKdn7RnbUFkwdmie4B0Yxji7DE5lP6Cq4v7Qv1vs+l6hE6bxLPMz1nL
ZP0UyX84/Xt2k/ULUpAaEeQnPXqUN9co1udTlsxnxkq0ZHvfk1fqNqW443yeDaNS
vkCluFJxJbdkxwLEr1PfuJF5iSt1c3Qwb+HVZbIYj9BAMTUzlOxDuHBvdoBYwbFu
/urCKItbR3p2nhAG+f24bsSFYABAlf6IPLnOgB4cpK+KTmhVB2cqmSNOZrrZoZJa
FLewvpe09URD4QTAp7WgIA3+9KMzsr3Mv16E0C8lz6+kVrMeFxdCGS7Wy3AXUR0m
HrljZ9zgE8oD8E0yNmB0nlbZqbGbIP7JFgo0xSwdewVuHt2dZicg6yNmNb+OEgnj
zzreo8O4FjNotClCOXKt+BLwmVMJhfslvPk5QFerNRl9CPizzsU=
=t+zP
-----END PGP SIGNATURE-----

--ntwazjxefqnjumvx--
