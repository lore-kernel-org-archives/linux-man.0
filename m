Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B11FF7C5
	for <linux-man@vger.kernel.org>; Mon, 27 Jul 2026 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138704; cv=none; b=SIYXxw/8EZFlPIpeZDCTrmFZ6+IyKhN0jntaKm7slFwsW9BC2MYerbjM8CAg21e71E6dcudkzHtKsAGfkdfID9EYWmTIBzTaWb86/C5vcxzaT9Ur8mau0fEmRV0E6/FEMMaF0/g2plO5Vp5VAbRCJqhquIGL5dkCnQx/wRB6vLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138704; c=relaxed/simple;
	bh=ncLtXWHCjHWnpUafEW83L3E4t4FmPTlgZlELmn4HNb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCmfWXl1QYLTum/7b+HmvXZCrqPqFjxl+vAvV2rkP+SNWoMhcSVTcUOZXWy/7SdS/cRQF1J88KFq+vkeLoEkOuP12mHjog4iMJiHR+elL9PNKjSvdFkh11hqhHC1Vow47gsot/4pw9Gp9Vd4KZ+KV3Xo4PMSjUIs6MGvKzzwDAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ge0tlzfl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ge0tlzfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66031F000E9;
	Mon, 27 Jul 2026 07:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138703;
	bh=Dn44JtskMOOpDLsYI6GedGrtA2Ycqep3eXVtA/MzcFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ge0tlzfloDGsInVWl+va+yulB0Z2zQpMg1d3ICykzy5iCgNZWYLe0zMXsLbB6C+mf
	 wk4/9og5GzDo1MlC8fRWxH8sjBWbIfSHaAafz9fI6+/QJlqkp9lyMtoimFSSXkrLM5
	 K8j0qElcKz8GExIgZEaOsfAnewklinNoYHO43Z75EkajIRLdW98MC9HCNETSeH9dMj
	 eeEF5Ci12dSsEp1tj4z8svGZXx9m2AjlanUrBVvWpS9X/4Xq8hWo0y1xmhGvq7ED6r
	 CvQWI+yU73Y6xXVQ0Ie8qhvUxYf2BeSdffawnk5MSgditz2nzYA1NuBZMWj/H0X3gA
	 43ssWKdm3d5Nw==
Date: Mon, 27 Jul 2026 09:51:39 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-man@vger.kernel.org, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 1/4] man/man3/str*.3: NAME: Explain the names
Message-ID: <amcMzmP4CF9RkbDk@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <ambE5rIikTuHudR4@mail.hallyn.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mbhr4nnfe5mjwvzm"
Content-Disposition: inline
In-Reply-To: <ambE5rIikTuHudR4@mail.hallyn.com>


--mbhr4nnfe5mjwvzm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-man@vger.kernel.org, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 1/4] man/man3/str*.3: NAME: Explain the names
Message-ID: <amcMzmP4CF9RkbDk@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <ambE5rIikTuHudR4@mail.hallyn.com>
MIME-Version: 1.0
In-Reply-To: <ambE5rIikTuHudR4@mail.hallyn.com>

Hi Serge,

On 2026-07-26T21:39:34-0500, Serge E. Hallyn wrote:
> > [...]
> > > > @@ -5,10 +5,7 @@
> > > >  .\"
> > > >  .TH strncat 3 (date) "Linux man-pages (unreleased)"
> > > >  .SH NAME
> > > > -strncat
> > > > -\-
> > > > -append non-null bytes from a source array to a string,
> > > > -and null-terminate the result
> > > > +strncat \- nonstring catenate
> > >=20
> > > why nonstring?  The source string doesn't *have* to be a string,
> > > but can be, right?
> >=20
> > Yup, it can be a string, although it would be useless (if you want
> > a string, you can use strcat(3)).
>=20
> If the destination is 10 bytes long and has a 5 character string now,
> and the source is a valid string that's 15 characters long, it's still
> not safe to use strcat.

It's not safe to use strncat(3) either.  At least for my high standards.
It's full of off-by-one opportunities, and other opportunities for bugs,
which will result in buffer overflows.  :)

One should write and use strtcat().  Here's a patch set for doing that
in shadow, FWIW: <https://github.com/shadow-maint/shadow/pull/1334>.
That patch set is very small, so if you merge it already,
I'd appreciate it.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--mbhr4nnfe5mjwvzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpnDgUACgkQ64mZXMKQ
wqkdexAAn4iHH2KQaiydMu7bHSYGeqfRBOYhMq38YanKbGy5tO4HStjz4FivG9C7
CwqOTuKuEtaBzw9yqlghPA8NeUHSqmlfzmCoahsTSm77P+PTjNyeV6hr478ACMZg
4SRYHf2w+KPIrtGt3aTV1/euw4li4pcZCQh9LOPjfirpTi26/vR1Wwu9C+Qaw/Ir
s1TwnP6p9Tj9COeU75CnHM3FHt0tBhNfBZAACO32N1nH8X3sxh66xiVODTCtCx7e
Js3dz6NEfzq+cl30U5GQgsOLWoHElE67bcjcosncfomDi8BUZXGrmcHh5N5Z6wPp
YD3MyRpAW+5pSHMOhlWyUFZZ6YhUHxEyti8SROoHTG/vTmxmzex4l/zXWVKJGkj2
vHeGe9Ro2Hvj7YJzPWYAc1QpiEpRLQR3KsqO2kcFTal2P0ElfKfucljpQ2bHf5VF
6hlA63rTAPxyEDQ5MKreBZK5nvrFmXq8ZSmUa5vDClBET2jXLVmLANFyP59c9cAZ
53Csn7aW7Oj+mu9f3RFKl19hn6YxzZ9L1o6iPrBNAyiwiusFyPcgYoNZ25daRDww
nRaWn8nRsASXZTCr2nVyXJ9o8prpL0OoxCTY/ej1W4lPxWr3nLtrzInXwAMI9kM7
ObngQemcTTSCTlVny5ZIdR0MjzrjpAENxUFkdJe7E9zEF9NG924=
=nLup
-----END PGP SIGNATURE-----

--mbhr4nnfe5mjwvzm--
