Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.27.2.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792865485;
	b=Y1a5daQn8NbEHVwpX32tB/pHd4yrNH4y2pDTeYfoJDqjT5usqjrU4znpyk/IjUpQjbG7
	 gtx61NhM30BwEN4lt8Qo+VYp3dNl0uIVkb1KGCMOVND2sx7KdB6JhNq8sjCEej6jrlDEl
	 QMd0g44Bh3eQiG6G54A/lYuTAeT8sdLvlrJcjpaGNx/1rWqF8a49rrbl6AFhdDhplDmIx
	 X03esZrF/ftuVaih/hHLVB5eOZn2su8jpK2lu6+e/FyUcJ6fJENgJjXGeA5qOklRkCAHE
	 NdZWwlspvJHP1V39y0fssIzQjrAX7jmEu+IYmZtAaeH/n5gHbzOVsxQ42jai2Gd4hgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865485;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-TUG-Backscatter-control:X-Spam-Scanner:
	 X-Spam-Score-relay:X-Scanned-By;
	bh=65m0ZCG2xOL6RxDPqQEefAWNL9qmEuV3mlVJEY106CI=;
	b=c3ImM9vF8Vk8ch3eUYwtmnnbBR5zEid7v5cJBnX8hIQeEx9spfUnvwGRjHpZ60nZ/qOH
	 kF2fB+fzhA2L490OxBXCr4Qq8Y9RL7WBICvJ8ugF8DFRocFSl3aSE2XAEwRtQfktlfCQp
	 AgS+sdHeMFBjBUulXIgYzNDzzRYYs9b7LbxFeFaFcdRHE7h/cHPnbG9CBinfGUZYxUbOD
	 Ndc+Fjcc8IP98KwkTd6rmD7LPXJFGFjG8u6xoQODtkWXfmd94jJ8QRsWthEyfvGiDR69f
	 q1iZgVmoublJ+BgCiHzq3By+qcRYlReFeOxdcg/1Af9WWGXoz+ksCf9PVvgzo4ipTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tugraz.at;
	spf=pass smtp.mailfrom=tugraz.at;
	dkim=pass header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=oqDoE9hJ;
	arc=none smtp.remote-ip=129.27.2.202
Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32516606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 18:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32516606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=oqDoE9hJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1792865472;
	bh=65m0ZCG2xOL6RxDPqQEefAWNL9qmEuV3mlVJEY106CI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oqDoE9hJo0DY+7zonL5V2GHRE8YrptL+HVrCjO54ilh5Cm00UmOFSQzC5vDT5tRNq
	 5GzheXR2HZagqR7AMa6qxZo5mbfWDw1iuyDyg7xxWTxNzMoA9KdugAhJ4k3HsDX1vb
	 J7kkMIpBfyUD9SjdKHELkkBtNsZcVkKUej8wPyS4=
Received: from [192.168.0.221] (84-115-216-212.cable.dynamic.surfer.at [84.115.216.212])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4jBny64ZrPz2xMH;
	Sat, 24 Oct 2026 20:11:10 +0200 (CEST)
Message-ID: <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx+linux-man@kernel.org>, Christopher Bazley
	 <chris.bazley.wg14@gmail.com>
Cc: "Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
 Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>,
 Carlos O'Donell <carlos@redhat.com>,  "Joseph S. Myers"
 <josmyers@redhat.com>, corbet@lwn.net
Date: Sat, 24 Oct 2026 20:11:10 +0200
In-Reply-To: <atzcMTC3Hl4GPD39@debian>
References: 
	<79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
	 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
	 <atpnWiYQzs_HZ1Q7@debian>
	 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
	 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
	 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
	 <atyxz7Uj4rue8HjP@debian>
	 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
	 <atzcMTC3Hl4GPD39@debian>
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

Am Samstag, dem 24.10.2026 um 18:37 +0200 schrieb Alejandro Colomar:
> Hi Chris,
>=20
> > Date: 2026-10-24 17:16:19+0100
> > From: Christopher Bazley <chris.bazley.wg14@gmail.com>
> >=20
> > On Sat, Oct 24, 2026 at 2:38=E2=80=AFPM Alejandro Colomar
> > <alx+linux-man@kernel.org> wrote:
> > >=20
> > > > Date: 2026-10-24 09:45:02-0300
> > > > From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
> > > >=20
> [...]
> > > > I was unfamiliar with that syntax, but at least in context it is
> > > > immediately understandable,
> > >=20
> > > Actually, it is not understandable.  [static 2] doesn't mean the same=
 as
> > > [2], and this is one historic mistake of the C Committee that I wish =
had
> > > never happened.  [static 2] is never what you want (I was tempted to =
say
> > > almost never, but I've never seen a good case for it).  Programmers w=
ant
> > > the meaning of [2].
> > >=20
> > > The main differences between [static 2] and [2] are:
> > >=20
> > > -  [2] means (in GNU C, and in common understanding, but not
> > >    acknowledged by ISO C) that:
> > >=20
> > >         -  The caller must supply at least 2 elements.
> > >         -  The callee must not access past those 2 elements.
> > >=20
> > > -  [static 2] means (in ISO C, but ignored by GCC):
> > >=20
> > >         -  The caller must supply at least 2 elements.
> > >         -  The callee is free to access past those 2 elements!!
> > >            (of course, if there aren't any elements after that, it's =
UB)
> >=20
> > You can, of course, document for the benefit of callers that a
> > function does not read past the static array bound.
>=20
> Comments are bound to be wrong in the future, often near future.  It's
> better to not use the feature, because it's not necessary.  Just use
> [2], and ask your compiler to be better than what ISO C requires.

[static ...] implies that the pointer is not null, this is
a standard compliant way to express this (it implies a bit
more as nonnull, but compilers do not support more).  Still,
it gives you a real practical security benefit.

void foo(int a[static 3]);
void bar()
{
	foo(nullptr);
}

<source>: In function 'bar':
<source>:5:9: warning: argument 1 null where non-null expected [-Wnonnull]
    5 |         foo(nullptr);
      |         ^~~
<source>:2:6: note: in a call to function 'foo' declared 'nonnull'
    2 | void foo(int a[static 3]);

https://godbolt.org/z/fa4YsWq63

>=20
> > >         -  The caller must supply a non-null pointer.
> > >=20
> > > The null-pointer issue is nonsense, but we can live with it.
> > > The allowance to access past the specified length, that's the real is=
sue
> > > with this feature, and why it should not be used at all.
> >=20
> > Of the compilers I have tried, only SDCC currently warns about access
> > past the specified length, and it does so regardless of whether the
> > length is specified using 'static' or not:
> >=20
> > int foo(int a[static 2])
> > {
> >   return a[2]; // warning from SDCC
> > }
> >=20
> > int bar(int a[2])
> > {
> >   return a[2]; // warning from SDCC
> > }
> >=20
> > https://godbolt.org/z/zf3nPerdn
>=20
> GCC has some partial diagnostics for out-of-bounds accesses.
>=20
... (example) ...
>=20
> I wish it diagnosed as much as SDCC, but not yet.  :)

The more relevant example is this:

void foo(int n; int a[n], int n);
void bar(int a[4])
{
	foo(a, 5);
}

<source>: In function 'bar':
<source>:5:9: warning: 'foo' accessing 20 bytes in a region of size 16 [-Ws=
tringop-overflow=3D]
    5 |         foo(a, 5);
      |         ^~~~~~~~~
<source>:5:9: note: referencing argument 1 of type 'int[]'
<source>:2:6: note: in a call to function 'foo'
    2 | void foo(int n; int a[n], int n);

https://godbolt.org/z/hhGYTej49

This has a very real and obvious security benefit.

> ...

> > > The committee was clearly confused when they added this feature.
> > > It was around the time when 'restrict' was added, which is another
> > > historical mistake of the committee.  In general, every feature they
> > > added thinking of optimizations (and that includes these two) has
> > > resulted in a mistake.

It was not a mistake, it was a different set of priorities
We now have more users and people interested in safety in
the committee, but powers could easily shift back.

> > >=20
> > > > and I so I don't dislike it, And it is
> > > > standard C.
> > >=20
> > > When the standard clashes with reality and common sense, I'm not sure
> > > I'd give the standard much credibility.
> > >=20
> > > >  I really don't think Linux man-pages is the place to
> > > > introducing nonstandard, GNU-specific syntax (that people clearly
> > > > don't understand).
> > >=20
> > > People clearly don't understand [static 2] either.
> >=20
> > My understanding is that [static 2] was introduced to facilitate cases
> > like the following, where an implementation could theoretically
> > generate code that reads the first four elements together, but would
> > have to load subsequent elements individually:
>=20
> My understanding is tthe same.
>=20
> >=20
> > int len(int s[static 4])
> > {
> >   int i =3D 0;
> >   do
> >   {
> >     if (!s[i]) break; else ++i;
> >     if (!s[i]) break; else ++i;
> >     if (!s[i]) break; else ++i;
> >     if (!s[i]) break; else ++i;
> >   } while (1);
> >   return i;
> > }
> > https://godbolt.org/z/ra6zh7Ej3
> >=20
> > I have never yet managed to persuade a compiler to optimise such code
> > differently from a version without 'static 4', and I struggle to
> > believe it would ever be beneficial to do so. The more obvious case,
> > where an array bound such as [static 4 * n] potentially enables
> > speculative loads when unrolling a loop with an early exit, does not
> > need the compiler to be permitted to generate code that reads beyond
> > the passed-in array bound.

I think the idea of limiting access to the rest of the array did
not occur to them, as this feature was only for optimization.

>=20
> And indeed, I agree.  This seems a case of bad design, wishing that it
> might eventually be optimizable, while it wasn't and still isn't, and
> also while ignoring the safety issues caused by it.  We should just
> pretend that the feature doesn't exist.

It would potentially be useful for optimization, but I think there
was a chicken-and-egg problem.  Nobody used [static] and then
people worked on instead optimizations more useful for existing code,
so [static] also never become useful for programmers.

Much later it become useful to express non-null pointers.

Martin

>=20
>=20
> Cheers,
> Alex
