Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239463;
	b=Z3Zu/N1ME8SH0PbULQGByVHXoT9Ey3hPkOpwYwOLjBfLnUrDf9jqBnSMyti4kILGA1CC
	 2FYuh7hc26kIdBB87OFYuVQ8ZtPWohGkCseDD1JkTN1jocek2bxvOH3bzcPUJPbWlISaw
	 5dHRYrDoVGCd7gjGT7At2FIk/V0uUVAY0/235yq5EPx9cmUdI+M/FSKyiEBheUi22mZEE
	 VGpnKIyBKSq9LR7wMo2iAEHJm2iuzCvPQmlzsIMCo/gxEPmhWIgYA/8lEKi5NeBwBl9FL
	 5nbvk0VAk1vtgTSMSv5rXYYA2jKf7HwtFWpe/u6Oq3RV8d38w6Zd+ZMVw8obilRF63g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239463;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=plxhaJCTNaz3V7zAZ9fk1FcWqCd0tCOUF6m2D9xHeew=;
	b=AOtg36V32eldsV6nzgY2gXJ8+CSFHQgeHFtSHA8nu4lBueNdB6qkxsjdnziGtIETUrCb
	 qA03Kue5Irmw7Zg0dwHTLj6cb9WwB+D2HKCfEDA5jm24qplhsh+1ssxsJWtc4vnGgByqZ
	 ta1Maj/RM8a6PA5H/h+0xOszBgNLsUzG1X0JLEhatw+mClF1jhIAlQeocn3zeCiiBx543
	 mK//CClAo4vNIAgaXkOin+C47Ay683k3MGEgJkUCkEvYJwa2/gevfzW/lP/ozFwGIj6OA
	 x0azfHHEX8yz5m7Ut3mRQyrF9ZfgPgNehAX7CBhOixCaTKUBj/UV0+dyLByzR4aPKwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJOZXeU2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A000D606A31C
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJOZXeU2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D801F0089F;
	Mon,  9 Nov 2026 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239462;
	bh=plxhaJCTNaz3V7zAZ9fk1FcWqCd0tCOUF6m2D9xHeew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NJOZXeU2X0r1GxGXmPDhjlIso8Z1lL8SPiubnKqF4TXR0cqiD/aakoSYbjrGPv57B
	 ljWeqROsv1XbaYb7f4mB1AJbMONgSzUZDwd3hIwiy7jzgrcH7/3DBXaZlDuic+fc5i
	 ovwGz7pZeYjh3ePzv6aSvQXI3FUsx+RZJElo8mL27iyNoSB3D3Bz6Wuy82YE0akJOv
	 ppdP0EeAGH4be6IRNx6OC5wJbtgf61fzdyLs6R5c6eTtU5AW3zxG+eftpztca/xyeS
	 VhTBTgtJAZJdpnymDyedHKg5EZ5y/EB8oFtL3gB8qBCvnOoab/6ILDblArHit5KMfa
	 HTktytBKIFhsQ==
Date: Mon, 9 Nov 2026 16:50:58 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Walter Harms <wharms@bfs.de>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <avHqKtsxQQDkZX90@devuan>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
 <20261109131732.GM23438@brightrain.aerifal.cx>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="crv2mcvxfunybc44"
Content-Disposition: inline
In-Reply-To: <20261109131732.GM23438@brightrain.aerifal.cx>


--crv2mcvxfunybc44
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Walter Harms <wharms@bfs.de>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <avHqKtsxQQDkZX90@devuan>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
 <20261109131732.GM23438@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261109131732.GM23438@brightrain.aerifal.cx>

Hi Rich,

> Date: 2026-11-09 08:56:50-0500
> From: Rich Felker <dalias@libc.org>
>
> On Mon, Nov 09, 2026 at 11:10:56AM +0100, Alejandro Colomar wrote:
> > Hi Walter,
> >=20
> > > Date: 2026-11-09 08:59:19+0000
> > > From: Walter Harms <wharms@bfs.de>
> > >
> > > Hello list,
> > > in case someone missed it: musl crypt() had an documented but
> > > unexpected behavier that caused a lot of trouble.  See:
> > > <https://news.ycombinator.com/item?id=3D50377221>   SSHHole.com  CVE-=
2026-123158
> >=20
> > Indeed, I also wondered if we should change something in the
> > documentation after it happened.  Unfortunately, the bug has been
> > treated with some secrecy in the first days (reasonable), so I couldn't
> > really understand what went wrong.
> >=20
> > I've CCed Rich and also musl and glibc, since they probably want to
> > comment.  I've also CCd shadow-utils.
> >=20
> > > Normaly i would step over it but in this special case ... it would
> > > like to start a discussion if we should mention that in a note to
> > > crypt().
> >=20
> > Thanks!
> >=20
> > > Perhaps recommending an additional check for '*' ?  I am not sure but
> > > this is a very special case ...
> >=20
> > Rich, now that some time has passed and I guess everyone has a patched
> > SSH, would you mind clarifying what happened, and what should be
> > documented about it?
>=20
> Have you seen my full analysis on the musl list?
>=20
> https://www.openwall.com/lists/musl/2026/11/06/7

Not before, but thanks!  Now I have read it.

I agree with the suggestion of using null+errno in the future, BTW.
FWIW, shadow-utils already handles well a null pointer.

> The correct usage of crypt for password authentication is asserting
> that, if P is the candidate password and H is the account password
> "hash", strcmp(crypt(P,H),H)=3D=3D0. Allowing the user in without checking
> that is potentially a password-authentication-bypass bug.
>=20
> I put "hash" in quotation marks because it might not be an actual
> hash; it can be a string chosen by the tooling or a user manually
> editing the passwd/shadow files to produce something unmatchable. So
> an application should not be making assumptions about its form.
>=20
> Through at least 1.2.6, musl uses failure tokens "*" and "x" for cases
> where the password should never match. These include unsupported
> password length (for hash types that need to restrict it) and
> unsupported or invalid setting/salt strings.
>=20
> It isn't decided yet, but 1.2.7 will probably switch to using failure
> tokens matching libxcrypt's ("*0" and "*1") which are slightly safer
> against some forms of misuse by the caller.

Ok.  Please CC linux-man@ when that happens.

> Future versions may drop
> failure tokens entirely and switch to treating these conditions as
> errors (returning null).

+1.  Again, please CC linux-man@ when that happens.

> I would not document future behavior, and would document existing
> behavior only as an implementation detail, not an application-facing
> contract. The only contract with the application is that crypt(P,H)
> will never return a string identical to H except on valid password (in
> the absence of theoretical hash collisions) regardless of the validity
> of P and H.

Okay.  Thank you very much!  I'll work on a patch, and CC you when it's
ready.


Have a lovely day!
Alex

>=20
> Rich
>=20

--=20
<https://www.alejandro-colomar.es>

--crv2mcvxfunybc44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrx69wACgkQ64mZXMKQ
wqkSSxAAgfhFwnaz/PyQHdHq+i4MGVw5BIUCpd8NlMM7HJCsurfva8u2XP7tAv1J
WXiKboovTEuLA1G1/vMJ90wfQMgxWRc0ZzqQwYXm9EVyxuYdcwgLZjObzOItVDOT
wyznN+HFM9AhaGwzlnxJ0uG8L9q2SIgMGhLltRdgtfOJu8YAOXiPgM8Z54W1qo38
/2wUETxpsxfmdKV8g6VRqoWyS7fkLuMdpVcDAEPGh14cQEgZRhROD+bEX62L4Vtc
FBaHDC4M77zYL1iRkMHSoXA8rkMMgzgOgmQoavwGWurjNv6+Hc3jBC78Rme2Zx3l
3U/++dvO7u/la0Nf+1L0l/HcfZkf+umBkWSYPwBkkwVaP+oNgmQ15TJilgPyXb78
9HwD2I9z2TjQ4SoB9B/peqIwddJ2lxVUIG6UubQehR8dM+I5vDpKMQ5rkVKiHu8V
x9U04XrCZvXRuoP8vNuF/GB5KXA//yGD1QUU5JPRgpYjcnmUQl8FnMlS1ofJuMLu
f5/rYf9Adxk2hgoihX/lE2Fo/w83j0h4PnnXCOyYUvPWdlHhjHAancfKIfT2O30H
VCZ+UnMgE0xlwgMAVFMDu/IT9Zvhxc8L6B6pkY06DPk6WhKSi5NZETQGFmiKBEL4
NaNjo7+Dho5KM23JXjr6bZ21I+gBhqt1s4pdmNEm1daYuODf5uE=
=RH6B
-----END PGP SIGNATURE-----

--crv2mcvxfunybc44--
