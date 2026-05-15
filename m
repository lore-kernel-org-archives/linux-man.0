Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8747D93B
	for <linux-man@vger.kernel.org>; Fri, 15 May 2026 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.27.2.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853954; cv=none; b=G3Xl87XHD+rSDvnTbCwZusr8Lm1oIG5CtIsl4bv1zWM0Abl4611SfXK4UcMfME9pwdvoxtRfAfWytyXifn7GlcwXJ3HYv4RAdlx/LwZVUdVLJjO7GgMPjC1n1zfc68gFC47M6bg+9Kd3JtCRNn0FkKBC9iRIB204jASbgbYxvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853954; c=relaxed/simple;
	bh=qyJ2zP28zsVe8/IJd7FkqwwFDQE2mk6OFRJiwCNMMUk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ugcnK3I42/TNY21jOxNFO2NVDGcUJy2dH7Q2xWXqGcfJAGwp0jNJxDt3807xirCHCSmHNUNC0qelnJQdr8O+SqkOectCG+xnStl4O7AkhtDl4timoKZmGmOokzzLnivJCXdJnTQMyheDE2a3jFur3kYz67EaASS6rOTkqBV4Ih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at; spf=pass smtp.mailfrom=tugraz.at; dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b=e6+DkMv1; arc=none smtp.client-ip=129.27.2.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b="e6+DkMv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1778853929;
	bh=R9R78VTRkHctifn1urB5YtaeEcGhboitszyflUlTcDw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e6+DkMv1ppXi5S8GCQZxTab6hbq7GK+HxsJRn3u0UMgXfZRc/E8GL7chV2WzzQ4/U
	 1LiwoAE83TIHabAdUswcgg7wJaevDevPhFFIPONsGi5fm8NHGVN4uaC65Cy7S2y0Tb
	 GqhfWdchAEKg470ngTUpIaSv8JSlyfqjtjY+I32c=
Received: from vra-171-44.tugraz.at (vra-171-44.tugraz.at [129.27.171.44])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4gH89M3g96z2xQK;
	Fri, 15 May 2026 16:05:27 +0200 (CEST)
Message-ID: <b2eb99d1f9a5681a4e8bca3126f3743fed900243.camel@tugraz.at>
Subject: Re: AW: clumsy cast in dlopen.3
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx@kernel.org>, Walter Harms <wharms@bfs.de>
Cc: Bruno Haible <bruno@clisp.org>, "linux-man@vger.kernel.org"
	 <linux-man@vger.kernel.org>
Date: Fri, 15 May 2026 16:05:24 +0200
In-Reply-To: <agbsgTSLbKb-jz-p@devuan>
References: <21436742.Yz81rIOvuz@nimes> <agWw2-7U82vIKSWI@devuan>
	 <face5848c7aa40ba94d37f25ccbd62e9@bfs.de> <agbsgTSLbKb-jz-p@devuan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TUG-Backscatter-control: G/VXY7/6zeyuAY/PU2/0qw
X-Spam-Scanner: SpamAssassin 3.003001 
X-Spam-Score-relay: 0.0
X-Scanned-By: MIMEDefang 2.74 on 129.27.10.116


There is no such thing needed here, you just do

double (*cosine)(double);

cosine =3D dlsym(handle, "cos");


Best,
Martin

Am Freitag, dem 15.05.2026 um 11:56 +0200 schrieb Alejandro Colomar:
> Hi Walter,
>=20
> On 2026-05-15T08:35:49+0000, Walter Harms wrote:
> > Hello,
> > I agree the cast is not nice, (someone for a extension of C standard ?)
> > but i have to admit that i have never seen the trick with the union.
> > But it needs some explaination. The comment in the example is already h=
uge,
> > i would ask for a comment subsektion for this behavier here.
>=20
> The thing about unions is that the only two ways for type punning that
> are blessed by ISO C are unions and memcpy(3).  Everything else isn't
> allowed.
>=20
> Perfectly valid:
>=20
> 	static_assert(sizeof(int) =3D=3D sizeof(float));
>=20
> 	union u {int i; float f;};
>=20
> 	float    f;
> 	union u  u;
>=20
> 	u.i =3D 42;
> 	f =3D u.f;
>=20
> Perfectly valid:
>=20
> 	static_assert(sizeof(int) =3D=3D sizeof(float));
>=20
> 	int    i;
> 	float  f;
>=20
> 	i =3D 42;
> 	memcpy(&f, &i, sizeof(float));
>=20
> UB:
>=20
> 	static_assert(sizeof(int) =3D=3D sizeof(float));
>=20
> 	int    i;
> 	float  f;
>=20
> 	i =3D 42;
> 	f =3D *(float *) &i;
>=20
>=20
> Have a lovely day!
> Alex
>=20
> > btw: the original code in the example looks like this ...
> > cosine =3D (typeof(double (double)) *) dlsym(handle, "cos");
> >=20
> > my2c
> >  wh
> >=20
> > ________________________________________
> > Von: Alejandro Colomar <alx@kernel.org>
> > Gesendet: Donnerstag, 14. Mai 2026 13:29:20
> > An: Bruno Haible
> > Cc: linux-man@vger.kernel.org; Martin Uecker
> > Betreff: Re: clumsy cast in dlopen.3
> >=20
> > Hi Bruno,
> >=20
> > On 2026-05-14T12:56:55+0200, Bruno Haible wrote:
> > > The dlopen.3 man page contains this text:
> > >=20
> > >                   *(void **) &cosine =3D dlsym(handle, "cos");
> > >=20
> > >               This (clumsy) cast conforms with the ISO C standard and=
 will
> > >               avoid any compiler warnings.
> > >=20
> > > However, such a cast violates the strict aliasing rules of ISO C, no?
> >=20
> > I think I agree.  Dereferencing the pointer &cosine with a type
> > different than the type of the object is not allowed.  I've CCed Martin=
,
> > who might be able to confirm.
> >=20
> > >=20
> > > The proper workaround is to use a union:
> > >=20
> > >   union { double (*cosine) (double); void *pointer; } u;
> > >=20
> > >   u.pointer =3D dlsym(handle, "cos");
> > >   ...
> > >   printf("%f\n", u.cosine(2.0));
> >=20
> > This is seems much better, indeed.
> >=20
> >=20
> > Have a lovely day!
> > Alex
> >=20
> > >=20
> > > Bruno
> > >=20
> > >=20
> > >=20
> > >=20
> >=20
> > --
> > <https://www.alejandro-colomar.es>
