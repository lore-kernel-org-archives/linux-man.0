Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12719800
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 00:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784160484; cv=none; b=Uu4fFfKnV6k4fxvpVa96+eLYvjCV9pefuKAd2DIjI/PXbh4921GvTR72nA7RGYvBKfr1EZy5qLo0zFa9ov2x8ji3Lo/RZ8mnoW1OiwtIRRFSLyTQFeyHwUiKtE/Kv3QBQKMkN+2gEDowGLyra7BGRdKmjys1DZ2AtJPKVK1sJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784160484; c=relaxed/simple;
	bh=BcqgsxRSRvf28vNSGEtV30aeETaXpucDw8uZpHG2j1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkpINjsDwJ8uMMkHB+gYDq3kMH98j3f2Rq05u/1O5r38u/QOOuDqKJOqTcD2F9rtWn3Fzq3c6bx+za4Y7M69082ksFQwI/XyZTF9j4sAYp9u69SMyWTOpq2P2PnHSaBGWaF3cwvf8FEDteWg6cB3Nta4wxJcIX0TezjbNy570V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luKf0jie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luKf0jie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C2B1F000E9;
	Thu, 16 Jul 2026 00:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784160482;
	bh=gtKm8zy8fHst6DF9K9T65RDehzprudsqZf+Cquz0emU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=luKf0jieVzxVTnEuscIufubHs69gktYARA/VmasU69XimgWxYNXGiOS11GfijpQun
	 whl04e7A8VjkrsvLvPSjEuPtzrMPzSY+IT7NWA7hR4jWHoyL+//gLoORdgaLxbOE8G
	 5ClvBQ32OTjJRl3EwhzNR7lhQs2DsIIYpzxmu6yU/6sD54SA0gtzjZXEnpR2suwZL6
	 iomKj2IUxV/quWppyrNnBNSbY+1P/sSx+YLxnw1Gp6gS+c8AkSQlcAy6D8YodNtsIN
	 RvXV6I6Ip5uZh5/Efcb1owjPD3VvKdk5+s6rScEw4t+Mne2F90H9hU0qqJlLQoSBtS
	 52cQkK0kSG8OQ==
Date: Thu, 16 Jul 2026 02:07:59 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <algfTMXXsxKV9xGT@devuan>
References: <alfwyVnZSgMgWskj@devuan>
 <xnik6g6i48.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x66kgzm6mxxf5vxg"
Content-Disposition: inline
In-Reply-To: <xnik6g6i48.fsf@greed.delorie.com>


--x66kgzm6mxxf5vxg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <algfTMXXsxKV9xGT@devuan>
References: <alfwyVnZSgMgWskj@devuan>
 <xnik6g6i48.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnik6g6i48.fsf@greed.delorie.com>

Hi DJ,

On 2026-07-15T17:46:47-0400, DJ Delorie wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> > I find it easier to write documentation in man(7) than in any other
> > languages.  It's simple enough that I don't need to remember much.
>=20
> I can say the same for HTML, because I'm used to it and I stick to
> simple constructs.  It's good that there are people who find man(7)
> easy, and it's good that those people have found a way to contribute
> using their expertese.  I.e. Thank You :-)

Thanks!  :-)

> >> I've always advocated for "whatever system means the docs are stored a=
nd
> >> edited with the code, that I can turn into whatever I need."

[...]
> I mean "anything that means one commit has code change and doc change".
> I don't care about the mechanism.  Do it either way as long as you do
> something.

I see; that makes sense.  In general, I agree; in this specific case,
I prefer it split, for other reasons, but yep.

> > You're welcome to send the patches well before they're merged in glibc.
>=20
> Er, I've been working on tunables for about 3-4 years now.  I doubt
> you'd want to hold on to a patch set that long.

I would be happy to review a patch until it's fine, discard it locally,
and let you re-send it in 4 years (bonus points if it's In-Reply-To the
original one, so I can keep track of the history easily).

> In this case, the timing was poor - it finished up just before a release
> cycle, so whether the man pages needed to be done now or in six months
> was not known until the last minute.  The time from glibc freeze to
> glibc release is plenty long enough for a man page review cycle, though.

Ok.

> > For the tests in the build system, I use MANWIDTH=3D80,
> > precisely to maintain a consistent width that is the most common one.
>=20
> I don't think I've had a default with of 80 for a couple decades now.  I
> wish we'd standardized on the 132-column terminals instead.

I have a big screen, and when I switched to it, I thought I could use
more columns.  What ended up happening is that I've increased the font
size to keep my eyes healthy.  :D

If I split my screen in two (which I often do), the terminal has 88
columns.  Considering that I enable column numbers in vim(1), I still
get to use around 80 columns for actual work.

> > So, it's at least as old as 1994.  :)
>=20
> Um, my career predates that too.  I don't think I was doing man pages
> back then, though.

Heh!


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--x66kgzm6mxxf5vxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpYINkACgkQ64mZXMKQ
wqnzdQ//QpXkhZARU38N6B8hqpT8UgegR2IxaUE8zONZn54bj24+WW+qzswEFlB0
xcWX/xAmnbyKZAsE78vN+WEDh4q9Q42CKySJTRjx6MiuEV819Cw2tMk4OtTn+f3D
UEc8kUdsAjoLcO65angL7CPnGmRwQoFR/9jgoRYLJoH85zy9PzuktaJrehrn73CI
J8RCMBi7v073u7egqi0PNRemEydyNUcIK8szh866aWd8ZvPaw+/2wjwakASkC0Ck
ll+7ren/7qw92V++mjiWt1xORZbZp2IqEzmbl0lk5C1fzWUmFmvbCSr1u4U7GXp7
7Ohmpx7PvHXAqny4OX/oVcGV18JfBapDhNZLUZKM25nnSLJpK+Upc4O1G0Vmab3d
f519JnKlAM4HbrVpcRinI9/kWhfNAHxd3GMvCZHRpGA+nvZiwhnfLUrXzQ5BGYP4
F6clhH++NE+xx25UUvgSCCE0rtI43Ov34Scsml38a2SGvx8bkk3SI7yYstasleqp
gFpyDT/6f/cRcjjYAjlp3EErhtVdgqBV3jkwAVSHB87iqDnOxPzduhbU8w2SLmsz
78RY8sduIPT3FVjqdziW06+sEvk8CucLVFp1tNstn0CY/AUrTvtP0KjsP9VqGDz3
ZxLhbhsFqRHfeM3SRrqlSxJ98kChCMkx0MVJ21n4uj8vfkVqaTw=
=15v2
-----END PGP SIGNATURE-----

--x66kgzm6mxxf5vxg--
