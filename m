Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF8F1419A4
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420599; cv=none; b=TdnuSDIKbAMcVyGBVU92NhVPKki8TsbbrgFgHzk111buuOqklOuaqqm/rb9DmZRPjOER+QkJhC7fyBuGGQyhEhU/flI/G7JJv310xXIDiCOLRwXWA7QKZMicalldsBVVt44lXFTq+SftsL89SY3xRIYIbXNkb3l7u3i8OoP2ljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420599; c=relaxed/simple;
	bh=8c7TiLISeIxqMNsXFGuAQPofo6v46x0yETRvzVAsG/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjxkyGa1b2oKvM9DZEqg1jhxS67BVEgLcppwtd/ETsVNNqLS1ZI6AI0yAkRyE1n3CYJA28yIPYYZB1GybHG8j0jAzs0Ol9E01Z3UToBORjKyk8ujtqUzQm6+63zU5bPexkMe9pbvgavJPE4AkgoGK+Z5TZOURtvL+kVxjIAr+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9ncioLC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9ncioLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038361F000E9;
	Sat, 22 Aug 2026 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787420597;
	bh=neX4kkQkrAIRVZkAqNruoXVY282FfbqAFhEGE7WXgno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y9ncioLC4DN/rBqOgpS1vZYH1fIGgiDm/b9HSUrya+aUOXllvzokdirXzj+id7NOe
	 9fG8wE3RMRwKIEStaYUBRJsPZ0rtXbbFvxYqBI6/DFzY5DzhALL1wnofpjIal/YC+T
	 8azV07ZpcBvtx13Zl9JfcioXkL9SXoN8GfQxtrKIeLveARVBxWCEUT9xltAC9hmATh
	 qmvKXIk5kSe9Ed80TCCords/OqPa1I6pNO/Ehi17CsKxjpCuiXvYOrsjBwZjOTMn2j
	 1zr94M50kUUQ0F8QowWae2R4oNo4rlwEo8oamvmQG8iJZM0jbD6xSU8SFtadP4fPM7
	 aR5j9QhHn5HQA==
Date: Sat, 22 Aug 2026 19:43:14 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aonffTpk4ABQKkGH@devuan>
References: <aomtdXK5M19xrk0z@devuan>
 <xnecfq9jhi.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q4eld6glqkxnczju"
Content-Disposition: inline
In-Reply-To: <xnecfq9jhi.fsf@greed.delorie.com>


--q4eld6glqkxnczju
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aonffTpk4ABQKkGH@devuan>
References: <aomtdXK5M19xrk0z@devuan>
 <xnecfq9jhi.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnecfq9jhi.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-22 13:02:17-0400
> From: DJ Delorie <dj@redhat.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
> >> +.BI [ filter : pattern ]
> >> +.EE
> >> +.in
> >> +.TP
> >> +.B proc
> >> +The
> >> +.B proc
> >> +filter limits the following tunables to processes
> >> +whose name matches the pattern.
> >
> > Is this also a glob(7) pattern?  Or is it a literal name?
>=20
> No, it matches /pattern/ exactly.

Hmmm, then let's say file.  Does that sound good to you?


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--q4eld6glqkxnczju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqJ37IACgkQ64mZXMKQ
wqkX9w/9F1FkUkHo4JEYV7WvxCo1F6icXo/6qTZn48YUb1hxnN7DhbEyR750CtYU
Iud8q3cZTPSQ1CgKeDSNwrKbb5CpCD+P+bTsEyD20F4vNXPBEElI8DWC8L9OtDu7
OU+VwCebt2G92kcVF/cbG/xA85kIef6vziAvBR7mO/GGhEpHZ0YppCm3rl93GvaG
Qro9Xsgg/eJ7T0uuKeWytC7op8MdIZRrAzHSPJ3WW4GS7r8vKN63iqNowz36Hp+2
ed2pcmdd8NqkQmMbYoCpChEGwm5QqKMiT//UFyYIXX68bh6ksNJq8piFATz6QNsC
UAxNZ0OakqkaVM1k+Kq7FUoQyZknssTBcnf6tBUBj47wEdeEBTGWDQr/Iaz/o3xM
FG7Q90P4l8udHyVxjA58U1VQyw6VfY420XRi9nlSY+lfknTzaRo22l7QeB9LWEGM
sgnpvZYtb1l6uEK1LNnI49sjCWaraRppvKlF+g/i8ycAtXpKg2lAbf60NQ3/Mx6E
yLXvBk+y7sUTp5L/5dsyVLd6E0GD+iSECaOmWqXeyQhHhJO8dj9ZnZYkZkEXSHAJ
fGhVv6am83Gln+XkiZYavQUKZQH7x0wYK4RuFYCi4frS4x54MPaPKToFPr5cFGAn
CH0w/raFTiadjN1W+j9/kmTuWrXyAOT098qvu2tFum4Ed4eQs2s=
=Tnx5
-----END PGP SIGNATURE-----

--q4eld6glqkxnczju--
