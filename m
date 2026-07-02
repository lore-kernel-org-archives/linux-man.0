Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421123403FC
	for <linux-man@vger.kernel.org>; Thu,  2 Jul 2026 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028212; cv=none; b=TnripbeP+tpfBt0JaCrCUY9ziY8Gs213628nwtOzrOwFiR9vvu58TEKjiC9EOGoJV50zkWP8YRldYFFs7r0FRDr2Ion5OzuQTiBRTsvm+Z/5wtJ4D3UosGLXmGqK4DOHXPbLbWazmgaTupf5Hfo0rGDrkQgqiNxC99iOoN26yIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028212; c=relaxed/simple;
	bh=kPDrX6/amgMHryk3k4yKUzJOyarjwIP0VGuZK0g5syU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouc+vtn5kIUXGFO26SzHnPe90LD8JdUHVhhADSbdUsBRv9D9+qP2XmCQZjIc+IdPV8p5CmrUQjBLglf/ChbuLcqTezfddQUZv4jT3Ru7NFC+VLcBzsVgjCh6QQJ0NWbxv1Omtrgj8gSJIRv18tfXMlouLVkSG2p7YZ//Zn1aSbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLwV6gUi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLwV6gUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616201F000E9;
	Thu,  2 Jul 2026 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783028211;
	bh=0eG/TDto7m2R5kVuHmvBFfVgchko37T6tkQehslvl94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OLwV6gUiZQT9iH1G+26o/NsdkWEofa8YF+Vcd00ZGgDf5WEV37kLhoQPTad7war9x
	 f4Hsdkl4nHRhC/l/qRcHM58TdO1+RwXQuFYSSw6SMQjVyGq4xSVNqJUlBPcgoLowv6
	 8Ab9zOCYup8YeoR4oOw1JsyjJQYw7VY9JSRm85m+CRdw3drBE3WqmZIeU5y12H7FN4
	 QiWfGm4URJReK5dimqmuz43m8Mmcn4ugIyP7RJiZdshLjYcX/svdHPoih3KelthEb4
	 wrHXqWdsZcQUpsXZiJrf2/0grT6N960sQDH+hywOpGxFofB00NZeX4TLdyrozcLP0L
	 gPe1uzf2Nd5gA==
Date: Thu, 2 Jul 2026 23:36:48 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "Priedhorsky, Reid" <reidpr@lanl.gov>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: claim: forward declarations are confusing
Message-ID: <akbWn0TppbdxNAHQ@devuan>
References: <22CA00EA-0D8B-4479-87A8-DE6F322FDB3E@lanl.gov>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yki4cjese2vcn3dt"
Content-Disposition: inline
In-Reply-To: <22CA00EA-0D8B-4479-87A8-DE6F322FDB3E@lanl.gov>


--yki4cjese2vcn3dt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "Priedhorsky, Reid" <reidpr@lanl.gov>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: claim: forward declarations are confusing
Message-ID: <akbWn0TppbdxNAHQ@devuan>
References: <22CA00EA-0D8B-4479-87A8-DE6F322FDB3E@lanl.gov>
MIME-Version: 1.0
In-Reply-To: <22CA00EA-0D8B-4479-87A8-DE6F322FDB3E@lanl.gov>

Hi Reid,

On 2026-07-02T17:37:04+0000, Priedhorsky, Reid wrote:
> Hi folks,
>=20
> It seems that since early 2025, the man pages have starting using
> GCC-style forward declaration of parameters, which based on skimming
> the mailing list has generated many spurious bug reports.

Correct.

d2c2db8830f8 (2025-03-14; "man/: SYNOPSIS: Use GNU forward-declarations of =
parameters for sizes of array parameters")

> I agree with many others that this notation is confusing.  I=E2=80=99ve b=
een
> programming C for over 30 years and had never heard of this syntax.
> I actually spent a while this morning preparing a bug report on a few
> web pages, since I thought it was a typo.  Only when I went to figure
> out when the =E2=80=9Cbug=E2=80=9D had been introduced did I realize it w=
as a
> deliberate change to introduce a syntax I was not familiar with.
> After reading up on forward declarations a bit, I=E2=80=99m convinced the=
y are
> a useful syntax for actual programming, but I also agree with several
> others that the syntax is confusing in reference documentation.

I understand and somewhat agree.  If you've never seen the syntax
before, it's confusing.  And most people have never seen the syntax
before.

> My use case, as a human rather than a compiler, is to figure out how
> to call the function and what it does, and the information to do so is
> already present, for example in the case of getpwnam_r(3), the type of
> `size` is already given in the normal parameter list.

Yes, it looks a bit repetitive (like most of C, declarations and
definitions are repetitive).

> If one assumes the syntax *is* correct, it=E2=80=99s still difficult to f=
igure
> out what it means.  It is (AFAICT) still a GNU extension, so looking
> at =E2=80=9Cwhat=E2=80=99s new=E2=80=9D for e.g. C17 or C23, or even the =
current working draft
> of C29, doesn=E2=80=99t turn up anything.

Indeed.

There's a proposal for the C Committee, but Clang is vetoing it, so it
hasn't been approved so far.
<https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>

> The point being, I argue that the forward declarations are a usability
> bug and should be reverted, because
> (1) the syntax is unfamiliar/confusing

I agree with the syntax being unfamiliar and confusing, but:

The alternatives are worse.  We have to choose between not declaring
array sizes at all (which would make the synopses less informative),
or keep using array sizes but remove the forward declarations (which
would be dangerous, because it is invalid C, until you have a variable
declaration in scope with the same name, in which case you have a pretty
bad bug).

So, I think the best way forward is to keep this, and let the world
spread the word that this syntax exists, so that future readers
understand it.  It might take a transition period of a year or a few of
extra bug reports, but I can deal with that.

> and
> (2) generates many spurious bug reports that waste the time of
> maintainers.

As the maintainer of the project, I'm willing to spend my time on this.
It's a price I can pay.

> Or, at a minimum, there should be a link at each point of use to an
> explanation, similar to the ubiquitous =E2=80=9Csee feature_test_macros(7=
)=E2=80=9D.

We could add it to intro(3), but I believe people don't read that page
often.

At the moment, I believe this will cure with time, but if it remains
problematic after a few years, I'll try to figure out the best way to
point to the documentation of this syntax.

> Appreciate your time. Please CC me on any replies as I=E2=80=99m not on t=
he mailing list.


Have a lovely night!
Alex

> HTH,
> Reid

--=20
<https://www.alejandro-colomar.es>

--yki4cjese2vcn3dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpG2egACgkQ64mZXMKQ
wqn9qRAArVVejpmtN7EHN5wBz7BeypPYqy5zkt9vDPTnMCKVPVNQsC62RfLy5smW
hSxdFs0OkWBOuYJDTM1CoOqhgsjtfKIp6omvo4Bipw5N/uSxRJyDaYRHSP3ETI5i
iD8rvaHj9s+Nah9HNOgRTv90ZXwWnWFMaBd14tuhGYrptR9AmUwWG/FLlxdfavJz
VaHuQy2Q5NpcHMTmZU0TMczRb3+lcaLnpwMFxotPvAou0BnwGfIIPAdk7TV4Z3rZ
g3uyTyBhcbsS3TDqzRBAM5oKYauQgXIoTG06sSZcOcFqtp/hPgyJIAJhYJUzpPL1
0wE5y/Pu41UJBR8IwrqmuQirVHhZHhlbtSuFeZC3S3pVXaSS+NBL+9MfFmUmkmB3
LZZOMeB34HsvX2qQqetQPurRz4dzc6kyf1JpUJOxNb0wE85EM58DAc05BGjMDT4E
hYqX8psYkr/kM6D40702SDPsahtudzRA6GEaxCadmsRZLjnAIWn75dUoI6nzhnj5
G7CexqL7r423FQhg/hqINq4NhdibWug01kQPnWeG/+9scMuPvCo31ZaSRX1y8ozP
bCAlXFp6xhHQoxIoXNqQvgE+RwntFtky0YfDnRTjdEEDl2kjv48jZJn7OstyaPvx
F0aYVVggtpKS9FAcY2KoxwUG5arQi196O6gf8MUMQzv2yeRd3OU=
=MCVL
-----END PGP SIGNATURE-----

--yki4cjese2vcn3dt--
