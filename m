Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6CD12CDA5
	for <linux-man@vger.kernel.org>; Sun, 30 Aug 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095832; cv=none; b=DCp6LLAHJwCRrz1XL9FFpRlOEFptRFGLUYXqZwqlJZnuyTxtUTvtAOprqg8l5QGeG7U39LsccgHUNI2mbYKEdB3//Iz1QuoSxBqzTvqRvf8spZ0XZ299U459KMR/c7mSjc9IIf6Nx/yfy2vVDE5q5xTVjNr256CDhoQL6nqGXR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095832; c=relaxed/simple;
	bh=oN+LooPkC8LQqtaoFux2ONrg+B/a/ABlePwojN2f0jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMiuJMATBEU4vK95Uci2JnxQNj9F0b6W58Hj76s70Vu4LaBJDuL9KUkzeD+LNOMTfrQGIQ6L/VLrC2364/2U4dbznJ28U+esqhhD4meOWlnvm+/KCtvjWdXwcGkafNdNI2Esl0fUpE34F9X+nqU3/Xyo/McTHN99zELaD8X93jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCeayvVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCeayvVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA3E1F000E9;
	Sun, 30 Aug 2026 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788095831;
	bh=OQQaxZsTqKpun8YuYlUQtNCOXyhG9Uz38f7pJlgMgzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KCeayvVLJLtjk2k34VtwrntZXbBNAYRYNq7urTUc8dqpkL9iNbNKMawUykNyBTZxw
	 OXHuu9gcj2Q4bkB7k1eePbnr+nkATikITaqiGQFxY03v6OiyBEEf5U0WAJuWLQLBEJ
	 w72rr0lyNmowqEZGV+kv//B+xNet4oPxhJiQ0JSkndk0vfiszINx6RalntAAn3OOu6
	 1J3BwMK0gh7jWlYlMWBhhmzyLKsZl2NlPlDSXtgH75pNwA44nlLDvrh5lTE7xpEJCq
	 XDKcPCO+seldWZ/FfdgM3UkgPSvj75W8wv0RGeO0h/+4FLK69ir1Kjwfp5gQ3PkgXW
	 6JYMHnRudpkcQ==
Date: Sun, 30 Aug 2026 15:17:07 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: linux-man@vger.kernel.org
Subject: Re: configure separate from make or not
Message-ID: <apQq4u6L8i3Ax_DA@devuan>
References: <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKou1PHGi1N5gGO@isnote.usta.de>
 <apLV749V4YvfqCOZ@devuan>
 <apL7VAruk1bIOr1M@isnote.usta.de>
 <apMytOcLd3pecFFc@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t65wwtfog25phy5d"
Content-Disposition: inline
In-Reply-To: <apMytOcLd3pecFFc@devuan>


--t65wwtfog25phy5d
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: linux-man@vger.kernel.org
Subject: Re: configure separate from make or not
Message-ID: <apQq4u6L8i3Ax_DA@devuan>
References: <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKou1PHGi1N5gGO@isnote.usta.de>
 <apLV749V4YvfqCOZ@devuan>
 <apL7VAruk1bIOr1M@isnote.usta.de>
 <apMytOcLd3pecFFc@devuan>
MIME-Version: 1.0
In-Reply-To: <apMytOcLd3pecFFc@devuan>

Hi Ingo,

> Date: 2026-08-29 22:49:08+0200
> From: Alejandro Colomar <alx@kernel.org>
>
[...]
>
> The main thing I run code for in the makefiles is for listing all the
> source files.  Here's an example:
>=20
> 	$ grepc -xmk -tv -n MANPAGES share/mk/
> 	share/mk/src/man.mk:20:MANPAGES ::=3D $(shell $(FIND) $(MANDIR)/* -type =
f \
> 			| $(GREP) -E '$(MANEXT)' \
> 			| $(SORTMAN) \
> 			| $(SED) 's,:,\\:,g')
>=20
> I know you prefer to list them manually, but I like this little bit
> of magic (it's not that magic, since it's written in the code, but
> admittedly, if you're not used to this build system, it's hard to
> expect it).

BTW, the git repository is tracking 3387 files (at the moment, and
growing), and thus the distribution tarball contains that many files.
Given this amount of files, I find it more maintainable using scripts
instead of hard-coded lists.  I could have a hard-coded list, and
regularly diff it with the output of find(1), but I prefer using find(1)
directly in the makefiles.  Also, I wouldn't want to have 80k of
Makefile text that is the output of a command:

	$ git ls-files | wc -c
	80511

We already have quite heavy makefiles, at around 100k, and that would
duplicate their size.

[...]
> The thing is, we have 1.5k non-link pages, and we use absolute paths
> in most variables.  Thus, each variable can hold around 100kB for the
> paths:
>=20
> 	$ find man/ -type f | xargs grep -l '^\.TH' | xargs realpath | wc -c
> 	106833
>=20
> 'make help-list-targets' lists 119 .PHONY targets, of which most require
> at least one variable for holding the actual file targets.  A simple
> multiplication and rounding says there's 100x100k =3D 10M in these path
> variables.  Then 25 MB sounds not far from that.
>=20
> I think I might be able to optimize this down by using relative paths.
> I might be able to optimize this a bit further by using suffix rules
> as much as possible, instead of listing all targets in the rules again.
> But there's a hard floor.  It should be hard to go much below current
> size, at least without reducing targets.

Self-correction: we're not using absolute paths; they're relative.
It seems I had already implemented this optimization, and I didn't
remember.  Anyway, relative paths don't change much.  The best gain
would come from using suffix rules, which would save a few variables
entirely.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--t65wwtfog25phy5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqULU0ACgkQ64mZXMKQ
wqlCQxAAqYjAKB3MrrBPPRgKLWd+iFMOLZbsXmKRcWgeTi0EgSYzqBR0PWBHI9G4
WDE+pyha/bjCYLBCWtM7G6dTiSpTyeZNuTAAnm81Ty+n4dS4bbpQpuhJHjk8ny9F
LNK/ZbXFlZG1qiNu7bfHkaSfRkBMirmg+KIfwDJ1QUHhwAPKNMoTMHOGv3qFT6Uv
m8j4nFpEQJw/GNbElahs5QDvgBkAnBXrEg6Ru4gMT1IRra9BRjPKsM67ecPTXsCv
eVFuSdnWscWJFIxH7hsz8f6LBpNnXNwXaHt7MzBGTr/uFMtR2oTLMR76Gq9YVegJ
iTgsUOS1inmDTQyAx1k51IBdLB9bYLK7nGbCcc7TvUvC93jCS/z7fpzPqqUaudp+
oWSYVRKX4XbjuMLUPdDa4tTVt2rrA5ZDnLV0TcGZ1obLU0FOR6ZgP3aOxclZhZ9f
QxM/8oUUJ8WablRVO3WfuOZXHRafzAAjAl/jqYo5EgaiIZZALnN1ZdBdrpudOkD7
N3CTDXRT5b9Tu2r9OQ/lFIv9wSuneF4WuahRd/VZZShP55kGYWUH733kPKLW8Lmz
FFGErenpLVRCEvbJpkt1rQOV1rTGGjtxhqTrEpTrWRFVPKAe3wu3O9rCkNg2besD
hWRjwKzYG4vxnZ1xBNaFVPKCo0B6G18Vqv0nmbcrAyMtFJO+moA=
=GLcQ
-----END PGP SIGNATURE-----

--t65wwtfog25phy5d--
