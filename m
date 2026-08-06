Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822522E5429
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043672; cv=none; b=ZOgimPFYL0FLqHeKIdMmNKsd8FhAPv0Yf+7rwhkP5QpknjwrYJsHtbYGzd+E3jLkBbw5EVF9xdf+MCys6auvW3QumU4w1rA27VZ58dfM89TIfY4Os3YGZ4pDrYRnQ3+2u9XrGMuDEQdbfrcXK+m0uCNg8xaTgQGG2CP5dqKQDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043672; c=relaxed/simple;
	bh=+AvFvjJY4bn7GDyAWDoLtwvyZv+wPQfc/lWEwhS++6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3gDlcX0ShaNvpMNRwVsIjV8ThLGpN5qIM8/xLevpP4btT9gD/1OxwTO/kudP2URZW/Iw9J5/4tL2YHx4osfN+slEQGw+4YQUi8Bgrzq5ZOOncwdXtZAqJdlcTmA22JUQ+8tP0dLbUhomFdpgUhh7pLVdTE1ki+SAmvodklQde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKcFRuoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKcFRuoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D30D1F000E9;
	Thu,  6 Aug 2026 19:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786043671;
	bh=A6Ab9+VfxRLW6OZ1xlK/O/otLwgs2QpEQuGHubyXJ0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKcFRuoI45s18h4EDAgXzNsTW6UTqPp13k9+O2H77djbj9FDVr4Hn4Re3fnXbLF5v
	 j8i7UrselNXi3iAS2QQifptx0SaEbEET3+bLcBhtdejIcWlHCLruGQ4Wo+kYG6GPmY
	 un6Lee8RRlRvwwc8l2vvIXaYhBop8++7mj13HxhL1ZNsnwaIPmK3VYdhkewOOYe7/I
	 nxf7rGjUyAFHCy+i5z/NtoxvvCU6D1OZdJrm3ULKbnbMRfsHk8KssaNAyKh2bMM6E0
	 xf/H+xe6OiNft2YU8VM7k2z3vhxAiHZh2bmm0GVGextiLiS78MASVN1AC1fPN08ciI
	 0LNNczReOBrpw==
Date: Thu, 6 Aug 2026 21:14:28 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anTZdJDceYtD7Rfj@devuan>
References: <anSaCsgYGOPtoDJ8@devuan>
 <xn8q6j461w.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ayvmz7jstlaqzx3k"
Content-Disposition: inline
In-Reply-To: <xn8q6j461w.fsf@greed.delorie.com>


--ayvmz7jstlaqzx3k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anTZdJDceYtD7Rfj@devuan>
References: <anSaCsgYGOPtoDJ8@devuan>
 <xn8q6j461w.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xn8q6j461w.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-06 11:33:47-0400
> From: DJ Delorie <dj@redhat.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
> > A few minor comments below.
>=20
> I'll defer a v5 until we finish discussing...

Good.  :)

> >> +The file may also contain
> >> +.IR filters ,
> >> +which limit the tunables following it,
> >> +up to the end of the file
> >> +(or end of the included file,
> >> +or start of a new included file)
> >
> > I'd append within the parentheses:
> > 	, whichever comes first
>=20
> "first"?  Or "next"?
>=20
> >> +or a line with only
> >> +.B []
> >> +on it.
> >
> > So, this is like an end-all-filters directive, right?
> >
> > I wonder something: Does a filter end previous filters, or do they
> > compound until a [] ends them all?
>=20
> There is only ever one filter active at a time.  It stops being the
> active filter when another filter is encountered, or the current file
> ends, or an include directive.  An empty filter spec (i.e. "[]") is a "no
> filters" filter.  It acts as a "new filter" for the purpose of ending
> the previous filter, but does not specify a new filter, so no new filter
> is active after that.
>=20
> If you can get that into five words or less, you win ;-)

Hmmmm, let's see.  I couldn't do it in five words, but how about this
schematic approach?

	The file may also contain
	.IR filters ,
	which limit the tunables following it,
	The effects of a filter are terminated by
	any of the following:
	.IP \[bu] 3
	The end of the file.
	.IP \[bu]
	The end of an included file.
	.IP \[bu]
	An
	.B include
	directive.
	.IP \[bu]
	A new (possibly empty) filter.

>=20
> >> +The syntax is:
> >> +.P
> >> +.in +4n
> >> +.EX
> >> +.RI [ filter : pattern ]
> >
> > Since '[', ':', and ']' are literal, let's put them in bold.  Thus, BI.
>=20
> Done.

Since a filter can be empty, we should document that.  If we document
that 'filter:pattern' is optional, it'd be [[filter:pattern]] (with the
appropriate formatting differences: the inner '[' wouldn't be bold).
However, that's likely to be confusing, so let's document that
separately:

	A filter can also be empty:
	.BR [] .
	Such a filter has no effects.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--ayvmz7jstlaqzx3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp03Q0ACgkQ64mZXMKQ
wqn7lhAAoe4wdPOvvNJyx4gnFtaC0OLW3bYORlq/LfjrT/JSFDUUu1FazfM8A+UK
UjpPXXe/oYxDHyhkjVcozoxklygb6TKuxwK0XWz/rsiAsCne/Xo4+PyW3ANnZtvL
FHvRzSHVyJUNOQhYXiYdv2tzwbnFALOhaCQF0U5LcmG+wYaXkcyUCg/80XvXK8Oa
3KvC187xDYL6yTNMokfP1XmHVHHxhMsP+WgPJivA7Rlgk7UIiJNclIESoUv1oS8B
PDgmuMyCPK/SULPbLF7ZSs6QQotZOKYxkFtqDkShaLqX9UgK3zvzsWs6wpu9o2NL
VLNZULCd/T7AitAeAvJID8pbKE48YDEpzdSpHUrPiP8ErKUXq0ZxABnB0PWIT3Wy
Z+PFfrpze0ETxD/P1EINBqZY8c8o1v0HinoABjCt03b7DXRuz/oLFLUikartNNCL
yL9TqjjvTnVuq5BVeO5rrQN32otS+JochiPQ1EPvmu9fsPM4S2KErmhy2B8m5GUk
XpNBxY1ZZaxyWRNGNvpR9SEFB3ikokestXTmE5F+tUyjG8c+iMfm69E7gJTYK4/8
8Y9jw7o+9S8J0fBI3mSHFM3G55Bx5DmbTE0GgkWgVP7BejdLQ6QcCEtrEyniD0mF
5G9+M5hqpqUg5cCEx+V3IW7ZGoA5oQZBOipJM5qY/Cj8dUkea1c=
=lnk8
-----END PGP SIGNATURE-----

--ayvmz7jstlaqzx3k--
