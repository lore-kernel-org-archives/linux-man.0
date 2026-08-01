Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A433ADA7
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595943; cv=none; b=Xrqw/NQUTZ7YWl9QKBmrp2/zfSo2aP3BEA/rgYmNXsXSu2sA6WHPw1FgGVkFmA/50ir4CcDU+0e/hNq52v682xSSWIQn7KgcrG8QfWh8AMBa+WPBHS2XAP54I5w/k38uEsTFpwxjcPYiqD9mCm+/dGE9juJV6XAKB5rFaOrGi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595943; c=relaxed/simple;
	bh=KEQQXLaek/T/4pGQvDbx/XX4dpjqJuW+rA4hO9TkAx0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bNmZEDEbueYdSBH+4bmtEgS/JkH5QoDvBWxlJv5KcWMt9H48ZKa77wpTXIY4GCYYelKCO2CwOUfAgtKnA90LMlR5toNFddd0/pnnRK1ybZMk42PgTKC0XJS1sQgC5l89twTSC157nF4rJB1wQs0RNU1pK71jP43rujYlgbQlMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E1636341EB9;
	Sat, 01 Aug 2026 14:52:18 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>,  Alejandro Colomar <alx@kernel.org>,
  linux-man@vger.kernel.org,  Keith Bostic <keith@bostic.com>,  Mark Harris
 <mark.hsj@gmail.com>,  Nevin Liber <nevin@cplusplusguy.com>,  JeanHeyd
 Meneide <phdofthehouse@gmail.com>,  Christopher Bazley
 <chris.bazley.wg14@gmail.com>,  "Serge E. Hallyn" <serge@hallyn.com>,
  Iker Pedrosa <ipedrosa@redhat.com>,  "Evgeny Grin (Karlson2k)"
 <k2k@drgrin.dev>,  Kees Cook <keescook@chromium.org>,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform
In-Reply-To: <20260731222417.4fo36is3iawyc7d4@illithid>
Organization: Gentoo
References: <cover.1785532392.git.alx@kernel.org>
	<784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
	<e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
	<20260731215122.4p4aepsbgeoibx74@illithid> <87a4r6es6k.fsf@gentoo.org>
	<20260731222417.4fo36is3iawyc7d4@illithid>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Sat, 01 Aug 2026 15:52:13 +0100
Message-ID: <87h5lddhb6.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:

> Hi Sam,

Hi Branden,

>
> At 2026-07-31T22:59:47+0100, Sam James wrote:
>> "G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
>> > At 2026-07-31T21:23:35+0000, Joseph Myers wrote:
>> >> I think it's irresponsible to use the man-pages project to promote
>> >> personal idiosyncratic ideas like this in preference to what's been
>> >> the standard location of functions since 1989.
>> >
>> > I'm sure I don't need to bring to your attention what a mine field
>> > string/`char` sequence/memory buffer handling has been in C since the
>> > language's inception.
>> >
>> > More to the point: what's a better forum for pursuing this attempt at
>> > reform that will both (a) reach a significant population of stakeholde=
rs
>> > who can variously red-team it and/or endorse it; and (b) has sufficient
>> > visibility that it can't easily be ignored by people who oppose reform
>> > in this area for whatever reason?
>>=20
>> I think the man page already tries to discourage use in its CAVEATS
>> section.
>
> Yes, but that's not a language reform, which is what Alex is pursuing
> with "alx-0097r1".  In at least one earlier iteration he's expressed his
> intention to submit an N document to WG14.
>
>> > I hope you do not wish to imply that a closed session of some
>> > committee, or unofficial backroom politicking would be preferable,
>> > nor that WG14 should close its doors to members of its user
>> > community who have not been vetted for a disinclination to
>> > boat-rocking.
>>=20
>> I am confused as to where that implication could have possibly come
>> from.
>
> From familiarity with Alex's stated objective and rationale, which we
> can acquire from the recent list traffic Joseph characterized as
> irresponsible.

Ah, I see. Thanks for explaining.

To clarify then: I have no issue with Alex advocating changes. I just
have an issue with man-pages being used regularly as a vehicle for that.

>
> AC> The C Committee is discussing standardization of <memory.h>, so
> AC> let's give it a bump.
>
> AC> I'll send you a copy of a paper I'm writing for the C Committee.
>
> AC> It is at the bottom of this email.  I will publish it as an N
> AC> document in August.
>
> https://lore.kernel.org/linux-man/784288e704183a4297aeaa3d13af8edab18bc1e=
a.1785532392.git.alx@kernel.org/
> https://lore.kernel.org/linux-man/amaTpQxd52iYjlor@devuan/
>
>> Joseph is opposing the change in the form of a patch that is
>> likely to be applied (*) to man-pages.git which has the effect of
>> advocacy.
>
> Yes, and he said so categorically.  More constructive advice might have
> taken the form of recommending a sequencing for staged changes.  Here's
> a crude sketch.
>

I agree this is more productive, thanks for setting it out.

> 1.  Expand "CAVEATS" sections in relevant Linux man-pages documents.
> 2.  Pursue N-document work with WG14.
> 3.  When WG14 has disposed of that N-document (and any descendants
>     thereof), update Linux man-pages documents as appropriate.
>
> Joseph's almost certainly better placed than I to add a "step 1.5"
> such that Alex might pursue some course that would better prepare the
> ground for his step 2.  I haven't attempted revision of the C language
> standard myself, so I can't offer specific advice regarding how best to
> pursue such an objective.  I possess only notions of elemental
> principles regarding how democratic, consultative bodies of technical
> experts _should_ serve the public.
>
> That _is_ what we're here for, right?
>
>> I don't think it has anything to do with WG14 membership or anything
>> of the like? What am I missing?
>
> See above regarding Alex's publicly circulated drafts and expressed
> plans.

What I mean is that I didn't take Joseph's comments to be an objection
to Alex's WG14 membership or anything of the sort, just that man-pages
isn't an appropriate vehicle for it. In any case, that's my position
even if I misunderstood Joseph's.

>
>> (*) Alex has a history of making opinonated changes like this to
>>     man-pages, such as removing references to older standards, and
>>     using a somewhat novel (to many) syntax for prototypes.
>
> I concur with that assessment.  However, a person having a history of
> making opinionated changes is not sound grounds for evaluation of a
> technical proposal, especially if it's topically unrelated.
>
> Preoccupying oneself with irrelevancies distracts from the conscientious
> execution of standards committee participation.
>

Thanks for your thoughtful email. I found it helpful!

> Regards,
> Branden

sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpuCB0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkDGt
AQD1ZDfWlaEV3ladwzJQRlwgU6Lzt9Wz1TK871+xNpwtGAD/cyfBoif2DEvXxOH+
avBDoOPdm8O5Zel6wsffZ5mNKwM=
=B5cS
-----END PGP SIGNATURE-----
--=-=-=--
