Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D69368D59
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768032; cv=none; b=pPLuDIamyH1thJeR8Z1jeHDTtBO5hCJDD9is810+m5VPSrIW5HqwyfJl1y2RDqlcMltfs366U9GGD/WYQkap5ROahif7DErUyCZ/bJdJbR6mFI+eL/EG5KMki5wxbSc+LbIRsC4fhy6VClavLh3BXlEwqjMl2brQ6zjLD/aNRJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768032; c=relaxed/simple;
	bh=Vo5UebBO2Y2N5rV+wze6dRhQuUKDzPqLNdZUjoeLOvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utobRtaOMoArHe7RssRjC7OvBGuwzMZdOHms+QAIS9x+YTHm/pFfrnw6I78PAvNBuBe4yiCY+sCPArKxjQW709qnMenmVVHosdAVkMDWtzd0NfrhXd2tNBTgWU7aQx1W0PqTIEtQ0s0shgR3Cw8xkZBParSe4NVEqd5ZVCHTIu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofsHeMVq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofsHeMVq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EFE1F000E9;
	Mon,  3 Aug 2026 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785768030;
	bh=he1pCpVij99Mr4uLai+Sd1cixKelONGeXp7TI3xjQbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ofsHeMVqhFm7szhEWixfupKdrsRb4o/FwZZjN9vZIhcCFtFicla4fPl7MX+3NH3LP
	 sFmjobnFCeetYp9/+DZlY+dZvjXDRAyRcstU+zO9PsJzwjkS9wqd9QtXtyEAxEqRSU
	 milu+ML5Da+wY9YybcBF866hTE3atwirvzBMZFV6rhtcqHBdBHyqIzPKOtfSyyh7vZ
	 jTohXMbR2TV/kKpM4ZcRvewpjqWYxw1bOZUNCxFLAP/kQzjFQ1wQlH3UjNzoO7eVeG
	 Niku6Q1jEpS4LMNsyPtW9OHgEAV4riOISoJjxfJYCptiDE+0zL6JG6/faFIzndiYeA
	 qQImnYuLU6T3A==
Date: Mon, 3 Aug 2026 16:40:26 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Collin Funk <collin.funk1@gmail.com>, Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anCmfRDpkhSErjkS@devuan>
References: <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
 <anCAeQ5YNwXwSTWA@devuan>
 <878q6n9u4v.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5zq7hqjxhtv4k3l"
Content-Disposition: inline
In-Reply-To: <878q6n9u4v.fsf@gentoo.org>


--i5zq7hqjxhtv4k3l
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
Message-ID: <anCmfRDpkhSErjkS@devuan>
References: <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
 <anCAeQ5YNwXwSTWA@devuan>
 <878q6n9u4v.fsf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <878q6n9u4v.fsf@gentoo.org>

Hi Sam,

> Date: 2026-08-03 15:05:36+0100
> From: Sam James <sam@gentoo.org>
>
> Alejandro Colomar <alx@kernel.org> writes:
>=20
[...]
> > He doesn't need to have read every word of the glibc manual, but this
> > precise text he could have read it, because it was mentioned by Paul in
> > this thread (different subthread) prior (19:28 UTC) to his message, and
> > reviewed by me also prior (20:31 UTC) to his message (23:27 UTC).
>=20
> I often reply as I go rather than reading all other emails around that
> time. I don't think you should assume he read those emails and
> deliberately neglected their contents.

Me too.  But eventually I respond to those other emails, and rectify
when that new information conflicts with something I said with
incomplete information.  So far, Collin didn't rectify.

> >
> > 	Date: Sun, 2 Aug 2026 14:28:33 -0500
> > 	From: Paul Eggert <eggert@cs.ucla.edu>
> > 	Message-ID: <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
> >
> > 	Date: Sun, 2 Aug 2026 22:31:59 +0200
> > 	From: Alejandro Colomar <alx@kernel.org>
> > 	Message-ID: <am-eAGL6OWqP9Yah@devuan>
> >
> > 	Date: Sun, 02 Aug 2026 16:27:21 -0700
> > 	From: Collin Funk <collin.funk1@gmail.com>
> > 	Message-ID: <875x1sp0h2.fsf@gmail.com>
> >
> > Also relevant is the fact that he accused me of "slowly" documenting
> > "personal preferences".  His wording implies that it wasn't there
> > before.  Maybe I misunderstood, though.  I'd be happy to rectify if I
> > was wrong.
>=20
> I think he meant in general?

I don't interpret that.  I guess he can defend himself and clarify.

> > While he didn't need to know whether it was there before, it would be
> > good to make some effort to learn whether that was the case, before
> > making such a serious accusation.
>=20
> I took it to be that you (as you've said yourself) have a different
> style from Michael and this does involve a more opinionated (you may not
> call it that) approach.  He's commenting on that being unfavourable to
> him.  I didn't think that was contentious, more that you see it as your
> duty wrt education.

I only see my style slightly different than Michael's, but not
necessarily in the sense of involving a more opinionated approach.  See
the other messages where I've shown how Michael had done the exact same
thing with strlcpy(3) a long time ago.

On reconsideration, and after researching what Michael really did,
I think I was wrong saying we have a different style at all.  I believe
we've had the same style.  We just had different topics of expertise.

Michael has had his own share of opinionated comments in manual pages.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--i5zq7hqjxhtv4k3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwqFoACgkQ64mZXMKQ
wqnQEg/8DoI+BT67ZYfbNyPpz241JrxzZm+Xu5oobqJU9sfH3cfAYm8WwUE1oGrN
H1Lx7VtjbTtFBr+uCMDwdLyJjjMpAfYytGBTNig0zKtPQFKJfS7y/bTX7RqqDCJC
G0jSLanBd0zIH39TfxVDrg8G2tUIXgSQVE6Q4V3DfYkSN5Q2LsdvFXufOSpTpLqP
rXcVL+2NjuXy7TYO/8uqLdDlrwaYtF1BNw7y4XJeD+NPcbrKX/rV4QmVsSlnz6Dt
MTtr9NtV8yhMzHmm8qEA0G42GTUM3GJ+CeobZwPwQFR6Awy46bzMS3jXE3dO84su
67cu17sugWearI0oGqRubgQxyDrjExzq1SUx5QcWvN7m13JPAYh0r0KDSHSlAqTi
4EDpiJmoAciq+SFTJ8m7ix+TwV1JbuvU+FHFTqv6yf8DKZY0O+eQ4oGyNB0Y7WuS
FrqFs0+/4OEm/r+d2KDRmwmOMEy4QF/zlfuEVTYeMH3Ewz05T6fweuDnSjOzUmYa
pqG4MhhYRdZRfxWApbQX9Ek3V49e4toZ74CYQmSaQLoB/4UJ4gqbMB9XTZg1YwJp
zG/s+HFyi2g9VEWCgiedRz+TSmqgXCJNJ0tOrsmQWBuLYsBGvuCtAvCxYgvlQ2vd
npndbt+yhKP0Sp0m1rSriFkinuTVX1vg/PWKTi5K3P2ijHhUktY=
=ClqX
-----END PGP SIGNATURE-----

--i5zq7hqjxhtv4k3l--
