Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC0644E04C
	for <linux-man@vger.kernel.org>; Tue, 11 Aug 2026 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464674; cv=none; b=R6idbcy2cEuwPyMJu4U9AsPdxY1sCkvaN7PC0yFCMpDjMxZ3oYGLf874g17Wvy+FpEsiYE75tSs0AKiwS8tEz5vhH4E0Wd/baf4Zs1/muweJqwUdOoYmAWQPREAMjNs0Zv7uWGJ6SPSYEnZ4itIGVXAh61ajbaoutrcqmxCgEyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464674; c=relaxed/simple;
	bh=UruGVknhFGDF+LUNV79B2uzYrinw6ou/OQKV5GwHBqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbplvbHDfJoqN4+ateZe9r+3pz6dNFiO1tP8YLQjraPa3AObby8QUSJOAUBJpy1qG98HYFe5/+vnlyF03eF9z2UWDu64cKzYo9cu1FBTYVDDn1EqlqVE1GWy1KwlPJ2UHpl5ih5NeX9niJehEiP6MgDtZU1RbOEOp8ToztYT3sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9pwW1Mn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9pwW1Mn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CAD1F00A3A;
	Tue, 11 Aug 2026 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786464672;
	bh=pnTms7APsUzCoIQDw2tCQcXmuxRoH+as5ol+++O5D7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9pwW1MnBFvzS8FVBJpRTkE7gpL4rtKM3JPjd7W3cFAZL76z0g3U7TRM/J9vob+X4
	 /bS85DzdVUaEG1y1Y5OPeXIOAjnKMV8rmPABqPaVTQ8zjVD+O6ijjrJT+PsUkQU2NE
	 RLuC+t3uEYek/0J9phcqUqdyUe7UvpI6xPDh3zFiWzo9ayGk9c+KKFEDWD5AHv5Xf+
	 oI3x9+JdmFuZcfpL/seWhCbJGKyYEkhWolT9fGEnprUm5ZRwkPRPuwli/8JXmaLo6T
	 uwW8a8HEoPHTi//SGds5AcZJJ0lQzrylbtRMgfmXKPLp6oc01LiYlw23ufrnGiEZFk
	 s0Jg6B/HDmf/Q==
Date: Tue, 11 Aug 2026 18:11:05 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?RGFuacOrbCBIw7ZyY2huZXI=?= <dbjh@gmx.net>
Cc: linux-man@vger.kernel.org, victorm007@yahoo.com, 
	Thomas Piekarski <t.piekarski@deloquencia.de>
Subject: Re: Suggestions for an improvement to the man page "iopl - change
 I/O privilege level".
Message-ID: <antI1H44BYIktmLa@debian>
References: <trinity-ad00fce6-96e1-4b4f-8abc-98e945e01f5f-1786459267306@trinity-msg-rest-gmx-gmx-live-d7f776569-7648m>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2gepcieewdetjaai"
Content-Disposition: inline
In-Reply-To: <trinity-ad00fce6-96e1-4b4f-8abc-98e945e01f5f-1786459267306@trinity-msg-rest-gmx-gmx-live-d7f776569-7648m>


--2gepcieewdetjaai
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?RGFuacOrbCBIw7ZyY2huZXI=?= <dbjh@gmx.net>
Cc: linux-man@vger.kernel.org, victorm007@yahoo.com, 
	Thomas Piekarski <t.piekarski@deloquencia.de>
Subject: Re: Suggestions for an improvement to the man page "iopl - change
 I/O privilege level".
Message-ID: <antI1H44BYIktmLa@debian>
References: <trinity-ad00fce6-96e1-4b4f-8abc-98e945e01f5f-1786459267306@trinity-msg-rest-gmx-gmx-live-d7f776569-7648m>
MIME-Version: 1.0
In-Reply-To: <trinity-ad00fce6-96e1-4b4f-8abc-98e945e01f5f-1786459267306@trinity-msg-rest-gmx-gmx-live-d7f776569-7648m>

Hi Dani=C3=ABl,

> Date: 2026-08-11 14:41:07+0000
> From: Dani=C3=ABl H=C3=B6rchner <dbjh@gmx.net>
>

The mailing list doesn't accept HTML mail.  Would you mind resending in
plain text?

Also, please CC the people who were involved in the current text, as
they might be interested in discussing the proposed improvements.

I've added them in CC in this mail.

	Cc: <victorm007@yahoo.com>
	Cc: Thomas Piekarski <t.piekarski@deloquencia.de>


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--2gepcieewdetjaai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp7SZkACgkQ64mZXMKQ
wqnF1A//ex9c46ILFnuL6qXfOgtdPfLo0sI3lCWwKzUaNQz4P3YpW6j9Dhla2mPT
0JxauT0ylzCHs6aE5QPHkFgNxs6O04qv53mfl8UW7pNw1rwNsgPYwgKf2vmMz6lc
SpFf6gfU7orUKPkzFzIg9wRiKl/dxkUC2jKyzNrfYsVT0kVzAjp917NitimFKwFy
BZ+4vGiGp3IMSUuddgZuZUPBA/rHexjWw0jj+ePXozdwF216te2RwA3OD1FQebTB
bMKc5BjH84xNRihe002cOET7e5ZT4YSSxtRC/YeeFdqDluNjRf88uJscSDiDIvJL
tEZLJ4PjkIf4kEhmGu5MZ4yceKDIpIOgVIBr1A/jNS5cobs0XRZEu9Nu/Gqx5nOM
sThlNlTyMQmv9NbzCRn4fmCoJjMU1i1L2KHF0QlHFn3KnBZsfVc1hd1wIT1gAFjQ
240yyuxeMUjwWxl9ocKmtQP4DKEmiBejxf8otY5u4xwfFcX75rqBwTsdXdYtfCPx
K/1oV8odjHDIJDSQsGfAtVgNUVy/009siZw1VqAbcGAc+Stlp3stAwhKDR9FSYHC
XbMk8OGujJQFy+xpw9/jABAOCO9TVUAFh0/J5fe3iAQeNHYRGzNyd7N9HnB72bXE
SX1uslFLoafjh7oZhzBVseDLKzqE0PtqFxjivyZLy0GZQQjkqe8=
=boAd
-----END PGP SIGNATURE-----

--2gepcieewdetjaai--
