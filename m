Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DE643635F
	for <linux-man@vger.kernel.org>; Tue, 20 Jan 2026 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917584; cv=none; b=FhPm7GyujDIQO2ohKI3+sFimW1IX0VliuOL9VYwIejKGMh/lCeWizgqxB6/S40hrwgtYyaKcRRhFEF80dQ97RP0j2glXwzPyxRIlc0cD5KTgcM6Bn1v7qmYUmEQvi3foxZsmTWOeNPhqvnKIzcTE1ZlZpjyXlu+OdVIFcIVlArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917584; c=relaxed/simple;
	bh=yvlkT8kghDfRBv3+yNxD8ugm+9mIXdDV2jStHpWlJic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGc+3wdBH8LvVOruwaWJGjfMFNEwW2e9RACEAPz5VrRwz38PPl/ZEZYZKvCifMbXRbHWsE8lTSB+qRYl6iHeHPSf21prCcOpmMMyiGRsb6OXH6+BJbxx0UibLOJRl0BcXFZnb0w1IPrzPdHaAy5qg6ioJ5doDalYPO8T/4NFH5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ekP02jjb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekP02jjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0852DC16AAE;
	Tue, 20 Jan 2026 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917583;
	bh=yvlkT8kghDfRBv3+yNxD8ugm+9mIXdDV2jStHpWlJic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekP02jjbVW/IiSa8D9sZ661hZ3mNnTJATXDn9vfWcYeooeJ/59nN96s2HFq3W8Lbf
	 tYd2bbTmpn872Zh4X1bw42962UbaOTi7j0qFneWQf2+SQMzqNYSKGs/3Pcpi5WtNGz
	 zUmtyteQjSHtCUI3Ks6u4hcMXWU0gYFd1ZJ0sVjvOzBpZglELSziN4Qr9RYImAW7wL
	 0c8833PbFtS+z38tIAfOa1rGa/9Z/AK0L7Qu7cRiZ7Y/2JLxWx6XysfFpb8ikSDjxv
	 5OXmr4MF+5eU08d/kG08p2eFcU8pFmDCLVm9trYW4+dE/CConton8CAGcgDvXDL9wA
	 oQJsv+TRTa99g==
Date: Tue, 20 Jan 2026 14:59:40 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: Re: History of const in C++, C89, and POSIX.1-1988 (was: [PATCH v1
 02/19] man/man2/access.2: HISTORY: Specify different)
Message-ID: <aW-In8-c7w1J13Th@devuan>
References: <cover.1768822707.git.sethmcmail@pm.me>
 <d87c7800e0f556efefaf5972294fb6a149bf02d1.1768822707.git.sethmcmail@pm.me>
 <aW7aOgFHOdCSiwUH@devuan>
 <aW9xYhsFpNxlo3C5@McDaDebianPC>
 <aW96GgzoYUurH5FS@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kqwytpuebgllwyj6"
Content-Disposition: inline
In-Reply-To: <aW96GgzoYUurH5FS@devuan>


--kqwytpuebgllwyj6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: Re: History of const in C++, C89, and POSIX.1-1988 (was: [PATCH v1
 02/19] man/man2/access.2: HISTORY: Specify different)
Message-ID: <aW-In8-c7w1J13Th@devuan>
References: <cover.1768822707.git.sethmcmail@pm.me>
 <d87c7800e0f556efefaf5972294fb6a149bf02d1.1768822707.git.sethmcmail@pm.me>
 <aW7aOgFHOdCSiwUH@devuan>
 <aW9xYhsFpNxlo3C5@McDaDebianPC>
 <aW96GgzoYUurH5FS@devuan>
MIME-Version: 1.0
In-Reply-To: <aW96GgzoYUurH5FS@devuan>

On Tue, Jan 20, 2026 at 02:52:25PM +0100, Alejandro Colomar wrote:
> For example, here's how qsort(3) was implemented in 4.3BSD (1986):

BTW, there's a git repository that includes all of the historic Unix
systems: <git@github.com:dspinellis/unix-history-repo.git>

I use it when I need to inspect old Unix sysmtems.  I have checked out
a few of them in separate git-worktree(1)'s:

	alx@devuan:~/src/unix/unix$ ls -a
	.  ..  .bare.git  4.3BSD  v3  v4  v5  v6  v7
	alx@devuan:~/src/unix/unix$ ls | xargs -I {} git -C {} status
	HEAD detached at BSD-4_3
	nothing to commit, working tree clean
	HEAD detached at Research-V3
	nothing to commit, working tree clean
	HEAD detached at Research-V4
	nothing to commit, working tree clean
	HEAD detached at Research-V5
	nothing to commit, working tree clean
	HEAD detached at Research-V6
	nothing to commit, working tree clean
	HEAD detached at Research-V7
	nothing to commit, working tree clean

> 	alx@devuan:~/src/unix/unix/4.3BSD$ cat ./usr/src/lib/libc/gen/qsort.c \
> 	| sed -n \
> 		-e '/^qsort/,/^{/p' \
> 		-e '/compar\>/p' \
> 		-e '/qcmp/p' \
> 		-e '/^}/{p;q}' \
> 	| uniq;
> 	static  int		(*qcmp)();		/* the comparison routine */
> 	qsort(base, n, size, compar)
> 		char	*base;
> 		int	n;
> 		int	size;
> 		int	(*compar)();
> 	{
> 		qcmp =3D compar;
> 			if (qcmp(j, lo) > 0)
> 			while (qcmp(hi -=3D qsz, min) > 0)
> 	}

--=20
<https://www.alejandro-colomar.es>

--kqwytpuebgllwyj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlvikwACgkQ64mZXMKQ
wqlNzg/6AvTYBrm8SdYl+TuSY8eyBx0faTXzAl2l706PpLv09XZXX4DAAS0kxUQx
hrrmLbLAdIvrY+lP08/7634HJtSEsHx0Mn0O5PxvRQPbHXfiyv5zcGqGPMSMO1UF
Hae8bpWoW0OmVt3TmsFsQiWOd0cdAnS168k/h4hgy4bENjCG97sYTWc/1Xu9pyDi
8rGVZkrbsvBzSoj1WTb/RGurAjKJ+zDOQz/YaFXB7VOz0uSjQwFd8mjofA25bjvJ
vwHWdjnt04bvVqFEEEVWN590pTZapWd9y7n5AzSQp8J7pfqsB4WcFXgb3qEYEOE1
7FFZohrlBpit0bDrdNZrANDcuevxy5FB4KsKqmLxXbST2HiFnSIrVIg8sCsshrTB
hQtvN4cF3RIoA0AUO6jGTPyN3lLzgBGgkaZ8bKp0qtJ77Og25iaKKFXlsyhokDgn
EtU0N6Uzezh40+JUO10EBK4Fo7ag+6ocDbBxxacoMNMSRQvo2o/6YdIF9zMWMRe5
PvyMsLFquClJnrsCyLxb7v1Dw543TkCdszGD5vXIVsH9hJSTkzpCNckZ53q4MazN
vjAsqbLL5cNMKMEYkbXgyYFLw0zY+Canzf7oME69Iz18FjMZLQaSMNSdWHOJ8U7H
ATZnvIWJQ7spCdlYfMlI3Yj4w680loTzGgQ6ygEaHjtoexnMdAI=
=cz59
-----END PGP SIGNATURE-----

--kqwytpuebgllwyj6--
