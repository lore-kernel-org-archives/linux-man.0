Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7844B0493
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 00:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061465; cv=none; b=YEmT3TtJO/XOkjPDWTJ4ZxamF6OwzUyA39NP+iTzZwEjEkBCI8WS9rmZE0fio92OF23+9/3OfEU6Qgq+6aKwrOpZqZem5O7YHHbcsVIMgVc9ggH0hgPiS4JVj16lqKdR6tmJ67USgM6mQpCXLB6TWFYZE3HUiR9aDQuYxyWQ2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061465; c=relaxed/simple;
	bh=qbRZWg00Vn9jvoK2rx+XL5PE0vOsZVdszcR3/lFTFO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5hM+x+/5G5b96YhFAZFWDAtQFca5qR90HOIAmheUWYBeSJWphZG9PFJn3vbCCDgFBaDC+5yvhR8USNajEmP0CwKVONaSmOURseN4KzfjfApGvTuos00rPM+GYfBpR+9t2rhRRSJLwXlU3fZn9ncv+W5GuO5iszoz1eepy6Q7CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GU2ZYNh6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GU2ZYNh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FDB1F000E9;
	Fri,  7 Aug 2026 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061464;
	bh=jxWYWL6FtZkTSFUcWMRa3OUlzwXk2zBV3FOJ0z6vJws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GU2ZYNh6DXc232sPaBho5RuZ7l1j/XinmqZdZzq2ylIq+esKWbXXZiXxbJwaKwSRc
	 UdRx34IQaRBsBy+rx2RIM0o7S/SCm0ardUe1LQ8kIaoWy7GEgHt5Jjp0UET5P50vDR
	 8eOwGpod6FJvXqCspYCIIgaq4p5IstWqRBgMzCQtE5PwMHwX4Rv9dkzItfqrhd5l0s
	 wmelYCAgrNQb0RCyeNMh03iTHoQU29duaDbs9qTifxw1NTE1eq3JQaJIa/12GcRm4J
	 eHZkA6olIxxvNiCYUq5Vhc+BY2eIPYdDL2dTSTN23Rm6PA3zLiJ/2Euy687LGqagis
	 bL9Jl5AedLBxQ==
Date: Fri, 7 Aug 2026 02:11:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUiQua2QnWnzBeR@devuan>
References: <anUAwb8lY_u7eU3F@devuan>
 <xnwlu23ngs.fsf@greed.delorie.com>
 <anUbLZzOLY2qM6iP@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5xbovuxs4jfsvzh5"
Content-Disposition: inline
In-Reply-To: <anUbLZzOLY2qM6iP@devuan>


--5xbovuxs4jfsvzh5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUiQua2QnWnzBeR@devuan>
References: <anUAwb8lY_u7eU3F@devuan>
 <xnwlu23ngs.fsf@greed.delorie.com>
 <anUbLZzOLY2qM6iP@devuan>
MIME-Version: 1.0
In-Reply-To: <anUbLZzOLY2qM6iP@devuan>

> Date: 2026-08-07 02:07:00+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi DJ,
>=20
> > Date: 2026-08-06 18:15:15-0400
> > From: DJ Delorie <dj@redhat.com>
> >
> > Alejandro Colomar <alx@kernel.org> writes:
> > > You forgot to sign.
> >=20
> > I will never remember that... :-P
> >=20
> > >> +The resulting data is read when a new process is created by
> > >> +.IR ld.so .
> > >
> > > Sorry for noticing this in v4; I forgot about it.  I see this unresol=
ved
> > > issue from earlier versions remains.
> >=20
> > A program is a file on disk.  A process is a running memory image.
>=20
> Yup.  fork(3) creates a process (produces a new PID).  execve(2)
> replaces the image of the current process with a program read from disk
> (or in short, executes a program in the current process).
>=20
> >=20
> > Neither fork() nor exec() cause the tunables to be loaded, the process
> > itself has to do that.  For dynamic ELF programs/processes built with
> > glibc, ld.so does it before it passes control to the ELF image.  There
> > are other types of programs/processes that do not use ld.so and thus do
> > not read the tunables cache (which is called "ld.so.cache" for a reason=
 ;-)
>=20
> Hmmmmm, let's say you call execve(2) several times without any fork(2)s.
> Assuming a that the program paths that you pass to execve(2) are all
> dynamic ELF programs built with glibc, I guess for every time you call
> execve(2), ld.so(8) will be run, and the tunables stored in ld.so.cache
> will be used.  Is this correct?
>=20
> 	#include <unistd.h>
> 	int
> 	main(int, char *argv[])
> 	{
> 		sleep(1);
> 		execve("proc/self/exe", argv, NULL);
> 	}

Oh, I thought this would work as a recursive infinite-loop program.  It
doesn't seem to work.  I guess there's some race condition?  :D

	alx@devuan:~$ cd tmp/
	alx@devuan:~/tmp$ cat ex.c=20
	#include <unistd.h>
	int
	main(int, char *argv[])
	{
		sleep(1);
		execve("proc/self/exe", argv, NULL);
	}

	alx@devuan:~/tmp$ gcc -Wall -Wextra ex.c=20
	alx@devuan:~/tmp$ time ./a.out=20

	real	0m1.003s
	user	0m0.003s
	sys	0m0.000s


Cheers,
Alex

>=20
> Let's also say you fork(2) several times, without any execve(2) calls.
> I suppose that won't trigger any of this, right?
>=20
> 	#include <unistd.h>
> 	int
> 	main(void)
> 	{
> 		for (int i =3D 0; i < 10; i++) {
> 			sleep(1);
> 			fork();
> 		}
> 	}
>=20
> From my understanding, only the first program will trigger this more
> than once, right?
>=20
> If so, I'd use the same wording that execve(2) uses:
>=20
> 	execve() executes the program referred to by path.
>=20
> That is, execve(2) executes programs, and ld.so.cache is read when
> a program is executed (in the current process).
>=20
> >=20
> > I don't know how to say this clearly with fewer words...
> >=20
> > >> +The syntax allows lines to start with the keyword
> > >> +.I include
> > >
> > > s/I/B/  (since it's a literal, not a variable)
> >=20
> > Fixed.
> >=20
>=20
>=20
> Cheers,
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--5xbovuxs4jfsvzh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp1IpUACgkQ64mZXMKQ
wqmbxQ/5Ad14PLRpjlrq1h8DOMiD63kuFQ+PLX9UaMNZ525rzRFEDyX9PXX3Wxjr
+z2IS6afCfYIxfBMWHfDi5YgP/E/Cls5qzQAwMwoHMT8CRfIsKtF4pYByaIWsVn1
rPsyIHSIGpKBaAL8GwOZwZPE4sK/A1KEhJriw20vWypIcKrLYXQzmkfqwEBWqYpd
D29iV6xd2I4809Z5IGpcKfpW8WA4v6EvbFEAtSY8z2PCUm2M+lg+UYB/UEa6joao
N5ZB8XarPruUiinL/Gc+z7G3hLafo3Zk3Ly5V8EuZGYdPV6EdOP5h6bt5LA5r2SH
P2Kue3/EClBCiNeXuCqkoKd7TMPo8JkMP70w2HLpwbY0hdmax2S2wQWUEWtovqol
M1A9Zj4MjcKeKCbccmyBBhD1bOTpwJDe6uIMOryVzSAKU5xYSSi9c7LXZu/sm7P3
NpUjqOZ2XzxxNIW5g+EqwJCTa3tBThOBVPraqT7US8yIrtuL+9S1nqV1fTs1dh/I
C2K2aTR5Diq3S2mpmgOw29jmodxc3Q3063OcU+jiIcTzBXVkDzy5DB9lwoBsUgoD
NQWqPoiCOZgUBGG4zvgdeRpJh/MbPS+fDeIX0+ax2HuSlONum4Wyf8qPRw9DWeSO
O2UZaonKfzfjoz5vIX3A9jG7TgJW0egAUXgCVAZmRqGiq0Hvzvs=
=IfPr
-----END PGP SIGNATURE-----

--5xbovuxs4jfsvzh5--
