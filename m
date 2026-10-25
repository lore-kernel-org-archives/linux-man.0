Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.27.2.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792919139;
	b=orpkOM12n80PMyC76E1l0A7ZdfhznVDK131UYZW6jSja70EnkX/mTfzJ5/jvAPs0CTa8
	 NMPM+ECkGH2nDg5YXyJITc+FHo2CayfpOpuOw0tStqdWxvs6VqkO7OVePTB+mu8zDku4W
	 eqi8RZGzteQw6EWkvGwfcCl5cPNR3rYhDtYpIl+mHCQtUw49hWeFwtz9lMzVZp8Eu0Vft
	 bS8TcaTcEr4PCF1J30wBtZAuZQZPfZazD0rxQZuBbLrBYNfXYVHdpa6ilcXxn+djOlr7o
	 nJ2kAE27pgls+LZuy69n55r4Y6cv6Q6UfDimxHNkPDfZdBcxXB4QAKrLlF4RkkBm7Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792919139;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-TUG-Backscatter-control:X-Spam-Scanner:
	 X-Spam-Score-relay:X-Scanned-By;
	bh=jLvv9WqIVDkjhq13YOSwg7AygFjqyfOdWf5+HOncXAA=;
	b=ApP+fTvjsQnz3YoXaAbrpHsbJrg9WQZ0UI+KJ9T7JaloyQ/cT0e8AptkM7YH0ubLj6Sf
	 OH7cPHwyS2QEg+m1OxvaQFxMH16QT5Fl8ik12gbjnru/daRAaSH3XDTjeitMMMVlJ5QTJ
	 OWDZy+iAuwESLHg4iTwFayDyq9AmhPoqbWNbnejILnFIk2pT9FY+YF4ckfvolMP3/mOel
	 waCgS7t0/lQdMm1JDMXQTjPccRGUOnVUzaD9Bv0yWFIX/tT9DQ9Qq6sI+EGyd+4fyW5A8
	 EgDrtauCo/E+KhZwyG+srYMevd1+hUw1Q4HWNMACsy3Z3ujcD370PhLA3dKSS+UTniA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tugraz.at;
	spf=pass smtp.mailfrom=tugraz.at;
	dkim=pass header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=sNEx+PUR;
	arc=none smtp.remote-ip=129.27.2.202
Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB75606A31A
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 09:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=sNEx+PUR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1792919121;
	bh=jLvv9WqIVDkjhq13YOSwg7AygFjqyfOdWf5+HOncXAA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=sNEx+PUR4viIprvgNMtiKnaze7jEYD44Pb6NSkK0wvpzTIz08xg8w9vKa+3Yeh+xr
	 j3+VynYQL+Yskx1hYABAtElzo3HDHKplC/4q9ME3Mn/yWYKSmusrLozxBQNp944Q44
	 aFX4PnAou+hY/P6g3ZxbybWWXtWHTt9xzenccV0U=
Received: from [192.168.0.221] (84-115-216-212.cable.dynamic.surfer.at [84.115.216.212])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4jC9ns0v5Fz2xJ0;
	Sun, 25 Oct 2026 10:05:20 +0100 (CET)
Message-ID: <1288a5ed994afb226751f78ab0fbed80d5bb2040.camel@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, "Michael Kerrisk
 (man7.org)"	 <mtk@man7.org>, linux-man@vger.kernel.org, Michael Kerrisk	
 <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell	
 <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Date: Sun, 25 Oct 2026 10:05:20 +0100
In-Reply-To: <at3CrSg8Rpf5JDOY@debian>
References: 
	<CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
	 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
	 <atyxz7Uj4rue8HjP@debian>
	 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
	 <atzcMTC3Hl4GPD39@debian>
	 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
	 <at2l_NpU28j3n6L0@debian>
	 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
	 <at2vv1isjbPZ6-34@debian>
	 <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
	 <at3CrSg8Rpf5JDOY@debian>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-TUG-Backscatter-control: G/VXY7/6zeyuAY/PU2/0qw
X-Spam-Scanner: SpamAssassin 3.003001 
X-Spam-Score-relay: 0.0
X-Scanned-By: MIMEDefang 2.74 on 129.27.10.117


Thanks. I think we are on the same page on this.
And thanks for pushing this forward.

Martin


Am Sonntag, dem 25.10.2026 um 09:57 +0100 schrieb Alejandro Colomar:
> Hi Martin,
>=20
> > Date: 2026-10-25 09:40:52+0100
> > From: Martin Uecker <uecker@tugraz.at>
> >=20
> > Am Sonntag, dem 25.10.2026 um 08:38 +0100 schrieb Alejandro Colomar:
> [...]
> > > > Yes, but we do not even have a proposal and [static 1] exists today=
.
> > >=20
> > > Actually, we do have one: n3803.
> > > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3803.txt>
> > >=20
> > > The wording on this one is good.  I think I forgot some trivial
> > > duplication of the diff for both the non-abstract and the abstract
> > > declarators, but I can fix that when I arrive home, so we could have =
it
> > > in time for the next meeting.
> >=20
> > Yes, please.  But this would also not work for function pointer,
> > so I thought you meant something new.
>=20
> Done.  I've asked Dan for a number, and sent the draft to the mailing
> list.
>=20
> > > > > And we also have the issue that it changes the meaning of the bou=
nd.
> > > > > It's just terrible.
> > > >=20
> > > > The bound in [1] has no meaning in parameters,
> > >=20
> > > This is not true.  ISO C is just toilet paper in this regard.
> > > It has a meaning in SDCC and GCC, and every programmer that ever wrot=
e
> > > [1] assigned a meaning to it.  Moreover, I'm using [1] myself to expr=
ess
> > > pointers to exactly 1 element.
> >=20
> > In GCC [static n] and [n] have the same meaning, except
> > that [static] additionally implies that the pointer is not null.
> > I have worked on this, so please assume I know this.
>=20
> Indeed, I know you know.
>=20
> > In ISO C it is as I said, [n] has no meaning and [static n]
> > is a strict subset of what we want.
>=20
> And I insist that ISO C should be ignored.  It doesn't matter what ISO C
> says about it, and your statement that [1] has no meaning in parameters
> is giving it too much credibility.
>=20
> > So I am really confused about what you are trying to tell me.
>=20
> I'm trying to say that [1] has a meaning, even outside of GCC.  Every
> programmer that ever wrote [n] meant the obvious thing.  The fact that
> ISO C ignores this shouldn't be an excuse to claim that [static n]
> doesn't change the meaning, because it is a de-facto change of meaning.
>=20
>=20
> Cheers,
> Alex
