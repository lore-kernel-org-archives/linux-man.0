Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.211.166.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223458;
	b=utLUIFq9j+XeyETvmlhPrVunQ2qZmtbah/jg1HnoqpvsJOw721ja/TcjWi/vYF9/B7fo
	 LxVS43pqHBXHwnCVedV2XhOD4UjlXsKfGB/T3JAgp0GX40akUH4YlgGdv2nh6hjXWUQRR
	 qt7ky/3vBM5qGF+cDREIItbPNMZFSqN+1Lb9Yy41miKmO59QMUYnpC1XuPmKlpxLW2EXb
	 zFpTbrnfeY2TZo4Qtu73l/9ypUSA0AIqh28Ktwsl5Y0t+1a3/uKDSSI5OmmdKM48peeXP
	 xIF7bIe20F9xa1Z+Q1aVVOGXlE3QLFi7XYQ7a+MKZ3bnUih33dsm/K4SbYYvg4pq3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223458;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:Organization:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=K6tPkD1R2j5vchQwc6G0V73sZ6HdfUeHdMhovh7KydE=;
	b=bRnSZu/hO8DJATAab6f5CTAu/QCyFqWAvR01qhv6uNqIZbMdnVLaF0aVDWg3v0WMgRyM
	 NxqzLmTJuD5UvzaJIWr6V1x8MMSjgXVzUA7efvCFVamFVtAy5YgD6Dq7HjYa7DH2dlPly
	 93At9axztRGEaC5zRbeMUcdQ/QxxJjUsiiTetnkVtZ71OGIS/koGiGCp6HoiV2E2sr5ZT
	 gf8xRgkY5a5iDpoaJkbkdydOCjgMfQX+D9V0R2j67xguAmZKsXw6ru1yuF5aTOXd+Nqdp
	 INxii6fp6juEV6NPGEeeYVBoZ6lAEf4vfseAt6SCb+heVNNrsF5V4pBDYKMGXz1mXDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentoo.org;
	spf=pass smtp.mailfrom=gentoo.org;
	arc=none smtp.remote-ip=140.211.166.183
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF5606A321
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 11:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A2125343212;
	Mon, 09 Nov 2026 11:24:15 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>,  Walter Harms
 <wharms@bfs.de>,  "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>,
  Rich Felker <dalias@libc.org>,  libc-alpha@sourceware.org,
  musl@lists.openwall.com,  ~hallyn/shadow@lists.sr.ht
Subject: Re: RFC: how to document musl-crypt failure ?
In-Reply-To: <mvmqzgugv6q.fsf@suse.de>
Organization: Gentoo
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
	<avGP3ZsVvX1mOirn@debian> <mvmqzgugv6q.fsf@suse.de>
User-Agent: mu4e 1.14.4; emacs 31.1
Date: Mon, 09 Nov 2026 11:24:10 +0000
Message-ID: <87zevii6xx.fsf@gentoo.org>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Andreas Schwab <schwab@suse.de> writes:

> On Nov 09 2026, Alejandro Colomar wrote:
>
>> I've CCed Rich and also musl and glibc, since they probably want to
>> comment.  I've also CCd shadow-utils.
>
> libcrypt is no longer part of glibc, it is now provided by libxcrypt.

Indeed. But while we're here..

For libxcypt, it's determined by the configure option:
--disable-error-tokens. By default, error tokens are enabled.

I've switched Gentoo to use --disable-*. Fedora already did many years
ago so package failures should be smoked out by now:
* https://src.fedoraproject.org/rpms/libxcrypt/c/853ed305cd53c67bb2827dce78b889c8d187e1e0?branch=rawhide
* https://bugzilla.redhat.com/show_bug.cgi?id=1611784

Debian uses the libxcrypt default. I didn't check other distros yet.

sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmrxrVobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkBs3
AP0QW8qSIsvdwyqPsN9fyKVm8p7JxKObnBYVanS61ZNcYQEA5E5twmISjRuAMsUC
D+sbCLe/30q3mq11hBuaGm9fyAc=
=MRUA
-----END PGP SIGNATURE-----
--=-=-=--
