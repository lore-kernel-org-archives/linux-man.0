Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA551B6D1A
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488199; cv=none; b=mYaIhiE8bLKrcWHhcQNp9yGw0a+4UHqr4LLZFXOV8hkKaGcPXQjmayAmnm0WCA05j2QA9m2F1/aDrtFW3h1fQbIZIhPR5Q9Dn0O3m4m/XolyQnM1XvRXlJKu6SFkYxW97dXGm+Q/ZlZu2wsnr8SjZ666qev1WiVDLhYeXiHg+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488199; c=relaxed/simple;
	bh=fMFUZ/0+T1dxD4LC1GGtGmlDTC4miVYxu75IT+1Tg+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COqWGQAkvI4b19S59ChWe9wt58Pif/kgmhUyqrHNUhzMEYbQWseWJkAEZwC8tlHESf5P/hVQmHyq4BFR6mygxkUPMMr4EQ2tKaMHziBKfy566k1tZuIZtgLNWzqYGwVo3CGCgVNPsfG7z6JgV38Hyr6xT4BV9x+cuvsb2ElZRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnCu11sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnCu11sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A7E1F000E9;
	Sun, 23 Aug 2026 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787488197;
	bh=Q89zPKvdKjVNZrSll/Ofi1yTYVqqQKv+egSoJAZ1whs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnCu11saxDdawBuWr+/7CgT4pAF1uw+J+4aiP+S5Rk0JqOWBQmu4tgreKS3PcEWuM
	 ufykr9VHLcFS+zVoLFjn1pIH6lD8TywqBhSxKB7xIjmnL9b1Ms78rrN2WbHPkqc/9C
	 WAuhx2/hdqlrYvj2zrrQNZvNKTjtxSsxv4Rw4cClmUVTPioewBafF1/uCAJkOKRiju
	 ZI2hBGxBj3b6Ik5hwoaQ/F0KhFvAgDENidpwGo6oHxXjmKv573gVZFef3CJ+QYrmhA
	 g6Dbbyk2l1qosdJJcZhXG0c9rLT9QPmLsBbuWRBvLI1O/XgZv+t31dOYWA5fhGBWXk
	 MCKUleddPU3OA==
Date: Sun, 23 Aug 2026 14:29:54 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf: Document
 system-wide tunables config)
Message-ID: <aorlBv8YTu4JlZcy@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dl4ctzbe6d4wrnei"
Content-Disposition: inline
In-Reply-To: <20260807021256.pwzsls7awqmbslti@illithid>


--dl4ctzbe6d4wrnei
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf: Document
 system-wide tunables config)
Message-ID: <aorlBv8YTu4JlZcy@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
MIME-Version: 1.0
In-Reply-To: <20260807021256.pwzsls7awqmbslti@illithid>

[CC -=3D DJ]

Hi Branden,

> Date: 2026-08-06 21:12:56-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-08-06T16:42:35-0400, DJ Delorie wrote:
> > Alejandro Colomar <alx@kernel.org> writes:
> > > (I haven't tested; I've written it in the mail editor directly)
> >=20
> > The placement of the .PD's is important ;-)
> >=20
> > I'll send a v5 with these, you can decide if you like them or not.
>=20
> Managing `PD` placement to achieve "compact lists" is indeed tedious.
>=20
> If you like, you guys can pilot groff 1.25.0's new `LS` and `LE` macros
> for man(7).  I expect to release 1.25.0 in the next week and a half.

Oops, I forgot about this before pushing.  I can still patch the page
to do that.  I was planning to release tomorrow, so it'd be interesting
to have one page with that.

BTW, I haven't heard of Mr. Sed for some long time.  It'd be nice to
meet him again.  ;-)

I've tried building groff from git HEAD now, and have some issues.
Bootstrap succeeds, configure succeeds, and then make(1) eventually
fails:

	$ make=20
	  GEN      doc/groff.html
	Cannot find a locale compatible with document strings translations
	doc/groff.texi:12253: warning: @image file `line-layout' (for HTML) not fo=
und, using `line-layout.png'
	doc/groff.texi:26767: warning: @image file `gnu' (for HTML) not found, usi=
ng `gnu.png'
	cp: cannot stat './doc/gnu.png': No such file or directory
	cp: cannot stat './doc/line-layout.png': No such file or directory
	make: *** [Makefile:20047: doc/groff.html] Error 1

Do you know what's wrong?


Have a lovley day!
Alex

>=20
> Unlike the `MR` macro introduction/reform, `LS` and `LE` can be adopted
> early and without any negative consequence except a GNU troff(1) warning
> in category `mac`, which is not enabled by default, but which some
> people enable for linting purposes.
>=20
> If even that is unacceptable, you can add the following anywhere after
> the `TH` macro call and before your use of `LS`.
>=20
> .\" Avoid `mac` warnings from groff < 1.25.
> .as LS \" empty
> .as LE \" empty
>=20
> Use the `as` request instead of `ds`, lest you clobber groff 1.25's
> macro definitions.
>=20
> So how do `LS` and `LE` help?  Here's groff's "NEWS" file:
>=20
> *  The an (man) package offers new macros to ease the formatting of
>    lists.  Enclose paragraphing macros between `LS` and `LE` to identify
>    them as list items.  Doing so can mark them as "compact", ease
>    management of their indentation, and supply hints to the output
>    driver to improve their rendering (as with HTML).  Lists can be
>    nested.  (Sub)sectioning macro calls, and the end of the document,
>    close all open lists.  See groff_man(7) for details, and
>    groff_man_style(7) for an example.  Thanks to Alex Colomar, Chet
>    Ramey, P=C3=A1draig Brady, and Stephen Gildea for consultation and
>    encouragement, and to Alex for selecting these macros' names.
>=20
>    Because these macros format no text, documents employing them risk no
>    damage to their content if the formatter does not support them.  A
>    man(7) document author can choose either to transition to these
>    macros, to manage list "compactness" and item indentation with
>    existing man(7) package facilities, or to employ both approaches.
>=20
> ...and here's groff_man(7).
>=20
>    List enclosure macros
> ...
>      .LS type [compactness [indentation]]
>             (since groff 1.25) Start (or open) a list.  type is one of
>             =E2=80=9Cdefinition=E2=80=9D, =E2=80=9Cenumerated=E2=80=9D, o=
r =E2=80=9Citemized=E2=80=9D.  compactness is a
>             Boolean value directing suppression of inter=E2=80=90paragraph
>             spacing between list items.  indentation specifies an
>             indentation amount for the body of each list item; it is
>             then unnecessary to specify this argument to the list item
>             macros.  Use IP with a mark argument to represent an
>             itemized or enumerated list item, and TP for a definition
>             list item.  Use IP without arguments to associate successive
>             paragraphs with an existing list item; to these, inter=E2=80=
=90
>             paragraph spacing applies even in compact lists.
>=20
>      .LE    (since groff 1.25) End (or close) the most recent open list.
>=20
> For groff 1.26, I hope to use the "type" property to select appropriate
> HTML elements to bracket paragraphs within list enclosures.
>=20
> See:
>=20
> https://savannah.gnu.org/bugs/?68335
> https://savannah.gnu.org/bugs/?68424
>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--dl4ctzbe6d4wrnei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqK57wACgkQ64mZXMKQ
wqkMeg/9FqgW+kXV3/JGijqOj+MMSmCR4wUmZkcZ+v4kKbDv9/Ybf2ZEtadjUBN1
CgcZSgfV59d33PiZOZe5Wgttlo7aMvBFqNiWoMZunChxkmeDkqe6VlhoKa1xjO5J
64ZElnb+HFXc1U/JmJInKdOPWfi3JdsTH9luobf8629LlLcaJFi/vSAdRNq7lCHZ
ZKBGpDD+MulmBk4sTw3xrxttPhjEddZ4aZi9K9RRZHFbYMH1GACHbwHRi818P0p/
R7gd7bHxWmVR7oo+OXmN4UJdXZ6F/8Yiar6zZPrYywZKUxmQcVih4JrsA2y0OTKL
Tx7lDmPla6himwsVwXYpDi0Jhbgn16CEBbEAciDbt5UccYGbSnRbh2XLUHBwYz3z
zH2bF+/a2KZWhD1qiENzfunfAmkiPbryyyq/E4hH9FBxBacxC+T7VXEOP8pUf1h8
4wmbeLLbJakNFTYq24Zgh9On6iLP0wxjrsSYLZLNksI4FB1VbZhH37nibYANMhXb
czg3OiO1IdESb+LBO5aOOtICEOJCWcWuYGMwjJU/M+0Yh2VvmIHcQt/t+qGR35gW
gGuNljSc6iEP4fUq6zyIJEOx9Atmf4mZ6Lff0UiIcryv/4A8ES3XoR9G9H390oDn
njtRsHejwY7hNn6a0Z8zCWrsZUg23ZJikq/dhFOoio0XYqYS2x0=
=sLOG
-----END PGP SIGNATURE-----

--dl4ctzbe6d4wrnei--
