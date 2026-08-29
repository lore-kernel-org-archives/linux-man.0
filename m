Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232952848BE
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788007909; cv=none; b=a3eyEsUenwDfzwLwkvjWQEepTXogjmfEuB5JJmQsexw6K1lMLvOf3o0fJjXRXL7obFduKd2/lNCjusrzMOpH1YLWjARjARrXKVlnIdFIO6z1dJ/YcZ9f9FwctVWK3Hmu0X0/h/O1SkyHqu3nHYixJ79hLexQlCpWZrfLFukFzXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788007909; c=relaxed/simple;
	bh=EknfBOZ3S9+kME4+A6gGOjtpcmu0xy6woypk1SvdiS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8Aox1lusHEZv6ainK2e0nrJpjsYiLSk1EHIY4d6ARpDifTFlhazZBHyguUkIt8WVq5WeprU3ByzhiMm/G8XkXirJbiLfMTKR/F/QfeTnA0zjltGCeGoNV4cOgCf7uQJ1uMcqVuD1Fr5/XdoUBR83yZy4e9PSHeoRemXbqAdgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYRhHEpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYRhHEpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED791F000E9;
	Sat, 29 Aug 2026 12:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788007907;
	bh=Q08ywuqPnOonqtfbGN0x/ZTwYtQa+xBNM4BT7WlBY6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BYRhHEpgLYB41LFKu5d+8rAoPPovgArVKcN8U4wDEBKnh+KkJ8qmxA3MCmQ5movrv
	 4GnzwT1F2skHpl3oMIh4hp0lUHL7qsygWZsOYoyJgr/fGvoh3PK2bqtmAXstAzRrKB
	 dpXgQuIqxzxrPYQ9d9Bh9SGAy2jo6u23GLtOjwqSDphmHdQPDjFz/eUbsDKzFFdbpt
	 /hIAAmYgWcj/kNuDv09x21iag9yLcYYS+Uh/0Zgm+/PoaXYDvveCzymA/awHFg4U0a
	 VsZ3JWvGLGJncbY2W2w5pXehpXoliO5aTmPPyUP8bmki+uhf/BJsC3H2b/VCMJXzve
	 okMBnyChz4KQQ==
Date: Sat, 29 Aug 2026 14:51:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <apLSc6uhVjBNhtyy@devuan>
References: <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <aot0q9iCIXOJf8Kk@isnote.usta.de>
 <20260829043615.vuh3idp3a7if4vnm@illithid>
 <apLD35LsoOqX6fK1@isnote.usta.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o7crjucvo4yeph43"
Content-Disposition: inline
In-Reply-To: <apLD35LsoOqX6fK1@isnote.usta.de>


--o7crjucvo4yeph43
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <apLSc6uhVjBNhtyy@devuan>
References: <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <aot0q9iCIXOJf8Kk@isnote.usta.de>
 <20260829043615.vuh3idp3a7if4vnm@illithid>
 <apLD35LsoOqX6fK1@isnote.usta.de>
MIME-Version: 1.0
In-Reply-To: <apLD35LsoOqX6fK1@isnote.usta.de>

Hi Ingo,

> Date: 2026-08-29 13:34:55+0200
> From: Ingo Schwarze <schwarze@usta.de>
>
[...]
> The mandoc(1) -T man output mode uses
> [...]

Oh, there's a -Tman mode!  That's interesting!  Some years ago,
I wondered whether groff(1) could have a -Troff mode, which would
evaluate the man(7) (or any other -m macros, FWIW) macros without
formatting the document.  This -Tman from mandoc(1) sounds like a
similar (but not same, of course) thing.

[...]
> >      .LS type [compactness [indentation]]
>=20
> What is the logical reason for requiring that, to specify the
> indentation, you also need to specify the compactness?

I guess I'd have the same question if it were the other way around, and
this way I expect it's simple to implement (I'd certainly be more
worried if groff(1) attempted to guess the meaning of my argument if I
only pass one of them), so I think I'm okay with it.  Do you have any
ideas for a better interface?

> >             (since groff 1.25) Start (or open) a list.  type is one of
> >             "definition", "enumerated", or "itemized".  compactness is a
> >             Boolean value directing suppression of inter-paragraph
> >             spacing between list items.
>=20
> That sounds very confusing.  Does "Boolean" mean: either the string "0"
> or the string "1"?  Or what would "true" or "false" mean?
> Then, "Boolean value directing suppression" sounds vaguely as if "1"
> might mean "suppress", but that's not expressed unambiguously.

Agree.

> Finally, why only *between* list items?  Why not *before each*
> list item?  Would suppressing the vertical spacing before the first
> list item still require .PD 0 *in addition* to "compact"?

The idea, I think, is that if you write '.P' surriounding LS/LS, you'll
get the outer blanks, and if not, you'll get compactness also before
and/or after the list.

[...]
> >             Use IP with a mark argument to represent an
> >             itemized or enumerated list item, and TP for a definition
> >             list item.  Use IP without arguments to associate
> >             successive paragraphs with an existing list item; to these,
> >             inter-paragraph spacing applies even in compact lists.
>=20
> Not sure the phrase staring with "to these" should be advertised
> so prominently.  *If* an author chooses to make a list "compact"
> but then kind of contradicts themselves by inserting paragraph
> breaks into individual list items, the behaviour you describe is
> probably what the formatter should do.

I'm not convinced about this detail either.  I think in a compact list
this should not produce a blank line:

	.P
	.LE

But this should:

	.LE
	.P

> But authors ought to be strongly discouraged from doing that.
> When one or more items of your list are so complicated that they
> require more than one paragraph of text, making your list "compact"
> makes no sense in the first place and will result in ugly and
> confusing typography.

+1

> To summarize, after reviewing the design of .LS/.LE, my first
> impression is that it is likely a small-value, small-harm
> addition.  I think i will support them in mandoc(1) -man when
> i find the time, but not emit them from mandoc(1) -T man, at least
> not for many years to come, because the whole point of that output
> mode is dealing with operating systems that use ancient
> manual page formatters, and those are unlikely to support .LS/.LE.

Makes sense.

> Chances are the the deeper scrutiny that will be necessary to
> implement .LS/.LE in mandoc(1) may lead to additional criticism;
> or if we are lucky, it may not.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--o7crjucvo4yeph43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqS1doACgkQ64mZXMKQ
wqlx9hAAjH8CiuqeHoI+KnwgJEd1rhNVaih+dv7w754LtJwggYLjOF9ejw3QnIGl
cPYfwqIgIcnG9skzc4sdwED6iNzuP9lE+k6ENCK09fTIwThIRvgPolsF9Of4cDcr
XL2Bmrmg2zpe6KwQwQoDzP3sP2jfR8fZHcZCdS3m4PnSh0/wRHiSqBX7DItB/b/d
SiLiV3D8v+bo2bhH4jNxkX78dPhjHXYFMa3bCHOp26BTZJQcXJhhvhFQ21oVKGC4
Ero7l56/F6lePUmTE1IitJxPJaA2/mes6UmI1NjLyutcUVOht9MdJpR6OhT5Kyjv
WNOxfyRI0gxFeFmbFznHL/FL1DSCBpNMv1mp3uWUax+sDhvblyanXB4jQibirJBv
8HfeiUJmYjIKT3Q+Tx9ib2azGjV1YQUzYixjeXePnC0FY0jc7rOHPuXg9Sr9z4CE
EBspwqGwrfw/H0oJ4Zid8yjJpT6fS3Dpiyt1us5O1iGxiwVii1HXilzwWG+zS3xR
la5PsssHSDiR0h0lR/DuYGpzCUpg6jOVR57PcUN1ag0TQ1aX/I04ty4SD3kWspSa
VSmfHqkLdg/GGPu+jCfUO25x4jD3gqSUYxqd5hDxbUlLrdHEt9HGmhfuIMIeamVt
hr1DElUe6RNGqtBJey7Vf/T293BehjIozq6dojMc5LxNFahgX5Y=
=5uKv
-----END PGP SIGNATURE-----

--o7crjucvo4yeph43--
