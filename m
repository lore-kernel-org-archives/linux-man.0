Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209693207
	for <linux-man@vger.kernel.org>; Tue,  7 Oct 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829848; cv=none; b=unhEBvpb/mpYkLMd8jjY6rVXRlhpAml7WcZyMlO41tGnFSryQmo4tMBZIGR+JjgnbKuZQJAMu/9Rpv5FQIQfRuqNedhFmdYAhRaTfEHsOPR5Yb3FSVExH9ZNhM1uQJo6v3W5bxIvBrF9JnQE5ReudD039sJKjNy/TcowOfFMb7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829848; c=relaxed/simple;
	bh=g4CIALvEqEM5+puAj70m6cdlrrJdoZAy1xGozbZMddI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz+TcDVL2vNzmv0K1kQKfpNS6D6N93cMWg51vWBeQKuM1D7eyAMVJzmhHlkMAGhxdH/ySfBiHbSnszNIiErnWFn4A2t2QLuQjBXk+9bPCzfbtnHKSFhx70RtOvQLZ/Aoxv9pj2EuVS7QRdUDKds2zvEbTIIK4RKUkfIfvEzwLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGM0E9Wr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGM0E9Wr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2564C4CEFE;
	Tue,  7 Oct 2025 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759829847;
	bh=g4CIALvEqEM5+puAj70m6cdlrrJdoZAy1xGozbZMddI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KGM0E9WrR2V59vbQYS7dMADi7DlpBAvE93Mo3fXsv1JK3CJmtvWdox7dmFfoeiB2+
	 HrB1Zm/eW/dFsxjNFjb8tdDzlf7xh07Rqd812WGbCDrqmOBMR9hN1qp4jczv8KHjIn
	 GFzDT4RFR7sUiM0U5P5zMDKrTH/mkglMQVZmbAhdEeYgEe/IgnGUoo/QkgUHJrZa9Z
	 WlXGAxIX/QewomETdjYWzqUxbr7UEaz4gejgUGxm0skbG7tC+DCmsjo8Eg7z1d2Rjd
	 dcrT0Pe9reN/4KFQ7AYBt7wRxy6t3quZIszb8C0zOkpvjIuqGFl2s265U+3HdxIPDI
	 haHnQ8vsi/hPg==
Date: Tue, 7 Oct 2025 11:37:24 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Kalenik <mchl.klnk@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Bug report
Message-ID: <3tq3issiyu3opsfqj4zqjjbog36hdfscciioubdsoajimnv2pa@vh6hfvlzpd3n>
References: <CAGZ+kfD9W1fU8FUDct3kbtDitXtTu=zeY_vqZzOJCwkjOYFM5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hyqvlhywen6sff3k"
Content-Disposition: inline
In-Reply-To: <CAGZ+kfD9W1fU8FUDct3kbtDitXtTu=zeY_vqZzOJCwkjOYFM5A@mail.gmail.com>


--hyqvlhywen6sff3k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Kalenik <mchl.klnk@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Bug report
Message-ID: <3tq3issiyu3opsfqj4zqjjbog36hdfscciioubdsoajimnv2pa@vh6hfvlzpd3n>
References: <CAGZ+kfD9W1fU8FUDct3kbtDitXtTu=zeY_vqZzOJCwkjOYFM5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGZ+kfD9W1fU8FUDct3kbtDitXtTu=zeY_vqZzOJCwkjOYFM5A@mail.gmail.com>

Hi Micha=C5=82,

On Tue, Oct 07, 2025 at 11:21:21AM +0200, Micha=C5=82 Kalenik wrote:
> Hi,
> I want to report some bug:
> On site: https://man7.org/linux/man-pages/man3/bzero.3.html
> is:
> [image: image.png]
> When I call: 'man bzero' on my Ubuntu:
> [image: image.png]
> That's Typo

Would you mind pasting text?  I'm not going to open PNG images, sorry.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>
Use port 80 (that is, <...:80/>).

--hyqvlhywen6sff3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmjk31QACgkQ64mZXMKQ
wqlccBAApFwMarbTluhQEB4FqcLh6YwmB+umBCQMmoWajp8iGNYvjHrF/iWY2tJ8
P5R1O4uQeKMHJvuaF0TzSPO6pi7v0TsvYnYTit7GzJ/n5Tr5DNMyFAprO4eQHNCI
IobAHqpMwu6Nsi7738rHHrhChPhgGhKb0eI44wzDStLk2TFD5LkC038JqAYYSqRJ
AOfRG8lyeiERASGKfSAgvhxtb5A3NdoU3itTkm62IfA5/B1ckIIclkBykGpx34XB
X6BbHyv2cOEPGICOA61jPCKwPkh7fQxhE/PYoYoWHj5IRN8OtitOd4pwX9klruDO
dtGYC78THB2Fp9ASsih/JtpJmtbbniIA/bSbyLhTqGsMRRMM7fVdFGqKdGBGjS0k
ga0jPKn29xioR9EyALvnhnlchLdLFcef3MYGQpJg3uGZbrgYEU7vSMKpmvOXY6+x
IadOpmUXHQmTbQ119GPZ2ODBhYk6pMFDzmRfl2XE6Qkq17BmKIE0w4x42KkL9QBY
UbqJDYwJ/Kz8U+eKAtZOnyjsVIuoDWv/5cvy5HipsKHTt6cs5mY8IHmIdV3LpTpz
BImbErlhEFr9RwpzH9DCPhTIE/IBS+pm4C0b/Os99mQTZeRbNutVzzy+kZzjBC8b
xKtf9YMH486/uoKqTgk0zFhmvoaXpx99qKNTINVdTSh2vA9oS/M=
=N4La
-----END PGP SIGNATURE-----

--hyqvlhywen6sff3k--
