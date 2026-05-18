Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7B3E8662
	for <linux-man@vger.kernel.org>; Mon, 18 May 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100072; cv=none; b=EmG3g1giiHArfOLa9oZAezew6GGq6YPo4E876BdNJEqH4RpIGWl+qLNQFEiCaZKxrRdLBduaKZFrEvPu35Oo+Vwg8OEZcaORLGmv0wEiVbcyjoGg+4IWOiyYCenHxmc654u69lHsM+foRuSUzs65dQUWK+d4g9hNE0hcAEDJOo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100072; c=relaxed/simple;
	bh=b80uNcMDX69DUIbWkgv/H9QTz7pkxF8vXVMNHXOL1vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHBNt88B3a/8iLBbDkFJU76tKxYCDTay+e/Ck0k+shrtxqHi9Pg2HKZmz7e4MobdWQIfT8Iq7uj0SWHs4yJRy4o+D4O3esfzsfQ6tAw/DoIp53Gz7QZzEMwe06jHibDYoFx08h3K5s681FkFbHVxN00ipxDSIP7SpmkEUfE7jqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zqs/RsBH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zqs/RsBH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A51C2BCB7;
	Mon, 18 May 2026 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100070;
	bh=b80uNcMDX69DUIbWkgv/H9QTz7pkxF8vXVMNHXOL1vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zqs/RsBHDLwCdmrPniiKxF9h86cb4im2S2e92D1gdebfVvA2nWTUqFHggqgmel+pf
	 byDoDfpVxExDq8Z4sfictoI72YLqi4GIIj0ItAWkvJanuBJ2SazTa51hBvI12/Cy5J
	 jdz3RXnx3+GOV9VOY7TMUsIPMkkNu+DJGpZ3ewbQNKwIMW92pR5k75M/44LOsGUHZ4
	 DwzX0qICuu4SHO3o4ognt5Juz9nrjfhOavo5Wwdv0mdJWqDNiqBQyaIJqthv/cOrEL
	 MOy5JJBoapR2vVocdiaIkBQ7u5A16i31E80hMNJs+xfr3ei5LhywepcH660veR5JD2
	 EoW2sGyhY5kZg==
Date: Mon, 18 May 2026 12:27:47 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-man@vger.kernel.org, Petr Gajdos <pgajdos@suse.cz>, 
	Jan Blunck <jblunck@novell.com>
Subject: Re: [PATCH v1] man/man2/quotactl.2: tfix
Message-ID: <agrpfWkAA6g-WGGF@devuan>
References: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
 <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r3ducmmiyeakcxy6"
Content-Disposition: inline
In-Reply-To: <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>


--r3ducmmiyeakcxy6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-man@vger.kernel.org, Petr Gajdos <pgajdos@suse.cz>, 
	Jan Blunck <jblunck@novell.com>
Subject: Re: [PATCH v1] man/man2/quotactl.2: tfix
Message-ID: <agrpfWkAA6g-WGGF@devuan>
References: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
 <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>
MIME-Version: 1.0
In-Reply-To: <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>

Hi Jan,

On 2026-05-18T12:20:50+0200, Jan Kara wrote:
> On Sat 16-05-26 19:12:08, Alejandro Colomar wrote:
> > It seems most likely that this was a typo, and that Q_XQUOTAON was
> > meant.
> >=20
> > Fixes: 1eeddf25 (2010-06-16; "quotactl.2: Major updates")
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Petr Gajdos <pgajdos@suse.cz>
> > Cc: Jan Blunck <jblunck@novell.com>
> > Signed-off-by: Alejandro Colomar <alx@kernel.org>
>=20
> Right. Thanks for the fix. Feel free to add:
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>

Thanks!  Added and pushed.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--r3ducmmiyeakcxy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoK6aIACgkQ64mZXMKQ
wqkiTA//RqDOIL1AFm72DRWMLblMW/5L0WKQ612XC3YcZocxxdFPlQ0huZpdRhW+
6WfuTN3z+d97NR4HttlpxgSYo1Ec3pqeNcy0EiM39MfmYoay73iFTff1xm0GKsie
3kaeleHWZLHfG1a+Yeg99/g7ihTG3q551FehI4kAveI7KRictSGDFrAxBGLgWkLq
TkEam/6vVAT4mImTIXtgoq8lM/kwZJoeYdTcPTkbExPb/cZgpTXvu8LpiD/gQ9YO
O7mgfPC4ctqTnpCIbMgnNNaUdZ/ID/58Kw0xvQ0AoOGfcMKboNjLL+s1hP/Couw8
bJLQEZbNUD4pMdbsfO47MrWLO+Xu849rpa6RB4BOY+Ht7UlRblksCn7zswR0RQ/w
2SqifQxsfWRN1dvXfMJY2AIPMRm3QsOI16dqquJ9zaqLfMtPM3rU5M+FiQsXEkD/
ybJJyB7DZRpeZN9BmTgWGhtrGC8sdFy8mJpl87lPcZfIqDrfCIE5bVxSw1JKlSc2
/LOyyzalf6nTRepTjxRYesrE2MIQxHGRY9xToRRHCLl8ZIWo705OBtz0pO29bdxj
AVXn7eB2w8R6smy5WDyImjW+LxWfKnbtXq0sg+G9DLHQ+Qm1ZYKQrMmbaE9XqQjd
jOYN4S56hGwPTsJUsuuki/dv0ULB22ufrPcFjn3DBdSEZs8fR/4=
=vMc+
-----END PGP SIGNATURE-----

--r3ducmmiyeakcxy6--
