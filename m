Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C503C35979
	for <linux-man@vger.kernel.org>; Sun, 19 Jul 2026 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784499028; cv=none; b=dnQSL/9/GgTWp+qlB2T4qTAvrML7h1CkW7onpbVEWVsCp6MamwSLOp2umVCPxMTSZ1shm2CJ8HIf+m5UGh+XDA1Z/5VadjqxgqxajBdTIfCRMYFdHEVAyC3MIh1+NE/nxPpNW81/BLgdv9m7Nv6+LywE5pU0gD/2qpv8qtqiJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784499028; c=relaxed/simple;
	bh=4pRw9qXRoqJ3ArHCSTRmvjvbIjkK33lzbV8tdEIXxYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZM5pnr/tgwUSsVV6gVR5UJKnXN4AjJBBz18LjEBUMsc/kUboIIu+80E5TOoEKgE6SMQQwUcJjUfkOLD5FyHUp6uVlnpxiQwaiXT0JU1FaDtrjIUI2z3USgQg2iAKt6ImSerDCmWsVLil24uVvSDtiddDJhFhVB8r4yeplAR+Ork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1ZNe+zz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1ZNe+zz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FB31F000E9;
	Sun, 19 Jul 2026 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784499027;
	bh=v8ULpcvN7XDiCKdmPbWUwiRBPmF8o9dWHSWdJMHSnls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W1ZNe+zz2eIF4u2elu2UHO6jWNAx8vGL1AUFb8f+ghkrl5fL78OPlhUSj1r14TreR
	 O60SSy0w4FPZPrEPJpdeAdDrUJw9wO5Mod+pZK49rALr9dQoH9OIPuxgOF/s3fTdxm
	 vmkN/1XawN8EJrNDb/6IU3trpbbgGoR42jKsOC5R226WvdJ/1GTmT/eoU0acJU/jN+
	 aLUHtuoOAEY8k0dS3oDIdqL6PEFwpm/aHfrAbMsiQloALQts5NdBC/dAIxpZaFnB2U
	 P9v6Wgz98cjUNHCd+ili+cebqQ5OqFlm0RCwSKjUgIuAhm8H4HhiTPok8qulb1rVPT
	 xsLdgl/ViZU3A==
Date: Mon, 20 Jul 2026 00:10:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [PATCH 3/3] man/man7/landlock.7: wfix
Message-ID: <al0_v8rno_mZzl0U@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <20260709153422.210312-3-stepnem@smrk.net>
 <alEh_O7UT8cjcxMq@devuan>
 <20260713114855Z.2240445002-stepnem@smrk.net>
 <alttHBBoVW2Vej6u@devuan>
 <20260719211238Z.2327494602-stepnem@smrk.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cf2em6lh2malx4sr"
Content-Disposition: inline
In-Reply-To: <20260719211238Z.2327494602-stepnem@smrk.net>


--cf2em6lh2malx4sr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [PATCH 3/3] man/man7/landlock.7: wfix
Message-ID: <al0_v8rno_mZzl0U@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <20260709153422.210312-3-stepnem@smrk.net>
 <alEh_O7UT8cjcxMq@devuan>
 <20260713114855Z.2240445002-stepnem@smrk.net>
 <alttHBBoVW2Vej6u@devuan>
 <20260719211238Z.2327494602-stepnem@smrk.net>
MIME-Version: 1.0
In-Reply-To: <20260719211238Z.2327494602-stepnem@smrk.net>

Hi =C5=A0t=C4=9Bp=C3=A1n,

On 2026-07-19T23:12:38+0200, =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec wrote:
> On Sat, 18 Jul 2026 14:17:57 +0200
> Alejandro Colomar wrote:
>=20
> > On 2026-07-13T13:48:55+0200, =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec wrote:
> >> FWIW I see little point in this kind of duplication, given
> >> that the kernel docs are as readily available to anyone
> >> interested as the man pages are;
> >
> > Not so much; the manual pages are available for anyone on a terminal
> > without internet connection.  The kernel docs are only available if you
> > have the kernel sources or internet.
>=20
> No, I really don't see a difference here: I don't know a
> Linux distro that doesn't provide the kernel docs as a
> package.  (You seem to be using Debian and/or its
> derivatives, so that would be the linux-doc package.)

Hmmm, thanks!  I didn't know about it.  Still, I find local html docs to
be less comfortable for users than manual pages, but it's good to know
that it exists.


Have a lovely night!
Alex

> > So, the manual pages are necessary.  What I wonder is if the kernel
> > documentation is necessary.  I think they could drop it (the duplicated
> > part of it), and refer to the manual page.  However, I trust they know
> > what's best for them.
>=20
> In principle, if the docs are maintained by kernel
> developers, the other way round, i.e., preferring the kernel
> docs, makes more sense to me: being in the same source tree,
> their maintenance is less likely to be forgotten or
> neglected (there might also be other factors, such as reST
> likely being less taxing to work with than roff for most
> people).
>=20
> --=20
> =C5=A0t=C4=9Bp=C3=A1n

--=20
<https://www.alejandro-colomar.es>

--cf2em6lh2malx4sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpdS0UACgkQ64mZXMKQ
wqmcOA//QMQsp1EVDQkPxZzZewVb4J3smnIUu5H0ZreLlg5norH+8J/TvRLmY+OQ
7g9QUc/rDZJt6ab0etPIirtQ+Ztd7prfPJQPeACqRhKRynfoVHQB5lJunF4FNNi8
1PRmU/GZDWJmULRsS0gMOo4iTxiDzaMuFpF06yEr+JsK9LY+jitFHfmnDnzuvTD8
oLkQKesDMWqM2+28f0ThvUXEeU+39wYPy/GE36KAzZHpJ03QYJMsGFneyWPqDmqq
Mk3vQ6Nb3XREdOW4m3KVNT/AsWov+o304uhXCyO3dh4EcWDZ+adGRunqDlIFyLL6
8k57aF2TFuwrYKBA1GSiL6pMOJX+8+4IxqDMypQj9rk7IDZW+5DZS1EGIc/9WXik
rtoTyhXWRcbbfxf2tkf8PgGbNKiF6I/ZAX7tfquCjjLpfQUcwLD0usjSUd9kFojR
G57c7o9P6qYG//Fn4H0vI/r3qY47i9u9+TQI2BAuKwF/HFi0VVVjbvP/85J6QxIS
19+x6JFCumOeviWAEYJPBQ9a3kH66OTQ7/8lJw2I7tEcYOYQ9lA4Ee6jvPeZS/XX
lgdB/tJm0SaS5JjhbG1wH93Ywlswj13zS34aWtwS7fKXfNuRNiALsBVpHI8y5xlM
jzUZ7RjNui+23tXUjRhpMSJ26Q8AQwQdnBCpZ5MOULLoncpqVUI=
=Br00
-----END PGP SIGNATURE-----

--cf2em6lh2malx4sr--
