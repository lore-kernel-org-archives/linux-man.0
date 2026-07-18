Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE025348C4A
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377083; cv=none; b=is9D3gzI+pQzv+C5GpExMtpgG1QnONIyXAeKGznYF04PMAiAIpdmdbK4SNVTGYf9ooCoK3FnauAry4lC7bCURXDBMCDI/U/f4vynQZF/a2tCZQkA6X5HCjqTxqYpPlYRgHGXFvV9rJES8ChYbM2H0fi8LzyleOsN09fP9m3Z5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377083; c=relaxed/simple;
	bh=ZFc16yM/sohiuEFILQR+TodmBpuORjdNJ3XsGU70fmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hv5jjmKqtXnyrxblUzjqCdO++vTpGWN+y7JGYRaPcOXjkY58CDmD/S3SzrneOAyZ685Gm+lO6JBcs9iq9Pb1FCdiewXz4G+jQJMytRlMpbw+GtZWcUbUySypDBcF7JPuza9kv/SFGkGlvTMSlwCvypxKBf4vwGBRIK9kv7OngNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUTJhQUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUTJhQUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EE11F00A3A;
	Sat, 18 Jul 2026 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784377081;
	bh=qfgJ73SI4LI/zSm6mjMRYw7HUGypHgJuEfQ9gnnHqcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JUTJhQUAl3AZIRr+MSrju5+kx98ZU2+cBQUHWRoFb8iDdoP1bz0A9aVGjUoKG69Au
	 gblwCSHAFlXaJuUkm73DHJFG6n5WEwhqJEjByEtMq1U5mNV5ZdVoHiBZLJVQ2rvGLt
	 21VmSTkDsftS4g/a9Pws8ob9x/SzwVBl9npGKCZ16LVqrJfoz9PxIU9M0NqYjv52d3
	 XFU5mR/7IZ1nBFVEZHtPmAYti+3f4ZgyYw4Kft2EFLKtF/ZFOkBYDK8K2Y9JeXOjlR
	 k3zEZwzqGOe5LsC5LspuN+w6+CzWwP5/CFxwS9pImVUMRnsGOTV2599DyOS+msGoz9
	 bcu1M9jhT+3cg==
Date: Sat, 18 Jul 2026 14:17:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [PATCH 3/3] man/man7/landlock.7: wfix
Message-ID: <alttHBBoVW2Vej6u@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <20260709153422.210312-3-stepnem@smrk.net>
 <alEh_O7UT8cjcxMq@devuan>
 <20260713114855Z.2240445002-stepnem@smrk.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qqzcj3xdnhxkf5kv"
Content-Disposition: inline
In-Reply-To: <20260713114855Z.2240445002-stepnem@smrk.net>


--qqzcj3xdnhxkf5kv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [PATCH 3/3] man/man7/landlock.7: wfix
Message-ID: <alttHBBoVW2Vej6u@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <20260709153422.210312-3-stepnem@smrk.net>
 <alEh_O7UT8cjcxMq@devuan>
 <20260713114855Z.2240445002-stepnem@smrk.net>
MIME-Version: 1.0
In-Reply-To: <20260713114855Z.2240445002-stepnem@smrk.net>

Hi =C5=A0t=C4=9Bp=C3=A1n,

On 2026-07-13T13:48:55+0200, =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec wrote:
> On Fri, 10 Jul 2026 18:48:36 +0200 Alejandro Colomar wrote:
[...]
> > I've added to CC the landlock maintainers, so that they review the text.
> > They maintain the same text in the kernel, so it's better to have it
> > coordinated.
>=20
> Thanks, I did not realize that.
>=20
> I see now that the texts have already diverged and the
> equivalent paragraph in the kernel docs
> (Documentation/userspace-api/landlock.rst) now reads
>=20
>   Each time a thread enforces a ruleset on itself, it updates its Landloc=
k domain
>   with a new layer of policy.  This complementary policy is stacked with =
any
>   other rulesets potentially already restricting this thread.  A sandboxe=
d thread
>   can then safely add more constraints to itself with a new enforced rule=
set.
>=20
> (Wording introduced by linux commit dad2f2071516
> (2024-10-15; "landlock: Fix grammar issues in documentation").)
>=20
> FWIW I see little point in this kind of duplication, given
> that the kernel docs are as readily available to anyone
> interested as the man pages are;

Not so much; the manual pages are available for anyone on a terminal
without internet connection.  The kernel docs are only available if you
have the kernel sources or internet.

So, the manual pages are necessary.  What I wonder is if the kernel
documentation is necessary.  I think they could drop it (the duplicated
part of it), and refer to the manual page.  However, I trust they know
what's best for them.

> OTOH it seems that the
> duplication is only partial here (i.e., the documents
> differ, with only isolated verbatim overlaps), so perhaps
> the rationale is that the different documents target
> slightly different audiences (I'm not sure I'd agree).

Yup; still, referring to the manual pages instead of duplicating that
part in the kernel might (or might not) be a good idea.

> Anyway, here is a patch simply adjusting the man page text
> to match the kernel docs (I still believe "potentially" is
> more distracting than useful there, but it is an improvement
> on the original.):

Thanks!  This sounds like an improvement that doesn't need to be
reviewed by the kernel maintainers.  I've applied it.


Cheers,
Alex

>=20
> ----------------------------------- 8< --------------------------------
> Subject: [PATCH] man/man7/landlock.7: wfix
>=20
> Use the current wording of the equivalent paragraph in
> Linux kernel Documentation/userspace-api/landlock.rst.
>=20
> Signed-off-by: =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec <stepnem@smrk.net>
> ---
>  man/man7/landlock.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 293374ed9b46..f0a9b6db4bc8 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -296,8 +296,8 @@ .SS Scope flags
>  .SS Layers of file path access rights
>  Each time a thread enforces a ruleset on itself,
>  it updates its Landlock domain with a new layer of policy.
> -Indeed, this complementary policy is composed with the
> -potentially other rulesets already restricting this thread.
> +This complementary policy is stacked with any
> +other rulesets potentially already restricting this thread.
>  A sandboxed thread can then safely add more constraints to itself with a
>  new enforced ruleset.
>  .P
>=20
> base-commit: 794e74fd54156f767801eb60a0d79a496c73e505
> --=20
> 2.55.0

--=20
<https://www.alejandro-colomar.es>

--qqzcj3xdnhxkf5kv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpbbvUACgkQ64mZXMKQ
wqlJcRAAl7q+nY//hgLIXQL5uTUcJAWAIjNNeEhQOP+Rhcs1V1VupNGN/j9bSSw7
C5/wvp3SGGaKhgvvdctdHK/GKGi6+fnPnOtq8uQErFsliYzvHij/LhPNOqVmYJSF
FEtAiuXa6MSgk7D6pYuQwmJb7bkoOUfzxZwFh4kuuCjJs9DJhNgwG2GeUivdSY3W
bccKL5W0KxNa0x8+xYR4QvoeIvbbCsQpiadwf10Ln4anYGGcBQdwl5O/Zb17WEw+
EcfAas8vZ/6wb6CWRBkDjSz8V3WxAxbvmizHTLBqncHxW06Ng237qQ2c2r6MYcbL
wfs+3/rAPIrPaz5PpwzolMIhGHLu86P+7ZyjX7Tqi2xSMG+FH0QKCMDvSmMC9Dqy
NSYPotrG/7b3zB2AxST7zXX0HKEcQf+Ty/jcAXfTOsSoXx//oz2yucpMhnHYYdLn
3vUpfchrNE9o+0Mw8+Pyyf6PMI0Hxer1WagTMg0RCCDPsGye57o+KuIQjW6csGnP
oJ5V2Vy3B6RCRz0EdL6/jfcFNBUFYXpliKM971H83C0Lzsq7C9NukjsWI8QKqVn0
9HJz7ZOxx+YUBBOwEyqt9RccrQOEiqwDV0SBaDVBbKU89x00UYlH7d9jepmfe+06
efanAaeriNmk2HaZ1imOEfBFx0ZHvNoCpvk/4stNZAO6hibtv/Q=
=l9Iu
-----END PGP SIGNATURE-----

--qqzcj3xdnhxkf5kv--
