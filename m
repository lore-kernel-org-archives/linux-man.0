Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034D34DB6D
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 20:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785616555; cv=none; b=rA+pJUz9XBCEJ95kYOc85KTRpyebapqz+Rhti2NjRUdldKt/LdnK1w1cPvBCPmC9ODJhnrmIX7jDP1FVOnxjWZbNkTaWlSpOYNwcN48LYsoAY9L5Qrvgw5SAAMeuP8e9zjgKCKipF2s/aEFq8jDeoYuvEbnNM7680K8xP09mEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785616555; c=relaxed/simple;
	bh=QkkdrfGZ98JaS/HnoItjUJwrwl5OlNZTAADceA21iks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/JegnN4or9EpUy1uy4JYLko+7IEcYoZmxpTfNs+QiPB1ciWOPufUtE9+tTha0HA1uUc3x5+ykSA4j3TZr71jzSfOHQkZNsb60aCEwb9ttxpP9jsoEIllCX0N67P9GbRKVMcgyq8dIVgVvQe0J4up1uXITIMoNYvDYFpE8ie8uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=is22gSC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="is22gSC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF51B1F00AC4;
	Sat,  1 Aug 2026 20:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785616553;
	bh=vguQyFzIjW8laeYvTP9xxetFsv33XaWym7JUYD+nlho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=is22gSC/jIg0so0dbNB4uIGBFntDM96RZTLL/MPKjRO3R3RXvNNY1xfcTu216Vmdi
	 CMnXZ1kqIs+EG4CGwzURWsl+DHUe5eyYHwbSNngz3gnvzedR5Ja7MaQ6a+FcrmzTcF
	 GnjjZOT8SvK8G/kHKdSlyQx8BJLwzt2usin16N9ctXiq+C2/6h3IHeikqhceaJ+dUL
	 Kr7AmiW3lUniv+A+hV0FA6vJmTw4ghhI2SGHO4nd8NmwX/ewwy5O5MYTHTYDLD+dK6
	 elVi9By02GPu2oPk9wn0+PBrlSU4mSZFT6U7fID0JVI1twPkbi4HDtFbuj+AjLWlXN
	 JAuKw4XwJMVyQ==
Date: Sat, 1 Aug 2026 22:35:48 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Martin Sebor <msebor@redhat.com>
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am5TKqAZmizNCAvG@devuan>
References: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
 <am0vIUDzNzTnXMcI@devuan>
 <CAKH6PiWTmDsuFOOLGqMjEBY7+GafEmnfwoy-8-ZDxoJ-14JPkA@mail.gmail.com>
 <20260801195435.lmuo2gstytdqyt5f@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4ebesmvxecmp4sg"
Content-Disposition: inline
In-Reply-To: <20260801195435.lmuo2gstytdqyt5f@illithid>


--h4ebesmvxecmp4sg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Martin Sebor <msebor@redhat.com>
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am5TKqAZmizNCAvG@devuan>
References: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
 <am0vIUDzNzTnXMcI@devuan>
 <CAKH6PiWTmDsuFOOLGqMjEBY7+GafEmnfwoy-8-ZDxoJ-14JPkA@mail.gmail.com>
 <20260801195435.lmuo2gstytdqyt5f@illithid>
MIME-Version: 1.0
In-Reply-To: <20260801195435.lmuo2gstytdqyt5f@illithid>

Hi Branden, Doug,

> Date: 2026-08-01 14:54:35-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Doug,
>=20
> At 2026-08-01T08:39:08-0400, Douglas McIlroy wrote:
> > Branden wrote
> > > I'm sure I don't need to bring to your attention what a mine field
> > > string/`char` sequence/memory buffer handling has been in C since
> > > the language's inception.
> >=20
> > Yes, this is a property of the language, not a peculiar deficiency of
> > the <string.h> functions.

Actually, I'm going to disagree on the first principle: the language is
not flawed, and <string.h> functions aren't particularly bad either.

The fact that they can be used safely after you understand the tools
means that the tools are good.  It's the teaching that has been bad.

Just like with every sharp tool, you need to first understand the tool.

After 5 years of researching about <string.h> functions, I've proved
with example that one can rewrite vast amounts of string code without
regressions every two lines of code.  This can only mean that <string.h>
is not inherently dangerous, since I'm not especially free from the
human-mistake factor (actually, I feel I'm more prone to them than the
average programmer).

<string.h> lacks a few functions and macros that make life much simpler,
such as Linux's strscpy(9), gnulib's streq(3), and a few others.

That lack, I attribute it to the fact that programmers have been burnt
so many times on bad design that they have grown an aversion to adding
them.  The fiasco of Annex K has probably helped.

> I mostly agree.  I think it's possible that C's string interfaces
> managed to innovate some deficiencies of their own on top of those
> proferred by the underlying the language definition.  8-O
>=20
> > As I see it, patching up perceived deficiencies of the functions adds
> > complexity to the language definition and to the task of code-reading,

I'm currently just proposing a documentation change (there's another
proposal I'm working on in parallel, which actually affects the
functions, but that's not what we're discussing now).  The functions are
virtually moved to a different header file, but nothing else changes.

That header file division will help with the teaching problem, which is
the problem that has affected <string.h> so badly for so long.

> That's true.  But it is also true that without clear guidance from the
> standard's specification of the library, and with the flagship text on
> the language having gone unrevised since 1988, those perceived
> deficiencies cause ad hoc innovations to sprout like mushrooms after a
> thunderstorm.  Some of those innovations, like OpenBSD's strlcat and
> strlcpy (1998), claw their way into acceptance.

And interestingly, OpenBSD's strlcpy/cat(3) suffer from DoS, which
Linux's strscpy(9) is free of.

> Others don't, and
> remain bespoke features of a particular code project--often with little
> commentary or accompanying documentation to illuminate them.

Indeed.

> The result?  Reading _any_ code that involves string/`char` sequence/
> memory buffer handling has a substantial complexity tax stuck onto it.

And indeed.

> Culturally, it used to be that any inadequacies of the C language or its
> standard library were hand-waved away because a coder of sufficient
> ability could bull through any challenge with cleverness.  Our community
> has been purged of that preening vanity ten thousand CVEs at a time.

And indeed.

> I think one of the reasons Alex is getting pushback is that everybody
> knows this is a horrible can of worms

I'd say they think they know.  I believe it's not a can of worms, if you
are strict about keeping it simple.

> --Joseph referred to "relitigation"

And because the C Committee has the bad habit of considering past
decisions of the committee as godspell, no matter how bad they prove to
be.  I've been repeatedly accused of relitigating realloc(p,0),
<string.h>, and many more bad decisions of ISO C.

One good news is that Microsoft is currently testing my proposed changes
to fix realloc(p,0), and when their testing is done, all the FUD that
we've been hearing that it can't be changed now because "it would break
the world" will just vanish.

> --and that in turn is because seasoned C practitioners have a shared
> dread that instead of a brilliant solution existing somewhere in library
> design space, we face only struggles over who the taxing authorities
> shall be.  And everybody hates the tax man.
>=20
> > with little real benefit.
>=20
> If there is no Pareto improvement available in any dimension, but just
> reshuffling of code-reading tax authorities, then you're right.
>=20
> I can, at best, hope the situation is not that bad.

I am certain that the solution exists.

> If it is, what is to be done?


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--h4ebesmvxecmp4sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuWJ0ACgkQ64mZXMKQ
wqk3kQ/+NPZSikRK0xgLgKOn2UiBzCTNAbGV2QugdPzNkUlJUmQEnz9LSRjWOaSe
E6wC2DiLALujXqodsIRq9yWsdiZyV/xyozPP7+7fFHR6CacYO7AsUGU0Gpy/0LOo
LY2gbe5e4GLEVc+d5X7D7BkBWprrZVo4b8VB4n+B7Bb/cMSZFJ8aQPpnh9P0vnK0
Yl38H5sI0eY44SQSkpeU3av/TF60vomIl8aBjWQlETpXlZNnoOHZV3NBad9Rgkfz
C4BKjVpgubalszHp4G9qt6zXQ7L6VAK3xNDRKPNGG8qcZmz9LWaHmxfnHRx6H4gt
vfJb2RSaXe8TYEAJTWx92KUtkaoLuAII87NAMSdAXvs2wh7dWiLUV/JMXje7MW92
18mW7WpwVhEqDbg+voYXIZWqGCrD/CqI38zYWwDI5IVRk9VitfgtWsDY3ZjwfMMc
SEcUckl6ojrl+zXdb1E/fFVinplbpym7frLMohVDTzaGsxSEytgkyuBBTFWwdf+3
ts6IdvkoPHwIR71iQKoLGoGLLJDbEk9I2egbgY5lFPo/uGUUtfqGCNthAa8qBvCO
UeEZuVlSVf9IRPCD3jpR8qsJnz8x4XVTEF6r+S/rAmCGJzzmzn1fpawb37DjI3z3
8jWp57/w4OLj524Y3Y1e1q2tKsbZOpqgJt4FS/wdDHS0vBlDPGk=
=9UuJ
-----END PGP SIGNATURE-----

--h4ebesmvxecmp4sg--
