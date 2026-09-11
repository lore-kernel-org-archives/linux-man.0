Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30D2E92BA
	for <linux-man@vger.kernel.org>; Fri, 11 Sep 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124553; cv=none; b=Kz4nFLStAqg08j7HFAZ51Mx2JjErf4gU1rFCYUwyeZeiProKTtYY2wX3ESlpzJTpohXlVRvuFXSoINioF3ZBopzCMySMfn/27XJwIxqXWITiw42LxSsq5Yana7TAHeu/poad+uuulTHZtDW/l4IqmjyC8wvyOG8yxPe1ITyKisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124553; c=relaxed/simple;
	bh=U+vRF/maOXW0u4kw7Tiw7rMr1eXqtHEMNx3givPDE8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfQsrPzV4rfz+Hs4/FmGzFEzlL1BMi0o8vktPE03gjFk9WZ6lBucQf7FAq30tpzcUJsg5JFv2YYoIlXO1CtyG/aqXB204uj/x6LyWjH/d5yY4o1SbK3hC7DH1oSoZwZnHI++30nGA2SN9/xmLnCWdmprnu4dMox1Z/LBBbyv/zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of/UvF/x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Of/UvF/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0021A1F000FF;
	Fri, 11 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789124552;
	bh=+MUWnkjRc5ng8OJ7rhowZQASb+7hLjd1XjHH2P4sxDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Of/UvF/xcpkepZGSz+rD6BVktBDoIRRhYLamwcW3b3uQCMTjVVNxcyhTFBcPn88/b
	 uVdYbiPSG6sREI2OO9YDCBuaTNPLX05wDoHjdcfMCoJvHtZR5p4dQwSOl9kcLrTCP8
	 OnlE5IU8hHUmGV2JbVXwCiNxc8qrbpHPMHiWsPbY/yq8kT+zn8gJPrccnYVg5azNrK
	 /RWJtVIF4Rq+YqfdudK/p84rGrpALmRsUoeH8CNjHmAwyO7Z5cvTaUJWA9vhGRdewi
	 l5g6B3F8Nl5wZXZOzlcsCq1/Z2LPqnyPQf72OdztCBnHB69RalugNfhY1Syz4bY+Y1
	 H0DlTfLxcaz3g==
Date: Fri, 11 Sep 2026 13:02:28 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Cc: Tingmao Wang <m@maowtm.org>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v4] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <aqPfntaF5CMStaq9@devuan>
References: <20260901234202.1608520-1-m@maowtm.org>
 <apg8FsPOChcB-tJh@google.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jj5st6pnmdjsuprh"
Content-Disposition: inline
In-Reply-To: <apg8FsPOChcB-tJh@google.com>


--jj5st6pnmdjsuprh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Cc: Tingmao Wang <m@maowtm.org>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v4] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <aqPfntaF5CMStaq9@devuan>
References: <20260901234202.1608520-1-m@maowtm.org>
 <apg8FsPOChcB-tJh@google.com>
MIME-Version: 1.0
In-Reply-To: <apg8FsPOChcB-tJh@google.com>

Hi Tingmao, G=C3=BCnther,

> Date: 2026-09-02 17:09:10+0200
> From: G=C3=BCnther Noack <gnoack@google.com>
>
> On Wed, Sep 02, 2026 at 12:42:02AM +0100, Tingmao Wang wrote:
> > LANDLOCK_ADD_RULE_QUIET is a new feature introduced in Landlock ABI
> > version 10, merged in kernel v7.2 [1].  This patch copies relevant
> > kernel documentation into man-pages.
> >=20
> > Link: <https://patch.msgid.link/cover.1781228815.git.m@maowtm.org/> [1]
> > Signed-off-by: Tingmao Wang <m@maowtm.org>
> > ---
[...]
>=20
> Reviewed-by: G=C3=BCnther Noack <gnoack@google.com>

Thanks!  I've applied the patch and appended the tag.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--jj5st6pnmdjsuprh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqj38QACgkQ64mZXMKQ
wqkQeBAAjgRnJaHsEllO5AGMMvBwp0I4vZxHcW9mLa73dazmOgxWbDURYOM9ZYOx
V65ZaCKCB5FyOMXH0WOJ7Z9cpTqnSYhBZqCm8/5jv/U3ah8FP8Dxpzv1IXwqjsQT
CHXq/Btrv15UwGl5s83tHqL5WfblX5NHYQJqH2tX7krQjNieLzNFlKX374dKjlWH
qR5eRHmzCVUOcOGvrHR9Kr6XiBefm5YuxtpIVP7eW5pf41ie98HJFwSwNGEmnwiD
AGEjgrxQyWw/ioR9SwayhJGHfK8rreP4STzBDzOMhwFatwDa3NXyHtDS/D/5yurr
0SKjqKlcOwCCbxfZe9CtWT9JvD+4O1AszxEkHRgVSPlHNiypUnTQST0zoAXo827T
Zqd0ezenKp5HTh4DnBU3G5MTgXYOwAYeHrbqtOKw4b5afJIfMZeoyQYHVFOJjPM3
kcxyBcDPjcbHdac2gVBo1XVGJ1kVIahRnlGA3NctI+Bmz3epx71aOBZCPcnhfzO/
E3aF+e+WTEbJvIPV/3fDlq2QTtM7Gfafw83YczevoMWWvUSrdufol5zm3Owt7Scd
0OiP/FvvfsKWjywF9pBvNtp0wgns3R7dQxbJglOVLGzA3GnBeisKE1gLrMJWGz5r
MmPODwywhx07r3vLiRPeDLa3s/+pB+VXqGqsRUcn/PhZ6M7K5ZA=
=l7M1
-----END PGP SIGNATURE-----

--jj5st6pnmdjsuprh--
