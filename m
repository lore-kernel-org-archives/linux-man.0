Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D939C006
	for <linux-man@vger.kernel.org>; Fri, 17 Apr 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432533; cv=none; b=Mapk/mPOmMSp+AcOM6TWqVxgBNJCUTqfa7qjnxueCAj7odacU2b4LwKg1E7Tpee9SB+PFTh45e7a0KCH9US1aIjWoJ5EZ8UdeNsX96FLAlxLJ5ErXauJHD7Q8etuYcxKm0qZWu+mc5qm7fjWMKC9TmIfZ9NkXJyAWrgOOTbsNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432533; c=relaxed/simple;
	bh=O3cyGn4WjvL6idUDk8yJUJ9X8Ca5lrycTNWS87SDiHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ugbb59d0hH5Wv8UytX6HpWtIKIL6V6ncH+yX/EILfbuRuzJx80lU6Oh2ZpmNq3a0zl8XTjc0wXtHAa22EnLI4i4Effo3couldaOCpqokgmQH4nxE15/i8azw1lAHgEPLNOyx4aOVL+VHitiV2ydXZTZcqazM1g/h8XxeXNUAcAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8dlkeFf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8dlkeFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1EEC4AF0C;
	Fri, 17 Apr 2026 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776432532;
	bh=O3cyGn4WjvL6idUDk8yJUJ9X8Ca5lrycTNWS87SDiHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8dlkeFfdiSvBItLMXqvaK7qf/NDWI6FlxjZBRIDScBqNgWQQuDhnkoxK0xAmMtpu
	 7m5fUyQEKWGeTw+YaLPUE7w/+ZJUkqnqZRuEDLtewEdj7XaeSHL2+4CNWd4/bKc96N
	 q3uFoLNS9u18aF4FofYampOiAzp2PiFXKzFDS1YTFjqLEDMxk9VAMGgd1m5giQWgFM
	 4F7n2OGhmTg3I/MxmlaQl2MMj9esBALngFtb2dpG6WJBCjj8T5J4vNkV3ZTocRw4jK
	 413Fnxv9/F2s8bAvt8KQK8DiBM16W4poytHPuC4Y8BnuViYgQZT0mwBffv1q8U89es
	 PTWiSTPJGD43w==
Date: Fri, 17 Apr 2026 15:28:49 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Dirk =?utf-8?Q?M=C3=BCller?= <dmueller@suse.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [BUG] typo in man2/readlink.2
Message-ID: <aeI1bpl018Lr-4tX@devuan>
References: <CAN6Ha9b5Tujw=sB5MwhLhnt1XJodmH1TOfeZWJk_VWnWE_smzg@mail.gmail.com>
 <20260415182417.b6cvefbzk6ss3lmw@illithid>
 <CAN6Ha9YYK7jD6D-_eKhHQA0dT3kfkGZuka31Pg+ka=mzt+QtxA@mail.gmail.com>
 <aeADVnt6NpZ8qC9E@devuan>
 <CAN6Ha9YD1T41jTLDux_fwFGQnWEWKQfwPGUC54GrRRG5XXtXog@mail.gmail.com>
 <aeActTSkTKUvMSSW@devuan>
 <CAN6Ha9Z0TTQ5HoA5GthQcExK-3rAf0mi-1svpL8W8TDw2KZBxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jxxvnah7mra2ochw"
Content-Disposition: inline
In-Reply-To: <CAN6Ha9Z0TTQ5HoA5GthQcExK-3rAf0mi-1svpL8W8TDw2KZBxA@mail.gmail.com>


--jxxvnah7mra2ochw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Dirk =?utf-8?Q?M=C3=BCller?= <dmueller@suse.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [BUG] typo in man2/readlink.2
Message-ID: <aeI1bpl018Lr-4tX@devuan>
References: <CAN6Ha9b5Tujw=sB5MwhLhnt1XJodmH1TOfeZWJk_VWnWE_smzg@mail.gmail.com>
 <20260415182417.b6cvefbzk6ss3lmw@illithid>
 <CAN6Ha9YYK7jD6D-_eKhHQA0dT3kfkGZuka31Pg+ka=mzt+QtxA@mail.gmail.com>
 <aeADVnt6NpZ8qC9E@devuan>
 <CAN6Ha9YD1T41jTLDux_fwFGQnWEWKQfwPGUC54GrRRG5XXtXog@mail.gmail.com>
 <aeActTSkTKUvMSSW@devuan>
 <CAN6Ha9Z0TTQ5HoA5GthQcExK-3rAf0mi-1svpL8W8TDw2KZBxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN6Ha9Z0TTQ5HoA5GthQcExK-3rAf0mi-1svpL8W8TDw2KZBxA@mail.gmail.com>

Hi Dirk,

On 2026-04-17T08:41:22+0200, Dirk M=C3=BCller wrote:
> Hi Alejandro,
>=20
>=20
> > If you can reproduce the difference, please share the details.  Maybe
> > there's something wrong that I'm not seeing.
>=20
> Sorry for the noise,

No problem!

> this was a downstream issue which I now resolved.
> Thanks again for your help.

Nice!  You're welcome!  :-)


Have a lovely day!
Alex

>=20
> Greetings,
> Dirk
>=20

--=20
<https://www.alejandro-colomar.es>

--jxxvnah7mra2ochw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmniNZEACgkQ64mZXMKQ
wqngXg/7BrY/RplPrf88dQTNOmrsB0wlhPHt31KtlP8DFNgWs8w0dahPTDxNAbvz
iz4ee37gfoZkfiUruFIByLL9Po1oTcKSqSPnMcXU8Z9+wza1rfH8T8+xjNp6pCtF
ZHhplqfktMTQky61BGz2Gt4oS1OZLCDz8+5cFVYyreerFp2eY51fph/kZBo0/ZCj
S0tHLt2tAv7VSovaM07hBW9sYfRczC2iJJkU++KIVL4zgUTf6NxFz7DWSmbZBSio
XgnEN64yKXVrU8S1R8ujg1m57Izc4hDsVGn94w5MySmDUOAgcklWU+VYHlFuOedN
SF5OQlV20kmJExQvVdM5lT1bk2JxhiURn2ecquPJWNFeeCnUjYHobFNi20DA0gqP
QxDFlAobut0oCywJ34VzD2QSxxssKlkMWwZ79OkZLKOL+ZfjhHnWY9r9qIvS9vPh
zc4P40t4cdKoIDpf8SOPNCa6kupW4wb88C+NETX/rP+8Cqbbpv5cAwmTn0BqFEaV
QJEbZ5UwYcJqi87H53upfPjqS7Us9dZYl7wWuSGpK/5rtv61yoFU/qdWk/ePrIKR
AUMqYW3T+E9Nt7AH1PG8d1Mg0h0ZbVEppNnWOVnne9j5OV+wfu4B3y8Qz8evDIy5
69e00vxg0ZQcECidOzIW1h8z94uflnIIezEnlVaEwhT4SnmPYHY=
=3sOz
-----END PGP SIGNATURE-----

--jxxvnah7mra2ochw--
