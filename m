Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.27.2.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792912958;
	b=q57B/9hfQ1A49rkCA8e6OlLFkwAh6rfHaQCOdXQyOGyknBTOqG4gPhY24wTS3wMBHy6Q
	 Pecx82uvfaLc34/WbOH2wSoWCF7Vr+htFkWWuz038hgKf3mQgMsPAe76AXpZcXXJdlYAN
	 GjT9ojsxOIGv5sefUgXVhGz4BZ1fXmPQl8YX53VoEhoMvrVZfRfnsG7P6KxdO4j+NeCHH
	 2Kj4U9YH7v/DeWyyVsauAiw4ehVeYsVNRMBEWgxrW5QaQ1KqfroAzRwE3Fs/oO7COpgV9
	 WVO3VjH3W+38efrOmZpPKae/nZF8Z6FdmZRmKOpkPkaGcvmwu+Z3r4iy1enJH3j+tlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792912958;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-TUG-Backscatter-control:X-Spam-Scanner:
	 X-Spam-Score-relay:X-Scanned-By;
	bh=obDUpQoEXLgXa+8WrPNrN/+MVqnMUfckwzkBU4S/Y7E=;
	b=l7+50aYj2ad7YsMnJxNG11xoLbkAt4Y2CcM7wkgO2M9hdMwggyIjvTtO5qA6RYy5ECTz
	 32HaiSAFMw9Zf4B8iwkQ5deo72W7/ReFKuaHyUEmLLs6ffnOD3GpNaW7i1Ughlvg257k9
	 Mvip8a4Ch9nqVm2UFYY7ro1J8eiiXB0Tj7Rj6LFMrtxbUkzQvMAgGfWw0aXmTGuR2HtDJ
	 pGGvkpPkVdXsRywfB+6aKMyhSSlruzcUOT0uBR1oB3Eb+yRo0KGuT3lQuocT+IZMEXAla
	 87r+PkDEARm/rYyobHV+B+jx1FvcnYEJ/dGig12br5xsxMpJ/ayH3H0iu78pfcJlX7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tugraz.at;
	spf=pass smtp.mailfrom=tugraz.at;
	dkim=pass header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=PBaX8IdR;
	arc=none smtp.remote-ip=129.27.2.202
Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53B9606A321
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 07:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D53B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=PBaX8IdR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1792912946;
	bh=obDUpQoEXLgXa+8WrPNrN/+MVqnMUfckwzkBU4S/Y7E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PBaX8IdRFTzcrXpeQ56HN+Eqn3NxdEud5wMXV8vVHwJ2+x+hC8IPeavOg7dxHlBF6
	 5/rF4qzjrN1kc4/8okMNT/xxrJuWj07DRX2E2ZFxi+6Jou2cqRyvwTF8Hv17VHQ7sw
	 PIY5cH41NGl/wjWk1Sla1r1GPIKABUWCePtqQtco=
Received: from [192.168.0.221] (84-115-216-212.cable.dynamic.surfer.at [84.115.216.212])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4jC7W35nMsz9s1P;
	Sun, 25 Oct 2026 08:22:23 +0100 (CET)
Message-ID: <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, "Michael Kerrisk
 (man7.org)"	 <mtk@man7.org>, linux-man@vger.kernel.org, Michael Kerrisk	
 <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell	
 <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Date: Sun, 25 Oct 2026 08:22:23 +0100
In-Reply-To: <at2l_NpU28j3n6L0@debian>
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
	 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
	 <at2l_NpU28j3n6L0@debian>
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

Am Sonntag, dem 25.10.2026 um 07:59 +0100 schrieb Alejandro Colomar:
> Hi Martin,
>=20
> > Date: 2026-10-24 20:11:10+0200
> > From: Martin Uecker <uecker@tugraz.at>
> >=20
> > Am Samstag, dem 24.10.2026 um 18:37 +0200 schrieb Alejandro Colomar:
> > > Hi Chris,
> > >=20
> > > > Date: 2026-10-24 17:16:19+0100
> > > > From: Christopher Bazley <chris.bazley.wg14@gmail.com>
> > > >=20
> > > > On Sat, Oct 24, 2026 at 2:38=E2=80=AFPM Alejandro Colomar
> > > > <alx+linux-man@kernel.org> wrote:
> > > > >=20
> > > > > > Date: 2026-10-24 09:45:02-0300
> > > > > > From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
> > > > > >=20
> > > [...]
> > > > > > I was unfamiliar with that syntax, but at least in context it i=
s
> > > > > > immediately understandable,
> > > > >=20
> > > > > Actually, it is not understandable.  [static 2] doesn't mean the =
same as
> > > > > [2], and this is one historic mistake of the C Committee that I w=
ish had
> > > > > never happened.  [static 2] is never what you want (I was tempted=
 to say
> > > > > almost never, but I've never seen a good case for it).  Programme=
rs want
> > > > > the meaning of [2].
> > > > >=20
> > > > > The main differences between [static 2] and [2] are:
> > > > >=20
> > > > > -  [2] means (in GNU C, and in common understanding, but not
> > > > >    acknowledged by ISO C) that:
> > > > >=20
> > > > >         -  The caller must supply at least 2 elements.
> > > > >         -  The callee must not access past those 2 elements.
> > > > >=20
> > > > > -  [static 2] means (in ISO C, but ignored by GCC):
> > > > >=20
> > > > >         -  The caller must supply at least 2 elements.
> > > > >         -  The callee is free to access past those 2 elements!!
> > > > >            (of course, if there aren't any elements after that, i=
t's UB)
> > > >=20
> > > > You can, of course, document for the benefit of callers that a
> > > > function does not read past the static array bound.
> > >=20
> > > Comments are bound to be wrong in the future, often near future.  It'=
s
> > > better to not use the feature, because it's not necessary.  Just use
> > > [2], and ask your compiler to be better than what ISO C requires.
> >=20
> > [static ...] implies that the pointer is not null, this is
> > a standard compliant way to express this (it implies a bit
> > more as nonnull, but compilers do not support more).  Still,
> > it gives you a real practical security benefit.
>=20
> I know you can get usefulness out of it, but the fact that you must
> express a bound and that it doesn't mean what everyone would expect it
> to mean makes it a broken feature, unless and until we fix the second
> bullet by making [static n] mean the same as [[gnu::nonnull]] [n], which
> is n3801 <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3801.txt>.

I know. Is this on the agenda?

>=20
> > void foo(int a[static 3]);
> > void bar()
> > {
> > 	foo(nullptr);
> > }
> >=20
> > <source>: In function 'bar':
> > <source>:5:9: warning: argument 1 null where non-null expected [-Wnonnu=
ll]
> >     5 |         foo(nullptr);
> >       |         ^~~
> > <source>:2:6: note: in a call to function 'foo' declared 'nonnull'
> >     2 | void foo(int a[static 3]);
> >=20
> > https://godbolt.org/z/fa4YsWq63
> >=20
> > >=20
> > > > >         -  The caller must supply a non-null pointer.
> > > > >=20
> > > > > The null-pointer issue is nonsense, but we can live with it.
> > > > > The allowance to access past the specified length, that's the rea=
l issue
> > > > > with this feature, and why it should not be used at all.
> > > >=20
> > > > Of the compilers I have tried, only SDCC currently warns about acce=
ss
> > > > past the specified length, and it does so regardless of whether the
> > > > length is specified using 'static' or not:
> > > >=20
> > > > int foo(int a[static 2])
> > > > {
> > > >   return a[2]; // warning from SDCC
> > > > }
> > > >=20
> > > > int bar(int a[2])
> > > > {
> > > >   return a[2]; // warning from SDCC
> > > > }
> > > >=20
> > > > https://godbolt.org/z/zf3nPerdn
> > >=20
> > > GCC has some partial diagnostics for out-of-bounds accesses.
> > >=20
> > ... (example) ...
> > >=20
> > > I wish it diagnosed as much as SDCC, but not yet.  :)
> >=20
> > The more relevant example is this:
> >=20
> > void foo(int n; int a[n], int n);
> > void bar(int a[4])
> > {
> > 	foo(a, 5);
> > }
> >=20
> > <source>: In function 'bar':
> > <source>:5:9: warning: 'foo' accessing 20 bytes in a region of size 16 =
[-Wstringop-overflow=3D]
> >     5 |         foo(a, 5);
> >       |         ^~~~~~~~~
> > <source>:5:9: note: referencing argument 1 of type 'int[]'
> > <source>:2:6: note: in a call to function 'foo'
> >     2 | void foo(int n; int a[n], int n);
> >=20
> > https://godbolt.org/z/hhGYTej49
> >=20
> > This has a very real and obvious security benefit.
> >=20
> > > ...
> >=20
> > > > > The committee was clearly confused when they added this feature.
> > > > > It was around the time when 'restrict' was added, which is anothe=
r
> > > > > historical mistake of the committee.  In general, every feature t=
hey
> > > > > added thinking of optimizations (and that includes these two) has
> > > > > resulted in a mistake.
> >=20
> > It was not a mistake, it was a different set of priorities
>=20
> It was a mistake.  They thought it would provide room for optimizations,
> but nobody checked whether it was actually useful in the real world.
> This seems to me a clear example of a design looking for users, which is
> precisely what the C Committee should *not* do.

I would assume it came from cray and they had real world
use case for this at that time.

>=20
> > We now have more users and people interested in safety in
> > the committee, but powers could easily shift back.
> >=20
> > > > >=20
> > > > > > and I so I don't dislike it, And it is
> > > > > > standard C.
> > > > >=20
> > > > > When the standard clashes with reality and common sense, I'm not =
sure
> > > > > I'd give the standard much credibility.
> > > > >=20
> > > > > >  I really don't think Linux man-pages is the place to
> > > > > > introducing nonstandard, GNU-specific syntax (that people clear=
ly
> > > > > > don't understand).
> > > > >=20
> > > > > People clearly don't understand [static 2] either.
> > > >=20
> > > > My understanding is that [static 2] was introduced to facilitate ca=
ses
> > > > like the following, where an implementation could theoretically
> > > > generate code that reads the first four elements together, but woul=
d
> > > > have to load subsequent elements individually:
> > >=20
> > > My understanding is tthe same.
> > >=20
> > > >=20
> > > > int len(int s[static 4])
> > > > {
> > > >   int i =3D 0;
> > > >   do
> > > >   {
> > > >     if (!s[i]) break; else ++i;
> > > >     if (!s[i]) break; else ++i;
> > > >     if (!s[i]) break; else ++i;
> > > >     if (!s[i]) break; else ++i;
> > > >   } while (1);
> > > >   return i;
> > > > }
> > > > https://godbolt.org/z/ra6zh7Ej3
> > > >=20
> > > > I have never yet managed to persuade a compiler to optimise such co=
de
> > > > differently from a version without 'static 4', and I struggle to
> > > > believe it would ever be beneficial to do so. The more obvious case=
,
> > > > where an array bound such as [static 4 * n] potentially enables
> > > > speculative loads when unrolling a loop with an early exit, does no=
t
> > > > need the compiler to be permitted to generate code that reads beyon=
d
> > > > the passed-in array bound.
> >=20
> > I think the idea of limiting access to the rest of the array did
> > not occur to them, as this feature was only for optimization.
>=20
> And that's what I call a mistake; a big one.
>=20
> > > And indeed, I agree.  This seems a case of bad design, wishing that i=
t
> > > might eventually be optimizable, while it wasn't and still isn't, and
> > > also while ignoring the safety issues caused by it.  We should just
> > > pretend that the feature doesn't exist.
> >=20
> > It would potentially be useful for optimization, but I think there
> > was a chicken-and-egg problem.  Nobody used [static] and then
> > people worked on instead optimizations more useful for existing code,
> > so [static] also never become useful for programmers.
>=20
> That's the right approach.
>=20
> > Much later it become useful to express non-null pointers.
>=20
> It still hasn't.  It will once we get rid of the bound.  That is, it
> will be useful when one can do [static] or [static *].  And even then,
> the fact that it can't be used on function pointers makes it a bad patch
> in the language.  We need a feature that is consistent.

Yes, but we do not even have a proposal and [static 1] exists today.
>=20
> And we also have the issue that it changes the meaning of the bound.
> It's just terrible.

The bound in [1] has no meaning in parameters, so [static 1] changes
the meaning only in a sense that that it has a stricter meaning
that is still only a subset of what we want.=20

Martin

>=20
>=20
> Have a lovely day!
> Alex
