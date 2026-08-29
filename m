Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9236196C
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788009032; cv=none; b=aa/1XicIFzHEFGmjlA+ayvivemTGtQxhP16cPAw3KyYi1pe8FVthiCgfgdODiI+1iYJpAWtXSwYki9xgwzvakUVRh0jFWHGrYeWXoGKQwf8tacMEPvtrBTs3frHpYsAvPJ/llUhMD55/MEYN7JLIn3t/lODF+62QjVVu/Ao48V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788009032; c=relaxed/simple;
	bh=4aaQ6B8d8tkfCpMsYYlxkX+dNPwDhNxu1Nyiw2KAju4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdWt1bnX6N9I+PKObPVGjhYJKb2/lA8QIScDGgaU2R/83H64ASq5VQs9+4l38EwBTlH6VAVzN48m98s5KniAhqjLQfC1+8dRqzDduSyFemyqQTWqqU7zxD8a+bY8kwONyHYOYG9m5O+X8GteT2trzh8zphQfbmUSUUK88PAkGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kkm4nI+/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kkm4nI+/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2597F1F000E9;
	Sat, 29 Aug 2026 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788009029;
	bh=j6fs9hq1pYneHAS70KDt01KjOMH/rq/ZvJ8VFPMIiJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kkm4nI+/j7mmaW02SbtDNHQd9KUM+ITNMo3Td9sTF1iWNhBj2dxNSYL4vFZBtH/50
	 77SS5EeN7QuXIVN4WDBkrfPu9jW1PMMZLYmyjHMDWPHtpVd9eoKCfP8l3cJjuTMgRk
	 N4ZB6syIbst8KpuwU0GFrE79CevFQueBVE+wV5K7/nw/fr5PABdvWfBP7CEa7S3OMQ
	 cGaNtnMYYTCjKAytFkC+cJQWj3cEVixso3e2zpk7dHdMzAP8fGK6j76co+lLL7lHiO
	 wMIiL2DJ0qH2uzVphmcxEsrw1uollMPmbJC237vS0t2DYtnBPTpRTMIeqdjSPgGo+X
	 sUPTEGERQQD4A==
Date: Sat, 29 Aug 2026 15:10:25 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: Larry Kollar <larry.kollar@icloud.com>, Groff <groff@gnu.org>, 
	linux-man@vger.kernel.org
Subject: configure separate from make or not (was: Using LS/LE)
Message-ID: <apLV749V4YvfqCOZ@devuan>
References: <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKou1PHGi1N5gGO@isnote.usta.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aexky3thd6od5wts"
Content-Disposition: inline
In-Reply-To: <apKou1PHGi1N5gGO@isnote.usta.de>


--aexky3thd6od5wts
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: Larry Kollar <larry.kollar@icloud.com>, Groff <groff@gnu.org>, 
	linux-man@vger.kernel.org
Subject: configure separate from make or not (was: Using LS/LE)
Message-ID: <apLV749V4YvfqCOZ@devuan>
References: <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKou1PHGi1N5gGO@isnote.usta.de>
MIME-Version: 1.0
In-Reply-To: <apKou1PHGi1N5gGO@isnote.usta.de>

Hi Ingo,

> Date: 2026-08-29 11:39:20+0200
> From: Ingo Schwarze <schwarze@usta.de>
>
[...]
>=20
> I think the main reason why build system developers don't usually
> run configure automatically from the Makefile is that from a user
> perspective, it makes sense to keep the two steps "inspect the
> configuration and make some decisions, but do not start building
> anything just yet" and "build the stuff, using the variables and
> decisions made at the configure stage" separate.  Users may even
> want to pause between the two steps, consider the decisions made,
> for example by inspecting configure output files like config.h
> or Makefile.local or, in case serious debugging is needed, config.log
> and maybe even change some of the decisions manually and re-run
> configure, even though autoconf(1) makes both steps, inspection
> and manipulation of decisions, gratuitiously hard, both by spewing
> vast amounts of noise and by the ./configure script being next to
> unreadable.  But saner, better-written configure scripts can make
> both inspection and manipulation quite simple and pleasant.
>
> Running the configure script automatically from the Makefile
> would remove this opportunity for inspection and tweaking.

In the Linux man-pages, the configure step is done entirely within
make(1) --there's no separate ./configure step--.  But as you say,
a separate configure-only step is important for serious debugging.

The solution I implemented is a 'nothing' target in the Makefile, which
as the name implies, does nothing.  However, it still runs the
configuration step, since that runs as part of parsing the makefiles.
Here's the rule:

	nothing:;

When I need to debug the build system itself, I run that target; often
with special flags for debugging.  One common command I use when I need
to do this kind of debugging is:

	$ make -p nothing | less

And if I need to see stderr output from the commands used by the
configure scripts, here's a common command:

	$ make HIDE_ERR=3D nothing

I'm not saying that this should be done, but this _can_ be done.  With
BSD make(1), it might be more difficult to debug, since it doesn't have
the -p flag.  But the output from configure tests can still be read
without building anything, with a dummy 'nothing' rule.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--aexky3thd6od5wts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqS2jsACgkQ64mZXMKQ
wqlDtg/9HE5Hye3O8t7ubx5+e6VSmYp8ZCFDR/Ln5Gi3QDmOxA2TMZZg1EnYK9ey
lIFsih5UCw8pncR7JZD12gSWcefTzhqluln6szDXlHPUnqkYMx6CDxt/PkaGdauG
tY0u9xpUv2XB03MBFm5SD+Ep1jltx6q4DlEuqTL5eCoM3D//t+reReKVSUiFij+P
caGUtiBGbxc3bCSqoaseFr7CykIGGlO/LGrpocMs6S8mar6SkXaXc9hFD3HN+Sai
JkiRNI4RLc8zQn6GQ31nEZubfKZHAKcl+KfUAk+OMglO4CdcQgxhTjRYel6Dkpip
IM1z/iW8NQ7aNfq8mOe8B0Ko3P8GkaxIub5ETrxrkDpM57ys7aS69r9VUX58SeqF
fHUM8Bk2BDsT5zQlGyWpPCuYv5EYPzhT2GIDuAzENE9iKqQs69ioDQXpw9jI7ny+
HsH3y2SoYeZRY3cOyOPwdNDXlZ5dYvhJpF0nbZN2f2RYD454atHq+Qs/nFZ3BR+v
RpE7GS8+dhPajWp41OEAI+Y/YAdN4huR/FwuYPME7hYYdHogvnl1XoiQnwUDlsmk
OqFv5cNnV9Uwy26WiWpJTz6p1vVhiBGa/1rR9YCKWheo1HHVzQ5VUFG5olGlN92H
5W1D/U6sKKt7v9ZAWeue8dKO3O5Hkkk8Ad+H2atJs+jEkLVCAlQ=
=JVjL
-----END PGP SIGNATURE-----

--aexky3thd6od5wts--
