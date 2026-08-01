Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8651B305670
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546785; cv=none; b=U/WWkudbPyb+hZQBS5kQba4kdMC9jLq41gdb6dU2QD5t9CSP6FWFk+mr+tXDTfUdhdckfP4mWig2VX/uWjatcSeWXQZrbduq8+7gY8cmx/EriQiO+DNpchVhEjEVz+P0tqwInrAgJtslcAMlbmP0Ix7vrm8Vvbe1W8/b2WP0jM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546785; c=relaxed/simple;
	bh=JeFBdd9+PQmHgp/CBoBk/DAvkIuk5P8uBZ0txw9PFhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+liCBywwEiWFC01wOv2EvSIQ2BzQDKkGLrDI6WJgveTpXhxzEVYV1hitpK3r3ebcqmuNojIjn3RmxZFos/rPyHyG+13EMnVmM/PIY/HHRfiGUlNA/SrrOvc09Bg1qUSXOUt27I+62gFmUl7hRoJBV73iWALuQL/IIVB3Zf2faw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jN5Prv6z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jN5Prv6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E441F00AC4;
	Sat,  1 Aug 2026 01:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785546784;
	bh=VuzywU7D2gQ25YQwdSDJQJ7O1+62NuWV5bRog3J1lHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jN5Prv6zXafp+W1REV7OFpXKbdZM4p4N27UuyLfkTCI0Bo6iQC2PmhczKKHED+Rnp
	 YcHDYULNEyevTzcOUUsEJQhfnOXFyX2sx0imsRLhtyTcyjOFc6lflDS4eKjiuwcKKY
	 A/SzCpy56nPDz2HaNNrFSFlaHPUeDIBl9SVYrwtNBzyXiLKqHZ6Peak36HJ7oMye9r
	 WptPHuOuIrgyq60aBD1OnqiN5T98vBYYe3rEIoED5TeJXOw4rIP9htjFP3gSQsAQrn
	 yZIHqRGER10dt0/xWabQTwk5OfvpeQTlzEPJM/X3OhgtRB5UPzua/9pKcuhggC0iZV
	 wvUaoOD4Lo5jw==
Date: Sat, 1 Aug 2026 03:13:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <am1GD8EYQqLBrXCT@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
 <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbrfyjjyelc36x7z"
Content-Disposition: inline
In-Reply-To: <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>


--tbrfyjjyelc36x7z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <am1GD8EYQqLBrXCT@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
 <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>

Hi DJ,

> Date: 2026-07-31 14:22:24-0400
> From: DJ Delorie <dj@redhat.com>
>
> ---
>  man/man5/tunables.conf.5 | 134 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 man/man5/tunables.conf.5
>=20
> diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
> new file mode 100644
> index 000000000..f96355bed
> --- /dev/null
> +++ b/man/man5/tunables.conf.5
> @@ -0,0 +1,134 @@
> +.TH tunables.conf 5 (date) "Linux man-pages (unreleased)"
> +.SH NAME
> +tunables.conf \- tunables configuration file
> +.SH SYNOPSIS
> +.nf
> +.B /etc/tunables.conf
> +.fi
> +.SH DESCRIPTION
> +Tunables are a feature in the GNU C Library
> +that allows application authors and distribution maintainers
> +to alter the runtime library behavior to match their workload.
> +For a list of supported tunables,
> +please consult the glibc manual
> +that corresponds to your installed version of glibc,
> +or run the following command:
> +.P
> +.in +4n
> +.EX
> +.B ld.so --list-tunables

'-' should be escaped: '\-'

Also, these examples don't need bold.  We use bold to differentiate from
program output, when we have examples that show both a command and its
output.  In this case, being just a simple command, it's fine in roman.

	ld.so \-\-list\-tunables

> +.EE
> +.P
> +Each line in the file
> +.I /etc/tunables.conf
> +specifies a tunable,
> +which is specified with a string of the form
> +.IB name =3D value \f[R].\f[]
> +.P
> +The syntax allows lines to start with the keyword
> +.I include
> +followed by a path wildcard.
> +The wildcard is a path specification in the
> +.BR \%glob (7)
> +format.

For consistency with patch 1/4, this should use the same wording:

	The syntax allows lines to start with the keyword
	.B include
	followed by a
	.BR glob (7)
	pattern.

It's also much simpler.

> +Matching files will be processed
> +as if their contents were included
> +at that point in the config file.

Same here, for consistency with patch 1/4:

	Files matching that pattern will be processed
	as if their contents were included at that point.

> +.P
> +The file is parsed by
> +.BR \%ldconfig (8)
> +and the results stored in
> +.IR /etc/ld.so.cache .

In patch 1/4 (ld.so.conf(5)), this paragraph is specified above the
specification of 'include'.  We should be consistent.  Do you prefer it
above in both, or below in both?

(I haven't pushed patch 1 yet, so if you want to modify it, I can amend
 it.)

> +The resulting data is read when a new process is created by
> +.IR ld.so .
> +.P
> +Each line may include zero or more keywords or symbols at the beginning,
> +which affect how each tunable affects each processes.
> +The keywords must be separated by whitespace,
> +but the symbols need not be.
> +.TP
> +.B overridable
> +.TQ
> +.B +
> +Allow the tunable to be overridden by the
> +.B GLIBC_TUNABLES
> +environment variable when the process runs
> +(this is the default).
> +.TP
> +.B nonoverridable
> +.TQ
> +.B \-
> +Do not allow the tunable to be overridden by the environment variable.
> +.TP
> +.B onlysecure
> +.TQ
> +.B @
> +The tunable applies only to
> +.B AT_SECURE
> +processes,
> +such as one started from a set-user-ID program,
> +or one with elevated capabilities.
> +.TP
> +.B nonsecure
> +.TQ
> +.B $
> +The tunable applies only to
> +.RB non- AT_SECURE
> +processes (this is the default).
> +.TP
> +.B anysecure
> +.TQ
> +.B *
> +The tunable applies to both
> +.B AT_SECURE
> +and
> +.RB non- AT_SECURE
> +processes.
> +.P
> +The file may also contain
> +.IR filters ,
> +which limit the tunables following it,
> +up to the end of the file
> +(or end of the included file,
> +or start of a new included file)
> +or a line with only
> +.B []
> +on it.
> +The syntax is:
> +.P
> +.in +4n
> +.EX
> +.RI [ filter : pattern ]
> +.EE
> +.in
> +.TP
> +.B proc
> +The
> +.B proc
> +filter limits the following tunables to processes
> +whose name matches the pattern.
> +The pattern may be an absolute path
> +or just the base name.
> +.SH FILES
> +.TP
> +.I /etc/tunables.conf
> +.TP
> +.I /etc/ld.so.cache
> +cached copy of tunables
> +.SH EXAMPLES
> +Example configuration file:
> +.P
> +.in +4n
> +.EX
> +glibc.malloc.arenas_max=3D5
> +onlysecure glibc.malloc.arenas_max=3D1
> +\-glibc.pthread.rseq=3D1
> +[proc:/bin/bad.program]
> +\-glibc.pthread.rseq=3D0
> +[proc:some.program]
> +\-glibc.malloc.mmap_threshold=3D65536
> +.EE
> +.in
> +.SH SEE ALSO
> +.BR ld.so (8),
> +.BR ldconfig (8)

Except for those consistency issues, it looks quite good to me.  Send
a revision and let me know what to do with patch 1/4, please.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--tbrfyjjyelc36x7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptSBcACgkQ64mZXMKQ
wqln3RAAhcmZNhGT8L+jJycywWcNe3buagoNor5j0jRlY8ck5J+rRWchvQmxypCW
5sIN5Yd7gy2BVxdGS6QZphfsPkqi6FZU21gojJkazJNjdWk3uXgdn6iuzS9MxSgR
u7/p5PIhw7+Jf4BPcm3OOlSbZPaXr0OysbJF3AFNWWgj9+kqpKTxNX3uig8JywpQ
Jek3fHiQClr8XvawI0zOHA8qsdWKU7EGja58GrDwXaZxM8ZqX3Ibyn9CJpiRHb8N
aTZsX1absunwBjeRlXkJf59BRsjoSLiTiNuEzLViEGZ99dPy5WEciuSO6+19QaIo
8qyEqkwUWsInbD3d4logziWtQc15DhllZjY53WDTaUOu0UGVnedOSdKHurNT8UFX
oBJZkjGMGfn88hn7fvMyUuMEZRpTG9FTPM98lzn3784QX/WK1Oa+oKSIvIivsfNJ
HLx/UV8F+kRxYmGiBtSgxgwx/vVSLeKBB//2L4jz4LrbiiHKveGqxrwnUX6eC8XD
Wg6pWmJrMrVjtOZvt5xmVNFSDIPlwoJPLa0/+3G7e/yQOms8aSJgU2mEtviRnKXa
CHZzSLo4/gWi8zfeE2Tjl8ID1vgmB1u84QGFWsxZE7dj2L40qtBBZpH1thfQNDjl
ZQgq8SqQx/8aXoXOpdkcaeoo9dMP+7s2qoNuwTLjU24yOjpvLOA=
=3hGM
-----END PGP SIGNATURE-----

--tbrfyjjyelc36x7z--
