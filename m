Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8926937E5E9
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504856; cv=none; b=pYvzos9ByxcNcza7gwhq0nKFEHZ/0kG2aWMYINF8Illd78lxbZKg+s1nKPDxdjQnl01DTPKeUfJ8Ee7NPuPdb+dNaf0QI4a90wI8rRs/qWzbrYsbLFxQr5+wm2Csc92ZUn1NmTsQr2OuTQH0q8sYwh9MscwXjNTx4be0mBlbAC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504856; c=relaxed/simple;
	bh=+wybdqqLXvLUniEYIS+Py0FBgqJ611dBo/0RRcZq5BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQY1wvWES5eoAx48VDjB0BXGLqdKkJlLfHrcaomskzndyeXdm4LVf6W0zU66jtOzITbHRK+ho6YKb352E7Zbs7KlVFugCxeQj/u654/91g/FeCAKyaKJ8kVWUeHrTJlaPb9lE7Sp9lgsWjAx3shK+BLQNO4M8iC0JOjkoNmHqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d50ZUdAV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d50ZUdAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28F1F000FF;
	Tue, 15 Sep 2026 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504855;
	bh=9CTlqvE+DdbXDv3yW6glJDSfDk4JbHW6/3KH4Z14jgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d50ZUdAVuQJt/pu/4S7z052+AWrcK7PWEeWTsqkFwxogfTfMijg+lD4PRgKJkJUA0
	 xIBg6XYoi7p71jtsGoW35YFGu1v4adxoYwTQhkAgDMCKN9r2NxYwFHxVHbbmwr226q
	 W1C+yWitg7HTrQuHr9Q+UAu0POGs8oVOjK6VS7SQQhqUkyaF52Xjtk38+SIjmdhfrF
	 K661LKRcBELZ4Y3tbI4BA/tT+xS4NBfNjb3ofwweTZb8V3Uip2EMcTByv+Z3mXHb5l
	 uvsGUIur0tcMV1NmuFAbAWxZwKRB4nu6G7Xu+z4Jnun0Wu63uPdEEUr85aFIjTch+4
	 4H+k36K5EPfoA==
Date: Tue, 15 Sep 2026 22:40:50 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v1] share/mk/: Use suffix rules where possible
Message-ID: <aqmsP8qsBabv3N-J@devuan>
References: <9a74fe43cf61f80f253e1401b547296b6f97c44a.1788101363.git.alx@kernel.org>
 <apRfmYBBPy0S8IAI@devuan>
 <aqQ1tJR43K-72xMV@devuan>
 <aqlyACy8rjSC2GiI@gremlin>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwushw37azuni4b5"
Content-Disposition: inline
In-Reply-To: <aqlyACy8rjSC2GiI@gremlin>


--rwushw37azuni4b5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v1] share/mk/: Use suffix rules where possible
Message-ID: <aqmsP8qsBabv3N-J@devuan>
References: <9a74fe43cf61f80f253e1401b547296b6f97c44a.1788101363.git.alx@kernel.org>
 <apRfmYBBPy0S8IAI@devuan>
 <aqQ1tJR43K-72xMV@devuan>
 <aqlyACy8rjSC2GiI@gremlin>
MIME-Version: 1.0
In-Reply-To: <aqlyACy8rjSC2GiI@gremlin>


Hi Lorenzo,

> Date: 2026-09-15 17:47:59+0100
> From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
>
[...]
> > From what I've seen, the kernel seems to use regular 'pattern rules'
> > extensively.  I wonder if moving to 'static pattern rules' would bring
> > a benefit similar to the one we experience in the Linux man-pages
> > project.
>=20
> Hmm intersting :)
>=20
> I think the kernel is complicated by a lot of 'flexibility' in the build
> process.
>=20
> And probably simplifying it is difficult in some cases.

Yup.

> > Another important thing is that the build system of the Linux man-pages
> > uses a single make(1) process to build (i.e., we don't use recursive
> > make(1)).  That makes it parallelize better.  I'm not sure whether the
> > kernel makefiles are recursive (for the main build) and how much that
> > affects the kernel build.  It might be something to check too, as I
> > remember it was very impactful.  Recursive make(1) is considered harmful
> > by some (I agree, IME).
>=20
> Yeah I don't think that's at all feasible for the kernel :)

I think it should be possible.  At least, it could be reduced
significantly.

> Ideally we'd use something other than GNU make honestly.

I'd suggest to keep GNU make(1).  Well written GNU makefiles can be
quite fast.  And being makefiles, they're relatively easy to read (like
with C, it depends on how weird you want to go), at least to some
degree.

Something I love from the kernel (and which I've also done in the
man-pages) is that it's a single-step build system.  Multi-step
(configure, etc.) build systems are consistently a nightmare, IME.

> But it's a step at a time based on what's actually feasible I think, so
> low-hanging fruit first!

:-)


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--rwushw37azuni4b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqprVIACgkQ64mZXMKQ
wqmXFg//Rzc2D3goYsrYgqvzYbdm7tuAJf2RAcwrobp4Y3s/MiozZaPiuJNMr/+f
UY1r2oJzpf0kg7zVMQnaeR7qSmcGHwIA5CXNA4W7JtToAwmFrBYdGsX/4g19xPtb
07HaYSct7dkOv0H3TdcsTZ+Clw1Pz/Ss+twfk4jOBkbmExdob1YlFGW1YKrXt737
NzznNw1xjaivSZ7MvaFerwmWu3sBBEQBNufjjc85UiUIFLJ9AytixXdEZbBJ/WCe
3Onn4AiacPwQl9dB894fzOAubigG1w1Tc7gTaxTwkoRyM2swm3rJVHJfZZ5s3H2v
PObtLQ4h5UPI9BqK7d2tKNMBZRrwvclRHVVLSRD2/Iq9T/S+oGPKM/lTb6s2aH+A
GKtjEHBz2Zpgx8Kh0uCmgzw5Hl0z9FjFQ/YZ9rlwqFetzzUbCNis4x/i3ErlFHi6
Xr4fi/xaGI06Ax0/d/z+0yXK38Ll3LkM98J+2FtqEYqYrjnJLT6o9IhN/2AhHHcm
ZIrIC0duEeXfqNVkeNZPKvA6B7+YHHBlpkYv86xDOXK8U9qRf+a2cJf8TOvjGrJu
dhdDbUunmTHqS8RLASx4eSALsKyka/rEDgZmWOnkWsHfVI+Q6KP+CiXjXALmSG/z
sAf1K+/Hcl8ox/C1BXbi4HiUF4ujrZVxAb6AOANidQfD3HVwyaA=
=oANO
-----END PGP SIGNATURE-----

--rwushw37azuni4b5--
