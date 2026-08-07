Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5DD11CA9
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 00:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061222; cv=none; b=MrsjravOeq49GhM8LCGb2n/PsylbYFV6C+uoRwLxndptQmPaCHomD4lnglQWyyANgXfzscp6ZodGTxsZeBt/ZDpWJpuTNEjJZJLlkMKjvfVnh0wVBMTOvVCL07osTjDTkXziIoiXuJgJmsXDAgRc9nMUOuK+fwei37aD4kP2chc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061222; c=relaxed/simple;
	bh=7ZMZcossVXA5qlJMEUZsVCjdvbUTHhJ8ip2rzfzmrVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wpl8K73EqjOi5SnBdjPseF1Lb9vzJz9obfDzcHVWORnHB1vyteVvGVActmspeAF2TLGKg1RTvthLv8QiDBc2csoWpBfjzD6PzuaBCHyuxV5AZhlwxdkfIuwYZXcIcXjgjBJNT8bYJ0xK3j0WuSTc0PmnqDpXP6JgbcRdWLDaK+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3W6ESO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3W6ESO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E982F1F000E9;
	Fri,  7 Aug 2026 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061220;
	bh=HzkHxHkMfmcgrXk5Js5Ewo1jBs3TIUv8TX3pVoHvdhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L3W6ESO8VL97fZTCpMbgRj58QIqh+oFevIO0ATBv8dRbK/Toqg5ZOCd61tCIsakBu
	 2OJvRyzAl/jyiJ3Q1a+K/3x2GRmt3xXzi7hNNexXGPytoQfmLmG+8OipVW/GBbYLBC
	 NWLdU1gUg9CzMjIRdVVz9WX195DYeLfGYlO0MqswKsCkD45Z4Llybuf2iIaaEKpGSN
	 e4So0gGY/z5CmkEph3wHNU4rVrW/wqOUOk3nvCaN8z0u2xX87ooNpFqNuPEkRQodHn
	 Vwzm5FI+jsrpQ6cfwBlu+rF/Smy5VMEaSrqf3ogPo3Uv53P4+hZ+HSdd8QQ9yYWS7f
	 Ow4lsx1kXuRyA==
Date: Fri, 7 Aug 2026 02:06:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUbLZzOLY2qM6iP@devuan>
References: <anUAwb8lY_u7eU3F@devuan>
 <xnwlu23ngs.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bpcw43c3wltk4q5p"
Content-Disposition: inline
In-Reply-To: <xnwlu23ngs.fsf@greed.delorie.com>


--bpcw43c3wltk4q5p
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUbLZzOLY2qM6iP@devuan>
References: <anUAwb8lY_u7eU3F@devuan>
 <xnwlu23ngs.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnwlu23ngs.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-06 18:15:15-0400
> From: DJ Delorie <dj@redhat.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
> > You forgot to sign.
>=20
> I will never remember that... :-P
>=20
> >> +The resulting data is read when a new process is created by
> >> +.IR ld.so .
> >
> > Sorry for noticing this in v4; I forgot about it.  I see this unresolved
> > issue from earlier versions remains.
>=20
> A program is a file on disk.  A process is a running memory image.

Yup.  fork(3) creates a process (produces a new PID).  execve(2)
replaces the image of the current process with a program read from disk
(or in short, executes a program in the current process).

>=20
> Neither fork() nor exec() cause the tunables to be loaded, the process
> itself has to do that.  For dynamic ELF programs/processes built with
> glibc, ld.so does it before it passes control to the ELF image.  There
> are other types of programs/processes that do not use ld.so and thus do
> not read the tunables cache (which is called "ld.so.cache" for a reason ;=
-)

Hmmmmm, let's say you call execve(2) several times without any fork(2)s.
Assuming a that the program paths that you pass to execve(2) are all
dynamic ELF programs built with glibc, I guess for every time you call
execve(2), ld.so(8) will be run, and the tunables stored in ld.so.cache
will be used.  Is this correct?

	#include <unistd.h>
	int
	main(int, char *argv[])
	{
		sleep(1);
		execve("proc/self/exe", argv, NULL);
	}

Let's also say you fork(2) several times, without any execve(2) calls.
I suppose that won't trigger any of this, right?

	#include <unistd.h>
	int
	main(void)
	{
		for (int i =3D 0; i < 10; i++) {
			sleep(1);
			fork();
		}
	}

=46rom my understanding, only the first program will trigger this more
than once, right?

If so, I'd use the same wording that execve(2) uses:

	execve() executes the program referred to by path.

That is, execve(2) executes programs, and ld.so.cache is read when
a program is executed (in the current process).

>=20
> I don't know how to say this clearly with fewer words...
>=20
> >> +The syntax allows lines to start with the keyword
> >> +.I include
> >
> > s/I/B/  (since it's a literal, not a variable)
>=20
> Fixed.
>=20


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--bpcw43c3wltk4q5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp1IZcACgkQ64mZXMKQ
wqmbkxAAg8gYx1clsV0TE9RAh/4iTJU0C/kLszwWiKi+YuB7rHjnpWWjxCSKl8wg
g+1Vq8uJj6yy1j9lpJF9I+thJWcsUloZ+tAlKSFR74NYqUcs1GOfi3XNJhNVMjmS
vQIB/yxp+cBRCpKMEopSDwtdHlZufRnt7vve4FOPoVFlMjOvJyuwpeRIqvD2Sy/L
xqzZ/hJ+SLTSuMqQwBU4hWxeOqPXy2YfH15UIIgA+3eDx2Cn65nOfYEHFuZhexWg
uod5m5dqSdg/wg1VhOoTsFkGfIB2NjOuj4EbEr5RgQ7ND0IRRMAQylo29GnZghbf
jenD9EepEezGNxCJdiJZr0tiViaRJDgXp7YcfRicd/sYDpmSOV2+9VSfmnx2F9Iv
lixjUd8RsNlArj6oWRVmX3Q7aOKGLR8nSrOlAm/MgYdlKNz80Y2LJdhrjGqAR1i/
oQyQjt1j2NQ5aVGya5r7rA1AN5Xq5BbNAsQNz7DiU5SXK9d8TWn1S7DLfsQ6tjE/
ia/vv0i8F6gSP+Pxjk1bqMBQc9Bbas4nfUojAc3xoPblLRkh/b7/1T4tm46d8vHS
UXOiUwVG5yBYjJRLJQDIeJvheS8hPff3mc6y8w4D5zr5Han8YYxXjirEjKeYTT6z
qCRB8ZXikMVIKPvm/WHG9Gvcz2GWwLNuUYqzwBnlRZEmjKi9UtU=
=SERM
-----END PGP SIGNATURE-----

--bpcw43c3wltk4q5p--
