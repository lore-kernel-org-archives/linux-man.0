Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C644160C
	for <linux-man@vger.kernel.org>; Fri, 10 Jul 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702120; cv=none; b=SRa+RhEcD98AUx/mOz5DMXXNPrRXwYu0CLFmSkE+0mXfyyxved0yqPWu7Gv7ideJDBl2HwJMZ1WPpX6Rh7yXOHnA+6PZZY0aWWF5z32Z/+E3TceKth0M5sl4Jnonr9YibUWmy00BeVdBRlUJqc2e4XSq5+CmXMEXmHhPzE/kF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702120; c=relaxed/simple;
	bh=fpjknICaKMUc9ZkPUHFH50pRWISVGEVy8LDsOp5kX/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5+pdhpWH42vyexhEm02sOYBNyxXkBwWMHn9wnvGpmTsV1/u6x3nbragUMt/CR2f1m360978oQ78or4oz8YNhjBYQyOn5+SRiRZ7frri3VEpqQ/mxy5lGKoy6JRwP7ZSc42N/gf+dJHBkz2rThAKhgts5QiZINFluNUnk0wH6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlQyDTb9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlQyDTb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AFA1F00A3A;
	Fri, 10 Jul 2026 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783702119;
	bh=xilq3m5AMq+IMsEsxpVPL4SXThGCFpmWe2E+kA779MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jlQyDTb9nS7IJk/1vtwdZXFyma4iIWiLnQZQZ+fgc2uHH7obOthYxaCer827zRCHp
	 yL28cwa82W6u1hZrwCF3o9h6o1L+IE9qUekqtvq9ETD+xsSHmVmweYmVPa3tcXztZO
	 7W8FQM9/OSKkmMLF8AT4duWh6J/QdNJ73ffTrNI6EikqCEchdyGQD0O47oUQSv9o6v
	 oRDrc3xODypgUBNLuzRlulw8RchiX7QYTgv8fiZR1bfuEHWoDHx6oHZGBx1rRfvj3v
	 6ImqvKCtMMSXLF7Ud0Prnh9bKRu0bI8gVib0RZVOMBT7dAihH4BcK1amULvT7Q1U7G
	 9MyVVFrQDQ0JA==
Date: Fri, 10 Jul 2026 18:48:36 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [PATCH 3/3] man/man7/landlock.7: wfix
Message-ID: <alEh_O7UT8cjcxMq@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <20260709153422.210312-3-stepnem@smrk.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f52a7enznn7td3wq"
Content-Disposition: inline
In-Reply-To: <20260709153422.210312-3-stepnem@smrk.net>


--f52a7enznn7td3wq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [PATCH 3/3] man/man7/landlock.7: wfix
Message-ID: <alEh_O7UT8cjcxMq@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <20260709153422.210312-3-stepnem@smrk.net>
MIME-Version: 1.0
In-Reply-To: <20260709153422.210312-3-stepnem@smrk.net>

Hi!

On 2026-07-09T17:34:22+0200, =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec wrote:
> Signed-off-by: =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec <stepnem@smrk.net>
> ---
>  man/man7/landlock.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 293374ed9b46..556b08fff04b 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -296,8 +296,8 @@ .SS Scope flags
>  .SS Layers of file path access rights
>  Each time a thread enforces a ruleset on itself,
>  it updates its Landlock domain with a new layer of policy.
> -Indeed, this complementary policy is composed with the
> -potentially other rulesets already restricting this thread.
> +Indeed, this complementary policy is composed with any
> +other rulesets already restricting this thread.
>  A sandboxed thread can then safely add more constraints to itself with a
>  new enforced ruleset.

I've added to CC the landlock maintainers, so that they review the text.
They maintain the same text in the kernel, so it's better to have it
coordinated.


Cheers,
Alex

>  .P
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--f52a7enznn7td3wq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpRImMACgkQ64mZXMKQ
wqmFFw/+MNWP+rkENwuRYZWZlKsnAhDE4BTyj2L8/zzBsl2NM5itgYwx7oUOGaHM
002eRSYwuBDuia1b/TbYLoYa6RX90pC3rInk7hWqm6N9ApyqTZRr/75u+V3/8EUY
zQyRjSxi4OrvvbXy/vpdMgEVTux2+paDHcRSqd0iEw28XYQymYPwUCfE5o2hA6wR
PEs8lbe1Dm3bC6qHBOAR4wnV1KdicGv780yxNfz0jOT0FfGtmBr2kARWsuLncSk2
yufFhHx7b+NacWCbKe/PLeQSISzYXRrQvrH6/xN0Zi05rdU3w2AnOLIb151KXq16
1z7Fu0bK0g49A5Id34jQ1QL9FeTh8xfmx5EhodHob77FVCyYxJDcoJ5eHemd5S+i
KSnIcLcwBt1Na40OFPsYA/M5NazHrqRBnphDW9PkeLYw6S3ARMge8ChCsRxpLh0l
QDl9yqTD8VoAkJWjZ0udsLDdOdQ8EZD0K+3PEmHF/EaxKHGqmxGu+npNWwkviJF3
WItH3p8VDogadizyUbQcDt7ulD+fy5QwzRu8CNfGEWw9yyQtAn6l0riawBPEMiBY
r2ao6ektDfbRNKyJ3Yl7II3A3YQxmH968CJa3Co11Jz3zixmcD8CdwyKIm0WAwy2
aUzQvOi3QnlwhXXx1cCy1ZloQRLMQFpQRfE9KppIhlENsIAPMkw=
=IhrP
-----END PGP SIGNATURE-----

--f52a7enznn7td3wq--
