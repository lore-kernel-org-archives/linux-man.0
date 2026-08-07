Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D2C3E63A8
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 22:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786142208; cv=none; b=d6xtLGo29vSwt+Bt1+CLTcV2ldiHw+tB4zmXKq6vLSJbPA8NlkX3PFE9SO69cJ638+JV1GhXQCSijArfNYLRcOcytVWhGO3Ah5JsFkpQcj+Gz4X6Suc5HJ6juQoqM8QnUeRpbouNGgVNmJDKQiWmrFZxuDAvyNCBPM+GtNBnpQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786142208; c=relaxed/simple;
	bh=uAIaCKbU6sgCETPvO7zIN7TxwKuazCLT1LFdJGKmusQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlGKA8JHNef0uIg5R5/TPlMk5XHkRxpuSwQutjT9fxvQwGtCuWG6eenXndQD4Xw1zu+M01Epd92yzfPot1Ju0u+8eudfozYvl7ueSzP0lJ9W4aOKOBrNrTjBHhi7rjTZmuGZykDgzku2yMQtnSDZuhu8OGlb0oDk2tIRh59wrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgUOxtnR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgUOxtnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C441F000E9;
	Fri,  7 Aug 2026 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786142206;
	bh=cad7lk9LAbdbrBPj47Q1fdj7cxw0b9tOkLo/Zn2n18g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kgUOxtnRaoEVUDbeq5hRGZhiEDg5hj+PzGB7DEKzByerzXFqy6dQF78rbpUFpM63H
	 MrI4hOQjYvNCvHqim5TMBjObop7l8CjSy2W0K5mL9YPiqQ+z0vaBsLMF31OwhAs2sL
	 Pw2X+zVjZoKBn2xaifHg6wuW27LkS76HiPPNHmotS745Dt5gq/l5XaLqqlxkaOshR2
	 qQ3ztm7aQ8H+XwyKvW0dk3U09hIlPHlzfITowMcG6JR8qf/l8t5V9Iu7GH1ZYG6wvY
	 yJvN44EV+ZYbnaNqZorIWGSKXW08coM+vLXqAWrn+DnTrUhDEr8X+vsU2TR01ohXsP
	 /YG6vXWkZiYtQ==
Date: Sat, 8 Aug 2026 00:36:43 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anZdHxYJZ6hLleQv@devuan>
References: <anUbLZzOLY2qM6iP@devuan>
 <xntsp6393q.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wu43cc2wvlmk4use"
Content-Disposition: inline
In-Reply-To: <xntsp6393q.fsf@greed.delorie.com>


--wu43cc2wvlmk4use
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anZdHxYJZ6hLleQv@devuan>
References: <anUbLZzOLY2qM6iP@devuan>
 <xntsp6393q.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xntsp6393q.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-06 23:25:29-0400
> From: DJ Delorie <dj@redhat.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
> > Hmmmmm, let's say you call execve(2) several times without any fork(2)s.
> > Assuming a that the program paths that you pass to execve(2) are all
> > dynamic ELF programs built with glibc, I guess for every time you call
> > execve(2), ld.so(8) will be run, and the tunables stored in ld.so.cache
> > will be used.  Is this correct?
>=20
> I think this rabbit hole is too deep for this part of the man page.  We
> need a short sentence that's obvious to the reader, not a diatribe on
> how the linux kernel works.
>=20
> I'm happy with something like "The resulting data is read when the
> program starts." regardless of how ambiguous or technically incorrect it
> might be ;-)

I'm not happy with starts, but if 's/starts/is executed/', or
alternatively 's/starts/& execution/', I'm happy.

'starts execution' is precisely the wording that execve(2) uses to
describe the moment when ld.so(8) is called.

     If the executable is an a.out  dynamically  linked  binary
     executable  containing shared=E2=80=90library stubs, the Linux dy=E2=
=80=90
     namic linker ld.so(8) is called at the start of  execution
     to  bring  needed  shared objects into memory and link the
     executable with them.

Does this sound good to you?


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--wu43cc2wvlmk4use
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp2XfQACgkQ64mZXMKQ
wqlhJxAAtXQx4hqoon2v577gu15+Cbo1bdwTrffJa5+MipTKlNYwm4RxkckGj8C6
xcH8st4iWXi493ecNRv4DJM5RIw6EI4F7zPuLURACCWH2saM70jV2Q4Ydiljt5wr
+ihCcOsF018HzRXrtgELhofU7ZprVWp0ezhbZbTn0yYwmQhYAoB7p9i4wQcHtWj5
niW4uLRKhhWz/jq4LiMf6TtXJQL40owUH/4QKEYyzw179s667py5pFcn1IMF9EjB
l3dhBqP26iAFhbjPyy0hlYXutVRQrz+lRsXUUF7N2yJo/uBovA+deExdR8YhPH2g
cHMImSqlN1ennTgfGNWvoTzuZCYHCJ1kqzmMRjF0MFW6IXBDTv4HFaTTnZqgMxKB
4eLR5ScyGm4Cm4ZZRmhs5kwInK4MfM+DsbkJW75srGEqBB1NaY5Jq+B7rjANaV6E
oDOUVpC5yHS3rQhxSutjBDjdPHsCZIaYrSY13ru1JQUzKAaozMnbPwpc9Uq8vrWw
PnXSgSPmDmoT9l/yC4nXmCSXPKB9RGN8XepOSeANc3elgDoA7lGeSz74UVvqqgRx
7Rp7Vp/I+E2zs1SqOqyq9/VoAT/Q7MWAtjf2IqmQWUAkd0SLheVkbSj7SPDTqLLf
mWhQj4kLYuWh2VLGhSo8g2ruf62gRjYyka32C7H2qqh+kS7x78k=
=vb0b
-----END PGP SIGNATURE-----

--wu43cc2wvlmk4use--
