Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616A377A98
	for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960382; cv=none; b=U64ci9eE0hbb5hNyq47yKgBI4P/MDsKtJhKjA7lmQ5G9Y2Q+aloMfTZ+JuqhWufHdp5G3TH6ewrHS7v9g54ae9NUlZhR/jO6dMBDoyqx0YR5RpaCXfHnu3q2VBTYrVesVIKQ2pv1IeJYS5b3mSn0rNl1AALuoe5/gmC2g7QceJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960382; c=relaxed/simple;
	bh=lyUSVSd83MVEPmIy+WJsWgex5j4U8j50uyRo9m/5e3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7GR0RajHijsJiH5aV9LRpL2CaavFIAOIonBvADM51bGOV3dCKY2NpqomJ95HyvZGwPZAoY13tiV2YeOByTVWeXHj3dmpsX/hk4ThD8LKsZCwmMeA+leybBrGDei4k3Xt6moDb6kmwOY4ivBZSti/xiwQSqYqI18KOtaJP52PM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1seslML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1seslML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FE11F00A3A;
	Mon, 17 Aug 2026 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786960380;
	bh=VUbUO1RyORVTjBvqVhrmcn6Zk5UVGB9ThFW/wnuqiGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P1seslMLO98d3OJ3n0Swp3tKKSiEO4xgR1VmGuMN8kCzB8OW3bN2BMqIlV+RpyWEN
	 ISCq8wBBs2jMtOjubt/r55+UkHD2zA9Tnev5tebAxwJKYrqaKVxdXEnTMhWG7SznKp
	 GU2/MhsmM5/MIuwC2sG4W2CgqZSODBBwUGYpsRpTHqBi0q0q3Oq/wtopWJu3iXRlMD
	 H0hZTFGsO7xnr1Wic6FEqwPMliLW4ySbDnRR085mltGX6+T7cZ/YW4P0yhb7cZ0hfX
	 xuDm/3AbbqvvRQt1JhV8XPlSMczvJ59ajoX9D8aLWFuj74eeLGYZHR/ak6rAKnT0qv
	 aFFGJaOnHRNfQ==
Date: Mon, 17 Aug 2026 11:52:54 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2 1/4] man/man3*: document the glibc 2.42+ baud_t
 termios interface
Message-ID: <aoLZuTZjb1L-4CVe@debian>
References: <20260629135910.143781-1-hpa@zytor.com>
 <20260629135910.143781-2-hpa@zytor.com>
 <akOL9gQovBTRQ3VW@devuan>
 <da42ba8e-782c-4b42-bcd7-ed089780acb1@zytor.com>
 <akQw0mjXu4yTzofX@devuan>
 <76055054-9902-4cd8-87e5-d2745ae2b261@zytor.com>
 <akUn-T3OpyEAhm5B@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="unirnmcu4kw6fw76"
Content-Disposition: inline
In-Reply-To: <akUn-T3OpyEAhm5B@devuan>


--unirnmcu4kw6fw76
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2 1/4] man/man3*: document the glibc 2.42+ baud_t
 termios interface
Message-ID: <aoLZuTZjb1L-4CVe@debian>
References: <20260629135910.143781-1-hpa@zytor.com>
 <20260629135910.143781-2-hpa@zytor.com>
 <akOL9gQovBTRQ3VW@devuan>
 <da42ba8e-782c-4b42-bcd7-ed089780acb1@zytor.com>
 <akQw0mjXu4yTzofX@devuan>
 <76055054-9902-4cd8-87e5-d2745ae2b261@zytor.com>
 <akUn-T3OpyEAhm5B@devuan>
MIME-Version: 1.0
In-Reply-To: <akUn-T3OpyEAhm5B@devuan>

Hi H. Peter,

> Date: 2026-07-01 16:53:34+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi,
>=20
> On 2026-06-30T15:01:02-0700, H. Peter Anvin wrote:
> > On 2026-06-30 14:17, Alejandro Colomar wrote:
> > > >=20
> > > > However, doing that using the broken-up diffs that you want would b=
e very
> > > > difficult at least for me, as I'm neither particularly comfortable =
with troff
> > > > nor a good technical writer, plus that this is a "spare time" proje=
ct for me.
> > > > I would be willing to try to submit such a rewrite, but if that mea=
ns
> > > > refactoring it into small diffs it isn't going to happen.
> > >=20
> > > I can break the page myself.  I can use the break points that you told
> > > me above.
> > >=20
> > > Do you prefer that I break the page in small bits and then you apply
> > > your patches on top of that?  Or would that be inconvenient for you?
> > >=20
> >=20
> > No, that would probably be the best way forward.
>=20
> I've pushed the patches in a branch:
>=20
> <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/log/?h=3Dt>
>=20
> I can send patches via email, but I suspect you prefer to pull the
> branch.  Let me know if you want the mailed patches.  Please review, and
> let me know if I should push these to master.

Since you didn't respond, and the patches looked good to me, I've pushed
them already to master.

You should be able to fetch the changes and work on your patches on top
of them now.


Have a lovely day!
Alex

>=20
>=20
> Have a lovely day!
> Alex
>=20
> >=20
> > > > In fact, I *did* rewrite and restructure significant chunks of the =
termios
> > > > chapter of the glibc texinfo manual during this work partly due to =
the sheer
> > > > number of errors that had collected over the years, partly because =
the clarity
> > > > was muffled by unclear language caused by wanting to pretend that t=
he tty
> > > > interface is anything other than an emulation of an RS232 interface.
> > > > Explaining it as an *abstraction* of an RS232 interface that may be=
 real or
> > > > virtual really clarifies a whole lot of things.
> > > >=20
> > > > As such, I would be very very interested in what you think of the f=
ormulations
> > > > I used in that document. Perhaps we could use some of them if you t=
hink that
> > > > such a rewrite would be worthwhile.
> > > >=20
> > > > I *very* strongly believe, however, that the ioctl_tty(2) interface=
 needs to
> > > > be kept separate and that we shouldn't muddle that into the termios=
(3) man
> > > > page. It's possible that we should be factoring out the termios par=
ts of the
> > > > kernel interface into ioctl_termios(2), as the rest of the tty ioct=
ls
> > > > generally coexist just fine with the termios(3) interface and thus =
fall into a
> > > > separate class.
> > >=20
> > > Okay; I'll try to do that, and send the patches to you for a review of
> > > the overall break points.  When I'm finished, you can rewrite the text
> > > as you wish.  Does that sound good?
> >=20
> > Sounds great to me.
> >=20
> > > >=20
> > > > Speaking of ioctl_tty(2)...
> > > >=20
> > > > One thing I have wondered about is that in ioctl_tty(2) you state t=
o use
> > > > <asm/termbits.h> as the include, but in practice applications use
> > > > <linux/termios.h>.
> > >=20
> > > IIRC, we weren't sure which header was preferred, so I put one that
> > > looked correct.  I never used these interfaces myself, so it's probab=
ly
> > > good to change it.  Feel free to send patches for that.
> >=20
> > Yep, I will look at ioctl_tty(2) and its fellows, but I think that need=
s to
> > be separate.
> >=20
> > > > There are considerable subtleties in using the kernel
> > > > termios interfaces, as they are architecture-specific *AND* mutuall=
y exclusive
> > > > from the glibc one (neither the types nor the constants necessarily=
 match up.)
> > > > On PowerPC, for historical reasons, the ioctl values in <sys/ioctl.=
h> for
> > > > TC[GS]ETS* don't even match the kernel ones and are intercepted in =
glibc and
> > > > redirected to the *glibc* tc[gs]etattr() functions, expecting the g=
libc
> > > > structure which I do believe is different in that it has a differen=
t number of
> > > > reserved special character slots which also pushes out the c_ispeed=
 and
> > > > c_ospeed members.
> > > >=20
> > > > Let me know what you think.
> > >=20
> > > I mostly agree with everything, I think.  There's too much to be
> > > specific, so maybe I should split the page, and then we can discuss m=
ore
> > > concrete patches.
> > >=20
> > > I'll wait for your confirmation to start breaking the page into many
> > > bits.
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--unirnmcu4kw6fw76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqC2fYACgkQ64mZXMKQ
wqkcEBAAp/tB3EkG8oxREELpW16tig/Yc8Fi31LJAHzdhj6gwU4okUaheZd2iJZ6
TYcC8n8fbtWsCFL5EGWKPoQeJICnjlXUmK6H1y8cY5SzEk0LZ5D0+kjwjC4ZFNP4
KJeButH3AqyIQFt+wQrU6a+KX5tBC0r0tJ2dpWcBwRQLi8gvmgaj0ckkrKJFlAfz
1GhmqrWRRywWIGVMHgzZJ4BhIUOX02LEGSqzNrfZAAmGY9/KN4dPC0c89RCFFGAC
iDbmOS9bX+HNDx2T8YMqItJkCXcORCF0cmFpE91ZyzkoGfMLdc14rPwo1N7D7cXT
HxD89sXZh/uVaWgoy3vSKj27JXcTd+QIRukU4+lweRweTaHiuDU441UIAgvXwWq0
fEXK2cnkr8/SyPLzSLqnlEALcr0y7R6o8klOiuXhvAZ7ksHsx5GxPQTJZJz9xSr1
Asq+8PFIyjYC6DtGkD313o22gGf9o9lHw34BhTDWdDG43oD4LraIF9p0ZnFvxX/t
v1pgZNdXbVErNK9b8z6PzKs6pRbc9Gg05KE78cJQTZ6sp51bcKMGNwu49UNLgz1a
LM1izCHi6SaCcQWhKvE5MHUfrh2evGwT1Zf0g9HfCYfzUf4c8TQ2dam2eu8iCRqF
oaiJIxkqFwUlVw2hdvMbA1WMGtUQrzX1kdI1ZgptpxpgX1Of7Lg=
=rsAD
-----END PGP SIGNATURE-----

--unirnmcu4kw6fw76--
