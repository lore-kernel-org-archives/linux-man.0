Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9215F388385
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775393; cv=none; b=aXbtsVMbY70BRfNyn+BTOfc2JHeTsnKpWuXJ7W8IXHoMUh5BwXpP7CekAImVnwQXljsKuQtDdCyQi81BJwAEmk9ex/KAtOPO1i2p29CBiJb5CptsHHMwfCb18q13ZSecjUZG3v3pvgB7xYDwuv8ky6Enx8o7qQnEibHvSAHuse8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775393; c=relaxed/simple;
	bh=FD7OkaGwnyM4/7Tbt+HOaj6Qi3vakouIMFRopqtpi94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgc/TgRfCcckrgRBFjhxnjoT/WwTt7Ifr6gNFrgZ8D5tC/GRXeE+KwlLl2f0MmNQ9di4d86Ld2v9dv4RYwOeU/hGI5T7BwuD41j3Pn9IQ399Tp+MSdtYc8R3uJRbo9au0s4pCfnhjElwyUVb7lgbHF02V4RtbOFAqRvXCckfZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzo9L4Kv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzo9L4Kv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D081F000E9;
	Mon,  3 Aug 2026 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775392;
	bh=m2bJMu+y/yxFPljr6ZoDM2kMwfHpeATge1vPyQkp5mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dzo9L4KvVlxElbQOFDBzMgiY8VAGU0c4+RQZ2LvHYgaK7Ixdh4FPa3VMuCIecQbD5
	 uRp2VDvroMe0gEb4PjVz1SuuAx/41QIsvEIeFyBotqxHwnwk54ZvMuIBnIlGcLGqrl
	 B1u6uPqmkXLxQvp4EH5gyeKxdNAufCmBX83ea908eAVeWa9b0WpLrVp94C5mEs0zBp
	 BBdo1uQoRl/uhRVJGzE8FdmjoAWdHIG7f0IS2mCWYeozCaL+zEMiLZdKIHgcKFN9A/
	 G19u4BDhIjJtkKaKSy9Iozvy2W9rE3OkHgsF5atBEk9fCqnHJUSttxK/4OvOe2doiq
	 cABPD6s1gXhbw==
Date: Mon, 3 Aug 2026 18:43:08 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Collin Funk <collin.funk1@gmail.com>, Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anDC3OsuGKFqwNME@devuan>
References: <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
 <anCAeQ5YNwXwSTWA@devuan>
 <878q6n9u4v.fsf@gentoo.org>
 <anCmfRDpkhSErjkS@devuan>
 <87tspb89j4.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jo5imb5cchkwfa6a"
Content-Disposition: inline
In-Reply-To: <87tspb89j4.fsf@gentoo.org>


--jo5imb5cchkwfa6a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Collin Funk <collin.funk1@gmail.com>, Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anDC3OsuGKFqwNME@devuan>
References: <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
 <anCAeQ5YNwXwSTWA@devuan>
 <878q6n9u4v.fsf@gentoo.org>
 <anCmfRDpkhSErjkS@devuan>
 <87tspb89j4.fsf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <87tspb89j4.fsf@gentoo.org>

Hi Sam,

First of all, thanks for toning down.

> >> I often reply as I go rather than reading all other emails around that
> >> time. I don't think you should assume he read those emails and
> >> deliberately neglected their contents.
> >
> > Me too.  But eventually I respond to those other emails, and rectify
> > when that new information conflicts with something I said with
> > incomplete information.  So far, Collin didn't rectify.
>=20
> Well, give him a chance.

Of course.  I don't have any resentment at all of anyone in this
thread.  I might have written more or less heated responses at some
points, mistakes are just mistakes, and don't bind anyone.  Love is
always welcome!  :-)

Moreover, I don't think he needs to rectify.  We can just forget about
this entirely.  Really, there's no problem here.  We got too opinionated
and that caused a flame war.  We're all working towards the same goal;
let's not fight each other.

I've already committed these changes (yesterday night), with some
changes from what we've discussed.  I'll apply some more changes after
the historic details that Joseph has clarified a moment ago.  I'll also
apply some other changes from another set of details someone sent (IIRC,
=66rom Branden) today.

The manual pages are not written in stone, and I'll continue to revise
this documentation.  Everyone is welcome to send patches to improve the
exact wording.

Please trust me on this specific change and let a year or two pass
before asking me to revert it.  But I'm open to fully reverting if it
becomes evident that I've been wrong.

[...]
> > I only see my style slightly different than Michael's, but not
> > necessarily in the sense of involving a more opinionated approach.  See
> > the other messages where I've shown how Michael had done the exact same
> > thing with strlcpy(3) a long time ago.
> >
> > On reconsideration, and after researching what Michael really did,
> > I think I was wrong saying we have a different style at all.  I believe
> > we've had the same style.  We just had different topics of expertise.
> >
> > Michael has had his own share of opinionated comments in manual pages.
>=20
> Yes, seeing the quotes you posted in another reply, I didn't realise
> he'd written those!

:-)


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--jo5imb5cchkwfa6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwxRYACgkQ64mZXMKQ
wqkpjw//QvW0gc1234ck6UDNec2FlbF0veNCLN8PBPIb2aofDkMJCLZRVqRR6bnK
5jUu9pdJbsjoT3mbyV15BxH+1ZXzOYSdYrZ9d7Q55HfYgUwu8SdvabVv9meVmzY1
Ylyh7pcgxIIrK6D9M6bkWh5MpOi5jb/528b/bOGGLIDRWyhPTEGa1M1Dr1RT8nZY
taFLj1vhKnDNofbjU14aCuakkxSceJQLCDc8juXTa+fU31CZNfp+/rii4Z9NaO/o
s5cvpGApOOj3vipojN7agGwnc8iRZ9KvL+e9ViOrg39afzbRRLVSSH0q/g4MvXB4
EVYRX6TamPwYNxCYCRwoRLHWxjZmAIf6Eylx6z09rLmcGkS3ofV9P1kzN+2HeDiy
/bvBiBZ32GXe1/3ExNzhQh5vhzDlyY38oAplNQoDeOQrFh1cx3F8sQDwixtvccWG
pQfQjTQnNJOwcRWtX7tSTC2wGRqMRnXBVN9bgdk2lG9DvBW6QOuXe17Gy5RSEyJT
kw+C9wGKP/IJEfDhY2QF5s5JB/gF/7mW9n62Wj+diDAACvdEwx3aGm1p40BcTTEE
2FkcjoxpPiuh+FlwsXkFnWz6CGUa52+Kd7PrAszKXs7HNyL5lNoyurKKQ7ZUkEH5
nk4UtsQJYMRfHYqDH5JomPLGAJ1sNJ5oGGOkJnQAtZRoq1N37Go=
=7ZXn
-----END PGP SIGNATURE-----

--jo5imb5cchkwfa6a--
