Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D597A48167F
	for <linux-man@vger.kernel.org>; Thu, 13 Aug 2026 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632989; cv=none; b=aKFgF7psERotvnxxdI9ipuyeXlAkaciyxNo97XnJI/+QJxNNOHYOqMknoJJrePfuUaHAyJYPbX11GWo4ewb94biU5+1ucSz0Nt//J6HYh6t7HPGG0qTesMHus38B7Uz62BPMVgbKKbyqG0W3BFDO4zptoE2ScauqsFnK5sz+vaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632989; c=relaxed/simple;
	bh=/wntbyL8ohmC/ONyTuaOaoLTD/5ioE4L8ZJ/Nq1YT0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7kB9atvA1QWdzkNLfBRL/9SB/kZWWq/suDcOE1RGn3Ag6VNYBySeAhS6N0l7BteScqDeXKduZ6ZB48tpnznCuyb2944REtAlrk03H6YK+Zv9ys5AbFftz1ukBty3qAmXlFZXXLeC5D7VGnsqbpe8lVXk1BXYi9lNyseYU1tMmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxOadZF6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxOadZF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCCE1F000E9;
	Thu, 13 Aug 2026 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786632981;
	bh=DWWLLO+IfgWQ2jdB9SvWfU4s1r5zzQv75eGhtbIvOn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NxOadZF6DUr4V2jUkoSdKVQbX9c2QUuSM7BrwlTgH5juyjGNQJWI1Iv1uj0+l8ugH
	 Hx0hcGBvi1642jMN758fIVp0tWzvcmEs2NODnBq5j+08i7mvJHpElzgMswnkPFFMDt
	 4PZozHotcDAq/IQMviXZ4DpvmtRKWtCOvJ3LuGDrdpuiC55CVG0GUlVF5O23jhbvnJ
	 e+v64cmoHKlUK5kBUOhHDbarZprCOGZW8kTwncAmF+KmZ5mkWYpd1vN5QEMOszz7tl
	 90bfUTAEeJ5XHI2v6kTysAO8PYRJUeS1wrNKd8gVpC6nxIUQGESbZ6Or9I3+ZEkeGZ
	 XhVaD+GJKx80g==
Date: Thu, 13 Aug 2026 16:56:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: bugzilla-daemon@kernel.org
Cc: linux-man@vger.kernel.org
Subject: Re: [Bug 221881] New: Documenting if both /dev/ptmx and
 /dev/pts/ptmx can be accessed at the same time.
Message-ID: <an3Z7qkQ9hwbYpzh@debian>
References: <bug-221881-11311@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66iekgoudxtdir6b"
Content-Disposition: inline
In-Reply-To: <bug-221881-11311@https.bugzilla.kernel.org/>


--66iekgoudxtdir6b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: bugzilla-daemon@kernel.org
Cc: linux-man@vger.kernel.org
Subject: Re: [Bug 221881] New: Documenting if both /dev/ptmx and
 /dev/pts/ptmx can be accessed at the same time.
Message-ID: <an3Z7qkQ9hwbYpzh@debian>
References: <bug-221881-11311@https.bugzilla.kernel.org/>
MIME-Version: 1.0
In-Reply-To: <bug-221881-11311@https.bugzilla.kernel.org/>

Hi Paolo,

> Date: 2026-08-13 14:20:33+0000
> From: bugzilla-daemon@kernel.org
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221881
>=20
>             Bug ID: 221881
>            Summary: Documenting if both /dev/ptmx and /dev/pts/ptmx can be
>                     accessed at the same time.
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: low
>           Priority: P3
>          Component: man-pages
>           Assignee: documentation_man-pages@kernel-bugs.osdl.org
>           Reporter: dedo.paolo.24+linux@proton.me
>         Regression: No
>=20
> Traditionally pseudoterminals are created through the device file /dev/pt=
mx.
> With the introduction of the devpts virtual filesystem, new slave
> pseudoterminals are created through /dev/pts/ptmx device file and allocat=
ed in
> /dev/pts/*. In order to mantain backward compatibility, the device file
> /dev/ptmx has not been dropped byt instead requests to /dev/ptmx are forw=
arded
> to /dev/pts/ptmx.
>=20
> However, this is not preserved by bind mounts to /dev/ptmx: for example, =
after
> launching
>=20
> "# mount --bind /dev/ptmx /dev/ptmx"
>=20
> any attempt to opening /dev/ptmx will fail. Instead, bind mounting
> /dev/pts/ptmx works as expected (if devptsfs has previously been mounted =
with
> ptmxmode=3D0666). This is quite problematic if one wants to give access to
> /dev/ptmx inside a mount namespace. The solution provided in
> https://docs.kernel.org/filesystems/devpts.html is to remount devptsfs wi=
th the
> mount option ptmxmode=3D0666, then remove /dev/ptmx and finally place a b=
ind
> mount or a symlink pointing to /dev/pts/ptmx.
>=20
> The issues involving documentations are the following:
>=20
> 1. man 4 pts only describes the old interface /dev/ptmx and the newer def=
ice
> file /dev/pts/ptmx is never mentioned. /dev/pts/ptmx should at least be
> mentioned as an alternative for /dev/ptmx both to help software maintaine=
rs
> moving to the new interface and to provide access to pseudoterminals insi=
de
> mount namespaces;
>=20
> 2. nowhere inside the documentation is explained if it is safe to provide
> access to both /dev/ptmx and /dev/pts/ptmx at the same time. All provided
> scenarios give access to exactly one of /dev/ptmx and /dev/pts/ptmx device
> files. If we have to avoid giving full access to both /dev/ptmx and
> /dev/pts/ptmx through ptmxmode=3D0666 (to avoid race conditions) then it =
should
> be explicitly stated. On the contrary, a note that says there are no prob=
lems
> in giving full access to both these device files at the same time should =
be
> added.

If you know how to solve those issues, would you mind sending a patch?
If so, plese have a look at
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING>
and
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING.d/>.

If you don't know these, you could maybe ask through email to the kernel
maintainers of those features, and CC the linux-man@ mailing list, so we
learn that information.  (The links above will also help you.)


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--66iekgoudxtdir6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp92wkACgkQ64mZXMKQ
wqmwMw//Z9lvpsFcy7NIQqEyAv62QhgHdpL63eVumKk/ctGLdF8Ag6jIsSg7lcgk
gRFN05yGhruLjGM3PNgiFf3za3F3xdeO2uL35JHPB+Jj0l/j951z31qGxXAaBt/B
w+AHN1verpjarvcNWyY6B7JMcRfyJJPSLC3zcBXt35bAQw3aLm/fEqpsvP9GxFrJ
aF4eQPIIAWVM8qefWfesZz+6kilqSHmOoUFIAvcjnQxE4IdeAsDfv1WTc6m3fbUj
o3vlI9FudOI/imoDXbzXQqQ8/2IvnXdl+FW7Wlx6iWyFWn9wwbvxpP47bvZ1ls8j
6/HgLFglE/PEDn4W+nqypW8iXweW6/6SA9XQhF5sVBrOX0BdRR/nif5GIzZibJB3
gcwPGKRRmjhlVlJa6cxpf8uXcJ44NfqOylIVh6xyCJiLiIUHM/KR8rNTJkTxzjf0
S/TazA2qOrN8n7KtTCyESdVTTwudcZKyEfc+II13G71FnlpmneT98Tq2iTM4YXYi
+esGOABlDcjQJvYjNqbHu69TSMhOI9PDA9/K9+KaR3o+AiJT/Pgewl+j2gRupuH6
jz/FWPgrmnj0uWJl6+5KSfb/o6pnbsES3orppGAQOywET66Vfydf1MU53ZiMdMVd
SNavFibncOF7UNV3SHstwuSXRVSkFKoID+JA/5mA/8NthcktPu4=
=kzGH
-----END PGP SIGNATURE-----

--66iekgoudxtdir6b--
