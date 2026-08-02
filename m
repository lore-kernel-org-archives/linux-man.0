Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D78399356
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 23:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785714101; cv=none; b=ptMZqdnDgrcbmwsSvTpYVZAjbO3EAF57pOpXy+bp6vW57b2VDvADkAlhQPVyZh1XKxYRVQJVmtmP579kSMXM4vAamIW1dUQvG9+7Of0Mw7ZuDMS5XS3y1AQYfmTZE/X75VQyPaaOMaPjT2KMzH/opHpFa8iZ8NTNVg/0NNcYv4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785714101; c=relaxed/simple;
	bh=lZB/UuUXRiyM94yPR+7gcHBepFvxywkEp5d30gKNCFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW/8FL1BMQtufBhbsaO1a9Kjj3f7WVMcIcZowvR9gcHWt4xhSM0qgGLgBcLidqAavWiGBn77Iaz7+LSmpCkM2GMbjZC+K0BCi9eRkRQpCAW11Kdcuwm6ZIpuElE+FtMI8Jb56tPQjFFlaQoTqTWy9PCPEXFjQjqmE3spJXBtTRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlmkM88D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlmkM88D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58841F00A3A;
	Sun,  2 Aug 2026 23:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785714099;
	bh=Ffp8IIwsZn9bZBbFkDRc4wwJ2xF60YqanN8lLr+0ovA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JlmkM88D7Vbs+1i01e6whhoP00yKJUI+kEI7nlDm91qEyt6FAbnQ/ht0C53/yXZWw
	 CiqeInK6kHOPoaISSuBdmParWxQkbrgCrAvEerFBQCFjxaAMW3CwRxAAgFIGfpuMaY
	 TK8v7bvp3x3pILkwLUeqFkDxliENbdg/zMYN3Tl4SJU1cCu+zpyvpTug1YVkArAQ/k
	 SQZqsqpswydH9GyyfhUD43y5hKj5r3rTOF+mgrU4NQRyGWvqIvJPM/X2ZhAji8QD/n
	 iaShzjutO2Ey1UCn7tfBgfnuv+RlfI6J0xt94lVz1BT6AmwRFflB2BfOM4UfgK/ons
	 CIVbtqTdcotjA==
Date: Mon, 3 Aug 2026 01:41:35 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_VUE1SzxqRkTAo@devuan>
References: <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z7hszugfj5ikgglz"
Content-Disposition: inline
In-Reply-To: <am_TTjDLlAI68zkp@devuan>


--z7hszugfj5ikgglz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_VUE1SzxqRkTAo@devuan>
References: <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
MIME-Version: 1.0
In-Reply-To: <am_TTjDLlAI68zkp@devuan>

> Date: 2026-08-03 01:37:30+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi Collin,
>=20
> > Date: 2026-08-02 16:27:21-0700
> > From: Collin Funk <collin.funk1@gmail.com>
> >
> [...]
> >=20
> > I can't help but wonder of what happens in WG 14 rejects this
> > controversial, as obvious by this thread, change. Will the man-pages
> > changes be reverted?

> > Or will we slowly watch them document personal
> > preferences instead of existing standards?

BTW, as I showed in another subthread, strncpy(3) did contain
opinionated comments well before I was involved.  If you're really
going to accuse me of that, better make sure you get the history right.


Cheers,
Alex

>=20
> This patch set is quite independent of the standard.  It documents a
> header file that has been provided since forever in glibc and most other
> POSIX-ish systems, so changes to the standard are unlikely to have any
> effects.  I've clarified this extensively.  If you want to discourage me
> from applying the change, you should rather bring up technical reasons.
>=20
> This passive-aggressive message is not something that will have the
> desired effects you could possibly reach with technical arguments.
>=20
>=20
> Have a lovely night, please!
> Alex
>=20
> > After seeing weekly threads
> > about the prototype changes, I don't think it is an unreasonable
> > concern.
> >=20
> > Collin
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--z7hszugfj5ikgglz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpv1a8ACgkQ64mZXMKQ
wqleww/8DJjdv2hbztEvvSd1bZX+o6Qmn8t5jnZ/ThMfbznq7hYpD2qhSo/hwmav
r73ejxAeqnw4bOCpxvvXKfqtXIUKHi1wzdTj0XeJDiakoVgKQqNuY4J+mAQotHXj
Jyafz2T4ywEEAnx+MD1eT2WfglllULoReRfxJF26RC52SuU/utgQBbv67AhLuiUo
7NjfBMen219NfVZv++NRhrH5ctumkPjhgUDVkaKSprNOlQMKdSikKR35mGwc+T18
sr5pTU6YT6s3tK2UKYxWlwrYLN5G/0lxJUyeGJ1KLcb0fWoHmqUH2BpH2yrWMUJH
BmFKvvJkVREks0zqtis19QOlJJXwjqysz50KKP+e+zxAJA+X4GegzAfgAgnykodn
e0XksclInTViJNkkLm8QBbUCN8fiOiQhOrT88Ek9bnUiw0wcOvrSEnZB5drOVTfG
tLiQpJaK/QDg/CeFEubL5k4ss1ezNDihq1cWjdkJWIWEf5a8QWK5SshLq8Vhh/ih
OqtS/qJRHh3IwLliqTlCQzUMsASB3LuC8OsRWvVn26wMfrksCphXAFkie1YybUmq
JCu2/+8cQfpxuVB2/KUVuJaT3gV+WDtRX9UiIT+1iOYAVMgcpKP0d26HKb5Os125
cDBCB5djvmVGXUq6vYvX1LsDh1qPqkTYn2zVhCD/4E80HrsEu34=
=SfnM
-----END PGP SIGNATURE-----

--z7hszugfj5ikgglz--
