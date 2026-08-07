Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C3B14A8B
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061743; cv=none; b=EhcMuK9kkQrnjrkAdWv1NTKvGSQuRgYZzGBRb795RuoJDARMEIY5DoR2X69iy6NLKS3OQa1gY1cgPudCAGTopQkFq+DS0weRJqoIXzyBXEMc9IGKjUQkqBSlslbVJGyrmkrUXVtn7voJokkvmoLHAKfoTH4259UkpPmm52acqnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061743; c=relaxed/simple;
	bh=grtcvMHKfL6jY15pHqoNndywt/OW4n89X9oPoO1DHHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWUySihuOPsvQeVywQ8C/RUXjxJW7lzcPTR444H5AZ3/37ZrPWQrpKy1t4sehBQ72t/Vvk724IcUW3XK8tSENNjc5gvU6cmgahWZacSTf9WzFnmtjtJ889F2h4K5j3hxt5imYr1xQBlis9a95rp6NmbQUvk44EOweG76hIP/7t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZflkPK8L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZflkPK8L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5341A1F000E9;
	Fri,  7 Aug 2026 00:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061742;
	bh=1rhKZ4oBLjctfncyrpVwC6bHsmJ0OAbmT9DFvBoBY/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZflkPK8LsGmJJ4/t4UQWI6Mrn5S+vruwpHu4X/hXgjvZ90UyjmtBmm4XxvwVsdEoM
	 lygW9DWiySrxGiXJp5N2mKNx3pMCEaLDK31rLydxaKdYBOPR9oUhFM0lw+SKDQGyo3
	 Gx4Z1Wzjed78oEj9nM6H1lvfGR5LDbpixf2puMeFwioksun/L9bWOStlVvQvDfdXVx
	 zZYQnnH16HwoQZfHYYoEBcUbIPO16148SDsa1PtSyoD2NFtYO1K+tJoSvH+A/eWDhe
	 9V6hJy1gItnw4cKyO3+X6PR4nV3zpbVEoMH/zP6WeAZb6pHegzl5gAb6jrkUcwF6+6
	 XagvYBBUFe0bg==
Date: Fri, 7 Aug 2026 02:15:39 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUjle4uSQ-RTF_Q@devuan>
References: <anUAwb8lY_u7eU3F@devuan>
 <xnwlu23ngs.fsf@greed.delorie.com>
 <anUbLZzOLY2qM6iP@devuan>
 <anUiQua2QnWnzBeR@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i3i4m6fdthm5ejap"
Content-Disposition: inline
In-Reply-To: <anUiQua2QnWnzBeR@devuan>


--i3i4m6fdthm5ejap
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUjle4uSQ-RTF_Q@devuan>
References: <anUAwb8lY_u7eU3F@devuan>
 <xnwlu23ngs.fsf@greed.delorie.com>
 <anUbLZzOLY2qM6iP@devuan>
 <anUiQua2QnWnzBeR@devuan>
MIME-Version: 1.0
In-Reply-To: <anUiQua2QnWnzBeR@devuan>

> Date: 2026-08-07 02:11:04+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-07 02:07:00+0200
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > Hi DJ,
> >=20
> > > Date: 2026-08-06 18:15:15-0400
> > > From: DJ Delorie <dj@redhat.com>
> > >
> > > Alejandro Colomar <alx@kernel.org> writes:
> > > > You forgot to sign.
> > >=20
> > > I will never remember that... :-P
> > >=20
> > > >> +The resulting data is read when a new process is created by
> > > >> +.IR ld.so .
> > > >
> > > > Sorry for noticing this in v4; I forgot about it.  I see this unres=
olved
> > > > issue from earlier versions remains.
> > >=20
> > > A program is a file on disk.  A process is a running memory image.
> >=20
> > Yup.  fork(3) creates a process (produces a new PID).  execve(2)
> > replaces the image of the current process with a program read from disk
> > (or in short, executes a program in the current process).
> >=20
> > >=20
> > > Neither fork() nor exec() cause the tunables to be loaded, the process
> > > itself has to do that.  For dynamic ELF programs/processes built with
> > > glibc, ld.so does it before it passes control to the ELF image.  There
> > > are other types of programs/processes that do not use ld.so and thus =
do
> > > not read the tunables cache (which is called "ld.so.cache" for a reas=
on ;-)
> >=20
> > Hmmmmm, let's say you call execve(2) several times without any fork(2)s.
> > Assuming a that the program paths that you pass to execve(2) are all
> > dynamic ELF programs built with glibc, I guess for every time you call
> > execve(2), ld.so(8) will be run, and the tunables stored in ld.so.cache
> > will be used.  Is this correct?
> >=20
> > 	#include <unistd.h>
> > 	int
> > 	main(int, char *argv[])
> > 	{
> > 		sleep(1);
> > 		execve("proc/self/exe", argv, NULL);

Dumb of me; missing leading '/'.  :)


Cheers,
Alex

> > 	}
>=20
> Oh, I thought this would work as a recursive infinite-loop program.  It
> doesn't seem to work.  I guess there's some race condition?  :D
>=20
> 	alx@devuan:~$ cd tmp/
> 	alx@devuan:~/tmp$ cat ex.c=20
> 	#include <unistd.h>
> 	int
> 	main(int, char *argv[])
> 	{
> 		sleep(1);
> 		execve("proc/self/exe", argv, NULL);
> 	}
>=20
> 	alx@devuan:~/tmp$ gcc -Wall -Wextra ex.c=20
> 	alx@devuan:~/tmp$ time ./a.out=20
>=20
> 	real	0m1.003s
> 	user	0m0.003s
> 	sys	0m0.000s
>=20
>=20
> Cheers,
> Alex
>=20
> >=20
> > Let's also say you fork(2) several times, without any execve(2) calls.
> > I suppose that won't trigger any of this, right?
> >=20
> > 	#include <unistd.h>
> > 	int
> > 	main(void)
> > 	{
> > 		for (int i =3D 0; i < 10; i++) {
> > 			sleep(1);
> > 			fork();
> > 		}
> > 	}
> >=20
> > From my understanding, only the first program will trigger this more
> > than once, right?
> >=20
> > If so, I'd use the same wording that execve(2) uses:
> >=20
> > 	execve() executes the program referred to by path.
> >=20
> > That is, execve(2) executes programs, and ld.so.cache is read when
> > a program is executed (in the current process).
> >=20
> > >=20
> > > I don't know how to say this clearly with fewer words...
> > >=20
> > > >> +The syntax allows lines to start with the keyword
> > > >> +.I include
> > > >
> > > > s/I/B/  (since it's a literal, not a variable)
> > >=20
> > > Fixed.
> > >=20
> >=20
> >=20
> > Cheers,
> > Alex
> >=20
> > --=20
> > <https://www.alejandro-colomar.es>
>=20
>=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--i3i4m6fdthm5ejap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp1I6sACgkQ64mZXMKQ
wqm1/w//VTIRovdCdt8eB56Vq5Ir8QA3kSHYYEKsqzQaKD991octJhMCL4RGqtS9
9fqJ/h/PScgNiSgftsm2XNLDJKy4GfArs2VS1+HSMbcy99UWEIjpWur8EAR5A8vI
tZ++aP/opjwQuZd/REr7uTXxgJBU/Q5nHLutb9lu4ysPSQhq9IS7q/sdihlXv8iI
haCgRmH/k58lE6OdFctgHZFUj1qNGhDQ9+75l8WbRBXk7XLwPYKg/0ZqemijgdG9
gP50wRyjxX8hxp6kKhRuruNFjeRRR8OYDmHI01p6T+qLf6o9+L9vQ1L8VWUgBgso
BsZZXtiKQ6dwvGAC1611afz7TVXCRYxgSzZ4Nviu+bGvFMO3QtFrn7opm8Tti8vt
p13eF3V60kTt4I3Gc6OYk6ublgzntJHILtdCw1MK7efUbF4HrhU+MMPDk/cJ4mAi
PP9nRVQIrZb1Rbfm+jBxe3NRpDAHIK9Icx+PeO7fBk63f/vF0/HK/4C3uF8JCjOt
ROLjSFVCi6JXizC2TzDJ3PPO3RxPSEvRB4xlS9hct3m3Wa3DvuLFULPztVoeJgz8
DS7zqG/8QxkBZZ1raVg9m15e2n6BTgx/XeXTBbDFJhlVIdqAB1rl6L5F9Mb3miGg
Bgbi3qXVKOMV0P2eWG2/adVTQ5RjXNPmdKslz6ogNzQibF8g6Q0=
=rDmK
-----END PGP SIGNATURE-----

--i3i4m6fdthm5ejap--
