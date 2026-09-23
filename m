Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24B2236FD
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 04:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137028; cv=none; b=XM7MixAUE5GMkXjNEv8tq7jCzY5DiqPSqkDfH7zp3q15H2Ju9vIdRwqmJ4lP1J5xlfMQn2B9XVPBoKNsJeE02N7NtvWbvqYIuBiF2MUkL7JN0gkKb15OpgDeNYz/MDvDkDSyAUzNjLDIxFLQUeH5mTZCzBNePf17EyQMJ5d2cvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137028; c=relaxed/simple;
	bh=lX1tLbEUfAWS0a9mQ+u2MehMUMhI9wAAAPgJUcZvS6M=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Mu9tCfk2V5/qwbFC+QVrWnnRVMUGVIdk2Nxv1IfLdZAI0yJ0kFb6YZKJmRjlDnvyPA2/m44tKGxP2n454j1QTMVc/zqHQHfKwGMmtj6tJTsliB2rowfwXFkDdYRhhfNDt4udunSWpt4Od7MwX8MPHIXxDflFGc//XEt5f120V3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=OXhr0Y9p; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="OXhr0Y9p"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 93FF9240027
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 06:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790137023;
	bh=lX1tLbEUfAWS0a9mQ+u2MehMUMhI9wAAAPgJUcZvS6M=;
	h=Message-ID:Subject:From:To:Content-Type:Date:MIME-Version:
	 Autocrypt:OpenPGP:From;
	b=OXhr0Y9pVGeDnRo4V6svYPcgfC0v0Mv37M42Wo2vg8JMk0SGfAdtjA3LI/XtEmwaG
	 zL7jN2F/HHPsKY4bh+fkNVOop/Ijdgbu1YZ0a1ZQKEhUO/o7/Repyn0h0QaEXQ2q85
	 FUrSgpi3g20sastZI/jvf7Ig3eX4ikSVvOMrxU+f+tFtehJUQaDy/QhvBsrpMHQxrt
	 RNt5NPNI774MHoMkFBAcS/Ru+Qr4s3ecgM7Tt7s2dTqrKomXy87nP9vQx1xq3X+QmZ
	 1WyDGe4LdJ54/K8jyLpx83AzBVQ7u9TXvQCvc3ymU/qd76nA7WTkQ9ur9euMh6nmbp
	 En42R6J0hy6Ww==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqNvy0SfZz6txy;
	Wed, 23 Sep 2026 06:17:01 +0200 (CEST)
Message-ID: <5db76d666377410fc105b9d527cbcd9f9ef3b332.camel@posteo.net>
Subject: Re: async-signal-safety of chroot
From: John Scott <jscott@posteo.net>
To: musl@lists.openwall.com, tg@trevorgross.com, linux-man@vger.kernel.org,
 	libc-alpha@sourceware.org
In-Reply-To: <20260923013428.GT23438@brightrain.aerifal.cx>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
	 <20260923013428.GT23438@brightrain.aerifal.cx>
Jabber-ID: me@johnscott.me
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vg9/NooafS+pv092Zlo+"
Date: Wed, 23 Sep 2026 04:17:03 +0000
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=jscott@posteo.net;
  keydata=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
  2Bms0A==
OpenPGP: url=https://posteo.de/keys/jscott@posteo.net.asc


--=-vg9/NooafS+pv092Zlo+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-09-22 at 21:34 -0400, Rich Felker wrote:
> Since it's no longer standard, there is no standard governing chroot,

On this claim only, I believe you're technically mistaken: ISO/IEC 23360-1-=
2:2021 (Linux Standard Base: Core specification generic part) is a current =
International Standard. It incorporates the definition of chroot() from SUS=
v2 by reference without amendment, so the same async-signal-safety limitati=
ons apply.

--=-vg9/NooafS+pv092Zlo+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iPsEABYKAKMWIQSiPzylvTnZ6xisfzWz9N0oYfTNugUCarNSt3IYaHR0cHM6Ly9q
b2huc2NvdHQubWUvLndlbGwta25vd24vbmkvc2hhLTI1Ni9zWUF3OTN6QUVrRkIy
RDREM1hOemRSeHEyMFBjNnByZGdtbEVWeXo0QUZRP2N0PWFwcGxpY2F0aW9uJTJG
cGdwLWtleXMSHGpzY290dEBwb3N0ZW8ubmV0AAoJELP03Shh9M26prMBAPiWBudj
RtXbfFR+Lj4zeijqEezwT1vFgdegKq3pa5aEAP9QEPBMOtxC4lswThQKeBa4KP9M
B3Ztdlu2Gy1aoMABDg==
=gSf7
-----END PGP SIGNATURE-----

--=-vg9/NooafS+pv092Zlo+--
