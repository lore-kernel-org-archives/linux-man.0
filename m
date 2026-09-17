Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5694D37D3
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646381; cv=none; b=Ds9EEFexggJW7F02B85FqnENdCoFuCF7XOzHaY6HX/P6lgJNvhe1mtdeaQIv9zWJ/2HxbyzTbASik9dCv8cLI5obOTXGadtis30b84X54DTADJWeKmCx9iWO1LbsjIMZKd2fFlTkaODNhuwmjCMXd6zgRHwQd/J1C+HYGiUSlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646381; c=relaxed/simple;
	bh=AID/v13QT1t7HxFylPQMd/TUMPo+cYXr6jKSva+mLZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTz/8IF3Wdttng7kbMvbRJ1eje+SfxXhd807deCRkj/TgMleeI/LwkECKvPjBbTfaFTKGx8mNX+Il3K2ILWeRt/IEPyaZKs0TdBIzTCuS+lXtWTWcd2Xwmpf9Ua29NPOt7SzgozHI49Kqwf125qXuR5q/EQ40Whz03Z0yeYG/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSFw7QgU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSFw7QgU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924601F000FF;
	Thu, 17 Sep 2026 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646362;
	bh=7odtCLqhiNGeA1k02Vmp3uRwsNaCyxwS4gxt3KaNjrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jSFw7QgUkmco0DRteTqjnhW34L5uC8mT4bp/pXZ0wqFP6BSmCqSrE9pL5M7R3ERHQ
	 0cNdB3sG07O3Q+ta68ReoXL3dkATY/rdXoZVO3ZR52K67c7Mtbvj4wJtpBHfXxAcP5
	 NwMA4ZUp1oXWOjQ8V3KC+4zi33lkWRJ2oZNM8mKIzu8Bzlbpx362U1N4RDB4z1S77T
	 s4I4iQ8UHHLDo0NnfAcHr8jXyhnCzeicoV9f8edqRt0JWeGRl0WCGcWXf/CoeLHzNK
	 sSFEzQUrNbKiRC8TOoLzaw0/omERFnlkSYEpoIQjB16jDmEq2YS890jUlJMDs3VVrU
	 CCNBfchCrZnhQ==
Date: Thu, 17 Sep 2026 13:59:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, g.branden.robinson@gmail.com
Subject: Re: [PATCH 2/2] man/man2/ioperm.2: wfix
Message-ID: <aqvVeSW_dHnYbwca@devuan>
References: <aqXOgqne-v4GtglY@devuan>
 <20260917062039.1365378-2-astian@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmrtr2ztumfiqdeg"
Content-Disposition: inline
In-Reply-To: <20260917062039.1365378-2-astian@memeware.net>


--kmrtr2ztumfiqdeg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, g.branden.robinson@gmail.com
Subject: Re: [PATCH 2/2] man/man2/ioperm.2: wfix
Message-ID: <aqvVeSW_dHnYbwca@devuan>
References: <aqXOgqne-v4GtglY@devuan>
 <20260917062039.1365378-2-astian@memeware.net>
MIME-Version: 1.0
In-Reply-To: <20260917062039.1365378-2-astian@memeware.net>

> Date: 2026-09-17 06:16:01+0000
> From: astian <astian@memeware.net>
>
> Signed-off-by: astian <astian@memeware.net>
> ---

Hi astian, Branden,

>  man/man2/ioperm.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
> index e4a058164f6f..9b9aaf3840e2 100644
> --- a/man/man2/ioperm.2
> +++ b/man/man2/ioperm.2
> @@ -4,7 +4,7 @@
>  .\"
>  .TH ioperm 2 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -ioperm \- set port input/output permissions
> +ioperm \- set input/output port permissions

If I'm understanding this proposal correctly, the fix is because I/O
is an adjective of port, not of permissions.  And then 'I/O port' would
be modifying permissions.

If my interpretation is correct, then I believe I/O would be separated
=66rom 'port' by a hyphen, not a space.

Is this the correct interpretation of the proposed fix?

BTW, should we contract to I/O?

	ioperm \- set I/O-port permissions


Have a lovely day!
Alex

>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--kmrtr2ztumfiqdeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqr1hcACgkQ64mZXMKQ
wqlZUQ/6A0G+D68TD4HdEED29BIjtXPzDMDkK7EPeUlanGlaoaMlSQuguuYqS3Kr
oOvq3SEkOT76/v3aYXq91eNCROyhrYpZ1q108klURPajeBfq4ufMd2R78M2kv8/Y
3KP4CQf/9udse8E8+D0cCk399oeLGEZxaytm4iZzujhiT0TF0rrZD5GvaccmZp9o
KpXHRyGq4tK37SKC7GW/7OWvbCye7D81IlM4Id9byzxIFa4ad/z3yNc62mcfYvMg
xia9t5ukrKczxrEgBsbtEWWKHkgo0hkumOLZCLqGTDTNeOU99aGgeSgEAfJUnbOS
Gl616eKkTgiXa6Iv5dqiqbzbv+xnjLfesnMxQkSun7OQ5aq/f9Utz1Csyt1rdB5N
IE8NAOzCNoNMXT4CvLdcgvHg3gxbe07TR9+JsMyy7e7HLdGdSyBP2ji4kAgyPfmH
KtWnZxdup0oywzsVJfSVFu2IlGVqS3y/o00ytGeCr1VCL9N1tj24XdQCnWl6yty6
0U66qDsHPOhqlMgLQzkoI6mhDhRP/w+GS9sDJP7ivgmMfa9sEC4PMn54fTMK0SFg
tIrqX6S3xJ9mIEhLgHFW7bZRZtbRP8XxoGNsq6PDwqYVFHEWNw71/T33F7qP/xt7
93eJq4mqbFL35JKabxHv5llXXUJBl+ZkluHdi+P9de4Y9oiC/4s=
=ito/
-----END PGP SIGNATURE-----

--kmrtr2ztumfiqdeg--
