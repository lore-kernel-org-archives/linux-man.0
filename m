Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A1447F775
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 22:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053772; cv=none; b=FR/Q9RfbgB6BlVPJdUfdbN8GJ6f0XETs+TEVmM7Z0vWDTxCwxoVxgNpB1yW4bD+Xl8PHZmRD6yuG70KFr/Kpf41Q0sDWwjAP2o8COMXJGsR1cMg65f4lCtNxIPnouDgeYxajULS2pcDeRSYIOiiNwTttfzeLw0luGNUW6yChRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053772; c=relaxed/simple;
	bh=mDdbtml7+73YD/CDn2hk4PckPDu7YKsZcizcRJfdvAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFblbQTIr7NhpDFMlbnWdq1u//zIXnBW7QtDrqdqae397qiJVE+qmTRpTTM9gq64FG5G/WuWrNCMyUuyEkVFm78zfKxLJh1SSkryWOnLC+qMQIo5zN2djQ0qpjZFdqz1NtyC9Stea6NME/vNUSnMc+YdQzRFX1I2LEq0Q4dmdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgXIIl47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgXIIl47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754991F000E9;
	Thu,  6 Aug 2026 22:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786053771;
	bh=uGlv+jrGOZ6XQPQ0TpPxjxsxbjcpATLks9Mr4h9hu8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OgXIIl47cL8jCbmjiT2oPxSfDMRAYoI0Mq1fyodW66HpIG5lXpHLeFDgC/J5lWVBk
	 xlHC7BgVCaiw4lvevYpcVvm2rzGDZ7d+UhhAtvOKjIMsvUoMAJnDwOsN2IdBxaImwD
	 LLNnlmCl2R/bAzY7afAMW7M1Az2AgDPsFtYGnzFp3h001j0FB24o6MjIRtEico6FqP
	 nmhuewoVaXrURDYrv75kcpI17Ow2qjTIM7xm7qcoIJ/ZQ/1XCQtUC87RhFTwvtJm6A
	 /PY91sYSvmPzybO4tWcLLQCtPjys5l16n3xjhZcGkAKjo5zSXelC2+3MzQTiiR0E5l
	 +mGal0lcIjUZg==
Date: Fri, 7 Aug 2026 00:02:47 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUAwb8lY_u7eU3F@devuan>
References: <xnzeyz2d3l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hyuzpqoqu7hn7pls"
Content-Disposition: inline
In-Reply-To: <xnzeyz2d3l.fsf@greed.delorie.com>


--hyuzpqoqu7hn7pls
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anUAwb8lY_u7eU3F@devuan>
References: <xnzeyz2d3l.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnzeyz2d3l.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-06 16:44:30-0400
> From: DJ Delorie <dj@redhat.com>
>
>=20
> ---

You forgot to sign.

>  man/man5/tunables.conf.5 | 145 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 man/man5/tunables.conf.5
>=20
> diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
> new file mode 100644
> index 000000000..29beeb8f8
> --- /dev/null
> +++ b/man/man5/tunables.conf.5
> @@ -0,0 +1,145 @@
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
> +ld.so \-\-list\-tunables
> +.EE
> +.P
> +The file is parsed by
> +.BR \%ldconfig (8)
> +and the results stored in
> +.IR /etc/ld.so.cache .
> +The resulting data is read when a new process is created by
> +.IR ld.so .

Sorry for noticing this in v4; I forgot about it.  I see this unresolved
issue from earlier versions remains.

ld.so(8) runs when a new program is executed --execve(2)--, not when
a new process is created --fork(2)--, AFAIK.

	alx@devuan:~$ MANWIDTH=3D64 man fork | grep ld.so
	alx@devuan:~$ MANWIDTH=3D64 man execve | grep -C2 ld.so
	     If the executable is an a.out  dynamically  linked  binary
	     executable  containing shared=E2=80=90library stubs, the Linux dy=E2=
=80=90
	     namic linker ld.so(8) is called at the start of  execution
	     to  bring  needed  shared objects into memory and link the
	     executable with them.
	--
	     ptrace(2), exec(3), fexecve(3),  getauxval(3),  getopt(3),
	     system(3),  capabilities(7),  credentials(7),  environ(7),
	     path_resolution(7), ld.so(8)

	Linux man=E2=80=90pages 6.18=E2=80=9018... 2026=E2=80=9002=E2=80=9008     =
            execve(2)

> +.P
> +Each line in the file
> +.I /etc/tunables.conf
> +specifies a tunable,
> +which is specified with a string of the form
> +.IB name =3D value \f[R].\f[]
> +.P
> +The syntax allows lines to start with the keyword
> +.I include

s/I/B/  (since it's a literal, not a variable)


Have a lovely night!
Alex

> +followed by a
> +.BR \%glob (7)
> +pattern.
> +Files matching that pattern will be processed
> +as if their contents were included at that point.
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
> +which limit the tunables following it.
> +The effects of a filter are terminated by
> +any of the following:
> +.IP \[bu] 3
> +The end of the file.
> +.PD 0
> +.IP \[bu]
> +The end of an included file.
> +.IP \[bu]
> +An
> +.B include
> +directive.
> +.IP \[bu]
> +A new (possibly empty) filter.
> +.PD
> +.P
> +The syntax is:
> +.P
> +.in +4n
> +.EX
> +.BI [ filter : pattern ]
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
> +.P
> +A filter can also be empty:
> +.BR [] .
> +Such a filter has no effects.
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
> --=20
> 2.47.3

--=20
<https://www.alejandro-colomar.es>

--hyuzpqoqu7hn7pls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp1BIEACgkQ64mZXMKQ
wqmjAQ/+PRHpheeJAbEylyfzg2/v1rWUiaK08+uLjmXEMNsvw8rN1NbgGH22ABDH
YJZVpvgjY+LdUysJ3bhC09rteNq4+8850GAt9C5MAirI8WpvrZdXE2uvFXpEiwd7
bGI++dW9/In1Cpa8qkf61teYQPIkV7tOAFzSkBUFfiPDz1+H2akLwVYHTYrvpzbM
ysKle8K1pR7Y4kqMw+dhLl84AnTkNA3bn8rZWggoOSNxpUhkNMwdRvjqLwfeu7Ho
WiF4+9GdL3PbkjrgqVVVWqFOJQNIH+MrGYE1P2iPZghtA1wk2e3nvSELbXoQUdrF
T4RAK1OqygXQAqVToTGdAMCTzaOGsdpx5eBXmB8bN7Sw/SkRUUlD0yXdxDaIchbM
9/RSXY8uXF8B5cWOPN4MZeaiH2W1jcW26/bAwA7X/hoYdZ/ilAzTmtj4U9bV6f+m
y17fiU7aRxbxMHUC/GCIeX5Sz5Af8t7A5pbKlUIOKTATRxmbcRWmPCmYmere4UMG
DmdlV/e6JJgL4/8+vzf6RsK55gR5ehjYTbha0T0z6EvJRHk3Jv69r6hX1v67Ncc6
2vhW4ggmh3egFFX70o//3H1MlzZ4Qd6JRtnwuiVmfMRrN0AAN+ZwKGjVoUa7de5k
73VdQ/ajJH063nQpm3tVNclDptu+tgxoCHpwGQlqsmg0IaiWJUY=
=UCB5
-----END PGP SIGNATURE-----

--hyuzpqoqu7hn7pls--
