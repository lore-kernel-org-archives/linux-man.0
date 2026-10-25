Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.27.2.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917671;
	b=Lw3082jbQzcxfbiEw4EMrjWtE8a5exxwNpxBvt98wzC6FL4E00DZNSF0Po3rXtKjtp6F
	 6l6aLFeb//c4ZQDLjYh0KA30KeRMMcOTqVvNkABgJPXb8BS9QJX7LtCU/wNu917FkQUiX
	 pRIr7zpFEKdF89MB8MbbBt32eGDNWzmhoLAj+89wDuioIUtFVC1tCGfv9zX2YjQUl9ZzP
	 At99XEVgYp/jSXZ80uwe+x7JWCYU2cIo9WTZ4kb8zzy1xxzoIsZitML0EftFHyGidGuS4
	 EqJO2CJrorCio7tcb/lgGtlDmsd1+TO6mM55+T2Wk56VQtOxbJyK2Eaakfdr6QE8VAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917671;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-TUG-Backscatter-control:X-Spam-Scanner:
	 X-Spam-Score-relay:X-Scanned-By;
	bh=TU0pdxKjIQ41S/NhHb+dflXT0WLGiYsNCGKA8NADkMA=;
	b=TOFWiJnyp2rjIrfXmQQaPAbedT64aiohLXZUW7qRY9CjtLkDkUrYN35zYQ8mV6tkr2m+
	 6vdoXAtzIUFTB5HeKXzZyPejV3Qg2MFe/G51ZcALwWOcyJSO/e+G5SY1AqaZFSLgfp+sb
	 b70ApIBsi4vWRoUxTRVnP/jl2qHDDCZjo72d2K+K70oog/NbOTQ0kFKRNGf5N/b+GYD1Q
	 UkgTOoMkbhccAOJKs3n3NcHSk1Lt+YX0I9kthyoX5J4mnus3h7iQETT6QeFzuOgwGc76D
	 yU8Q6SzDI+Wk7kHaOSNMRETcvoFhLRnTosOcLhVz3r6mOrDUvoyydBoCW4aoFaysKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tugraz.at;
	spf=pass smtp.mailfrom=tugraz.at;
	dkim=pass header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b="S/5nn7LH";
	arc=none smtp.remote-ip=129.27.2.202
Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15F4606A31A
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 08:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=S/5nn7LH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1792917654;
	bh=TU0pdxKjIQ41S/NhHb+dflXT0WLGiYsNCGKA8NADkMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=S/5nn7LH+PVUkDEjFBCyAR6TuW6EsceW91X7VC1oJji6YduRL6honk0E2FVR16B2V
	 MJXcwIQs5YFiHieMk2mA/Ad+smUyp7LYqm/MXqlCFvWsM5Tpx6Vl4+Q5ErU6s3O94g
	 JApHKx2zP7qMXmPlrSmiGGpME467LZtivNcd4zSM=
Received: from [192.168.0.221] (84-115-216-212.cable.dynamic.surfer.at [84.115.216.212])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4jC9Fd2JNxz2xMt;
	Sun, 25 Oct 2026 09:40:53 +0100 (CET)
Message-ID: <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, "Michael Kerrisk
 (man7.org)"	 <mtk@man7.org>, linux-man@vger.kernel.org, Michael Kerrisk	
 <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell	
 <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Date: Sun, 25 Oct 2026 09:40:52 +0100
In-Reply-To: <at2vv1isjbPZ6-34@debian>
References: <atpnWiYQzs_HZ1Q7@debian>
	 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
	 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
	 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
	 <atyxz7Uj4rue8HjP@debian>
	 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
	 <atzcMTC3Hl4GPD39@debian>
	 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
	 <at2l_NpU28j3n6L0@debian>
	 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
	 <at2vv1isjbPZ6-34@debian>
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
X-Scanned-By: MIMEDefang 2.74 on 129.27.10.116

Am Sonntag, dem 25.10.2026 um 08:38 +0100 schrieb Alejandro Colomar:
> Hi Martin,
>=20
> >=20
...

> > >=20
> > > > Much later it become useful to express non-null pointers.
> > >=20
> > > It still hasn't.  It will once we get rid of the bound.  That is, it
> > > will be useful when one can do [static] or [static *].  And even then=
,
> > > the fact that it can't be used on function pointers makes it a bad pa=
tch
> > > in the language.  We need a feature that is consistent.
> >=20
> > Yes, but we do not even have a proposal and [static 1] exists today.
>=20
> Actually, we do have one: n3803.
> <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3803.txt>
>=20
> The wording on this one is good.  I think I forgot some trivial
> duplication of the diff for both the non-abstract and the abstract
> declarators, but I can fix that when I arrive home, so we could have it
> in time for the next meeting.

Yes, please.  But this would also not work for function pointer,
so I thought you meant something new.

>=20
> > >=20
> > > And we also have the issue that it changes the meaning of the bound.
> > > It's just terrible.
> >=20
> > The bound in [1] has no meaning in parameters,
>=20
> This is not true.  ISO C is just toilet paper in this regard.
> It has a meaning in SDCC and GCC, and every programmer that ever wrote
> [1] assigned a meaning to it.  Moreover, I'm using [1] myself to express
> pointers to exactly 1 element.

In GCC [static n] and [n] have the same meaning, except
that [static] additionally implies that the pointer is not null.
I have worked on this, so please assume I know this.

In ISO C it is as I said, [n] has no meaning and [static n]
is a strict subset of what we want.

So I am really confused about what you are trying to tell me.

Martin

>=20
> > so [static 1] changes
> > the meaning only in a sense that that it has a stricter meaning
> > that is still only a subset of what we want.=20
>=20
> This is just not true.  The standard is meaningless when it clashes with
> reality and common sense.  As Capt. Barbossa would say, "the [standard]
> is more what you'd call "guidelines" than actual rules.  Welcome aboard
> the Black Pearl, Miss Turner!"
>=20
>=20
> Cheers,
> Alex
