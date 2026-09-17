Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4074E36E5
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673695; cv=none; b=XkFE9bsI+WwyZ9xFz52CcN0pMfE3AAKqWrblkSQkIiRKGMG5G2KjFKcPlO05CLaIXOM9JySLAoffv8hmhNMvGJpXRJufIDj901QjILayDOmg2+2u6E87tv/veijGLssN2/rL760kCc5zB6TJXDV7F2CFYv4updAqu0W5junrHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673695; c=relaxed/simple;
	bh=KB1M9WTGJEcaOktkB7ayC3kM2VOAlY8xGL3EfcDDBMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixVwGcTaMJRO1e2hhCy3+WWoKuDWJq/Rzb/dQue9NUxWWCVxBToiTYLDLZMz9ndTMpcIsdhFwKQeGpV2a4+BMYvd7YUMkkpsobFeGlvO/n17vMhWe2JM1sIWZM/OgYdlW9h6/EpFEbjxRs+AJ0/INwG1tZCM709vtNGlH00hsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOEvEMLO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOEvEMLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C536F1F00A1A;
	Thu, 17 Sep 2026 19:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789673687;
	bh=WCnh+ZmVGpyT6SYCrt4Ay+Z9OuzX31U0BUiTfB6sVN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fOEvEMLO7AosAoA/oX7Xunzpb4eTBBTlxqeP3MK21oIp+L+2xou/kSGvbwKYF3Znd
	 pTQlAmxwMKbmHJh7DhKiodJWqTXgBye2sQmXx7RM8iQv/bWN28BMJrx9AkbtdRUvtp
	 Z0Ad4bHkv8yNadC31yhfT0MRcRXM2Jx+wkLPTAHUMVEfa8M3QztNJJHWU4k5O/VYoV
	 3b6TuHqbqO1uFkNuxJb76M5YLx2SOrDHZJBeVzkP9UrgAUME9pCJzTCrK0IWjAmcun
	 bQDM5/HgBqHkMoTfOkNID0ud7IMwv5OnMcf/LSiGpiMVz896PitBbbXMISOmHP8cF+
	 iY1vX1vtFPXvg==
Date: Thu, 17 Sep 2026 21:34:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqw_5T8A06FPdRJ6@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
 <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan>
 <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>
 <aqvHRZ7DfbdG5XBt@devuan>
 <DLHTUAUL26OP.JKIAQT055DTD@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ioporkhzmkrbopqc"
Content-Disposition: inline
In-Reply-To: <DLHTUAUL26OP.JKIAQT055DTD@memeware.net>


--ioporkhzmkrbopqc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqw_5T8A06FPdRJ6@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
 <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan>
 <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>
 <aqvHRZ7DfbdG5XBt@devuan>
 <DLHTUAUL26OP.JKIAQT055DTD@memeware.net>
MIME-Version: 1.0
In-Reply-To: <DLHTUAUL26OP.JKIAQT055DTD@memeware.net>

Hi astian,

> Date: 2026-09-17 19:09:41+0000
> From: astian <astian@memeware.net>
>
[...]
> > I don't know how you read .md or .rst, but I read them in the terminal,
> > usually with less(1), which doesn't reflow them.
>=20
> But you read the rendered manpage, the output of running groff (and co.)
> on the manpage source, right?  If you were to read manpage sources with
> less in the terminal there wouldn't be reflowing either, naturally.
>=20
> The point I was making is that newlines in groff_man pages did not seem
> to be more semantic than those in adoc/md/rst/whatever.  Upon rendering,
> paragraph lines are reflowed.  After Robinson's explanation I can see 1
> bit of meaning to them (sentence delimiters).

Yeah, if we used it exclusively as source for formatted manual pages
--just like man(7) is used now--, then I'd be fine reading the formatted
pages.

However, as you said in another email, that would delete the unique
advantage of .md/.rst, and the source would read as bad as man(7) source
(IMO, worse, because the formatting macros would be replaced by weird
 pubctuation, which is more difficult to control --as we've seen in a
 recent mail too--).

I believe kernel maintainers would run away fro .rst if they used
semantic newlines and thus had to format them to read them nicely.

> > Is there any program for reading these in the terminal reflowed?
>=20
> I guess there are although I don't personally use one (of course, that's
> the point of these "light markup" formats: they mostly look like plain
> text so you don't much need a renderer).  For example, there are plenty
> of tools to convert these formats to HTML which can then be viewed in a
> terminal browser.  Or one could use pandoc to convert them to *roff
> and... haha ;).

Yeah, it ain't going to work.  Luckily, we've got man(7).  :-)


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--ioporkhzmkrbopqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqsQM4ACgkQ64mZXMKQ
wqncjg//UzaY4ZE8f04/sRpa0rMvJSSENr8+S/urILos1YC1jxGj0ZsCgiwww8B9
VwfClbH/VoU+g4uLh2c6/xyzULEZUDF3YXgc6tQjuwVUWICU8qr4Cd8zQ6R0OsUw
7cCeiy55+QwZ101//XjpPa9a1hzH4LIgRfZWxoyDktV+E+R0cF6KuubGC8TIWd7Q
IAV8F0noCtjOZqIAk17kE4mqJkmvLsSxmxI/VXHHAsHipswpCVjHfOc35cN/XZts
xp/9w2OTRFpZwaHQGeffdiJAjrUWtsoa/qrt923wWnrbaIl6muzQkoekUz/fL5g+
BVGLsCWyiw1rIGKcMZrqbVoxv4uVBh5e1xDdxYpjRSTjK3tChzKcR71IjadvgzhG
8VZcCx3vhBvZbe3qAGwzklK7S0/egG9WXJk5kihzOddrMno2tX/bwCI6q+9qxLfX
B0uw45lsK7ja3FU1Owi+MPZPfTdeVAuCzlhTYJkDhdLk3hx8YS7Yg9JrshQ1Jpre
dIjyMFh14HDYPszf+UdVGxAErHVQsCZYcuZLYBnZNI6rMiUVw6CBVjxWFJwp1qVD
LsT+srnAWpg9/wqk3Pt5k/W6ULpnrqjWsKNVo4po1PHfjkFN461EdPg8MrYJGz5d
FOYPM0MzSA7TyvTT4WZ4cYfjZm+PM5OMgOoh/4fxshByIXDexpk=
=M+CX
-----END PGP SIGNATURE-----

--ioporkhzmkrbopqc--
