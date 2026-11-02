Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661239;
	b=Ig6XVPW1PdMFAdApMzF1WGWnU8hlItcj1O7W7dH8tJaHwU793t37XP6W7N5Pgj6b5e4z
	 5Cf2OpVb5bmymZCd2zz3QqpcsJPeZcu5MkSKG1qxFxHbMjr8A365lJjvti+3zU9nCbo0n
	 gt7n0njc3XK6jkibkVDwWIbqsCuEEU0kHd7qSO1XJrZVeKaDehSCF1Kr2fHXuWwrI0LJ6
	 7o3bT7cPtGFkkkRCsN+/TKxuyQKI9GX7XGlcbBfqIqUnnIR8YortIp7Sb59kq4VyiuLF9
	 HX5aEA5CFQEMJ4Ax/Nx7Hx7qYd4FSiPptD7Z+76v8ouo+D3CsfRvrKRwXExznfVAwjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661239;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zvYn187KueGUNB0jY8oZ/YUPEuF9IOV5TaHK+e/n28E=;
	b=ZdEhPuaoK6BfBoZlSLQ1ehk8xUf10wzwNpB2iBWfjMEIjVBoAfu8xGrRtO/lrkpSEV2N
	 Z2TrLghqeEa3wX8J9NM3VE4KqYiaYDvzRGEiuL/ovS+VhFv47ROfJ8ShG5fwADKjJYuV3
	 rEoVCDEearIYo83TkLy9q8MxLbdhT6ZUMrB4LnF8+42n6aWFVPBNnlVpcB5USQ+Qvoydw
	 n2gOQHIEUGHBp9vS7NrUr2xpZwyqrs1796Or8Wp0woUg0f2okjHB6OXc6uo9Kr5yUkfMY
	 TGG1y8qlPgFe/482NkFF4iHDv5/WAZvZZF8NjNwrMwHSw75Qut39P0KXsWVuKYSzD9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N5Fysjj3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B3606A32C
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 23:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N5Fysjj3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0D01F00A1C;
	Mon,  2 Nov 2026 23:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793661238;
	bh=zvYn187KueGUNB0jY8oZ/YUPEuF9IOV5TaHK+e/n28E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N5Fysjj3cVPASV0E4070xd26rnCJ8Tq4s9UAiKQMhgp/TizsKn3356aRl/MjJ1AZB
	 yUAW0npsDVdA6Radi7gXoxeWwg6od4owfSCXlZQ9gn0N8dyG4R1oWcFWbKnYwPO1j8
	 tI90NZtp9CXFbhgoVsCfoQJDw8hNpDA+bdByGd+0gQSUqAPKVSnUCX9l3xV9GL4Z4Q
	 FtRcm4y0DeZx8gIMvmKUiwPd7eAqGkF+vSgM+MboV4uMBiv0RuaYrKzU7WNDIf+OB8
	 jW/kotnc4J64sHvu5oHFmDMKP7TYCK7hMFOKZuvcpI+WldnQbzDKEnKe7qUhyPhTqk
	 fR0A57pktd6VA==
Date: Tue, 3 Nov 2026 00:13:54 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Xavier Leroy <Xavier.Leroy@inria.fr>, 
	Carlos O'Donell <carlos@redhat.com>
Cc: linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <aukT75oZFuvhwiEd@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="asu4uifkzxj436px"
Content-Disposition: inline
In-Reply-To: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>


--asu4uifkzxj436px
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Xavier Leroy <Xavier.Leroy@inria.fr>, 
	Carlos O'Donell <carlos@redhat.com>
Cc: linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <aukT75oZFuvhwiEd@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>

Hi Carlos, Xavier,

> Date: 2026-11-02 11:24:25-0500
> From: Carlos O'Donell <carlos@redhat.com>
>
> Alejandro,
>=20
> I did a quick audit through 6.20 since we're looking to ship an update in=
 Fedora.
>=20
> - Xavier Leroy =E2=80=94 pthread_once.3

Xavier asked me to remove his name from the pages when I told him about
picking the old pthread_*() pages from glibc and Debian.

	commit 13151ec525a21101dabb2528784bf9a86b1280f4
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2023-10-03 16:57:29 +0200

	    pthread_*.3: Remove AUTHOR section; add copyright; adapt TH
	   =20
	    Xavier asked that his name be removed from the AUTHOR section, and sin=
ce
	    we don't use that section in this project, we can just wipe it.
	   =20
	    Add copyright notices to the pages, with Xavier as the original author,
	    and me, who will maintain them from now on.  Xavier ACKed the
	    Linux-man-pages-copyleft license.
	   =20
	    Adapt the TH line:
	   =20
	    -  Specify the date as (date).
	    -  Specify the project name in the 4th arg.
	    -  The first arg, the page name, must be the same as the file name.
	   =20
	    Suggested-by: Xavier Leroy <Xavier.Leroy@inria.fr>
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

Here's a quote from an email from Xavier:

| Date: Sun, 21 May 2023 11:40:12 +0200
| From: Xavier Leroy <Xavier.Leroy@inria.fr>
| Message-ID: <CAH=3Dh3gFakgz3xcH63h-5nO0L9LuSy2Xr5b2riwpJ1o4L3DzuRg@mail.g=
mail.com>
|
| To answer your question:
| - I don't think it's a good idea to take these man pages "as is" and drop
| them in the man-pages project, because they are probably obsolete and
| incomplete.
| - However, if you or others would like to use these man pages as a starti=
ng
| point for a comprehensive, up-to-date and maintained documentation for
| POSIX Threads functions in Linux, you're most welcome.
| - In both cases, I'd like my name and e-mail address to be removed from t=
he
| man pages, as I no longer support them.

And a follop-up email:

| Date: Sun, 21 May 2023 19:29:19 +0200
| From: Xavier Leroy <Xavier.Leroy@inria.fr>
| Message-ID: <CAH=3Dh3gF3F-tOq6-zYKf63_JhR3tRZ9NFMiTpX2YEjhhjDGr7Hw@mail.g=
mail.com>
|
| I'm happy with the man-pages-copyleft  license.  If you need me to write a
| more formal message for the licensing of these pages, let me know.
|=20
| No other requests than 1- removing my name, and 2- updating the pages as
| much as you and others can.

I'm not sure why I kept his name in the copyright notices back then.
I thought I had asked him about it, but I can't find that discussion.

Anyway, I've CCed Xavier now.  Xavier, are you okay with your copyright
notices being transformed to a generic one that says this?:

	Copyright, the authors of the Linux man-pages project

> - Linus Torvalds =E2=80=94 setreuid.2

Seems a mistake.  Fixed now.  Thanks!

> At the top level the following people have had their notices removed but =
I didn't
> see them acknowledge that removal on the mailing list, or in your final a=
udit here:
> https://lore.kernel.org/linux-man/unavr5u2uynqfvj7iymgvsptq4k5s5b4ex7havl=
36zro4bbua4@fqpjhnsuu5ln/
>=20
> Should we add these back?
>=20
> I can only assume the Michael Kerrisk consented,

He didn't.  We talked in person, and he asked his notices to be
restored, which I believe I did.

	$ grep -rn Copyright.*Kerrisk | wc -l=20
	1224

Did I miss any?

> but I don't think you explicitly
> mentioned this in any email I read with a Message-id. Would you do so for=
 the record?


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--asu4uifkzxj436px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrpGTEACgkQ64mZXMKQ
wqn5nQ/+IcoHJUD6UnWCyPqxYAz92cXz3ocA3JaxX6iJAXYTkE3YA43vU9av1mLY
ZqdwyjwMwO9a2OdBPi7VvQwB/AQiwMHva2hLnJ19jMqbFFuAx+u+RKdC07W0G7Vt
HacQYx6CTD/e/NZmhX43M4uHpAqtA35FnmMVNg16SxnDs/lBx3g/oBFiI7fud2Qt
LW4JyhekbABa258Ohs3gXEwZ5WALbkCUgG/xxRgz47Hht5Qb1kDnmRX0jv2S+f5V
EtXD1HHOQJKtKWoE+0xz01FKjOn4SOudJ2wgGKMMdJVzKK3XziSFH1c15jKB6nH1
OB6BcZfc6Qx9YFglb/Zrui1mFXjWF1fUEkD8xIzPTK/v1KnrGkHwmTQpc5LmoL8F
FvtIAwg82tCXXtkdIE8lz+dsHnP7OzdHnAn15W76/l36NpugrszVceDhM9Z+LUGx
F9y+Y3PKNeUNb+NlQbQFo4RlXzGhh/2hGxWLOWYJI9RX3CIBuPehHX84MlMl3CLe
NKP+6NTNwcwm3Bos43tsKD1zyhD0m6yJPx4UHc8Th4aiAQgwOSzTPRLATuTachju
4DvMK6cYR37nI5xOi1/gil3b7ZIPBKwfLKAbzI0+5WL+7UeKQdemXDB5+CNlpOJ6
Bd0+i/7dZfuEiVT/I/fzIqtqixCiTEQkkgLEeVHJ9x2gtq6vhec=
=JAa9
-----END PGP SIGNATURE-----

--asu4uifkzxj436px--
