Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EF93E9C33
	for <linux-man@vger.kernel.org>; Thu,  4 Jun 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575259; cv=none; b=ml6Wdkvi6EYptINtld2wuvcAOFOjcJYTfMoN1uby9orBroaTB7XXth717l6Z/5xfXDp/2LK1ryWnwZovutHf/16S0FpZjZXahaZvzQGbpasjg4265bbtFvlhK4DWu4HmDwwWXjbYlypUJ4O6+mnXBVeP3D40M3eIcBToGsb0q84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575259; c=relaxed/simple;
	bh=J9mMg+yFz38Q2epU4D/M57tLyLsmfWkq2WSJuELxLgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqAtq84XhsL3Z1eUHBg7KsOASX1gV2XKavBx+6hxLt9zM57H/4ONLGusQwgMJ90pu5oDvnmjq7X6RVXWItf2AbXTGtrWWgd9ysoW3Ce3LuPXTmjwOqSZIItDiB3C7I7eiUIKir320AhD1Finp9UfwUh1ZB3aUUlM603tHCHCQ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6t1W4lm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6t1W4lm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127E61F00893;
	Thu,  4 Jun 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780575257;
	bh=aBxa+lcyqcVhyWBKSzNc+JB9+27q4DQnFnUbO+WVQMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6t1W4lmKkuUG0RM+L32skbHjR+cwOS3ldqkpLqzHbbLVtuSMgSNHM883chwwCIfy
	 ERT2P94AcuYsOW+6oA7tqkEZeDaerccYNjypA6Bkmi3AmYxoH2ZDuGFcU3L2OZFVm0
	 qlsXEKHbdc7QXIArwNaZXdWRMGXJzliHQUmA1HTTHPHbCPit3+HazBAMJMXqgrDTwh
	 WwI5ujK3CjCJ4RlgC8EInaeiFDfRKmWHdVpe6xR570dkWB9XjpjGhztpS8brD+17yY
	 RPGeSVcm2DtOYOrZGQI9BOUHyg9DClj9XDHpYMttZm6WYy0UkO03rHBgAUWQL0RVe4
	 /n5ghoNRE2nig==
Date: Thu, 4 Jun 2026 14:14:12 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2 6/6] ioctl_userfaultfd.2: Reference UFFDIO_RWPROTECT
 and UFFDIO_SET_MODE
Message-ID: <aiFrwjkQ5SVcUYrL@devuan>
References: <20260526134149.2831720-1-kirill@shutemov.name>
 <20260526134149.2831720-7-kirill@shutemov.name>
 <aiC9Be5oxT8u1Z6E@devuan>
 <aiFplwrPTalpnQqn@thinkstation>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="moqcyjfqpi6k6vnz"
Content-Disposition: inline
In-Reply-To: <aiFplwrPTalpnQqn@thinkstation>


--moqcyjfqpi6k6vnz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2 6/6] ioctl_userfaultfd.2: Reference UFFDIO_RWPROTECT
 and UFFDIO_SET_MODE
Message-ID: <aiFrwjkQ5SVcUYrL@devuan>
References: <20260526134149.2831720-1-kirill@shutemov.name>
 <20260526134149.2831720-7-kirill@shutemov.name>
 <aiC9Be5oxT8u1Z6E@devuan>
 <aiFplwrPTalpnQqn@thinkstation>
MIME-Version: 1.0
In-Reply-To: <aiFplwrPTalpnQqn@thinkstation>

Hi Kiryl,

On 2026-06-04T13:08:49+0100, Kiryl Shutsemau wrote:
> On Thu, Jun 04, 2026 at 01:47:42AM +0200, Alejandro Colomar wrote:
> > Hi Kiryl,
> >=20
> > On 2026-05-26T14:41:49+0100, Kiryl Shutsemau wrote:
> > > Add the two new ioctls introduced in Linux 7.2 to the list of
> > > operations supported on a userfaultfd file descriptor.
> > >=20
> > > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > > Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >=20
> > Patch applied; thanks!  With this one, the full set is applied.
>=20
> Thank you!
>=20
> But it looks like I was too optimistic about Linux 7.2. Looks like it
> slips to 7.3.

No problem.

> I don't expect any API changes in between.

Ok.

> How do you want to approach it? Do you want me to resend it with
> s/7\.2/7.3/g once it actually hits upstream?
>=20

I've already pushed the patches.  You could send patches changing the
version numbers, once it actually hits upstream.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--moqcyjfqpi6k6vnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmohbA0ACgkQ64mZXMKQ
wql5nhAArlR9HFaQpqk7onN2HAfasQ5Sc8x+ZMMX5gWOTiqotg1oA5e+xU8fQTfH
OG/uqINZCXEE9/wPc+aUs8iHNWg0/33Irx0R5OWAkZLoqnqtf0rTdpz1EdlXqcWK
4S9I7VmNr8mvtrxVZmsTsZmPMVWgVoehMaiJ8H1tQsa2F7/355068jatngB4hGf0
V++kI0RNz0m84aTrU9078a/iAFobHJtn/3VC4Po7tqqIciz1gq7/T1AT3yqm4a7D
ufvZTiS/frZ+aDfXkG4lqXh9rlMmtkXh4Un5vCcuxxeol8/vRitebgjkSrXDLs7N
h0dEOcvRvQAN+u2YcIT6BuyDTRysRUOggn/YVlFVmtXdNq2t+ngGDEcA2IScweOy
yXN+XUkOdGs9SMlnHqQzcygGm3mOvVL+dOIUryD7+BNKzFsH3zdEo5TftfV9tcQN
7eKIm/AFp7db8X7c7z+Vrx9Gao1SRonpFRw0O3EMXbmpDxal19WUKonZ5qe/GdlK
58OOd8gPXd8U1FzFBF6shexLA8J0lLMrfznOJ45QIO1564O3SOPAdieLrEGAgQiK
ujxpNljM/4GdFfb8P65jOz7T1ahK1YQWLFxRGG41HZJe5thvm19tqMuw+2g30lYr
uf2T0liZj/ugXk0XFPJQ89Gjes8iT2vuf8CwOKySPejqfdK5e9o=
=+1I3
-----END PGP SIGNATURE-----

--moqcyjfqpi6k6vnz--
